<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 20.01.2015
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

    <!--    JQuery   -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.2.js"></script>
    <!-- Bootstrap -->
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <!-- DataTables -->
    <script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.css">
    <link rel="stylesheet" href="//cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
    <!-- DataTables End-->

    <style>
        .buttons {
            display: inline-block
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background-color: #ffffff !important;
            border: 1px solid #ffffff;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255, 255, 255, 0)), color-stop(100%, #f5f5f5));
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:active {
            background-color: #ffffff !important;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #ffffff));
            box-shadow: inset 0 0 0 rgb(245, 245, 245);
        }
    </style>

    <script>
        $(document).ready(function() {
            var table = $('#clientsTable').DataTable();

            $('ul.nav-tabs > li').removeClass('active');
            $('ul.nav-tabs > li > a[href="'+window.location.pathname+'"]').offsetParent().addClass('active');
        });

        function do_delete() {
            if(!confirm(' Are you sure ? ')) return;
            //self.location.href="url"
        }

    </script>

</head>

<body>

<div class="container">
    <tiles:insertDefinition name="nav-bar"/>
</div>

<div class="container">
    <c:if test="${!empty clients}">
        <h1>List of Clients</h1>
        <div>
            <table id="clientsTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Age</th>
                    <th>Accounts</th>
                    <th><i style="color:rgba(0, 0, 0, 0.50)">Functions</i></th>
                </tr>
                </thead>
                <tbody id="clients-table">
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>${client.clientId}</td>
                        <td>${client.lastName}, ${client.firstName}</td>
                        <td>${client.address}</td>
                        <td>${client.age}</td>
                        <td><a href="accounts/${client.clientId}">Accounts</a></td>
                        <td>
                            <form:form action="edit/${client.clientId}" cssClass="buttons">
                                <button type="submit"
                                        class="btn btn-primary">Edit</button>
                            </form:form>

                            <form:form action="delete/${client.clientId}" method="get" cssClass="buttons">
                                <button type="submit"
                                        class="btn btn-danger btn-mini"
                                        onclick="do_delete()">Delete</button>
                            </form:form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

<div class="container">

    <form:form action="new_client" cssStyle="margin-bottom: 40px;margin-top: 10px">
        <div class="control-group">
            <div class="controls">
                <input type="submit" value="Add New Client" class="btn btn-info" style="font-size: 15pt"/>
            </div>
        </div>
    </form:form>
</div>

</body>
</html>
