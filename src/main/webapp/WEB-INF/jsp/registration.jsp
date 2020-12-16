<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Регистрация</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="templatemo_body_wrapper">
    <form:form method="POST" modelAttribute="userForm">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title"><h1>Создание учетной записи</h1></div>
            </div>
            <div>

                <h4 id="edit1" class="edit">Логин:&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <form:input type="text" path="login" class="col" name="login" align="middle" size="8"
                                placeholder="Логин пользователя" minLength="2" maxlength="8"></form:input>
                    <form:errors path="login"></form:errors>
                        ${usernameError}</h4>
                <h4 id="edit2" class="edit">Пароль:
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <form:input type="password" path="password" class="col" name="password" align="middle"
                                placeholder="Пароль" minLength="4" maxlength="12"></form:input></h4>
                <h4 id="edit3" class="edit">Повторите пароль: <form:input type="password" path="passwordConfirm"
                                                                          class="col" name="passwordConfirm" align="middle"
                                                                          placeholder="Пароль" minLength="4" maxlength="12"></form:input></h4>
                <form:errors path="password"></form:errors>
                    ${passwordError}
                <div><a id="buttonreg1" class="c-button" href="login">Авторизация</a>
                    <button type="submit" id="buttonreg2" class="c-button">Регистрация</button></div>

            </div>

        </div>
    </form:form>
</div>


</body>
</html>