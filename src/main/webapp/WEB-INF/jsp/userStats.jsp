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
        <sec:authorize access="hasRole('USER')">
            <div id="templatemo_header">
                <div id="site_title"><h1>Статистика пользователя</h1></div>
            </div>
            <!-- end of templatemo header -->
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
            <div id="templatemo_header">
                <div id="site_title"><h1>Статистика пользователей</h1></div>
            </div>
            <!-- end of templatemo header -->
        </sec:authorize>
        <div id="templatemo_menu">
            <ul>
                <li><a href="/">Главная страница</a></li>
                <sec:authorize access="hasRole('USER')">
                    <li><a href="trainingParameters">Тренировка</a></li>
                    <li><a href="/user/userStats">Моя статистика</a></li>
                    <li><a href="/user/allUserStats">Общая статистика</a></li>
                </sec:authorize>
                <li><a href="/logout">Выход</a></li>
            </ul>
        </div> <!-- end of templatemo_menu -->
        <sec:authorize access="hasRole('USER')">
            <div>
                <h4 id="userst" class="enter">Логин пользователя: ${user.login}</h4>
            </div>
        </sec:authorize>
        <div>
            <table>
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

            </table>
        </div>

        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>