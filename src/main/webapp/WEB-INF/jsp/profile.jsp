<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Мой профиль</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div class="container">
    <nav>
        <ul>


        </ul>
    </nav>
</div>
<div>Мой профиль</div>
<form method="post">
    <table border="0" >
        <tr>
            <th>Введите логин:</th>
            <th> <input type="text" name="login"></th>
        </tr>
        <tr>
            <th>Введите новый пароль:</th>
            <th> <input type="text" name="password" placeholder="Введите пароль"></th>
        </tr>
        <tr>
            <th>Повторите пароль:</th>
            <th> <input type="text" name="password" placeholder="Введите пароль"></th>
        </tr>
    </table>
    <button type="submit">Сохранить</button>
    <a href="/">Отмена</a>
</form>
</body>
</html>