<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>ȸ������ Ȯ��</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>

</script>
<body>
<div>
    <br><br>
    <b>ȸ������ Ȯ��</b>
    <br><br><br>
    <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
    <!-- ��(�Ķ����) ������ POST ���, ������ �������� Joincheck.jsp -->

    <h1>���޹��� ������</h1>
    <%
        // request ��ü�κ��� �Ķ���͸� ������.
        String email = request.getParameter("useremail");
        String password = request.getParameter("userpassword");
        System.out.println("email check : "+email);
    %>
    <ul>
        <li>�̸���: ${email}</li>
        <li>��й�ȣ: ${password}</li>
        <li:forEach items="${User}" var="User">
            <tr>
                <td>${User.id}</td>
                <td>${User.pw}</td>
                <td>${User.money}</td>
            </tr>
        </li:forEach>
    </ul>

</div>
</body>
</html>