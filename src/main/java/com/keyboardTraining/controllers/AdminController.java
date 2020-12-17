package com.keyboardTraining.controllers;

import com.keyboardTraining.model.User;
import com.keyboardTraining.service.StatisticsService;
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
    private final StatisticsService statisticsService;

    public AdminController(UserService userService, StatisticsService statisticsService) {
        this.userService = userService;
        this.statisticsService = statisticsService;
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

    @GetMapping("/userStats/{userId}")
    public String getStatisticsUser(Map<String, Object> model,@PathVariable String userId){
        model.put("statistics",statisticsService.getAllByUser(Long.parseLong(userId.trim())));
        model.put("user",userService.findUserById(Long.parseLong(userId)));
        return "userStats";
    }

    @GetMapping("/stats")
    public String getUserStats(Map<String, Object> model){
        model.put("statistics",statisticsService.getAll());
        model.put("statistics", statisticsService.getAll());
        model.put("statistica150", (double)statisticsService.getAllLess(50)/(double)statisticsService.getAll().size()*100);
        model.put("statistica150400",  (double)statisticsService.getAllLess( 50,400)/(double)statisticsService.getAll().size()*100);
        model.put("statistica400", (double)statisticsService.getAllMore(400)/(double)statisticsService.getAll().size()*100);
        return "stats";
    }

    @GetMapping("/about")
    public String getAbout(){
        return "about";
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

