<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html lang="en">
<head>
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
        <th>Выберите
        <table border="0">
            <tr> уровень сложности:</th>

                <th><select>
                    <option>Уровень 1</option>
                    <option>Уровень 2</option>
                    <option>Уровень 3</option>
                    <option>Уровень 4</option>
                </select></th>
            </tr>
            <tr>
                <th>Выберите упражнение:</th>
                <th>numLevel</th>
            </tr>
        </table>
    </div>
</div>
<a href="/user/training">Начать тренировку</a>
</body>
</html>