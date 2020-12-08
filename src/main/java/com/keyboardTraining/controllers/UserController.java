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
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class UserController {

    private final UserService userService;
    private final ExerciseServiceImpl exerciseService;
    private final DifficultyLevelServiceImpl difficultyLevelService;

    @Autowired
    public UserController(UserService userService, ExerciseServiceImpl exerciseService, DifficultyLevelServiceImpl difficultyLevelService) {
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.difficultyLevelService = difficultyLevelService;
    }

    @GetMapping("/user/trainingParameters")
    public String getTrainingParameters(Map<String,Object> model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user=(User)userService.loadUserByUsername(name);
        model.put("user",user);
        model.put("allDifficultyLevel",difficultyLevelService.getAll());
        model.put("allExercises",exerciseService.getAll());
        model.put("exercisesLevel1",exerciseService.getExercisesById(1L));
        model.put("exercisesLevel2",exerciseService.getExercisesById(2L));
        model.put("exercisesLevel3",exerciseService.getExercisesById(3L));
        model.put("exercisesLevel4",exerciseService.getExercisesById(4L));
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
