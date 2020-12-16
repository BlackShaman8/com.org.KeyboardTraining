package com.keyboardTraining.service;

import com.keyboardTraining.model.Statistics;
import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.StatisticRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticsService  {
    @Autowired
    private StatisticRepos statisticRepos;

    public List<Statistics> getAll(){
        return (List<Statistics>) statisticRepos.findAll();
    }

    public List<Statistics> getAllByUser(Long userId){
        return (List<Statistics>) statisticRepos.getAllByUserId(userId);
    }

    public void saveStatistics(Statistics statistics){
        statisticRepos.save(statistics);
    }
}
