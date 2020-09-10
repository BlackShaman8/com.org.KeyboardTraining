package com.keyboardTraining.repos;

import com.keyboardTraining.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepos extends CrudRepository<User,Long> {
}
