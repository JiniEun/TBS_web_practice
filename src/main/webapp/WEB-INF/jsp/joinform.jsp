<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>회원가입</title>
</head>
<script type="text/javascript"
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#submit').click(function () {

            // joinCheck();

            // 입력 값 체크
            // if (form_data.user_email == '') {
            //     alert("아이디를 입력해 주세요.");
            //     $('#useremail').focus();
            //     return;
            // } else if (form_data.user_pw == '') {
            //     alert("패스워드를 입력해 주세요.");
            //     $('#userpassword').focus();
            //     return;
            // }
            // return false;

            var action = $("#joinform").attr('action');
            var form_data = {
                user_email: $("#useremail").val(),
                user_pw: $("#userpassword").val(),
                is_ajax: 1
            };
            checkValue();
            console.log(form_data.user_email + "\t" + form_data.user_pw)
            $.ajax({
                type: "POST",
                url: action,
                data: form_data,
                success: function (data) {
                    if (data == "false")
                        alert("회원가입 실패");
                    else
                        alert("회원가입 성공!");
                },
                error: function () {
                    alert("err");
                }
            });
        })
    })

    // function joinCheck(){
    //     var action = $("#joinform").attr('action');
    //     var form_data = {
    //         user_email: $("#useremail").val(),
    //         user_pw: $("#userpassword").val(),
    //         is_ajax: 1
    //     };
    //     console.log(form_data.user_email + "\t" + form_data.user_pw)
    //     $.ajax({
    //         type: "POST",
    //         url: action,
    //         data: form_data,
    //         success: function (data) {
    //             if (data == "false")
    //                 alert("회원가입 실패");
    //             else
    //                 alert("회원가입 성공!");
    //         },
    //         error: function () {
    //             alert("err");
    //         }
    //     });
    // }

    function checkValue() {
        var email = document.userInfo.useremail.value;
        var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

        if (exptext.test(email) === false) {
            //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
            alert("이 메일형식이 올바르지 않습니다.");
            $('#useremail').focus();
            return false;
        }
        if (!document.userInfo.useremail.value) {
            alert("아이디를 입력하세요.");
            $('#useremail').focus();
            return false;
        }
        if (!document.userInfo.userpassword.value) {
            alert("비밀번호를 입력하세요.");
            $('#userpassword').focus();
            return false;
        }
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if (document.userInfo.userpassword.value !== document.userInfo.passwordcheck.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            $('#passwordcheck').focus();
            return false;
        }
    }

    // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    function goLoginForm() {
        location.href = "/login";
    }


    // // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    // function signup() {
    //     var form_data = {
    //         user_email: $("#useremail").val(),
    //         user_pw: $("#userpassword").val(),
    //     };
    //     if (checkValue() == true) {
    //         console.log(form_data.user_email);
    //         console.log(form_data.user_pw);
    //         alert("회원가입 완료");
    //         location.href = "/login";
    //     } else {
    //         alert("회원가입 실패");
    //         location.href = "/joinform";
    //         return false;
    //     }
    // }

</script>
<body>
<div id="wrap">
    <br><br>
    <b>회원가입</b>
    <br><br><br>
    <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
    <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 joincheck.jsp  onsubmit="return checkValue()" onclick="signup()" -->
    <form method="post" action="joinform" id="joinform" name="userInfo">
        <table>
            <tr>
                <td id="email">아이디</td>
                <td>
                    <input type="text" id="useremail" name="useremail" maxlength="50">
<%--                    <input type="button" value="중복확인" onclick="">--%>
                </td>
            </tr>
            <tr>
                <td id="pw">비밀번호</td>
                <td>
                    <input type="password" id="userpassword" name="userpassword" maxlength="50">
                </td>
            </tr>
            <tr>
                <td id="pw_check">비밀번호 확인</td>
                <td>
                    <input type="password" id="passwordcheck" name="passwordcheck" maxlength="50">
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