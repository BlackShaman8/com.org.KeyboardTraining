package com.keyboardTraining.service;

import com.keyboardTraining.model.Exercise;

import java.util.List;

public interface ExerciseService {
    public Exercise addLevel(Exercise level);
    public void deleteLevel(Exercise exercise);
    public Exercise changeLevel(Exercise exercise);
    public List<Exercise> getAll();
    public Exercise getLevel(Long id);
    public void deleteLevelId(Long id);
    public Long count();
}
