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
    // $(document).ready(function () {
    //     $('#submit').click(function () {
    //         var action = $("#joinform").attr('action');
    //         var form_data = {
    //             user_email: $("#useremail").val(),
    //             user_pw: $("#userpassword").val(),
    //             is_ajax: 1
    //         };
    //
    //         // 입력 값 체크
    //         if(form_data.user_email == ''){
    //             alert("아이디를 입력해 주세요.");
    //             $('#useremail').focus();
    //             return;
    //         }else if(form_data.user_pw == ''){
    //             alert("패스워드를 입력해 주세요.");
    //             $('#userpassword').focus();
    //             return;
    //         }
    //         console.log(form_data.user_email + "\t" + form_data.user_pw)
    //         $.ajax({
    //             type: "POST",
    //             url: action,
    //             data: form_data,
    //             success: function(data){
    //                 if(data == "false")
    //                     alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.') ;
    //                 else
    //                     alert("회원가입 성공!");
    //             },
    //             error: function(){
    //                 alert("err");
    //             }
    //         });
    //         return false;
    //     })
    // })


    function checkValue(){
        var flag = true;
        console.log(document.joinform.useremail.value);
        console.log(document.joinform.userpassword.value);
        var email = document.joinform.useremail.value;
        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if(exptext.test(email)==false){
            //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
            alert("이메일형식이 올바르지 않습니다.");
            $('#useremail').focus();
            console.log("이메일형식이 올바르지 않습니다.");
            flag = false;
            return false;
        }
        if (!document.joinform.useremail.value) {
            alert("아이디를 입력하세요.");
            console.log("아이디를 입력하세요.");
            flag = false;
            return false;
        }
        if (!document.joinform.userpassword.value) {
            alert("비밀번호를 입력하세요.");
            console.log("비밀번호를 입력하세요.");
            flag = false;
            return false;
        }
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if (document.joinform.userpassword.value !== document.joinform.passwordcheck.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            console.log("비밀번호를 동일하게 입력하세요.");
            flag = false;
            return false;
        }
        if(flag){
            alert("회원가입 완료");
            console.log("join_success");
        }else{
            alert("회원가입 실패");
            console.log("join_fail");
        }
    }
    // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    function goLoginForm() {
        location.href="/login";
    }

</script>
<body>
<div id="wrap">
    <br><br>
    <h1>회원가입</h1>
    <br><br><br>
    <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
    <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 joincheck.jsp onsubmit="return checkValue()"  onclick="signup()"-->
    <form method="post" action="joinform" id="joinform" name="joinform" style="padding: 10px" onsubmit="return checkValue()">
        <fieldset>
            <legend>Sign Up</legend>
            <label for="useremail">USEREMAIL</label>
            <input type="text" id="useremail" name="useremail" maxlength="50"/><br><br>
            <label for="userpassword">USERPASSWORD</label>
            <input type="password" id="userpassword" name="userpassword" placeholder="Password" maxlength="50" required="" ><br><br>
            <label for="userpassword">비밀번호 확인</label>
            <input type="password" name="passwordcheck" maxlength="50"><br><br>
            <input type="submit" value="가입"/>
            <input type="button" value="로그인" onclick="goLoginForm()">
        </fieldset>
        <br>
    </form>
</div>
</body>
</html>