<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Тренажер</title>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
</head>
<body background="../../resources/images/siren-tsvety-myshka-klaviatura-ruchka.jpg">
<sec:authorize access="!isAuthenticated()">
    <h4><a href="/login">Войти</a></h4>
    <h4><a href="/registration">Зарегистрироваться</a></h4>
</sec:authorize>
<sec:authorize access="hasRole('USER')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">

            <div id="templatemo_header">
                <div id="site_title"><h1>Клавиатурный тренажер</h1></div>
            </div>
            <div style="height: 30px"></div>
            <div align="center">
                <h4 class="userpage1" style="color:#c68a4a;width: 300px; position: relative;" align="middle"><b>Логин
                    пользователя: ${pageContext.request.userPrincipal.name}</b></h4>
                <h4 class="userpage2" style="color:#c68a4a; position: relative; " align="middle"><b>Текущий
                    уровень: ${user.level}</b></h4>

            </div>
            <div align="center">
                <div><a class="gradient-btn"
                        href="user/editProfile">Редактировать
                    учетную запись</a></div>
                <div><a style="" href="/user/userStats" class="gradient-btn">
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Моя статистика
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
                <div><a style="" href="/user/stats" class="gradient-btn">
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    Общая статистика &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </a></div>
                <div>
                    <a href="/user/trainingParameters" class="gradient-btn">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        Тренировка
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </a>
                </div>
                <div><a href="/logout" class="gradient-btn">
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    Выход
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </a></div>
                <div style="height: 30px;"></div>
                <div><a style="" class="gradient-btn" href="user/manual">
                    &nbsp&nbsp&nbsp&nbsp&nbsp Руководство пользователя &nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
            </div>

        </div>
    </div>
    <div>
        <h4 style="color:#c68a4a;">
            <br>
            После авторизации происходит переход на главную страницу пользователя, представленную на рисунке 1. На
            странице расположены следующие кнопки:
            </br>    1. Редактировать учетную запись;
            <br>2. Моя статистика;</br>
            3. Общая статистика;
            </br>4. Тренировка;
            </br>5. Информация о программе;
            </br>6. Выход.
        </h4>
        <h4 style="color:#c68a4a;">
            <br>
            Также на данной странице отображается логин пользователя и его текущий уровень.
            <br> При нажатии на кнопку «Редактировать учетную запись» появляется страница, представленная на рисунке 2.
            <br> На странице пользователь должен ввести новый логин и пароль с повторением пароля.
            <br> Также на данной странице отображается текущий логин пользователя.
            <br> Помимо этого, на данной странице находятся кнопки «Сохранить» и «Главная страница».

        </h4>
        <h4 style="color:#c68a4a;">
            <br>
            При нажатии на кнопку «Моя статистика» появляется страница, представленная на рисунке 3.
            <br>На странице расположены кнопки «Общая статистика», «Тренировка», «Главная страница», «Наверх», а также
            таблица со следующими колонками:
            <br> 1. Дата;
            <br> 2. Уровень упражнения;
            <br> 3. № упражнения;
            <br> 4. Время прохождения;
            <br> 5. Скорость печати;
            <br> 6. Количество ошибок;
            <br> 7. Статус.
        </h4>
        <h4 style="color:#c68a4a;">
            <br>
            Также на данной станице отображается логин и уровень пользователя.
            <br>При нажатии на кнопку «Общая статистика» происходит переход на страницу, представленную на рисунке 4,
            <br>на которой располагается таблица со следующими колонками:
            <br>1. Дата;
            <br>2. Логин;
            <br>3. № упражнения;
            <br>4. Время прохождения;
            <br>5. Скорость обучения;
            <br>6. Количество ошибок;
            <br>7. Статус.

        </h4>
        <h4 style="color:#c68a4a;">
            <br>
            Также на данной странице отображаются диаграмма скорости печати, логин пользователя и список цветов,
            <br>  соответствующих сегментам на диаграмме, с указанием диапазона скорости печати.
            <br> При нажатии на кнопку «Тренировка», расположенной на главной странице, происходит переход на
            <br> страницу «Параметры тренировки», представленную на рисунке 5.
            <br> На данной странице пользователю доступны выбор уровня сложности и выбор упражнения.
            <br> Также на данной странице отображается логин и уровень пользователя.
        </h4>

        <h4 style="color:#c68a4a;">
            <br>
            При нажатии на кнопку «Начать тренировку» отображается страница, представленная на рисунке 6.

        </h4>

        <img src="(../resources/images/A1.png)" alt="Письма мастера дзен">
    </div>
</sec:authorize>
<sec:authorize access="hasRole('ADMIN')">
    <div id="templatemo_body_wrapper">
        <div id="templatemo_wrapper">
            <div id="templatemo_header">
                <div id="site_title" style="position: relative"><h1>Администратор</h1></div>
            </div>
            <div style="height: 70px;"></div>
            <div align="center">
                <div>

                    <a style="" class="gradient-btn" href="/accountManagement">Управление учетными
                        записями</a>
                </div>
                <div>
                    <a style="" class="gradient-btn" href="exercises">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Просмотр упражнений
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></div>
                <div><a style="" class="gradient-btn" href="difficultyLevels">
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Уровни сложности
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </a>
                </div>
                <div style="height:10px;"></div>
                <div>
                    <a style="" class="gradient-btn"
                       href="stats">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Общая статистика
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    </a></div>
                <div><a style="" class="gradient-btn" href="/logout">
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    Выход
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div style="height: 50px;"></div>

                <div>

                    <a style="" class="gradient-btn" href="/user/manual">
                        &nbsp&nbsp&nbsp&nbsp Информация
                        о программе &nbsp&nbsp&nbsp&nbsp</a>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>
</body>
</html>