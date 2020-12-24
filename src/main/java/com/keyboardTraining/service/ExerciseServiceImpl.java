package com.keyboardTraining.service;

import com.keyboardTraining.model.DifficultyLevel;
import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.Role;
import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.ExerciseRepos;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class ExerciseServiceImpl {
    private final ExerciseRepos exerciseRepos;

    public ExerciseServiceImpl(ExerciseRepos exerciseRepos) {
        this.exerciseRepos = exerciseRepos;
    }

    public boolean saveExercise(Exercise exercise) {
        exerciseRepos.save(exercise);
        return true;
    }

    public void deleteExercise(Exercise exercise) {
        exerciseRepos.delete(exercise);
    }

    public void changeExercise(Exercise exercise) {
        exerciseRepos.save(exercise);
    }

    public List<Exercise> getAll() {
        return (List<Exercise>) exerciseRepos.findAll();
    }

    public Exercise getExercise(Long id) {
        Optional<Exercise> exercise=exerciseRepos.findById(id);
        return exercise.orElse(new Exercise());
    }

    public void deleteExerciseId(Long id) {
        exerciseRepos.deleteById(id);
    }

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

    public List<Exercise> getExercisesById(Long id){

        return exerciseRepos.findExercisesByMyDifficultyLevel_Id(id);
    }
}
