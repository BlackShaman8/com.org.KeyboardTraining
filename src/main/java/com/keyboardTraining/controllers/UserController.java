package com.keyboardTraining.controllers;

import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.Statistics;
import com.keyboardTraining.model.User;
import com.keyboardTraining.service.DifficultyLevelServiceImpl;
import com.keyboardTraining.service.ExerciseServiceImpl;
import com.keyboardTraining.service.StatisticsService;
import com.keyboardTraining.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    private final UserService userService;
    private final ExerciseServiceImpl exerciseService;
    private final DifficultyLevelServiceImpl difficultyLevelService;
    private final StatisticsService statisticsService;
    private String exer;
    private String my_error_counter;
    private String my_speed_counter;
    private String my_status;

    @Autowired
    public UserController(UserService userService, ExerciseServiceImpl exerciseService, DifficultyLevelServiceImpl difficultyLevelService, StatisticsService statisticsService) {
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.difficultyLevelService = difficultyLevelService;
        this.statisticsService = statisticsService;
        exer = "";
        my_error_counter = "";
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


    @GetMapping("/user/training")
    public String getTraining(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        Exercise exercise = exerciseService.getExercise(Long.parseLong(exer));
        model.put("exercise", exercise);
        model.put("exerciseLength",exercise.getExercise().length());
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


    @GetMapping("/user/editProfile")
    public String getEditProfile(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        model.put("errorMessage","");
        return "editProfile";
    }
    @GetMapping("/user/editProfile/error")
    public String getEditProfileError(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        model.put("errorMessage","Данный логин занят");
        return "editProfile";
    }

    @GetMapping("/user/result")
    public String getResult(Map<String, String> model) {
        model.put("error_counter", my_error_counter);
        model.put("speed_counter", my_speed_counter);
        model.put("status", my_status);
        return "result";
    }

    @GetMapping("/user/stats")
    public String getUserStats(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        model.put("statistics", statisticsService.getAll());
        model.put("statistica150", (double) statisticsService.getAllLess(50) / (double) statisticsService.getAll().size() * 100);
        model.put("statistica150400", (double) statisticsService.getAllLess(50, 400) / (double) statisticsService.getAll().size() * 100);
        model.put("statistica400", (double) statisticsService.getAllMore(400) / (double) statisticsService.getAll().size() * 100);
        return "stats";
    }

    @GetMapping("/user/userStats")
    public String getAllUserStats(Map<String, Object> model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        model.put("user", user);
        model.put("statistics", statisticsService.getAllByUser(user.getId()));
        return "userStats";
    }

    @PostMapping("/user/editProfile/error")
    public String postEditProfileError(@RequestParam String login, @RequestParam String password, @RequestParam String passwordConfirm, @RequestParam String id) {
        if (password.equals(passwordConfirm)) {
            User user = userService.findUserById(Long.parseLong(id));
            if (!userService.loadUserByUsername(login).equals(null)) {
                user.setLogin(login);
                return "redirect:/user/editProfile/error";
            }
            userService.changeLogin(user);
        }
        return "editProfile";
    }

    @PostMapping("/user/editProfile")
    public String postEditProfile(@RequestParam String login, @RequestParam String password, @RequestParam String passwordConfirm, @RequestParam String id) {
        if (password.equals(passwordConfirm)) {
            User user = userService.findUserById(Long.parseLong(id));
            if (!userService.loadUserByUsername(login).equals(null)) {
                user.setLogin(login);
                return "redirect:/user/editProfile/error";
            }
            userService.changeLogin(user);
        }
        return "editProfile";
    }


    @PostMapping("/user/trainingParameters")
    public String postPerameters(Map<String, Object> model, @RequestParam String section) {
        exer = section.trim();
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();//get logged in username
//        User user = (User) userService.loadUserByUsername(name);
//        model.put("user", user);
//        Exercise exercise=exerciseService.getExercise(Long.parseLong(exer.trim()));
//        model.put("exercise", exercise);
        return "redirect:training";
    }

    @PostMapping("/user/training")
    public String postTraining(@RequestParam String exerciseinput, @RequestParam String transitTime,
                               @RequestParam String averageSpeed, @RequestParam String numberOfMistakes,
                               @RequestParam String status) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();//get logged in username
        User user = (User) userService.loadUserByUsername(name);
        Statistics statistics = new Statistics();
        statistics.setUser(user);
        statistics.setExercise(exerciseService.getExercise(Long.parseLong(exerciseinput.trim())));
        statistics.setTransitTime(Double.parseDouble(transitTime.trim()));
        statistics.setAverageSpeed(Double.parseDouble(averageSpeed.trim()));
        statistics.setNumberOfMistakes(Integer.parseInt(numberOfMistakes.trim()));
        statistics.setDate(new Date());
        if (status.equals("true"))
            statistics.setStatus(true);
        else
            statistics.setStatus(false);
        statisticsService.saveStatistics(statistics);
        my_error_counter = numberOfMistakes;
        my_speed_counter = averageSpeed;
        my_status = status;
        if(status.equals("true")){
            User userLevel=userService.findUserById(user.getId());
            userLevel.setLevel(userLevel.getLevel()+1);
            userService.changeUser(userLevel);
        }
        return "redirect:result";
    }
}
