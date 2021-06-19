<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>회원가입</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#submit').click(function() {
            var action = $("#joinform").attr('action');
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
                        alert("회원가입 성공!");
                    }
                    else {
                        alert("회원가입 실패!");
                    }
                }
            });
            return false;
        })
    })
    function checkValue(){
        if(!document.userInfo.useremail.value){
            alert("아이디를 입력하세요.");
            return false;
        }

        // if(document.userInfo.useremail.value){
        //     alert("아이디를 입력하세요.");
        //     return false;
        // }

        if(!document.userInfo.userpassword.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }

        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if(document.userInfo.userpassword.value !== document.userInfo.passwordcheck.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }

    }
</script>
<body>
<div id="wrap">
    <br><br>
    <b>회원가입</b>
    <br><br><br>
    <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
    <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
    <form method="post" action="@{/joinform}" id="joinform" name="userInfo" onsubmit="return checkValue()">
        <table>
            <tr>
                <td id="email">아이디</td>
                <td>
                    <input type="text" name="useremail" maxlength="50">
                    <input type="button" value="중복확인" >
                </td>
            </tr>

            <tr>
                <td id="pw">비밀번호</td>
                <td>
                    <input type="password" name="userpassword" maxlength="50">
                </td>
            </tr>

            <tr>
                <td id="pw_check">비밀번호 확인</td>
                <td>
                    <input type="password" name="passwordcheck" maxlength="50">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="가입"/>
        <input type="button" value="취소" onclick="goLoginForm()">
    </form>
</div>
</body>
</html>