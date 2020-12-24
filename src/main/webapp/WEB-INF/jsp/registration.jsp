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
                <div id="site_title" ><h1 style=""><b>Создание учетной записи</b></h1></div>
            </div>
            <div>
                <h4  class="edit" style="color:#c68a4a;left:291px;"></h4>
                <h4  class="edit" style="color:#c68a4a;left:291px;"><b>Логин:&nbsp&nbsp&nbsp&nbsp</b>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <form:input style="width:169px" type="text" path="login" class="col" name="login" align="middle"
                                placeholder="Логин пользователя" minLength="2" maxlength="8"></form:input></h4>

                <h4 class="edit" style="color:#c68a4a;left:291px;"><b>Пароль:&nbsp&nbsp </b>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <form:input type="password" path="password" class="col" name="password" align="middle"
                                placeholder="Пароль" minLength="4" maxlength="12"></form:input></h4>
                <h4 id="edit3" class="edit" style="color:#c68a4a"><b>Повторите пароль: </b> <form:input type="password"
                                                                                                        path="passwordConfirm"
                                                                                                        class="col"
                                                                                                        name="passwordConfirm"
                                                                                                        align="middle"
                                                                                                        placeholder="Пароль"
                                                                                                        minLength="4"
                                                                                                        maxlength="12"></form:input>
                </h4>

                <div style="height:10px"></div>

                <form:errors style="text-align:center;color:#800080;left:291px;" path="login"></form:errors>
                <h4 align="center" style="font-weight: bold; color:#800080;left:291px;"> ${usernameError}</h4>
                <form:errors style="text-align:center;color:#800080;left:291px;" path="password"></form:errors>
                <h4 align="center" style="font-weight: bold; color:#800080;left:291px;"> ${passwordError}</h4>
                <div style="height:10px"></div>

                <div align="center"><a style="" class="gradient-btn" href="login">Авторизация</a>
                    <button id="reg" type="submit" style="left:110px;top:20px" class="gradient-btn"
                            onclick="validate()">Регистрация
                    </button>
                </div>

            </div>

        </div>
    </form:form>
</div>


</body>
</html>