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
        <div style="height: 60px"></div>


        <div>
            <form method="POST">
                <h4 style="color: #c68a4a; font-weight: bold;" class="enter" align="center">Логин
                    пользователя:${pageContext.request.userPrincipal.name} &nbsp&nbsp&nbsp&nbsp Уровень: ${user.level}</h4>
                <div style="height: 20px"></div>
                <h4 id="list1" style="top:5px;color: #c68a4a; font-weight: bold; class="enter">Выберите уровень сложности:
                    <select style="color: #c68a4a; font-weight: bold;" id="difficultyLevel" onchange="changeSelect()">
                        <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
                            <option> ${difficultyLevel.id}</option>
                        </c:forEach>
                    </select></h4>
                <div style="">
                    <h4  style="color: #c68a4a;top:0px; font-weight: bold;">Выберите упражнение:
                        <h4 class="exerciseSelection" style="">
                            <select style="color: #800080;max-width:250px; font-weight: bold;" id="sel idLevel"
                                    name="section" <%--onchange="createTraining()"--%>>
                                <c:forEach items="${exercisesLevel1}" var="exercise">
                                    <option style="color: #800080; font-weight: bold;" value=" ${exercise.id}">
                                            ${exercise.exercise}
                                    </option>
                                </c:forEach>
                            </select></h4>
                    </h4>
                </div>
                <div style="height: 40px"></div>

                <div align="center">
                    <button type="submit" class="gradient-btn" style="width: 200px;left:80px">Начать тренировку</button>
                    <a  style="bottom: 20px;right: 10px" class="gradient-btn" href="/">Главная страница</a>
                </div>
            </form>
        </div>
        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div>
</div>


</body>
</html>