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
        $('#submit').click(function() {

            if($.trim($('#useremail').val()) === ''){
                alert("아이디를 입력해 주세요.");
                $('#useremail').focus();
                return;
            }else if($.trim($('#userpassword').val()) === ''){
                alert("패스워드를 입력해 주세요.");
                $('#userpassword').focus();
                return;
            }

            var action = $("#loginform").attr('action');
            var form_data = {
                user_email: $("#useremail").value,
                user_pw: $("#userpassword").value,
                is_ajax: 1
            };
            console.log(form_data.user_email+"\t"+form_data.user_pw)
            $.ajax({
                type: "POST",
                url: action,
                data: form_data,
                success: function(response) {
                    if(response == 'success') {
                        alert("로그인 성공!");
                    }
                    else {
                        alert("로그인 실패!");
                    }
                }
            });
            return false;
        })
    })

    // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    function goJoinForm() {
        location.href="/joinform";
    }

</script>
<body>
<h1>LOGIN PAGE</h1><br><br>
<form id="loginform" name="loginform" method="POST" action="logincheck" style="padding: 10px"> <!--action="@{/login}*/-->
    <fieldset>
        <legend>Login</legend>
        <label for="useremail">USEREMAIL</label>
        <input type="text" id="useremail" name="useremail"/><br><br>
        <label for="userpassword">USERPASSWORD</label>
        <input type="password" id="userpassword" name="userpassword" placeholder="Password" required=""><br><br>
        <button type="submit" id="login" >로그인</button>
        <button type="button" id="join" onclick="goJoinForm()" >회원가입</button>
    </fieldset>
</form>
<div id="message">Login</div>
</body>
</html>