<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Параметры тренировки</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Параметры тренировки</h1></div>


        </div>


        <div>
            <form method="POST">
            <h4 id="trpar" class="enter">Логин пользователя: ${pageContext.request.userPrincipal.name}</h4>
            <h4 id="trpar" class="enter">Уровень:&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${user.level}</h4>
            <h4 id="list1" class="enter">Выберите уровень сложности:
                <select id="difficultyLevel" onchange="changeSelect()">
                    <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
                        <option> ${difficultyLevel.id}</option>
                    </c:forEach>
                </select></h4>
            <h4 id="list1" class="enter">Выберите упражнение:
                <h4 class="exerciseSelection">
                    <select id="sel idLevel" name ="section" <%--onchange="createTraining()"--%>>
                        <c:forEach items="${exercisesLevel1}" var="exercise">
                            <option value=" ${exercise.id}">
                                    ${exercise.exercise}
                            </option>
                        </c:forEach>
                    </select></h4>
            </h4>

                <button type="submit">Начать тренировку</button>
            </form>
            <div><a id="buttontrpar" onclick="saveExercise()" class="c-button hrefTraining" href="/user/training/">Начать тренировку</a></div>

        </div>
        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div>
</div>


</body>
</html>