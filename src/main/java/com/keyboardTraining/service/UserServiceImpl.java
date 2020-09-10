package com.keyboardTraining.service;

import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.UserRepos;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    private final UserRepos userRepos;

    public UserServiceImpl(UserRepos userRepos) {
        this.userRepos = userRepos;
    }

    @Override
    public User addUser(User user) {
        return null;
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
    public void deleteUserId(Long id) {

    }

    @Override
    public int count() {
        return 0;
    }
}
