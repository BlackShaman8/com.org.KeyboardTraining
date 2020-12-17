<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Результат</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css"/>
    <!-- templatemo 304 light gray -->
    <!--
    Light Gray Template
    http://www.templatemo.com/preview/templatemo_304_light_gray
    -->

    <script language="javascript" type="text/javascript">
        function clearText(field) {
            if (field.defaultValue == field.value) field.value = '';
            else if (field.value == '') field.value = field.defaultValue;
        }
    </script>

</head>
<body onload="result()">
<div id="templatemo_body_wrapper">
    <div id="templatemo_wrapper">

        <div id="templatemo_header">

            <div id="site_title"><h1>Результат</h1></div>
        </div> <!-- end of templatemo header -->

        <form>
            <fieldset style=" border:2px solid #FF3399; width: 10px;margin-left: auto;
    margin-right: auto ">
                <div>
                    <h4 id="result" style="color: #550055; font-weight: bold;" class="userpage1" align="middle" value="${status}}">
                        ${status}</h4>
                    <h4 style="color: #550055; font-weight: bold;" class="userpage1" align="middle">Знаков в
                        минуту: ${speed_counter}</h4>
                    <h4 style="color: #550055; font-weight: bold;" class="userpage2" align="middle">
                        Ошибок: ${error_counter}</h4>

                </div>
                <a class="butggton" style="width:100px" href="/user/training">Повторить</a>
                <a class="butggton" style="width:100px" href="/user/trainingParameters">Далее</a>
            </fieldset>
        </form>


    </div>

</div> <!-- end of main -->
<div id="templatemo_main_bottom"></div>
</div> <!-- end of templatemo wrapper -->
</div> <!-- end of templatemo body wrapper -->

<div id="templatemo_footer_wrapper">


</div>

</body>
<script type="text/javascript" charset="windows-1251">
    <%@include file="../../resources/js/code.js"%>
</script>
</html>