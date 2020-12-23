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
            font: 12px Verdana, Arial, Tahoma;
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
        </div> <!-- end of templatemo header -->

        <form method="post" name="myResult">
            <section class="hero is-primary is-large">
                <!-- воспользуемся готовым элементом hero из bulma -->
                <h4 style="color: #550055; font-weight: bold;" class="enter" align="right">Логин
                    пользователя:${pageContext.request.userPrincipal.name}</h4>
                <h4 class="userpage2" style="color:#550055; position: relative; left:700px;bottom:10px;" align="middle">
                    <b>Текущий уровень: ${user.level}</b></h4>
                <input id="exercise" type="hidden" name="exercise" value="${exercise.exercise}"/>
                <input id="maxNumberOfErrors" type="hidden" name="maxNumberOfErrors"
                       value="${exercise.myDifficultyLevel.maxNumberOfErrors}"/>
                <input id="pressingTime" type="hidden" name="pressingTime"
                       value="${exercise.myDifficultyLevel.pressingTime}"/>
                <div class="hero-head container">

                    <h3 style="text-align:center; color: #550055; font-weight: bold;" class="lab"><span
                            name="error_counter" id="error_counter">0</span> Ошибок</h3>
                    <h3 style="color: #550055; font-weight: bold;"
                        class="label is-size-4 has-text-link has-text-centered"><span name="speed_counter"
                                                                                      id="speed_counter">0</span>
                        Зн./мин</h3>
                    <input class="butggton" onclick="newGame()" value="Начать заново" type="button">
                    <a class="butggton" href="/user/trainingParameters">Настройки</a>

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
            <style type="text/css">* {
                margin: 0;
                padding: 0;
            }

            body {
                font: 71%/1.5 Verdana, Sans-Serif;
                background: #eee;
            }

            #container {
                margin: 100px auto;
                width: 688px;
            }

            #write {
                margin: 0 0 5px;
                padding: 5px;
                width: 671px;
                height: 200px;
                font: 1em/1.5 Verdana, Sans-Serif;
                background: #fff;
                border: 1px solid #f9f9f9;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
            }

            #keyboard {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            #keyboard li {
                float: left;
                margin: 0 5px 5px 0;
                width: 40px;
                height: 40px;
                line-height: 40px;
                text-align: center;
                background: #fff;
                border: 1px solid #f9f9f9;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
            }

            .capslock, .tab, .left-shift {
                clear: left;
            }

            #keyboard .tab, #keyboard .delete {
                width: 70px;
            }

            #keyboard .capslock {
                width: 80px;
            }

            #keyboard .return {
                width: 77px;
            }

            #keyboard .left-shift {
                width: 95px;
            }

            #keyboard .right-shift {
                width: 109px;
            }

            .lastitem {
                margin-right: 0;
            }

            .uppercase {
                text-transform: uppercase;
            }

            #keyboard .space {
                clear: left;
                width: 681px;
            }

            .on {
                display: none;
            }

            #keyboard li:hover {
                position: relative;
                top: 1px;
                left: 1px;
                border-color: #e5e5e5;
                cursor: pointer;
            }</style>
            <ul id="keyboard" ></ul>
            <input id="onKeyboard" checked="checked" type="checkbox" onchange="keyboard()">
            <input name="exerciseinput" type="hidden" value="${exercise.id}"/>
            <input name="transitTime" type="hidden" id="transitTime"/>
            <input name="averageSpeed" type="hidden" id="input_speed_counter"/>
            <input name="numberOfMistakes" type="hidden" id="input_error_counter"  value="0"/>
            <input name="status" type="hidden" id="status" value="false"/>
            <input class="btnResult" type="submit" style="display:none"/>
        </form>
        <script type="text/javascript" charset="windows-1251">
            <%@include file="../../resources/js/code.js"%>
        </script>
    </div>
</div>
</body>
</html>
