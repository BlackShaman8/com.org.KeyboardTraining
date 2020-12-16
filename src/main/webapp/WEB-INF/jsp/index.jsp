<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Авторизация</title>
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
            <div id="templatemo_menu">
                <ul>
                    <li><a href="/user/trainingParameters">Тренировка</a></li>
                    <li><a href="/user/userStats">Моя статистика</a></li>
                    <li><a href="/user/allUserStats">Общая статистика</a></li>
                    <li><a href="about.html">Обучение</a></li>
                    <li><a href="/logout" class="last">Выход</a></li>
                </ul>
            </div>
            <div>
                <h4 class="userpage1" align="middle">Логин пользователя: ${pageContext.request.userPrincipal.name}</h4>
                <h4 class="userpage2" align="middle">Текущий уровень: ${user.level}</h4>
                <a id="button2" class="c-button" href="user/editProfile">Редактировать учетную запись</a>
            </div>
            <div class="cleaner"></div>
            <div class="cleaner"></div>
        </div>
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1>Администратор</h1></div>
            </div>
            <div>
               <%-- <a id="buttonadm1" class="c-button" href="/editProfile">Редактировать учетную запись</a> --%>
                <a id="buttonadm2" class="c-button" href="/accountManagement">Управление учетными записями</a>
            </div>
            <div>
                <a id="buttonadm3" class="c-button" href="exercises">Просмотр упражнений</a>
                <a id="buttonadm4" class="c-button" href="difficultyLevels">Настройка уровней сложности</a>
            </div>
            <div>
                <a id="buttonadm5" class="c-button" href="/userStats">Общая статистика</a>
                <a id="buttonadm6" class="c-button" href="/logout">Выход</a>
            </div>
            <div id="templatemo_footer"></div>
            <div id="templatemo_footer"></div>
            <div id="templatemo_footer"></div>
            <div class="cleaner"></div>
        </div>
    </div>
</sec:authorize>
</body>
</html>