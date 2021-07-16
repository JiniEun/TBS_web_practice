<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Loginpage</title>
</head>
<body>
<h1>MyPAGE</h1>
login success <br><br>
<button type="submit" id="logout" onclick="goLogoutForm()">로그아웃</button>
</body>
<script>
    // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    function goLogoutForm() {
        location.href="/logout";
    }
</script>
</html>