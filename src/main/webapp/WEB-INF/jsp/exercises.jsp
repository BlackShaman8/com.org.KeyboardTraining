<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Параметры тренировки</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Упражнения</h1></div>
            <div style="height: 70px;"></div>

            <div style="word-wrap: break-word">

                <table style="table-layout: fixed">
                    <thead>
                    <th width="6%">Номер</th>
                    <th width="10%">Уровень сложности</th>
                    <th>Текст упражнения</th>
                    <th width="15%">Сохранение</th>
                    <th width="15%">Изменение</th>
                    <th width="15%">Удаление</th>
                    </thead>
                    <c:forEach items="${allExercise}" var="exercise">
                        <tr>
                            <td style="text-align: center">${exercise.id}</td>
                            <td style="text-align: center">${exercise.myDifficultyLevel.id}</td>
                            <td>${exercise.exercise}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/exercises/save" method="post">
                                    <input type="hidden" name="exerciseId" value="${exercise.id}"/>
                                    <button style="top:20px;left:70px;width: auto" type="submit" class="gradient-btn">
                                        Сохранить
                                    </button>
                                </form>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/exercises/change" method="post">
                                    <input type="hidden" name="exerciseId" value="${exercise.id}"/>
                                    <a style="left:15px;width: auto" href="/exercises/changeExercise/${exercise.id}" class="gradient-btn">
                                        Изменить
                                    </a>
                                </form>
                            </td>
                            <td style=" height:50px;">
                                <form action="${pageContext.request.contextPath}/exercises" method="post">
                                    <input type="hidden" name="exerciseId" value="${exercise.id}"/>
                                    <button style="top:20px;left:70px;width: auto" type="submit" class="gradient-btn">
                                        Удалить
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div style="height: 20px;"></div>
                <div align="center">
                    <a class="gradient-btn" href="createExercise" style="right:5px;">
                        Создать упражнение</a>
                    <a class="gradient-btn" href="/" style="left:5px;">Главная
                        страница</a>
                    <a class="gradient-btn" href="#" style="left:10px;">
                        Наверх </a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>