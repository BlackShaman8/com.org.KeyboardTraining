package com.keyboardTraining.service;

import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.repos.LevelRepos;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciseServiceImpl implements ExerciseService {
    private final LevelRepos levelRepos;

    public ExerciseServiceImpl(LevelRepos levelRepos) {
        this.levelRepos = levelRepos;
    }

    @Override
    public Exercise addLevel(Exercise exercise) {
        return null;
    }

    @Override
    public void deleteLevel(Exercise exercise) {

    }

    @Override
    public Exercise changeLevel(Exercise exercise) {
        return null;
    }

    @Override
    public List<Exercise> getAll() {
        return null;
    }

    @Override
    public Exercise getLevel(Long id) {
        return null;
    }

    @Override
    public void deleteLevelId(Long id) {

    }

    @Override
    public Long count() {

        return null;
    }
}
