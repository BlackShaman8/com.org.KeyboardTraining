<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Изменить уровень сложности</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/editDifficultyLevel/${difficultyLevel.id}" method="post">
    <table border="0">
        <tr>
            <th>
                Уровень сложности упражнения:
            </th>
            <td>
                ${difficultyLevel.id}
            </td>
        </tr>
        <tr>
            <th>
                Минимальная длина:
            </th>
            <td>
                <input type="number" name="minLength", value=${difficultyLevel.minLength}>
            </td>
        </tr>
        <tr>
            <th>
                Максимальная длина:
            </th>
            <td>
                <input type="number" name="maxLength", value=${difficultyLevel.maxLength}>
            </td>
        </tr>
        <tr>
            <th>
                Максимальное количество ошибок:
            </th>
            <td>
                <input type="number" name="maxNumberOfErrors", value=${difficultyLevel.maxNumberOfErrors}>
            </td>
        </tr>
        <tr>
            <th>
                Скорость нажатия клавиш в минуту:
            </th>
            <td>
                <input type="number" name="pressingTime", value=${difficultyLevel.pressingTime}>
            </td>
        </tr>
    </table>
    <input type="hidden" name="action" value="change"/>
    <input type="hidden" name="difficultyLevelId" value="${difficultyLevel.id}"/>
    <button type="submit">Изменить</button>
</form>
<form action="${pageContext.request.contextPath}/editDifficultyLevel" method="post">
    <input type="hidden" name="action" value="back"/>
    <button type="submit">Отмена</button>
</form>
</body>
</html>