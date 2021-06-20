<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>회원가입 확인</title>
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
    <b>회원가입 확인</b>
    <br><br><br>
    <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
    <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 Joincheck.jsp -->

    <h1>전달받은 데이터</h1>
    <%
        // request 객체로부터 파라미터를 가져옴.
        String email = request.getParameter("useremail");
        String password = request.getParameter("userpassword");
        System.out.println("email check : "+email);
    %>
    <ul>
        <li>이메일: ${email}</li>
        <li>비밀번호: ${password}</li>
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