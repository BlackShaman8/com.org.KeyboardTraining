<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Тренажер</title>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
</head>
<body background="../../resources/images/siren-tsvety-myshka-klaviatura-ruchka.jpg">
<sec:authorize access="!isAuthenticated()">
    <h4><a href="/login">Войти</a></h4>
    <h4><a href="/registration">Зарегистрироваться</a></h4>
</sec:authorize>
<sec:authorize access="hasRole('USER')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">
                <div id="site_title"><h1>Страница пользователя</h1></div>
            </div>
            <div style="height: 30px"></div>
            <div align="center">
                <h4 class="userpage1" style="color:#c68a4a;width: 300px; position: relative;" align="middle"><b>Логин
                    пользователя: ${pageContext.request.userPrincipal.name}</b></h4>
                <h4 class="userpage2" style="color:#c68a4a; position: relative; " align="middle"><b>Текущий
                    уровень: ${user.level}</b></h4>

            </div>
            <div align="center">
                <div><a class="gradient-btn"
                        href="user/editProfile">Редактировать
                    учетную запись</a></div>
                <div><a style="" href="/user/userStats" class="gradient-btn">Моя статистика</a></div>
                <div><a style="" href="/user/stats" class="gradient-btn">Общая статистика</a></div>
                <div>
                    <a href="/user/trainingParameters" class="gradient-btn">Тренировка</a></div>
                <div><a href="/logout" class="gradient-btn">Выход</a></div>
                <div style="height: 30px;"></div>
                <div><a style="" class="gradient-btn" href="about">Информация о
                    программе</a></div>
            </div>

        </div>
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title" style="position: relative"><h1>Администратор</h1></div>
            </div>
            <div style="height: 70px;"></div>

            <div align="center">
                <div>

                    <a style="" class="gradient-btn" href="/accountManagement">Управление учетными
                        записями</a>
                </div>
                <div>
                    <a style="" class="gradient-btn" href="exercises">Просмотр
                        упражнений</a></div>
                <div><a style="" class="gradient-btn" href="difficultyLevels">Уровни
                    сложности</a>
                </div>
                <div style="height:10px;"></div>
                <div>
                    <a style="" class="gradient-btn"
                       href="stats">Общая статистика</a></div>
                <div><a style="" class="gradient-btn" href="/logout">Выход</a>
                </div>
                <div style="height: 50px;"></div>

                <div>

                    <a style="" class="gradient-btn" href="/about">Информация
                        о программе</a>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>
</body>
</html>