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
<button type="submit" id="logout" onclick="goLogoutForm()">�α׾ƿ�</button>
</body>
<script>
    // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
    function goLogoutForm() {
        location.href="/logout";
    }
</script>
</html>