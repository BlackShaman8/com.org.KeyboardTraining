<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <th>Номер</th>
    <th>Уровень сложности</th>
    <th>Текст упражнения</th>
    </thead>
    <c:forEach items="${allExercise}" var="exercise">
            <tr>
                <td>${exercise.id}</td>
                <td>${exercise.myDifficultyLevel.id}</td>
                <td>${exercise.exercise}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/exercises" method="post">
                        <input type="hidden" name="exerciseId" value="${exercise.id}"/>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
    </c:forEach>
</table>
    <a href="createExercise">Создать упражнение</a>
    <a href="/">Главная страница</a>
</body>
</html>