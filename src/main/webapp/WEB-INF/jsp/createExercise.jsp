<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<head>
    <script type="text/javascript" charset="windows-1251">
        <%@include file="../../resources/js/code.js"%>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Создание упражнения</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<form action="${pageContext.request.contextPath}/createExercise" method="post">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Создание упражнения</h1></div>

        </div> <!-- end of templatemo header -->

        <h4 id="editex" class="enter">Номер упражнения:&nbsp&nbsp0</h4>


        <div style="position: relative; ">

                <p>
                <h4 id="editex" class="enter">Уровень сложности: <select size="1" id="difficultyLevel" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select></h4>
                </p>
                <div class="cleaner_h10"></div>

                <label style="right:50px;  font-size: 18px; color :#666" for="text">Текст упражнения:</label>
                <textarea id="text" name="text" rows="10" cols="50" class="required" type="text" name="exercise" minlength="${difficulteLevel1.minLength}" maxlength="${difficulteLevel1.maxLength}" onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea>
                <div class="cleaner_h10"></div>

                <a style="position: relative; padding:5px 3px; width: 100px; left: 200px; bottom: 140px" class="butggton" href="#">Авто</a>
                <a style="position: relative; padding:5px 3px; width: 100px; left: 350px; bottom: 192px" class="butggton" href="#">Загрузить</a>

                <input type="hidden" name="action" value="create"/>
                <button type="submit" style="position: relative; padding:5px 3px;width: 110px;left: 200px; bottom: 199px" class="butggton">Создать</button>
                <a style="position: relative; padding:5px 3px; left: 350px; bottom: 251px; width: 100px; "class="butggton" href="/exercises">Назад</a>


        </div>
    </div>

    <div class="cleaner"></div>
</div>

</form>
</body>
</html>