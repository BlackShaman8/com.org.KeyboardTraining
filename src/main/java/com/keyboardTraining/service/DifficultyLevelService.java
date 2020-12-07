package com.keyboardTraining.service;

import com.keyboardTraining.model.DifficultyLevel;

import java.util.List;

public interface DifficultyLevelService {
    public void saveDifficultyLevel(DifficultyLevel level);
    public void deleteDifficultyLevel(DifficultyLevel exercise);
    public void changeDifficultyLevel(DifficultyLevel exercise);
    public List<DifficultyLevel> getAll();
    public DifficultyLevel getDifficultyLevel(Long id);
    public void deleteDifficultyLevelId(Long id);
    public Long count();
}
