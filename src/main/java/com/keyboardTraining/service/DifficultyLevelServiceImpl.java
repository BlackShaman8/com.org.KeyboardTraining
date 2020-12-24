package com.keyboardTraining.service;

import com.keyboardTraining.model.DifficultyLevel;
import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.DifficultyLevelRepos;
import org.hibernate.mapping.Collection;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class DifficultyLevelServiceImpl {
    private final DifficultyLevelRepos difficultyLevelRepos;

    public DifficultyLevelServiceImpl(DifficultyLevelRepos difficultyLevelRepos) {
        this.difficultyLevelRepos = difficultyLevelRepos;
    }

    public void saveDifficultyLevel(DifficultyLevel level) {
        difficultyLevelRepos.save(level);
    }

    public void deleteDifficultyLevel(DifficultyLevel exercise) {

    }

    public void changeDifficultyLevel(DifficultyLevel level) {
        difficultyLevelRepos.save(level);
    }

    public List<DifficultyLevel> getAll() {
        return difficultyLevelRepos.findAllByOrderById();
    }

    public DifficultyLevel getDifficultyLevel(Long id) {
        Optional<DifficultyLevel> difficultyLevelFromBD = difficultyLevelRepos.findById(id);
        return difficultyLevelFromBD.orElse(new DifficultyLevel());
    }


}
