package com.keyboardTraining.model;

import javax.persistence.*;

@Entity
public class Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    private DifficultyLevel myDifficultyLevel;
    private String exercise;

    public Exercise() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public DifficultyLevel getMyDifficultyLevel() {
        return myDifficultyLevel;
    }

    public void setMyDifficultyLevel(DifficultyLevel myDifficultyLevel) {
        this.myDifficultyLevel = myDifficultyLevel;
    }

    public String getExercise() {
        return exercise;
    }

    public void setExercise(String exercise) {
        this.exercise = exercise;
    }
}
