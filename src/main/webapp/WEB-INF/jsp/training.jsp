<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Тренировка</title>
    <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css"> -->
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/index.css" rel="stylesheet" type="text/css"/>


    <%--       <style>--%>
    <%--           <%@include file="../../resources/css/bulma.min.css"%>--%>
    <%--       </style>--%>

    <style type="text/css">
        h3, .label, ul li {
            display: inline;
        }
    </style>
    <style type="text/css">
        html, body {
        }

        table form textarea {
            width: 650px;
        }
    </style>
</head>
<body onload="init(), keyboard(),StartGame()">
<script src="../../resources/js/virtualkeyboard.js"></script>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Тренировка</h1></div>

        </div>
        <div style="height: 30px"></div>

        <form method="post" name="myResult">
            <section class="hero is-primary is-large">
                <!-- воспользуемся готовым элементом hero из bulma -->
                <h4 style="color: #c68a4a; font-weight: bold;" class="enter" align="center">Логин
                    пользователя:${pageContext.request.userPrincipal.name} &nbsp&nbsp&nbsp&nbsp
                    Уровень: ${user.level}</h4>
                <input id="exercise" type="hidden" name="exercise" value="${exercise.exercise}"/>
                <input id="maxNumberOfErrors" type="hidden" name="maxNumberOfErrors"
                       value="${exercise.myDifficultyLevel.maxNumberOfErrors}"/>
                <input id="pressingTime" type="hidden" name="pressingTime"
                       value="${exercise.myDifficultyLevel.pressingTime}"/>
                <div class="hero-head container" align="center">
                    <div>
                        <div><h3 style="text-align:center; color: #c68a4a; font-weight: bold;" class="lab"><span
                                name="error_counter" id="error_counter">0</span>/${exercise.myDifficultyLevel.maxNumberOfErrors} Ошибок </h3>
                        </div>
                        <div>
                        <h3 style="color: #c68a4a; font-weight: bold;"
                            class="label is-size-4 has-text-link has-text-centered"><span name="speed_counter"
                                                                                          id="speed_counter">0</span>/
                            <span id="pressingTimeSpan"></span>
                            Зн./мин</h3>
                        </div>
                        <div style="height: 60px"></div>

                        <div class="hero-body has-background-grey-dark ">
                            <div id="columns">
                                <div class="buttons columns is-half is-centered ">
                                    <!-- и здесь у нас будет происходить отрисовка  -->


                                </div>
                            </div>
                        </div>
            </section>
            <div style="height: 20px"></div>

            <style type="text/css">
            </style>
            <div align="left"><h4 style="color: #c68a4a"><input id="onKeyboard" checked="checked" type="checkbox"
                                                                onchange="keyboard()"> Виртуальная клавиатура</h4>
            </div>
            <div><button type="button"
                    style="background:transparent ;line-height: 20px; width: 200px;height: 43px;font-size: 13px;left:400px;bottom:28px;"
                    class="gradient-btn" onclick="newGame()" value="Начать заново">Начать заново</button>
                <a style="left:310px;bottom:50px" class="gradient-btn" href="/user/trainingParameters">Настройки</a>

            </div>
            <div>
                <ul id="keyboard"></ul>
            </div>
            <input name="exerciseinput" type="hidden" value="${exercise.id}"/>
            <input name="transitTime" type="hidden" id="transitTime"/>
            <input name="averageSpeed" type="hidden" id="input_speed_counter"/>
            <input name="numberOfMistakes" type="hidden" id="input_error_counter" value="0"/>
            <input name="status" type="hidden" id="status" value="false"/>
            <input class="btnResult" type="submit" style="display:none"/>
    </div>
    </form>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>

</div>
</div>
</body>
</html>
