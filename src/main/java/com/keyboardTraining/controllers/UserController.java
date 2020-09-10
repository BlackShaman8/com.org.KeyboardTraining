package com.keyboardTraining.controllers;

import com.keyboardTraining.model.User;
import com.keyboardTraining.service.LevelService;
import com.keyboardTraining.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
            if(role=="админ")
                newUser=new User("админ", login,password);
            else{newUser=new User("пользователь", login,password);}
            userService.addUser(newUser);
            Iterable<User> users = userService.getAll();
            model.put("users",users);
            return "home";
        }
        return "registration";
    }

    @PostMapping("/enter")
    public String ent(@RequestParam String login, @RequestParam String password, @RequestParam String role ){
        User searchUser;
        if(role=="админ")
            searchUser=new User("админ", login,password);
        else{searchUser=new User("пользователь", login,password);}
        User entUser=userService.getUser(searchUser);
        if(entUser!=null)
            return "home";
        else return "enter";
    }

}
