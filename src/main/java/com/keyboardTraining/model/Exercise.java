package com.keyboardTraining.model;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

@Entity
@XmlRootElement(name = "Exercise")
@XmlType(propOrder = {"myDifficultyLevel","exercise"})
public class Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    private DifficultyLevel myDifficultyLevel;
    private String exercise;

    public Exercise() {
    }

@XmlTransient
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
