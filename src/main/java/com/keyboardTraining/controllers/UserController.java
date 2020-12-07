package com.keyboardTraining.controllers;

import com.keyboardTraining.model.User;
import com.keyboardTraining.security.SecurityConfig;
import com.keyboardTraining.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Security;
import java.util.Map;

@Controller
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user/trainingParameters")
    public String getTrainingParameters(Map<String,Object> model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user=(User)userService.loadUserByUsername(name);
        model.put("user",user);
        return "trainingParameters";
    }


    @GetMapping("/user/training")
    public String getTraining(Map<String,Object> model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user=(User)userService.loadUserByUsername(name);
        model.put("user",user);
        return "training";
    }

    @GetMapping("/user/profile")
    public String getProfile(){
        return "profile";
    }

}
