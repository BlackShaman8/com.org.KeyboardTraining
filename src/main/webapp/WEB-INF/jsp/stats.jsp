<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Статистика пользователя</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css"
          href="../../../../../../../Downloads/templatemo_304_light_gray_new/templatemo_304_light_gray/css/jquery.lightbox-0.5.css"/>

    <!-- Arquivos utilizados pelo jQuery lightBox plugin -->
    <script type="text/javascript"
            src="../../../../../../../Downloads/templatemo_304_light_gray_new/templatemo_304_light_gray/js/jquery.js"></script>
    <script type="text/javascript"
            src="../../../../../../../Downloads/templatemo_304_light_gray_new/templatemo_304_light_gray/js/jquery.lightbox-0.5.js"></script>
    <link rel="stylesheet" type="text/css"
          href="../../../../../../../Downloads/templatemo_304_light_gray_new/templatemo_304_light_gray/css/jquery.lightbox-0.5.css"
          media="screen"/>
    <!-- / fim dos arquivos utilizados pelo jQuery lightBox plugin -->

    <!-- Ativando o jQuery lightBox plugin -->
    <script type="text/javascript">
        $(function () {
            $('#gallery a.box').lightBox();
        });
    </script>

</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title" ><h1>Статистика пользователя</h1></div>
        </div> <!-- end of templatemo header -->
        <sec:authorize access="hasRole('USER')">
        <div id="templatemo_menu">
            <ul>

                    <li><a href="/user/trainingParameters">Тренировка</a></li>
                    <li>
                        <a href="/user/userStats">Моя статистика</a></li>

                <li></li>
            </ul>
        </div> <!-- end of templatemo_menu -->
        </sec:authorize>
        <div>
            <h4 id="userst" style="top:30px;font-weight: bold;color: #550055" class="enter">Логин пользователя: ${pageContext.request.userPrincipal.name}</h4>
        </div>

        <div>
            <table style="position: relative;top:30px">
                <tr>
                    <th>Дата</th>
                    <th>Уровень</th>
                    <th>№ упражнения</th>
                    <th>Время прохождения</th>
                    <th>Скорость печати</th>
                    <th>Кол-во ошибок</th>
                    <th>Статус</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${statistics}" var="statistics">
                    <tr>
                        <td>${statistics.date}</td>
                        <td>${statistics.exercise.myDifficultyLevel.id}</td>
                        <td>${statistics.exercise.id}</td>
                        <td>${statistics.transitTime}</td>
                        <td>${statistics.averageSpeed}</td>
                        <td>${statistics.numberOfMistakes}</td>
                        <td>${statistics.status}</td>
                    </tr>
                </c:forEach>
                <!--ряд с ячейками тела таблицы-->

            </table>
            <a style="right:10px; position: relative; top:40px;width: 150px;" id="buttonedit" class="butggton" href="/">Назад</a>
        </div>

        <div style="position: relative" class="canvas">

            <svg class="chart" width="400" height="400" style="position:relative; left:495px; top:30px;" viewBox="0 0 50 50">
                <circle style="fill:none;  stroke-width: 10;  stroke: #3498db;   stroke-dasharray: 33 100;" id="unit" r="15.9" cx="50%" cy="50%"/>
                <circle style="fill:none;  stroke-width: 10;  stroke: #FF3399;   stroke-dasharray: 33 100;stroke-dashoffset: -33;" id="unit" r="15.9" cx="50%" cy="50%"/>
                <circle style="fill:none;  stroke-width: 10;   stroke: #550055;  stroke-dasharray: 34 100; stroke-dashoffset: -66; id="unit" r="15.9" cx="50%" cy="50%"/>
            </svg>
            <div style="position:relative;right:480px;top:30px; " >
                <ul class="caption-list">
                    <li class="caption-item"> <150 знаков/минуту </li>
                    <li class="caption-item">от 150 до 400 знаков/минуту</li>
                    <li class="caption-item">от 400 знаков/минуту</li>
                </ul>
            </div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>