<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>LOGOUT</title>
</head>
<body>
<h1>LOGOUT</h1>
logout
<button type="submit" id="login" onclick="goLoginForm()">�α���</button>
</body>
<script>
    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goLoginForm() {
        location.href="/login";
    }
</script>
</html>