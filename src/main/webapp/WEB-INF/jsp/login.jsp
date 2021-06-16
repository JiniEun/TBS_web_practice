<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Login</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#login').click(function() {
            var action = $("#loginform").attr('action');
            var form_data = {
                user_email: $("#useremail").val(),
                user_pw: $("#userpassword").val(),
                is_ajax: 1
            };
            console.log(form_data.user_email+"\t"+form_data.user_pw)
            $.ajax({
                type: "POST",
                url: action,
                data: form_data,
                success: function(response) {
                    if(response == 'success') {
                        $("#message").html("<p style='color:green;font-weight:bold'>로그인 성공!</p>");
                        $("#loginform").slideUp('slow');
                    }
                    else {
                        $("#message").html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
                    }
                }
            });
            return false;
        })
    })
</script>
<body>
<h1>LOGIN PAGE</h1><br><br>
<form id="loginform" method="POST" action="@{/login}" style="padding: 10px" > <!--action="@{/login}*/-->
    <fieldset>
        <legend>Login</legend>
        <label for="useremail">USEREMAIL</label>
        <input type="text" id="useremail" name="useremail"/><br><br>
        <label for="userpassword">USERPASSWORD</label>
        <input type="password" id="userpassword" name="userpassword" placeholder="Password" required=""><br><br>
        <button type="login" id="login">Sign in</button>
    </fieldset>
</form>
<div id="message">Login</div>
</body>
</html>