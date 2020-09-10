package com.keyboardTraining.service;

import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.UserRepos;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService{
    private final UserRepos userRepos;

    public UserServiceImpl(UserRepos userRepos) {
        this.userRepos = userRepos;
    }

    @Override
    public User addUser(User user) {
        return userRepos.save(user);
    }

    @Override
    public void deleteUser(User user) {

    }

    @Override
    public User changeUser(User user) {
        return null;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public User getUser(Long id) {
        return null;
    }

    @Override
    public User getUser(String login) {
        User user= userRepos.findUserByLogin(login);
        return user;
    }

    @Override
    public User getUser(User searchUser) {
        User user= userRepos.findUserByLogin(searchUser.getLogin());
        return user;
    }

    @Override
    public void deleteUserId(Long id) {

    }

    @Override
    public int count() {
        return 0;
    }
}
