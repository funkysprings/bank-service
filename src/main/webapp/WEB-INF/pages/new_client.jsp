<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 20.01.2015
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Add new client</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" >
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form action="/clients/">
        <button type="submit" class="btn btn-default" style="margin-top: 20px">
            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Back to Clients
        </button>
    </form>
    <h3>Add new client</h3>
    <form:form method="post" action="add" commandName="client" role="form">
        <div class="form-group">
            <form:label path="firstName">First Name:<b style="color:red">*</b></form:label>
            <form:input path="firstName" class="form-control" placeholder="Enter First Name"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Last Name:<b style="color:red">*</b></form:label>
            <form:input path="lastName" class="form-control" placeholder="Enter Last Name"/>
        </div>
        <div class="form-group">
            <form:label path="address">Address:<b style="color:red">*</b></form:label>
            <form:input path="address" class="form-control" placeholder="Enter Address"/>
        </div>
        <div class="form-group">
            <form:label path="age">Age:</form:label>
            <form:input path="age" class="form-control" placeholder="Enter Age"/>
        </div>
        <div class="control-group">
            <div class="controls">
                <input type="submit" value="Add Client" class="btn btn-info"/>
            </div>
        </div>
    </form:form>
</div>
</body>
</html>
