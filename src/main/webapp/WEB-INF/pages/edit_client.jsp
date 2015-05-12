<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 25.01.2015
  Time: 13:52
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
    <title>Clients</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .back-grey {
            background-color: #f0f0f0
        }
        .text-color {
            color: darkgrey;
        }
        .edit-row {
            background-color: #fdfdfd;
            color: black;
        }
    </style>
</head>

<body class="back-grey">

<div class="container">
    <c:if test="${!empty clients}">
        <h1 class="text-color">List of Clients</h1>
        <table class="table table-bordered text-color" contenteditable="false">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Address</th>
                <th>Age</th>
                <th>Accounts</th>
                <th colspan="2"><i style="color:rgba(0, 0, 0, 0.50)">Functions</i></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${clients}" var="client">

                <c:choose>
                    <c:when test="${client.clientId == editableClient.clientId}">
                        <tr class="edit-row">

                            <form:form method="post" action="${client.clientId}/ok" commandName="editableClient">
                                <td>${client.clientId}</td>
                                <td>
                                    <form:input class="form-control" value="${client.lastName}" path="lastName"/>
                                    <form:input class="form-control" value="${client.firstName}" path="firstName"/>
                                </td>
                                <td>
                                    <form:input class="form-control" value="${client.address}" path="address"/>
                                </td>
                                <td>
                                    <form:input class="form-control" value="${client.age}" path="age" cssStyle="width: 40pt"/>
                                </td>
                                <td>
                                    <a href="#" onclick="alert('Please, end the current operation!')">Accounts</a>
                                </td>
                                <td>
                                    <input type="submit" class="btn btn-success" value="Accept"/>
                                </td>
                            </form:form>

                            <td>
                                <form:form action="${client.clientId}/cancel">
                                    <input type="submit" class="btn btn-danger" value="Decline"/>
                                </form:form>
                            </td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td>${client.clientId}</td>
                            <td>${client.lastName}, ${client.firstName}</td>
                            <td>${client.address}</td>
                            <td>${client.age}</td>
                            <td>Accounts</td>
                            <td>
                                <form:form>
                                    <button disabled="disabled"
                                            type="submit"
                                            class="btn btn-primary">Edit</button>
                                </form:form>
                            </td>
                            <td>
                                <form:form>
                                    <button disabled="disabled"
                                            type="submit"
                                            class="btn btn-danger btn-mini">Delete</button>
                                </form:form>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<div class="container">
    <form:form cssStyle="margin-bottom: 40px">
        <input disabled type="submit" value="Add New Client" class="btn bg-success" style="font-size: 15pt"/>
    </form:form>
</div>

</body>
</html>
