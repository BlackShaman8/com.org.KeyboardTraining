package com.keyboardTraining.repos;

import com.keyboardTraining.model.DifficultyLevel;
import com.keyboardTraining.model.Exercise;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ExerciseRepos extends CrudRepository<Exercise,Long> {
    public List<Exercise> findExercisesByMyDifficultyLevel_Id(Long id);
}
