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

            <h4 style="color:#660099;font-weight: bold;" id="editex" class="enter">Номер упражнения:&nbsp&nbsp${number}</h4>

                <div style="position: relative; ">

                    <p>
                    <h4 style="color:#660099;font-weight: bold;" id="editex" class="exerciseSelection enter">Уровень сложности:
                        <select style="color:#660099;font-weight: bold;" size="1" name="difficultyLevel" id="difficultyLevel" required onchange="createExcercise()">
                            <option style="color:#660099;font-weight: bold;" value="1">1</option>
                            <option style="color:#660099;font-weight: bold;" value="2">2</option>
                            <option style="color:#660099;font-weight: bold;" value="3">3</option>
                            <option style="color:#660099;font-weight: bold;" value="4">4</option>
                        </select></h4>
                    </p>
                    <div style="color:#660099;font-weight: bold;" class="cleaner_h10">Допустимые символы: к,е,н,г,а,п,р,о,м,и,т,ь</div>

                    <label style="right:50px;  font-size: 18px; color:#660099;font-weight: bold;" for="text">Текст упражнения:</label>
                    <span class="createDifficultyLevel"><textarea id="text" name="exercise" rows="10" cols="50" class="required" type="text"
                              minlength="${difficulteLevel0.minLength}" maxlength="${difficulteLevel0.maxLength}"
                                                                  onkeydown="return restrictionOfEnteredCharacters(this,event)"></textarea>
                    <input type="hidden" name="minLength" value="${difficulteLevel0.minLength}"/>
                    <input type="hidden" name="maxLength" value="${difficulteLevel0.maxLength}"/>
                    </span>
                    <div class="cleaner_h10"></div>

                    <a style="position: relative; padding:5px 3px; width: 100px; left: 200px; bottom: 140px"
                       class="butggton" href="#" onclick="autoExercise()">Авто</a>
                    <a style="position: relative; padding:5px 3px; width: 100px; left: 350px; bottom: 192px"
                       class="butggton" href="#">Загрузить</a>

                    <input type="hidden" name="action" value="create"/>
                    <button type="submit"
                            style="position: relative; padding:5px 3px;width: 110px;left: 200px; bottom: 199px"
                            class="butggton">Создать
                    </button>
                    <a style="position: relative; padding:5px 3px; left: 350px; bottom: 251px; width: 100px; "
                       class="butggton" href="/exercises">Назад</a>


                </div>
        </div>

        <div class="cleaner"></div>
    </div>

</form>
</body>
</html>