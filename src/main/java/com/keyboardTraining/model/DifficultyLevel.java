package com.keyboardTraining.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@Entity
@XmlRootElement(name="DifficultyLevel")
@XmlType(propOrder = {"maxLength","minLength","maxNumberOfErrors","pressingTime"})
public class DifficultyLevel{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    int maxLength;
    int minLength;
    int maxNumberOfErrors;
    double pressingTime;

    public DifficultyLevel() {
    }
@XmlAttribute
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getMaxLength() {
        return maxLength;
    }

    public void setMaxLength(int maxLength) {
        this.maxLength = maxLength;
    }

    public int getMinLength() {
        return minLength;
    }

    public void setMinLength(int minLength) {
        this.minLength = minLength;
    }

    public int getMaxNumberOfErrors() {
        return maxNumberOfErrors;
    }

    public void setMaxNumberOfErrors(int maxNumberOfErrors) {
        this.maxNumberOfErrors = maxNumberOfErrors;
    }

    public double getPressingTime() {
        return pressingTime;
    }

    public void setPressingTime(double pressingTime) {
        this.pressingTime = pressingTime;
    }
}


