<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 24.01.2015
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Accounts</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" >
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function do_delete() {
            if(!confirm(' Are you sure ? ')) return;
            //self.location.href="url"
        }
    </script>
</head>
<body>

    <div class="container">
        <form action="/clients/">
            <button type="submit" class="btn btn-default" style="margin-top: 20px">
                <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Back to Clients
            </button>
        </form>
    </div>

    <div class="container" style="border-style: inset;border-color: lightgrey;margin-top: 10px;margin-bottom: 10px">
        <form:form modelAttribute="client">
            <h3><span class="label label-primary">Name:</span> ${client.firstName} ${client.lastName}</h3>
            <h3><span class="label label-primary">Address:</span> ${client.address}</h3>
            <c:if test="${client.age != null}">
                <h3><span class="label label-primary">Age:</span> ${client.age}</h3>
            </c:if>
        </form:form>
    </div>

    <div class="container">
        <c:if test="${!empty accounts}">
            <c:forEach items="${accounts}" var="account">
                <div class="row">
                    <div class="col-md-3" >
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th colspan="2">Account# ${account.accountId}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${account.amountOfMoney}</td>
                                    <td>
                                        <form action="${client.clientId}/delete/${account.accountId}"
                                              method="post"
                                              onclick="do_delete()">
                                            <input type="submit"
                                                   class="btn btn-danger btn-mini"
                                                   value="Delete"/>
                                        </form>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>

    <div class="container">
        <form:form method="post" action="create_new_account/${client.clientId}" cssStyle="margin-bottom: 40px">
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Create New Account" class="btn btn-info" style="font-size: 15pt"/>
                </div>
            </div>
        </form:form>
    </div>

</body>
</html>
