package com.keyboardTraining.service;

import com.keyboardTraining.model.Exercise;

import java.util.List;

public interface ExerciseService {
    public boolean saveExercise(Exercise level);
    public void deleteExercise(Exercise exercise);
    public Exercise changeExercise(Exercise exercise);
    public List<Exercise> getAll();
    public Exercise getExercise(Long id);
    public void deleteExerciseId(Long id);
    public int count();
}
