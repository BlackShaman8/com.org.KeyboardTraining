<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Создание упражнения</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<form action="${pageContext.request.contextPath}/createExercise" method="post">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">

                <div id="site_title"><h1>Создание упражнения</h1></div>

            </div> <!-- end of templatemo header -->

            <div style="height: 40px"></div>

            <h4 style="color:#c68a4a;font-weight: bold;" id="editex" class="enter">Номер
                упражнения:&nbsp&nbsp${number}</h4>

            <div style="position: relative;width:50% ">
                <p>
                <h4 style="color:#c68a4a;font-weight: bold;" id="editex" class="exerciseSelection enter">Уровень
                    сложности:
                    <select style="color:#c68a4a;font-weight: bold;" size="1" name="difficultyLevel"
                            id="difficultyLevel" required onchange="createExcercise()">
                        <option style="color:#c68a4a;font-weight: bold;" value="1">1</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="2">2</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="3">3</option>
                        <option style="color:#c68a4a;font-weight: bold;" value="4">4</option>
                    </select></h4>
                </p>
                <div style="color:#800080;font-weight: bold;" class="cleaner_h10">Допустимые символы:
                    к,е,н,г,а,п,р,о,м,и,т,ь
                </div>

                <h4 style="right:50px;  font-size: 18px; color:#c68a4a;font-weight: bold;" for="text">Текст
                    упражнения:</h4>
                <span class="createDifficultyLevel"><textarea id="text" name="exercise" rows="10" cols="50"
                                                              class="required" type="text"
                                                              minlength="${difficulteLevel0.minLength}"
                                                              maxlength="${difficulteLevel0.maxLength}"
                                                              onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea>
                    <input type="hidden" name="minLength" value="${difficulteLevel0.minLength}"/>
                    <input type="hidden" name="maxLength" value="${difficulteLevel0.maxLength}"/>
                    </span>


            </div>
        </div>
        <div align="center">
            <input type="hidden" name="action" value="create"/>
            <button name="buttonCreate" type="submit" style="bottom:150px;left:305px;width:160px;" class="gradient-btn"
                    value="create">Создать</button>
            <a style="bottom:110px;left:60px;" class="gradient-btn" href="#" onclick="autoExercise()">&nbspСгенерировать&nbsp</a>
            <label style="right:109px;bottom:45px;font-size: 12px;height:16px;line-height: 16px !important; width:125px;" class="gradient-btn">
            <input type="file"  name="fileName" onchange="showExercise(this)"/> &nbsp&nbsp&nbsp&nbsp&nbspЗагрузить&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            </label>
        </div>
        <div align="center">
            <a style="width:180px !important;" class="gradient-btn" href="/exercises">Назад</a>
            <a  class="gradient-btn" href="/" style="left:10px;">Главная страница</a>
        </div>
        <h4 align="center">${errorMessage}</h4>
    </div>
</form>
</body>
</html>