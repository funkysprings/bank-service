<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 30.01.2015
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--    JQuery   -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.2.js"></script>
    <!-- Bootstrap -->
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <tiles:insertDefinition name="nav-bar"/>
    <div class="jumbotron" style="margin-top: 10px">
        <h1>Hello!<br>Welcome to the Bank Service!</h1>
        <p>Try to use the navigation bar above.</p>
    </div>
</div>


</body>
</html>
