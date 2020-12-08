<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <title>Параметры тренировки</title>
</head>
<body>

<div class="container">
    <nav>
        <ul>
            <li><h3>${pageContext.request.userPrincipal.name}</h3></li>
            <li>Ваш уровень: ${user.level}</li>
        </ul>
    </nav>
</div>
<div class="main">
    <div class="container">

        <table border="0">
            <th>Выберите уровень сложности:</th>

            <th><select id="difficultyLevel" onchange="changeSelect()">
                <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
                    <option> ${difficultyLevel.id}</option>
                </c:forEach>
            </select></th>
            </tr>
            <tr>
                <th>Выберите упражнение:</th>
                <th class="exerciseSelection">
                    <select><c:forEach items="${exercisesLevel1}" var="exercise">
                        <option>${exercise.exercise}</option>
                    </c:forEach></select>
                </th>
            </tr>
        </table>
    </div>
</div>
<a href="/user/training">Начать тренировку</a>

</body>
</html>
