package com.keyboardTraining.repos;

import com.keyboardTraining.model.DifficultyLevel;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DifficultyLevelRepos extends CrudRepository<DifficultyLevel,Long> {
    public List<DifficultyLevel> findAllByOrderById();
}
