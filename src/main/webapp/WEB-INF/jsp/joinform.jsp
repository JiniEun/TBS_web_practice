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
<body>
<div id="wrap">
    <br><br>
    <h1>회원가입</h1>
    <br>
    <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
    <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 joincheck.jsp onclick="signup()"  onsubmit="return checkValue()"-->
    <form method="post" action="joinform" id="joinform" name="joinform" style="padding: 10px" >
        <fieldset>
            <legend>Sign Up</legend>
            <label for="useremail">USEREMAIL</label>
            <input type="text" id="useremail" name="useremail" maxlength="50"/><br><br>
            <label for="userpassword">USERPASSWORD</label>
            <input type="password" id="userpassword" name="userpassword" placeholder="Password" maxlength="50"
                   minlength="4"><br><br>
            <label for="userpassword">비밀번호 확인</label>
            <input type="password" name="passwordcheck" maxlength="50"><br><br>
            <input type="submit" value="가입"/>
            <input type="button" value="로그인" onclick="goLoginForm()">
        </fieldset>
        <br>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        $('#submit').click(function (){
            var form_data = {
                user_email: $("#useremail").val(),
                user_pw: $("#userpassword").val(),
            };
            console.log("user_email: "+ form_data.user_email + "\t user_pw: " + form_data.user_pw);

            if(!CheckValue()){
                form_data.user_email = " ";
                form_data.user_pw = " ";
            }

            console.log(JSON.stringify({useremail:form_data.user_email, userpassword:form_data.user_pw}));
            $.ajax({
                type:"POST",
                url:"",
                contentType:"application/json; charset=EUC-KR",
                data : JSON.stringify({useremail:form_data.user_email, userpassword:form_data.user_pw})
            })
                .done((res) => {
                    if(res == true)
                        alert("join success");
                    else
                        alert('join fail');
                })
        })
    })

    function CheckValue() {
        var form_data = {
            user_email: $("#useremail").val(),
            user_pw: $("#userpassword").val(),
            user_pw_check: $("#passwordcheck").val(),
        };
        console.log("useremail: "+ form_data.user_email + "\t userpw: " + form_data.user_pw);

        var email = form_data.user_email;
        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        if (exptext.test(email) == false) {
            //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
            alert("이메일형식이 올바르지 않습니다.");
            $('#useremail').focus();
            console.log("이메일형식이 올바르지 않습니다.");
            return false;
        }
        if (!email) {
            alert("아이디를 입력하세요.");
            console.log("아이디를 입력하세요.");
            return false;
        }
        if (!form_data.user_pw) {
            alert("비밀번호를 입력하세요.");
            console.log("비밀번호를 입력하세요.");
            return false;
        }
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if (form_data.user_pw !== form_data.user_pw_check) { // jquery 통일
            alert("비밀번호를 동일하게 입력하세요.");
            console.log("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        return true;
    }

    // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    function goLoginForm() {
        location.href = "/login";
    }

</script>
</html>