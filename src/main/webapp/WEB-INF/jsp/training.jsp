<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Log in with your account</title>
    <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css"> -->



<%--    <style>--%>
<%--        <%@include file="../../resources/css/bulma.min.css"%>--%>
<%--    </style>--%>

    <style type="text/css">
        h3,.label,ul li {
            display: inline;
        }
    </style>

</head>
<body onload="init()">
<section class="hero is-primary is-large">
    <!-- воспользуемся готовым элементом hero из bulma -->
    <h class="label is-size-4" align="right">${pageContext.request.userPrincipal.name}</h>
    <h>Ваш уровень: ${user.level}</h>
    <div class="hero-head container">
        <h1 class="label is-size-3 has-text-white promo"> Наш простой тренажер</h1>
        <ul>
            <li><h3 class="label is-size-4 has-text-link has-text-centered"><span id="error_counter">0</span> Ошибок</h3></li>
            <li><h3 class="label is-size-4 has-text-link has-text-centered"><span id="speed_counter">0</span> Зн./мин</h3></li>
            <li><input onclick="newGame()" value= "Начать заново" type="button"></li>
            <li><a href="/user/trainingParameters">Настройки</a></li>
        </ul>
        <progress id="prog" class="progress is-danger" value="0" max="20"></progress>
        <h3 class="label is-size-5 has-text-white has-text-centered begin">Press Enter to Start</h3>
    </div>

    <div class="hero-body has-background-grey-dark ">
        <div id="columns">
            <div class="buttons columns is-half is-centered ">
                <!-- и здесь у нас будет происходить отрисовка  -->


            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="windows-1251">
    <%@include file="../../resources/js/code.js"%>
</script>
</body>