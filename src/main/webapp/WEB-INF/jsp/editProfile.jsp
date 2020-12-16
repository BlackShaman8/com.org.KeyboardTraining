<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Редактирование профиля</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body background="../../resources/images/siren-tsvety-myshka-klaviatura-ruchka.jpg">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Редактирование профиля</h1></div>


        </div> <!-- end of templatemo header -->

        <form method="POST">
            <div>
                <h4  style="color: #550055;left:330px; position: relative;top:30px; font-weight: bold;" >Логин пользователя:${pageContext.request.userPrincipal.name}</h4>
                <h4 style="color: #550055;left:300px; position: relative;top:30px; font-weight: bold;">Логин: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="text" class="col" name="login" align="middle" placeholder="Логин пользователя"></h4>
                <h4 style="color: #550055;left:300px; position: relative;top:30px; font-weight: bold;">Пароль:
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="text" class="col" name="password" align="middle" placeholder="Пароль"></h4>
                <h4 style="color: #550055;left:300px; position: relative;top:30px; font-weight: bold;">Повторите пароль: <input type="text" class="col" name="passwordConfirm" align="middle"
                                                                     placeholder="Пароль"></h4>
                <input type="hidden" name="id" value="${user.id}">
                <div><button type="submit" style="right:100px;position: relative;top:30px;width: 160px;" class="butggton" >Сохранить</button>
                    <a style="left:91px; position: relative; bottom:21px;width: 150px;"  class="butggton" href="/">Отменить</a></div>

            </div>
        </form>
        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>