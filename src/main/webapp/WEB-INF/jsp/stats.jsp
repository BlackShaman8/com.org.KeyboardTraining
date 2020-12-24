<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Общая статистика</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css"
          href="../../../../../../../Downloads/templatemo_304_light_gray_new/templatemo_304_light_gray/css/jquery.lightbox-0.5.css"/>

    <!-- Arquivos utilizados pelo jQuery lightBox plugin -->

</head>
<body id="top" style="  background-attachment: fixed;">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Общая статистика</h1></div>
        </div> <!-- end of templatemo header -->
        <sec:authorize access="hasRole('USER')">
            <DIV>
                <a style="top:40px;" class="gradient-btn" href="/user/trainingParameters">Тренировка</a>
                <a style="top:40px;left:20px" class="gradient-btn" href="/user/userStats">Моя статистика</a>
            </div>
            <!-- end of templatemo_menu -->
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
            <a style="top:40px;left: 50px;" class="gradient-btn" href="/">Главная страница</a>
            <!-- end of templatemo_menu -->
        </sec:authorize>
        <div style="height: 50px;"></div>
        <div align="right">
            <h4  style="bottom:55px;right:100px;font-weight: bold;color: #c68a4a;width:400px;" class="enter">
                Логин пользователя: ${pageContext.request.userPrincipal.name}</h4>
        </div>
        <div style="height: 20px;"></div>

        <div>
            <table style="position: relative; bottom:30px;">
                <tr align="center">
                    <th>Дата</th>
                    <th>Логин</th>
                    <th>№ упражнения</th>
                    <th>Время прохождения</th>
                    <th>Скорость печати</th>
                    <th>Количество ошибок</th>
                    <th>Статус</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${statistics}" var="statistics">
                    <tr ALIGN="center">
                        <td>${statistics.date}</td>
                        <td>${statistics.user.login}</td>
                        <td>${statistics.exercise.id}</td>
                        <td>${statistics.transitTime}</td>
                        <td>${statistics.averageSpeed}</td>
                        <td>${statistics.numberOfMistakes}</td>
                        <td>${statistics.status ? "Пройдено" : "Провалено"}</td>
                    </tr>
                </c:forEach>
                <!--ряд с ячейками тела таблицы-->

            </table>
            <div align="center"><a style="" class="gradient-btn" href="/">Главная страница</a></div>
        </div>

        <div style="position: relative" class="canvas">
            <svg class="chart" width="400" height="400" style="position:relative; left:495px; top:30px;"
                 viewBox="0 0 50 50">
                <circle style="fill:none;  stroke-width: 10;  stroke: #883a82;   stroke-dasharray: ${statistica150} 100;"
                        id="unit" r="15.9" cx="50%" cy="50%"/>
                <circle style="fill:none;  stroke-width: 10;  stroke: #008080;   stroke-dasharray: ${statistica150400} 100;stroke-dashoffset: -${statistica150};"
                        id="unit" r="15.9" cx="50%" cy="50%"/>
                <circle style="fill:none;  stroke-width: 10;   stroke: #c68a4a;  stroke-dasharray: ${statistica400} 100; stroke-dashoffset: -${statistica150}-${statistica150400}; id="
                        unit" r="15.9" cx="50%" cy="50%"/>
            </svg>
            <div style="position:relative;right:480px;top:30px; ">
                <ul class="caption-list">
                    <li class="caption-item"> <50 знаков/минуту</li>
                    <li class="caption-item">от 50 до 400 знаков/минуту</li>
                    <li class="caption-item">от 400 знаков/минуту</li>
                </ul>
            </div>
        </div> <!-- end of templatemo wrapper -->
    </div> <!-- end of templatemo body wrapper -->
    <div style="height: 40px;"></div>
    <div align="center"> <a style="" class="gradient-btn" href="#">Наверх</a></div>
</div>


</body>
</html>