package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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



    @GetMapping("/joincheck")
    public String joincheck() {
        log.info("JOINCHECK");
        return "joincheck";
    }

    @PostMapping("/joincheck")
    public String saveDetails(@RequestParam("useremail") String useremail,
                              @RequestParam("userpassword") String userpassword,
                              User user) {
        log.info("JOINCHECK");
        if(useremail == userService.getUserInfoByUseremail(user.getUseremail()).getUseremail()){
            log.info("success");
        }else{
            log.info("fail");
        }
//        log.info(useremail);
//        log.info(userpassword);
//        user.setUseremail(useremail);
//        user.setUserpassword(userpassword);
//        userService.insertUser(user);
//        log.info("success");
        return "joincheck";
    }

    @PostMapping("/logincheck")
    public String logincheck(@RequestParam("useremail") String useremail,
                              @RequestParam("userpassword") String userpassword,
                              User user) {
        log.info("LOGINCHECK");
        if(useremail == userService.getUserInfoByUseremail(user.getUseremail()).getUseremail()){
            log.info("success");
//            response.getWriter().write("loginFail");
        }else{
            log.info("fail");
        }
//        log.info(useremail);
//        log.info(userpassword);
//        user.setUseremail(useremail);
//        user.setUserpassword(userpassword);
//        userService.insertUser(user);
//        log.info("success");
        return "logincheck";
    }


    @PostMapping("/login")
    public String signin(HttpSession session, @RequestParam("useremail") String useremail,
                         @RequestParam("userpassword") String userpassword, User user) { // 로그인

        if(user.getUseremail().equals(userService.getUserInfoByUseremail(user.getUseremail()).getUseremail()) && user.getUserpassword().equals(userService.getUserInfoByUseremail(user.getUseremail()).getUserpassword())){
            session.setAttribute("useremail", useremail);
            log.info("signin");
            log.info(user.getUseremail() + " , " + user.getUserpassword());
            return "redirect:/login.jsp";
        }else{
            return "redirect:/err.jsp";
        }


    }

    @RequestMapping()
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @PostMapping("/joinform")
    public User signup(@RequestParam("useremail") String useremail,
                       @RequestParam("userpassword") String userpassword, User user) { // , HttpServletResponse response@ModelAttribute  회원 추가
        log.info("JOINFORMPOST");
        if(!useremail.isEmpty() && !userpassword.isEmpty()){
            log.info("email:"+ useremail + ",  pw:" + userpassword);
            user.setUseremail(useremail);
            user.setUserpassword(userpassword);
            log.info(user.toString());
            log.info("signup");
            if(user.getUseremail().equals(userService.getUserInfoByUseremail(user.getUseremail()).getUseremail())){
                log.info("exist in DB");
//                try {
//                    response.getWriter().write("JoinFail");
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
            }else{
                log.info("success");
                userService.insertUser(user);
            }
        }else{
            log.info("fail");
        }
        return user;
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
    public void insert(User user) {
        userService.insertUser(user);
        System.out.println("INSERT");
    }
}
