package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@RestController // 데이터를 반환하는 어노테이션
@Controller // 페이지를 반환하는 어노테이션
public class MainController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

    // localhost:8080/
    @GetMapping("/")
    public String main(User user, HttpServletResponse response) {
        log.info("MAIN");
//
//        Cookie loginCookie = new Cookie("useremaul", user.getUseremail());
//
//        if (user.isCookieDel()) {
//            loginCookie.setMaxAge(0);   // 즉시 지우기
//            user.setUseremail(null);
//        } else {
//            loginCookie.setMaxAge(-1); //60*60*24*30 = 30일  / -1 = 세션이 끝나면 지움
//        }
//        response.addCookie(loginCookie);

        return "main";
    }

    //localhost:8080/test

    @GetMapping("/login")
    public String login() {
        log.info("LOGIN");
        return "/login";
    }

    @GetMapping("/joinform")
    public String joinform() {
        log.info("JOINFORM");
        return "joinform";
    }

    @GetMapping("/logincheck")
    public String logincheck(HttpSession session) {
        log.info("LOGINCHECK");
        if (session.getAttribute("login") == null) {
            log.info("LOGIN_SESSION_NULL");
            return "redirect:/login";
        }
        return "logincheck";
    }

    @GetMapping("/err")
    public String err() {
        log.info("ERR");
        return "err";
    }

    @PostMapping("/login")
    public String login(User user, HttpSession session, HttpServletResponse response) throws Exception { // 로그인
        log.info("LoginPost");
        String returnURL = "";

        if (session.getAttribute("login") != null) {
            log.info("session_getAttribute");
            session.removeAttribute("login");
        }

        User n_user = user;

        if (n_user != null) {

            log.info("Login");
            log.info("user_check: " + n_user.toString());

            User user_check = userService.getUserInfoByUseremail(n_user.getUseremail());
            log.info("db_user_check: " + user_check.toString());

            boolean flag = n_user.equals(user_check);
            log.info("user_equals_check: " + String.valueOf(flag));

            if (flag) {
                log.info("login_success");
                session.setAttribute("login", n_user); // 세션 login 이름으로 user 객체를 저장
                returnURL = "redirect:/logincheck";
                log.info("cookie");
//                Cookie logincookie = new Cookie("loginCookie", session.getId());
                Cookie logincookie = new Cookie("loginCookie", n_user.getUseremail());
                logincookie.setPath("/");
                logincookie.setMaxAge(-1); // 단위 = (초) 60*60*24*7 = 7일, -1 = 세션이 끝나면 지움
                response.addCookie(logincookie);
                log.info("response_AddCookie");
                log.info(logincookie.toString());
            } else {
                log.info("login_fail");
                returnURL = "redirect:/err";
            }

        } else {
            returnURL = "redirect:/login";
        }
        return returnURL;
    }

//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        log.info("ByeBye Logout success");
//        return "redirect:/login";
//    }

    @PostMapping("/joinform")
    public User join(User user) { // @ModelAttribute 회원 추가 @RequestParam("useremail") String useremail,
        log.info("JOINFORMPOST");
        if (!user.getUseremail().isEmpty() && !user.getUserpassword().isEmpty()) {
            log.info("signup");
            log.info("User: " + user.toString());

            User user_check = userService.getUserInfoByUseremail(user.getUseremail());

            if (user_check == null) {
                userService.insertUser(user);
                log.info("join_success");
            } else {
//                log.info("User_check : " + user_check.toString());
//                log.info("user_equals_check: " + String.valueOf(user.equals(user_check)));
                log.info("user_email_check: " + String.valueOf(user.getUseremail().equals(user_check.getUseremail())));
                log.info("user_pw_check: " + String.valueOf(user.getUserpassword().equals(user_check.getUserpassword())));
                log.info("join_fail:exist in DB");
            }
        } else {
            log.info("join_fail");
        }
        return user;
    }

    @ResponseBody // 데이터를 보냄
    @PostMapping("/user")
    public boolean getUser(@RequestBody User user) {
        log.error("USER");
        log.info(user.getUseremail());
        User users = userService.getUserInfoByUseremail(user.getUseremail());
        if (users == null)
            return false;
        return true;
    }

    @ResponseBody // 데이터를 보냄
    @GetMapping("/users")
    public List<User> user() {
        log.error("USERS");
        // controller > service > repository > service > controller
        return userService.selectUserInfo();
    }

    @ResponseBody
    @GetMapping("/user")
    public User getUser(@RequestParam String useremail) {
        log.info("USER");
        return userService.getUserInfoByUseremail(useremail);
    }

//    @ResponseBody
//    @GetMapping("/insert")
//    public void insertuser(User user) {
//        userService.insertUser(user);
//        System.out.println("INSERT");
//    }

    @ResponseBody
    @PostMapping("/insert")
    public boolean insert(@RequestBody User user) {
        try {
            log.info("INSERT");
            log.info(user.toString());
            userService.insertUser(user);
            return true;
        } catch (Exception e) {
            log.info("INSERTERROR");
            e.printStackTrace();
            return false;
        }
    }

    @ResponseBody
    @GetMapping("/insert")
    public boolean check(@RequestBody User user) {
        log.info("CHECK");
        log.info(user.toString());
        User getUser = userService.getUserInfoByUseremail(user.getUseremail());
        return getUser.getUserpassword().equals(user.getUserpassword());
    }

//    @RequestMapping("/index")
//    public String mallIndex(User user,
//                            @CookieValue(value = "gender", required = false) Cookie loginCookie,
//                            HttpServletRequest request) {
//
//        if (loginCookie != null)
//            user.setUseremail(loginCookie.getValue());
//
//        return "/";
//    }

    // 로그아웃 하는 부분
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, HttpServletRequest request) { // , HttpServletRequest request
        log.info("LOGOUT");
        session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
        session.invalidate(); // 세션 전체를 날려버림
        Cookie[] cookie = request.getCookies();

        for(Cookie c : cookie){
            if(c.getName().equals("loginCookie")){
                log.info(c.toString());
                c.setMaxAge(0);
            }
        }
//        cookie delete
        log.info("session_invalidate");

        return "redirect:/login"; // 로그아웃 후 게시글 목록으로 이동하도록...함
    }
}