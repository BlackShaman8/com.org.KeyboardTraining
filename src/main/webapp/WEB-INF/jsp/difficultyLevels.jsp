<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Настройка параметров тренажера</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Настройка параметров тренажера</h1></div>
        </div> <!-- end of templatemo header -->


        <div>

            <table style="top:35px;position: relative;" class="col">
                <tr>
                    <th>Номер</th>
                    <th>Минимальная длина</th>
                    <th>Максимальная длина</th>
                    <th>Максимальное количество ошибок</th>
                    <th>Среднее время нажатия</th>
                    <th>Настройка</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
                    <tr align="center">
                        <td>${difficultyLevel.id}</td>
                        <td>${difficultyLevel.minLength}</td>
                        <td>${difficultyLevel.maxLength}</td>
                        <td>${difficultyLevel.maxNumberOfErrors}</td>
                        <td>${difficultyLevel.pressingTime}</td>
                        <td><a id="buttonedit" class="c-button" href="editDifficultyLevel/${difficultyLevel.id}">Изменить</a>
                        </td>
                    </tr>
                    <!--ряд с ячейками заголовков-->
                </c:forEach>
            </table>
        </div>

        <a style="right:10px; position: relative; top:40px;width: 150px;" id="buttonedit" class="butggton" href="/">Назад</a>
        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>