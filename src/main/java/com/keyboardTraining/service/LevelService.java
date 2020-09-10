package com.keyboardTraining.service;

import com.keyboardTraining.model.Level;

import java.util.List;

public interface LevelService {
    public Level addLevel(Level level);
    public void deleteLevel(Level level);
    public Level changeLevel(Level level);
    public List<Level> getAll();
    public Level getLevel(Long id);
    public void deleteLevelId(Long id);
    public int count();
}
