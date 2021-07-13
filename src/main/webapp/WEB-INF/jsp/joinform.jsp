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
<body>
<div id="wrap">
    <br><br>
    <h1>ȸ������</h1>
    <br>
    <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
    <!-- ��(�Ķ����) ������ POST ���, ������ �������� joincheck.jsp onclick="signup()"  onsubmit="return checkValue()"-->
    <form method="post" action="joinform" id="joinform" name="joinform" style="padding: 10px" >
        <fieldset>
            <legend>Sign Up</legend>
            <label for="useremail">USEREMAIL</label>
            <input type="text" id="useremail" name="useremail" maxlength="50"/><br><br>
            <label for="userpassword">USERPASSWORD</label>
            <input type="password" id="userpassword" name="userpassword" placeholder="Password" maxlength="50"
                   minlength="4"><br><br>
            <label for="userpassword">��й�ȣ Ȯ��</label>
            <input type="password" name="passwordcheck" maxlength="50"><br><br>
            <input type="submit" value="����"/>
            <input type="button" value="�α���" onclick="goLoginForm()">
        </fieldset>
        <br>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        $('#submit').click(function (){
            var form_data = {
                user_email: $("#useremail").val(),
                user_pw: $("#userpassword").val(),
            };
            console.log("user_email: "+ form_data.user_email + "\t user_pw: " + form_data.user_pw);

            if(!CheckValue()){
                form_data.user_email = " ";
                form_data.user_pw = " ";
            }

            console.log(JSON.stringify({useremail:form_data.user_email, userpassword:form_data.user_pw}));
            $.ajax({
                type:"POST",
                url:"",
                contentType:"application/json; charset=EUC-KR",
                data : JSON.stringify({useremail:form_data.user_email, userpassword:form_data.user_pw})
            })
                .done((res) => {
                    if(res == true)
                        alert("join success");
                    else
                        alert('join fail');
                })
        })
    })

    function CheckValue() {
        var form_data = {
            user_email: $("#useremail").val(),
            user_pw: $("#userpassword").val(),
            user_pw_check: $("#passwordcheck").val(),
        };
        console.log("useremail: "+ form_data.user_email + "\t userpw: " + form_data.user_pw);

        var email = form_data.user_email;
        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if (exptext.test(email) == false) {
            //�̸��� ������ ���ĺ�+����@���ĺ�+����.���ĺ�+���� ������ �ƴҰ��
            alert("�̸��������� �ùٸ��� �ʽ��ϴ�.");
            $('#useremail').focus();
            console.log("�̸��������� �ùٸ��� �ʽ��ϴ�.");
            return false;
        }
        if (!email) {
            alert("���̵� �Է��ϼ���.");
            console.log("���̵� �Է��ϼ���.");
            return false;
        }
        if (!form_data.user_pw) {
            alert("��й�ȣ�� �Է��ϼ���.");
            console.log("��й�ȣ�� �Է��ϼ���.");
            return false;
        }
        // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
        if (form_data.user_pw !== form_data.user_pw_check) { // jquery ����
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
            console.log("��й�ȣ�� �����ϰ� �Է��ϼ���.");
            return false;
        }
        return true;
    }

    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goLoginForm() {
        location.href = "/login";
    }

</script>
</html>