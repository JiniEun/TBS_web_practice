<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>ȸ������</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    // $(document).ready(function () {
    //     $('#submit').click(function () {
    //         var action = $("#joinform").attr('action');
    //         var form_data = {
    //             user_email: $("#useremail").val(),
    //             user_pw: $("#userpassword").val(),
    //             is_ajax: 1
    //         };
    //
    //         // �Է� �� üũ
    //         if(form_data.user_email == ''){
    //             alert("���̵� �Է��� �ּ���.");
    //             $('#useremail').focus();
    //             return;
    //         }else if(form_data.user_pw == ''){
    //             alert("�н����带 �Է��� �ּ���.");
    //             $('#userpassword').focus();
    //             return;
    //         }
    //         console.log(form_data.user_email + "\t" + form_data.user_pw)
    //         $.ajax({
    //             type: "POST",
    //             url: action,
    //             data: form_data,
    //             success: function(data){
    //                 if(data == "false")
    //                     alert('�߸��� ���̵��̰ų�, ��й�ȣ�� Ʋ�Ƚ��ϴ�.') ;
    //                 else
    //                     alert("ȸ������ ����!");
    //             },
    //             error: function(){
    //                 alert("err");
    //             }
    //         });
    //         return false;
    //     })
    // })

    function checkValue(){
        if (!document.userInfo.useremail.value) {
            alert("���̵� �Է��ϼ���.");
            return false;
        }
        if (!document.userInfo.userpassword.value) {
            alert("��й�ȣ�� �Է��ϼ���.");
            return false;
        }
        // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
        if (document.userInfo.userpassword.value !== document.userInfo.passwordcheck.value) {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
            return false;
        }
    }

    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goLoginForm() {
        location.href="/login";
    }


    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function signup() {
        if(checkValue()){
            alert("ȸ������ �Ϸ�");
            location.href="/login";
        }
    }

</script>
<body>
<div id="wrap">
    <br><br>
    <b>ȸ������</b>
    <br><br><br>
    <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
    <!-- ��(�Ķ����) ������ POST ���, ������ �������� joincheck.jsp -->
    <form method="post" action="joinform" id="joinform" name="userInfo" onsubmit="return checkValue()">
        <table>
            <tr>
                <td id="email">���̵�</td>
                <td>
                    <input type="text" name="useremail" maxlength="50">
                    <input type="button" value="�ߺ�Ȯ��" onclick="">
                </td>
            </tr>
            <tr>
                <td id="pw">��й�ȣ</td>
                <td>
                    <input type="password" name="userpassword" maxlength="50">
                </td>
            </tr>
            <tr>
                <td id="pw_check">��й�ȣ Ȯ��</td>
                <td>
                    <input type="password" name="passwordcheck" maxlength="50">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="����" onclick="signup()"/>
        <input type="button" value="���" onclick="goLoginForm()">
    </form>
</div>
</body>
</html>