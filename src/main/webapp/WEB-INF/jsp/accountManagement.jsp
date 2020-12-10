<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Управление учетными записями</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">
            <div id="site_title"><h1>Управление учетными записями</h1></div>
        </div> <!-- end of templatemo header -->

        <div>

            <table class="col">
                <tr>
                    <th width="20%">Логин</th>
                    <th width="20%">Роль</th>
                    <th width="20%">Уровень</th>
                    <th width="20%">Статистика</th>
                    <th width="20%">Удаление</th>
                </tr> <!--ряд с ячейками заголовков-->
                <c:forEach items="${allUsers}" var="user">
                    <tr align="center">
                        <td>${user.username}</td>
                        <td>
                            <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                        <td>${user.level}</td>
                        </td>
                        <td><a id="buttonedit" class="c-button" href="userStats">Посмотреть статистику</a></td>
                        <td>
                            <form action="${pageContext.request.contextPath}/accountManagement" method="post">
                                <input type="hidden" name="userId" value="${user.id}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <button id="buttonedit" class="c-button" type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <!--ряд с ячейками заголовков-->
                </c:forEach>
            </table>
            <div>
                <a id="buttonmanagement" class="c-button" href="/">Отмена</a></div>
        </div>


        <div id="templatemo_footer"></div>
        <div id="templatemo_footer"></div>


        <div class="cleaner"></div>
        <div class="cleaner"></div>
    </div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->


</body>
</html>