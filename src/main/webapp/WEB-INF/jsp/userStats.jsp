<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Статистика</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>


</head>
<body style="  background-attachment: fixed;">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Статистика</h1></div>
        </div> <!-- end of templatemo header -->
        <div style="height: 50px"></div>
        <sec:authorize access="hasRole('USER')">
            <a style="" href="/user/trainingParameters" class="gradient-btn">Тренировка</a>
        </sec:authorize>
        <a style="left:20px;" href="/stats" class="gradient-btn">Общая статистика</a>
        <sec:authorize access="hasRole('USER')">
            <div>
                <h4 style="bottom:40px;color: #c68a4a; font-weight: bold;right:100px; " align="right" class="enter">Логин
                    пользователя: ${pageContext.request.userPrincipal.name}</h4>
            </div>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
            <a style="left:30px;" href="/accountManagement" class="gradient-btn">Учетные записи</a>
            <div>
                <h4 style="bottom:50px;color: #550055; font-weight: bold" align="right" class="enter">Логин
                    пользователя: ${user.login}</h4>
            </div>
        </sec:authorize>
        <div style="height: 30px"></div>

        <div>
            <table style="bottom:30px;position: relative;">
                <tr>
                    <th>Дата</th>
                    <th>Уровень упражнения</th>
                    <th>№ упражнения</th>
                    <th>Время прохождения</th>
                    <th>Скорость печати</th>
                    <th>Количество ошибок</th>
                    <th>Статус</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${statistics}" var="statistics">
                    <tr ALIGN="center">
                        <td>${statistics.date}</td>
                        <td>${statistics.exercise.myDifficultyLevel.id}</td>
                        <td>${statistics.exercise.id}</td>
                        <td>${statistics.transitTime}</td>
                        <td>${statistics.averageSpeed}</td>
                        <td>${statistics.numberOfMistakes}</td>
                        <td>${statistics.status ? "Пройдено" : "Провалено"}</td>
                    </tr>
                </c:forEach>

            </table>
            <div align="center"><a style="right: 20px;" class="gradient-btn" href="/">Главная страница</a><a  class="gradient-btn" href="#">Наверх</a></div>
        </div>

        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>