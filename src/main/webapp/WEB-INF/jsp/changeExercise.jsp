<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Создание упражнения</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body onload="initChangeExercise()">
<form action="${pageContext.request.contextPath}/exercises/changeExercise/${exercise.id}" method="post">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">

                <div id="site_title"><h1>Создание упражнения</h1></div>

            </div> <!-- end of templatemo header -->

            <div style="height: 40px"></div>

            <h4 style="color:#c68a4a;font-weight: bold;" id="editex" class="enter">Номер
                упражнения:&nbsp&nbsp${exercise.id}</h4>

            <div style="position: relative;width:50% ">
                <input id="myDifficultyLevel" type="hidden" value="${exercise.myDifficultyLevel.id}"/>
                <p>
                <h4 style="color:#c68a4a;font-weight: bold;" id="editex" class="exerciseSelection enter">Уровень
                    сложности:
                    <select style="color:#c68a4a;font-weight: bold;" size="1" name="difficultyLevel"
                            id="difficultyLevel" required onchange="createExcercise()">
                        <option style="color:#c68a4a;font-weight: bold;" value="1">1</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="2">2</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="3">3</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="4">4</option>
                    </select></h4>
                </p>
                <div style="color:#800080;font-weight: bold;" class="cleaner_h10">Допустимые символы:
                    к,е,н,г,а,п,р,о,м,и,т,ь
                </div>

                <h4 style="right:50px;  font-size: 18px; color:#c68a4a;font-weight: bold;" for="text">Текст
                    упражнения:</h4>
                <span class="createDifficultyLevel"><textarea id="text" name="exercise" rows="10" cols="50"
                                                              class="required" type="text"
                                                              minlength="${difficulteLevel0.minLength}"
                                                              maxlength="${difficulteLevel0.maxLength}"
                                                              onkeydown="return restrictionOfEnteredCharacters(this,event)">${exercise.exercise}</textarea>
                    <input type="hidden" name="minLength" value="${difficulteLevel0.minLength}"/>
                    <input type="hidden" name="maxLength" value="${difficulteLevel0.maxLength}"/>
                    </span>


            </div>
        </div>
        <div align="center">
            <input type="hidden" name="action" value="create"/>
            <button name="buttonCreate" type="submit" style="bottom:150px;left:380px;width:180px;" class="gradient-btn"
                    value="create">Создать</button>
            <a style="bottom:170px;left:300px;" class="gradient-btn" href="#" onclick="autoExercise()">Сгенерировать</a>
            <input style="bottom:80px;left:150px;height:20px;width:100px;" class="gradient-btn" style="" type="file"
                   name="fileName" onchange="showExercise(this)"/>
        </div>
        <div align="center">
            <a style="width:180px !important;" class="gradient-btn" href="/exercises">Назад</a>
            <a style="" class="gradient-btn" href="/">Главная страница</a>
        </div>
        <h4 align="center">${errorMessage}</h4>
    </div>

</form>
</body>
</html>