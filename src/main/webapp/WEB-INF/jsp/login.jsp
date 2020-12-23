<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Авторизация</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>


<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Клавиатурный тренажер</h1></div>


        </div> <!-- end of templatemo header -->

        <form name="f" method="POST" action="/login">
            <div id="templatemo_main">

                <div>

                    <h4 id="enter1" class="enter" style="color:#c68a4a"><b>Логин</b> &nbsp <input type="text"
                                                                                                  class="col"
                                                                                                  name="username"
                                                                                                  placeholder="Введите логин">
                    </h4>
                    <h4 id="enter2" class="enter" style="color:#c68a4a"><b>Пароль</b> <input type="password" class="col"
                                                                                             name="password"
                                                                                             placeholder="Введите пароль">
                    </h4>
                    <div style="height:20px"></div>

                    <div align="center">
                        <h4 style="font-weight:bold; color:#800080">
                            <c:if test="${param.regSucc == true}">
                                <div id="status">
                                    <spring:message code="message.regSucc">
                                    </spring:message>
                                </div>
                            </c:if>
                            <c:if test="${param.regError == true}">
                                <div id="error">
                                    <spring:message code="message.regError">
                                    </spring:message>
                                </div>
                            </c:if>
                            ${errorMessage}
                        </h4>
                    </div>
                    <div align="center">
                        <a style="" class="gradient-btn" href="registration">Регистрация</a>
                        <button type="submit" style="width:100px;left:55px;top:20px;" class="gradient-btn"
                                onclick="validate()">Вход
                        </button>
                    </div>
                </div>

            </div>

    </div>
</div>
    </form>
</div>
</body>
</html>