<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Настройка уровня сложности</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<form action="${pageContext.request.contextPath}/editDifficultyLevel/${difficultyLevel.id}" method="post">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Настройка уровня сложности</h1></div>
        </div> <!-- end of templatemo header -->

        <div>
            <table class="col" align="center" style="width:50%">
                <tr align="center">
                    <td>Уровень сложности упражнения</td>
                    <td class="col">1</td>
                </tr> <!--ряд с ячейками заголовков-->
                <tr align="center">
                    <td id="td1">Минимальная длина</td>
                    <td><input type="number" style="text-align: center; width:3em;" name="minLength" class="col" size="1" min="20" max="200" value=${difficultyLevel.minLength}></td>
                </tr>
                <tr align="center">
                    <td>Максимальная длина</td>
                    <td><input type="number" style="text-align: center; width:3em;" name="maxLength" class="col" size="1" min="20" max="200" value=${difficultyLevel.maxLength}></td>
                </tr>
                <tr align="center">
                    <td>Максимальное количество ошибок</td>
                    <td><input type="number" style="text-align: center; width:3em;" name="maxNumberOfErrors" class="col" size="1" min="1" max="10" value=${difficultyLevel.maxNumberOfErrors}></td>
                </tr>
                <tr align="center">
                    <td>Максимальное время нажатия</td>
                    <td><input type="number" style="text-align: center; width:3em;"  name="pressingTime" class="col" step="0.1" min="0" max="3" value=${difficultyLevel.pressingTime}></td>
                </tr>
                <!--ряд с ячейками тела таблицы-->

            </table>
            <input type="hidden" name="difficultyLevelId" value="${difficultyLevel.id}"/>
            <div align="center">
            <button type="submit"  class="gradient-btn" href="createExercise" style="width:130px;top:40px;left:30px">Сохранить</button>
            <a  class="gradient-btn" href="/difficultyLevels" style="top:20px">Назад</a>
        </div>


        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->

</form>
</body>
</html>