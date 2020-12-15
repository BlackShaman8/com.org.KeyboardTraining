package com.keyboardTraining.controllers;

import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.User;
import com.keyboardTraining.service.DifficultyLevelServiceImpl;
import com.keyboardTraining.service.ExerciseServiceImpl;
import com.keyboardTraining.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class UserController {

    private final UserService userService;
    private final ExerciseServiceImpl exerciseService;
    private final DifficultyLevelServiceImpl difficultyLevelService;
    private String exer;

    @Autowired
    public UserController(UserService userService, ExerciseServiceImpl exerciseService, DifficultyLevelServiceImpl difficultyLevelService) {
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.difficultyLevelService = difficultyLevelService;
        exer="";
    }

    @GetMapping("/user/trainingParameters")
    public String getTrainingParameters(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        model.put("allDifficultyLevel", difficultyLevelService.getAll());
        model.put("allExercises", exerciseService.getAll());
        model.put("exercisesLevel1", exerciseService.getExercisesById(1L));
        model.put("exercisesLevel2", exerciseService.getExercisesById(2L));
        model.put("exercisesLevel3", exerciseService.getExercisesById(3L));
        model.put("exercisesLevel4", exerciseService.getExercisesById(4L));
        return "trainingParameters";
    }


//    @GetMapping("/user/training")
//    public String getTraining(Map<String,Object> model){
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();//get logged in username
//        User user=(User)userService.loadUserByUsername(name);
//        model.put("user",user);
//        return "training";
//    }

    @GetMapping("/user/training")
    public String getTraining(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        Exercise exercise=exerciseService.getExercise(Long.parseLong(exer));
        model.put("exercise", exercise);
        return "training";
    }


    @GetMapping("/")
    public String reg(Map<String, Object> model) {
        if (SecurityContextHolder.getContext().getAuthentication() != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String name = auth.getName();//get logged in username
            User user = (User) userService.loadUserByUsername(name);
            model.put("user", user);
        }
        return "index";
    }

    @GetMapping("/user/profile")
    public String getProfile() {
        return "profile";
    }

    @GetMapping("/user/userStats")
    public String getUserStats() {
        return "userStats";
    }

    @GetMapping("/user/editProfile")
    public String getEditProfile(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        return "editProfile";
    }

    @PostMapping("/user/editProfile")
    public String postEditProfile(@RequestParam String login, @RequestParam String password, @RequestParam String passwordConfirm, @RequestParam String id) {
        if (password.equals(passwordConfirm)) {
            User user = userService.findUserById(Long.parseLong(id));
            user.setLogin(login);
            userService.changeLogin(user);
        }
        return "editProfile";
    }

//    @GetMapping("/user/training?id={id}")
//    public String getTraininge(@RequestParam String id) {
//        return "training";
//    }
//
    @PostMapping("/user/trainingParameters")
    public String postPerameters(Map<String, Object> model,@RequestParam String section){
        exer=section.trim();
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();//get logged in username
//        User user = (User) userService.loadUserByUsername(name);
//        model.put("user", user);
//        Exercise exercise=exerciseService.getExercise(Long.parseLong(exer.trim()));
//        model.put("exercise", exercise);
        return "redirect:training";
    }

    @PostMapping("/user/training")
    public String postTraining(){
        return "result";
    }
}
