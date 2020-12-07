<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Уровни сложности</title>
</head>
<body>
<table>
    <thead>
    <th>Номер</th>
    <th>Минимальная длина</th>
    <th>Максимальная длина</th>
    <th>Максимальное количество ошибок</th>
    <th>Время нажатия</th>
    </thead>
    <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
        <tr>
            <td>${difficultyLevel.id}</td>
            <td>${difficultyLevel.minLength}</td>
            <td>${difficultyLevel.maxLength}</td>
            <td>${difficultyLevel.maxNumberOfErrors}</td>
            <td>${difficultyLevel.pressingTime}</td>
            <td>
                    <a href="editDifficultyLevel/${difficultyLevel.id}">Изменить</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/">Назад</a>
</body>
</html>