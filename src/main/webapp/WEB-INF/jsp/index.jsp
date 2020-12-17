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
            <div>
                <h4 class="userpage1" style="color:#550055; position: relative; left:700px;bottom:20px;" align="middle"><b>Логин пользователя: ${pageContext.request.userPrincipal.name}</b></h4>
                <h4 class="userpage2" style="color:#550055; position: relative; left:700px;bottom:10px;" align="middle"><b>Текущий уровень: ${user.level}</b></h4>

            </div>
            <a style="position: relative;width: 300px; right:10px;" class="butggton" href="user/editProfile">Редактировать
                учетную запись</a>
            <a style="right:120px; top:25px;" href="/user/userStats" class="butggton">Моя статистика</a>
            <a style="left:100px;bottom: 26px;" href="/user/stats" class="butggton">Общая статистика</a>
            <a style="right:120px;" href="/user/trainingParameters" class="butggton">Тренировка</a>
            <a style="left:100px;bottom: 51px;" href="/logout" class="butggton">Выход</a>
            <a style="position: relative;width: 300px; right:10px;" class="butggton" href="about">Информация о программе</a>


        </div>
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"style="position: relative"><h1>Администратор</h1></div>
            </div>
            <div>

                <a style="right:10px; width:300px" class="butggton" href="/accountManagement">Управление учетными
                    записями</a>
            </div>
            <div>
                <a style="right:120px;top:20px;" class="butggton" href="exercises">Просмотр упражнений</a>
                <a style="left:100px;bottom: 50px;" class="butggton" href="difficultyLevels">Настройка уровней
                    сложности</a>
            </div>
            <div>
                <a style="right:120px;bottom: 40px; border: 2px solid #550055;" class="butggton"
                   href="stats">Общая статистика</a>
                <a style="left:100px;bottom: 90px;" class="butggton" href="/logout">Выход</a>
            </div>
            <div>
            <a style="position: relative;width: 300px;bottom: 70px; right:10px;" class="butggton" href="/about">Информация о программе</a>
            </div>
        </div>
    </div>
</sec:authorize>
</body>
</html>