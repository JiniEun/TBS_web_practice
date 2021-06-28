<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>ȸ������</title>
</head>
<script type="text/javascript"
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#submit').click(function () {

            // joinCheck();

            // �Է� �� üũ
            // if (form_data.user_email == '') {
            //     alert("���̵� �Է��� �ּ���.");
            //     $('#useremail').focus();
            //     return;
            // } else if (form_data.user_pw == '') {
            //     alert("�н����带 �Է��� �ּ���.");
            //     $('#userpassword').focus();
            //     return;
            // }
            // return false;

            var action = $("#joinform").attr('action');
            var form_data = {
                user_email: $("#useremail").val(),
                user_pw: $("#userpassword").val(),
                is_ajax: 1
            };
            checkValue();
            console.log(form_data.user_email + "\t" + form_data.user_pw)
            $.ajax({
                type: "POST",
                url: action,
                data: form_data,
                success: function (data) {
                    if (data == "false")
                        alert("ȸ������ ����");
                    else
                        alert("ȸ������ ����!");
                },
                error: function () {
                    alert("err");
                }
            });
        })
    })

    // function joinCheck(){
    //     var action = $("#joinform").attr('action');
    //     var form_data = {
    //         user_email: $("#useremail").val(),
    //         user_pw: $("#userpassword").val(),
    //         is_ajax: 1
    //     };
    //     console.log(form_data.user_email + "\t" + form_data.user_pw)
    //     $.ajax({
    //         type: "POST",
    //         url: action,
    //         data: form_data,
    //         success: function (data) {
    //             if (data == "false")
    //                 alert("ȸ������ ����");
    //             else
    //                 alert("ȸ������ ����!");
    //         },
    //         error: function () {
    //             alert("err");
    //         }
    //     });
    // }

    function checkValue() {
        var email = document.userInfo.useremail.value;
        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

        if (exptext.test(email) === false) {
            //�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��
            alert("�� ���������� �ùٸ��� �ʽ��ϴ�.");
            $('#useremail').focus();
            return false;
        }
        if (!document.userInfo.useremail.value) {
            alert("���̵� �Է��ϼ���.");
            $('#useremail').focus();
            return false;
        }
        if (!document.userInfo.userpassword.value) {
            alert("��й�ȣ�� �Է��ϼ���.");
            $('#userpassword').focus();
            return false;
        }
        // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
        if (document.userInfo.userpassword.value !== document.userInfo.passwordcheck.value) {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
            $('#passwordcheck').focus();
            return false;
        }
    }

    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goLoginForm() {
        location.href = "/login";
    }


    // // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    // function signup() {
    //     var form_data = {
    //         user_email: $("#useremail").val(),
    //         user_pw: $("#userpassword").val(),
    //     };
    //     if (checkValue() == true) {
    //         console.log(form_data.user_email);
    //         console.log(form_data.user_pw);
    //         alert("ȸ������ �Ϸ�");
    //         location.href = "/login";
    //     } else {
    //         alert("ȸ������ ����");
    //         location.href = "/joinform";
    //         return false;
    //     }
    // }

</script>
<body>
<div id="wrap">
    <br><br>
    <b>ȸ������</b>
    <br><br><br>
    <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
    <!-- ��(�Ķ����) ������ POST ���, ������ �������� joincheck.jsp  onsubmit="return checkValue()" onclick="signup()" -->
    <form method="post" action="joinform" id="joinform" name="userInfo">
        <table>
            <tr>
                <td id="email">���̵�</td>
                <td>
                    <input type="text" id="useremail" name="useremail" maxlength="50">
<%--                    <input type="button" value="�ߺ�Ȯ��" onclick="">--%>
                </td>
            </tr>
            <tr>
                <td id="pw">��й�ȣ</td>
                <td>
                    <input type="password" id="userpassword" name="userpassword" maxlength="50">
                </td>
            </tr>
            <tr>
                <td id="pw_check">��й�ȣ Ȯ��</td>
                <td>
                    <input type="password" id="passwordcheck" name="passwordcheck" maxlength="50">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="����"/>
        <input type="button" value="���" onclick="goLoginForm()">
    </form>
</div>
</body>
</html>