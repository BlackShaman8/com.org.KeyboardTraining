package com.keyboardTraining.service;

import com.keyboardTraining.model.Level;
import com.keyboardTraining.repos.LevelRepos;

import java.util.List;

public class LevelServiceImpl implements  LevelService{
    private final LevelRepos levelRepos;

    public LevelServiceImpl(LevelRepos levelRepos) {
        this.levelRepos = levelRepos;
    }

    @Override
    public Level addLevel(Level level) {
        return null;
    }

    @Override
    public void deleteLevel(Level level) {

    }

    @Override
    public Level changeLevel(Level level) {
        return null;
    }

    @Override
    public List<Level> getAll() {
        return null;
    }

    @Override
    public Level getLevel(Long id) {
        return null;
    }

    @Override
    public void deleteLevelId(Long id) {

    }

    @Override
    public int count() {
        return 0;
    }
}
