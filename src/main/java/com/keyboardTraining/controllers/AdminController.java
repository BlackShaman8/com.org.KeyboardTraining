package com.keyboardTraining.controllers;

import com.keyboardTraining.model.User;
import com.keyboardTraining.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class AdminController {
    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/accountManagement")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "accountManagement";
    }

    @GetMapping("/editProfile")
    public String getEditAdminProfile(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        return "editProfile";
    }

    @PostMapping("/accountManagement")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/accountManagement";
    }

    @GetMapping("/accountManagement/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "accountManagement";
    }


}

