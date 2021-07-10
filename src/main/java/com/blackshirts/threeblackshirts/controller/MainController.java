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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@RestController // 데이터를 반환하는 어노테이션
@Controller // 페이지를 반환하는 어노테이션
public class MainController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

    // localhost:8080/
    @GetMapping("/")
    public String main() {
        log.debug("MAIN");
        return "main";
    }
    //localhost:8080/test

    @GetMapping("/test")
    public String test() {
        log.info("TEST");
        return "test";
    }

    @GetMapping("/login")
    public String login() {
        log.info("LOGIN");
        return "login";
    }

    @GetMapping("/joinform")
    public String joinform() {
        log.info("JOINFORM");
        return "joinform";
    }

    @GetMapping("/logincheck")
    public String logincheck() {
        log.info("LOGINCHECK");
        return "logincheck";
    }

    @GetMapping("/signup")
    public String signup() {
        log.info("SignUp");
        return "signup";
    }

    @GetMapping("/signin")
    public String signin() {
        log.info("SignIn");
        return "signin";
    }

    @GetMapping("/err")
    public String err() {
        log.info("ERR");
        return "err";
    }

//    @PostMapping("/logincheck")
//    public String logincheck(@RequestParam("useremail") String useremail,
//                             @RequestParam("userpassword") String userpassword,
//                             User user) {
//        log.info("LOGINCHECK");
//        if(useremail == userService.getUserInfoByUseremail(user.getUseremail()).getUseremail()){
//            log.info("login_success");
//        }else{
//            log.info("login_fail");
//        }
//
//        return "logincheck";
//    }


    @PostMapping("/login")
    public String login(User user, HttpSession session) throws Exception{ // 로그인
        log.info("LoginPost");
        if(session.getAttribute("login") != null) {
            session.removeAttribute("login");
        }

        if(!user.getUseremail().isEmpty() && !user.getUserpassword().isEmpty()){
            log.info("Login");
            log.info("user email: " + user.getUseremail() + ",  pw: " + user.getUserpassword());

            boolean flag = false;
            String pwcheck = "";
            List<User> userList= null;
            userList = userService.selectUserInfo();
            for(User u : userList){
                if(u.getUseremail().equals(user.getUseremail())){
                    flag = true;
                    pwcheck = u.getUserpassword();
                    break;
                }
            }
            if(flag && pwcheck.equals(user.getUserpassword())){
                log.info("login_success");
                session.setAttribute("login",user);
                return "redirect:/logincheck";
            }else {
                if(flag && !pwcheck.equals(user.getUserpassword())){
                    log.info("login_fail: Wrong password");
                }else {
                    log.info("login_fail: No exist in DB");
                }
                return "redirect:/err";
            }
        }

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        log.info("ByeBye Logout success");
        return "redirect:/login";
    }

    @PostMapping("/joinform")
    public User join(User user) { // @ModelAttribute 회원 추가 @RequestParam("useremail") String useremail,
        log.info("JOINFORMPOST");
        if(!user.getUseremail().isEmpty() && !user.getUserpassword().isEmpty()){
            log.info("signup");
            log.info("user email: " + user.getUseremail() + ",  pw: " + user.getUserpassword());
            log.info("User" + user.toString());

            boolean flag = true;
            List<User> userList= null;
            userList = userService.selectUserInfo();
            for(User u : userList){
                if(u.getUseremail().equals(user.getUseremail())){
                    flag = false;
                    break;
                }
            }
            if(flag){
                userService.insertUser(user);
                log.info("join_success");
            }else{
                log.info("join_fail:exist in DB");
            }

        }else{
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
        if(users == null)
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

    @ResponseBody
    @GetMapping("/insert")
    public void insertuser(User user) {
        userService.insertUser(user);
        System.out.println("INSERT");
    }

    @ResponseBody
    @PostMapping("/insert")
    public boolean insert(@RequestBody User user) {
        try{
            userService.insertUser(user);
            return true;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @ResponseBody
    @GetMapping("/insert")
    public boolean check(@RequestBody User user) {
        User getUser = userService.getUserInfoByUseremail(user.getUseremail());
        return getUser.getUserpassword().equals(user.getUserpassword());
    }
}