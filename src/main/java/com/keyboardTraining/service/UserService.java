package com.keyboardTraining.service;

import com.keyboardTraining.model.User;

import java.util.List;

public interface UserService {
    public User addUser(User user);
    public void deleteUser(User user);
    public User changeUser(User user);
    public List<User> getAll();
    public User getUser(Long id);
    public User getUser(String login);
    public User getUser(User user);
    public void deleteUserId(Long id);
    public int count();

}
