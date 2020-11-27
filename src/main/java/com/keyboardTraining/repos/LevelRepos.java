package com.keyboardTraining.repos;

import com.keyboardTraining.model.Exercise;
import org.springframework.data.repository.CrudRepository;

public interface LevelRepos extends CrudRepository<Exercise,Long> {
}
