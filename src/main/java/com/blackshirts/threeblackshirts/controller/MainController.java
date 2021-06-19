package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

    @GetMapping("/joincheck")
    public String joincheck() {
        log.info("JOINCHECK");
        return "joincheck";
    }

    @PostMapping("/joincheck")
    public String saveDetails(@RequestParam("useremail") String useremail,
                              @RequestParam("userpassword") String userpassword,
                              User user) {
        log.info(useremail);
        log.info(userpassword);
        user.setUseremail(useremail);
        user.setUserpassword(userpassword);
        return "joincheck";
    }


    @PostMapping("/login")
//    @RequestBody
    public String signin(User user) { // 로그인
        userService.getUserInfoByUseremail(user.getUseremail());
        log.info("GETUSEREMAIL");
        log.info(user.getUseremail());
        log.info(user.getUserpassword());
        return "redirect:/login";
    }

    @PostMapping("/joinform")
    public User signup(@RequestBody User user) { // @ModelAttribute  회원 추가
        userService.insertUser(user);
        log.info("signup");
        log.info(user.getUseremail());
        log.info(user.getUserpassword());
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
