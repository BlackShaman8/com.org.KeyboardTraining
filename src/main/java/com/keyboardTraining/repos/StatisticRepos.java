package com.keyboardTraining.repos;

import com.keyboardTraining.model.Statistics;
import com.keyboardTraining.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StatisticRepos extends CrudRepository<Statistics,Long> {
    public List<Statistics> getAllByUserId(Long userId);
    public void deleteAllByExercise_Id(Long exerciseId);
}
