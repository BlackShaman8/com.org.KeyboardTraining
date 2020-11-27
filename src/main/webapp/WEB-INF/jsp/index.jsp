<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div>
    <h3>${pageContext.request.userPrincipal.name}</h3>
    <sec:authorize access="!isAuthenticated()">
        <h4><a href="/login">Войти</a></h4>
        <h4><a href="/registration">Зарегистрироваться</a></h4>
    </sec:authorize>

    <sec:authorize access="hasRole('USER')">
        <section class="container">
            <ul class="nav topmenu">
                <li>
                    <a href="/user/trainingParameters">Тренировка</a>
                </li>
                <li>
                    <a href="/user/download">Моя статистика</a>
                </li>
                <li>
                    <a href="/user/userList">Общая статистика</a>
                </li>
                <li>
                    <a href="/admin">Обучение</a>
                </li>
                <li>
                    <a href="logout">Выход</a>
                </li>

            </ul>
            <div>
                <a href="profile">Редактировать учетную запись</a>
            </div>
        </section>
    </sec:authorize>
    <sec:authorize access="hasRole('ADMIN')">
        <section class="container">
            <ul class="nav topmenu">
                <li>
                    <a href="/admin/trainingParameters">Редактировать учетную запись</a>
                </li>
                <li>
                    <a href="/admin/download">Просмотр упражнений</a>
                </li>
                <li>
                    <a href="/admin/userList">Общая статистика</a>
                </li>
                <li>
                    <a href="/admin">Управление учетными записями</a>
                </li>
                <li>
                    <a href="/admin/statistic">Настройка уровней сложности</a>
                </li>
                <li>
                    <a href="logout">Выход</a>
                </li>
            </ul>
        </section>
    </sec:authorize>
    <a href="/admin">Настройка уровней сложности</a>
</div>
</body>
</html>