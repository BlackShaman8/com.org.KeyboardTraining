package com.keyboardTraining.service;

import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.Role;
import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.ExerciseRepos;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class ExerciseServiceImpl implements ExerciseService {
    private final ExerciseRepos exerciseRepos;

    public ExerciseServiceImpl(ExerciseRepos exerciseRepos) {
        this.exerciseRepos = exerciseRepos;
    }

    @Override
    public boolean saveExercise(Exercise exercise) {
        exerciseRepos.save(exercise);
        return true;
    }

    @Override
    public void deleteExercise(Exercise exercise) {

    }

    @Override
    public Exercise changeExercise(Exercise exercise) {
        return null;
    }

    @Override
    public List<Exercise> getAll() {
        return (List<Exercise>) exerciseRepos.findAll();
    }

    @Override
    public Exercise getExercise(Long id) {
        return null;
    }

    @Override
    public void deleteExerciseId(Long id) {
        exerciseRepos.deleteById(id);
    }

    @Override
    public int count() {
        return getAll().size();
    }
    public List<Long> getAllDifficultyLevels(){
        List<Exercise> exercises=getAll();
        List<Long> list= Arrays.asList();
//        for(int i=0;i<count();i++){
//            list.add(exercises.get(i).getId());
//        }
        return list;
    }
}
