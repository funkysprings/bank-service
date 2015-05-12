<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 29.01.2015
  Time: 15:09
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
    <title>Transactions</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--    JQuery   -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.2.js"></script>
    <!-- Bootstrap -->
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" >
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <script>
        $(document).ready(function() {
            $('ul.nav-tabs > li').removeClass('active');
            $('ul.nav-tabs > li > a[href="'+window.location.pathname+'"]').offsetParent().addClass('active');
        });
    </script>
</head>
<body>

<div class="container">
    <tiles:insertDefinition name="nav-bar"/>
</div>

<div class="container" >
    <c:if test="${!empty transactions}">
        <h1>List of Transactions</h1>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>From Account</th>
                <th>To Account</th>
                <th>Money</th>
                <th>Description</th>
                <th>Date</th>
                <th>Result of transaction</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${transactions}" var="transaction">
                <tr>
                    <td>${transaction.transactionId}</td>
                    <td><a href="#">${transaction.fromAccountId}</a></td>
                    <td><a href="#">${transaction.toAccountId}</a></td>
                    <c:choose>
                        <c:when test="${transaction.amountOfMoneyToSend>=0}">
                            <td style="color: forestgreen">+${transaction.amountOfMoneyToSend}</td>
                        </c:when>
                        <c:otherwise>
                            <td style="color: red">${transaction.amountOfMoneyToSend}</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${transaction.isSuccess==true}">
                            <td style="font-style: italic">${transaction.description}</td>
                        </c:when>
                        <c:otherwise>
                            <td style="font-style: italic; color: red">${transaction.description}</td>
                        </c:otherwise>
                    </c:choose>
                    <td style="color: grey">${transaction.date}</td>
                    <c:choose>
                        <c:when test="${transaction.isSuccess==true}">
                            <td style="background-color: lightgreen">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true">
                                </span> Success
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td style="background-color: lightcoral">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true">
                                </span> Failure
                            </td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
