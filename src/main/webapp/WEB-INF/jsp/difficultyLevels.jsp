<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Уровни сложности</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Уровни сложности</h1></div>
        </div> <!-- end of templatemo header -->

        <div style="height: 60px;"></div>

        <div>

            <table >
                <tr style="">
                    <th>Номер</th>
                    <th>Минимальная длина</th>
                    <th>Максимальная длина</th>
                    <th>Максимальное количество ошибок</th>
                    <th>Максимальное время нажатия</th>
                    <th>Настройка</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${allDifficultyLevel}" var="difficultyLevel">
                    <tr align="center">
                        <td>${difficultyLevel.id}</td>
                        <td>${difficultyLevel.minLength}</td>
                        <td>${difficultyLevel.maxLength}</td>
                        <td>${difficultyLevel.maxNumberOfErrors}</td>
                        <td>${difficultyLevel.pressingTime}</td>
                        <td style="height: 60px;"><a  class="gradient-btn" href="editDifficultyLevel/${difficultyLevel.id}">Настроить</a>
                        </td>
                    </tr>
                    <!--ряд с ячейками заголовков-->
                </c:forEach>
            </table>
        </div>
        <div style="height: 30px;"></div>

        <div align="center"><a style="height:25px;" class="gradient-btn" href="/">Главная страница</a></div>
        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>