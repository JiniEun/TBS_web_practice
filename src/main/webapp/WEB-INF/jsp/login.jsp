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
<body>
<h1>LOGIN PAGE</h1><br><br>
<form id="loginform" name="loginform" method="POST" action="login" style="padding: 10px"> <!--action="@{/login}*/-->
    <fieldset>
        <legend>Login</legend>
        <label for="useremail">USEREMAIL</label>
        <input type="text" id="useremail" name="useremail"/><br><br>
        <label for="userpassword">USERPASSWORD</label>
        <input type="password" id="userpassword" name="userpassword" placeholder="Password" required=""><br><br>
        <button type="submit" id="login" >�α���</button>
        <button type="button" id="join" onclick="goJoinForm()" >ȸ������</button>
    </fieldset>
</form>
<div id="message">Login</div>
</body>
<script>

    $(document).ready(function () {
        $('#submit').click(function (){
            console.log(JSON.stringify({useremail:$('#useremail').val(), userpassword:$('#userpassword').val()}))
            $.ajax({
                type:"POST",
                url:"",
                contentType:"application/json; charset=EUC-KR",
                data : JSON.stringify({useremail:$('#useremail').val(), userpassword:$('#userpassword').val()})
            })
                .done((res) => {
                    if(res == true)
                        alert("login success")
                    else
                        alert('login fail')
                })
        })
    })

    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goJoinForm() {
        location.href="/joinform";
    }

</script>
</html>