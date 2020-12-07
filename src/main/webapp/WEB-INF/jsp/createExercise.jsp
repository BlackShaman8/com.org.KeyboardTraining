<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/createExercise" method="post">
    <table border="0">
        <tr>
            <th>
                Уровень сложности упражнения:
            </th>
            <td>
                <select name="difficultyLevel">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>
                Текст упражнения:
            </th>
            <td>
                <input type="text" name="exercise">
            </td>
        </tr>
    </table>
    <input type="hidden" name="action" value="create"/>
    <button type="submit">Создать</button>
</form>
<form action="${pageContext.request.contextPath}/createExercise" method="post">
    <input type="hidden" name="difficultyLevel" value="id"/>
    <input type="hidden" name="exercise" value="ex"/>
    <input type="hidden" name="action" value="back"/>
    <button type="submit">Отмена</button>
</form>
</body>
</html>