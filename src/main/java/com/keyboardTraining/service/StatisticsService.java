package com.keyboardTraining.service;

import com.keyboardTraining.model.Statistics;
import com.keyboardTraining.model.User;
import com.keyboardTraining.repos.StatisticRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatisticsService {
    @Autowired
    private StatisticRepos statisticRepos;

    public List<Statistics> getAll() {
        return (List<Statistics>) statisticRepos.findAll();
    }

    public List<Statistics> getAllByUser(Long userId) {
        return (List<Statistics>) statisticRepos.getAllByUserId(userId);
    }

    public void saveStatistics(Statistics statistics) {
        statisticRepos.save(statistics);
    }

    public int getAllLess(double less) {
        int count = 0;
        List<Statistics> list = (List<Statistics>) statisticRepos.findAll();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAverageSpeed() <= less)
                count++;
        }

        return count;
    }

    public int getAllLess(double more, double less) {
        int count = 0;
        List<Statistics> list = (List<Statistics>) statisticRepos.findAll();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAverageSpeed() <= less && list.get(i).getAverageSpeed() > more)
                count++;
        }
        return count;
    }

    public int getAllMore(double more) {
        int count = 0;
        List<Statistics> list = (List<Statistics>) statisticRepos.findAll();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getAverageSpeed() > more)
                count++;
        }
        return count;
    }

    public void deleteAllByExercide(Long ex) {
        List<Statistics> all = (List<Statistics>) statisticRepos.findAll();
        for (int i = 0; i < getAll().size(); i++) {
            Long l=all.get(i).getExercise().getId();
            if (l.equals(ex)) {
                statisticRepos.delete(all.get(i));
                List<Statistics> newAll = (List<Statistics>) statisticRepos.findAll();
                int a=1;
            }
        }
    }
}
