package com.keyboardTraining.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalTime;

@Entity
public class ResultTrain {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String login;
    private String exerciseName;
    private LocalTime time;
    private LocalTime avgKeyVelocity;

    public ResultTrain() {
    }

    public ResultTrain(String login, String exerciseName, LocalTime time, LocalTime avgKeyVelocity) {
        this.login = login;
        this.exerciseName = exerciseName;
        this.time = time;
        this.avgKeyVelocity = avgKeyVelocity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public LocalTime getAvgKeyVelocity() {
        return avgKeyVelocity;
    }

    public void setAvgKeyVelocity(LocalTime avgKeyVelocity) {
        this.avgKeyVelocity = avgKeyVelocity;
    }
}
