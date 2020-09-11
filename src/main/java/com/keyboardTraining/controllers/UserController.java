package com.keyboardTraining.controllers;

import com.keyboardTraining.model.User;
import com.keyboardTraining.service.LevelService;
import com.keyboardTraining.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class UserController {
    private UserService userService;
    private LevelService levelService;

    public UserController(UserService userService, LevelService levelService) {
        this.userService = userService;
        this.levelService = levelService;
    }

    @GetMapping("/enter")
    public String enter(){
        return "enter";
    }
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }


    @PostMapping("/registration")
    public String newReg(@RequestParam String login,@RequestParam String password,@RequestParam String role,Map<String, Object> model){
        User newUser=userService.getUser(login);
        if(newUser==null){
            if(role.equals("admin"))
                newUser=new User("admin", login,password);
            else{newUser=new User("user", login,password);}
        userService.addUser(newUser);
            return "home";
        }
        return "registration";
    }

    @PostMapping("/enter")
    public String ent(@RequestParam String login, @RequestParam String password, @RequestParam String role ){
        User searchUser;
        if(role.equals("admin"))
            searchUser=new User("admin", login,password);
        else{searchUser=new User("user", login,password);}
        User entUser=userService.getUser(searchUser);
        if(entUser!=null)
            return "home";
        else return "enter";
    }

}
