<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 19.02.2015
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
    <title>Payment</title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--    JQuery   -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.2.js"></script>
    <!-- <script type ="text/javascript" src="/resources/js/jquery-1.11.2.js"></script> -->
    <script type="text/javascript" src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <!--    Bootstrap   -->
    <script src="//getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <!--    JQuery CSS  -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <!--    Bootstrap CSS  -->
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" >
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .table-td-client {
            background-color: whitesmoke;
            font-style: oblique;
            width: 19%;
        }
        .ui-autocomplete {
            position: absolute;top: 100%;left: 0;z-index: 1000;display: none;float: left;min-width: 160px;padding: 5px 0;margin: 2px 0 0;list-style: none;background-color: #ffffff;border: 1px solid #ccc;*border-right-width: 2px;*border-bottom-width: 2px;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);-webkit-background-clip: padding-box;-moz-background-clip: padding-box;background-clip: padding-box;
        }
        .ui-menu .ui-menu-item {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;position: relative;margin: 0;padding: 3px 1em 3px .4em;cursor: pointer;min-height: 0; /* support: IE7 */
        }
        .ui-state-focus,
        .ui-widget-content .ui-state-focus,
        .ui-widget-header .ui-state-focus {border-color: transparent;background: #f2f2f2;font-weight: normal;color: #212121;
        }
    </style>

    <script> //set active tab in navigation bar
    $(document).ready(function() {
        $('ul.nav-tabs > li').removeClass('active');
        $('ul.nav-tabs > li > a[href="#"]').offsetParent().addClass('active');
    });
    </script>

    <script> //on events
        $(function () {
            $('[data-toggle="popover"]').popover({
                container: 'body',
                placement: 'top',
                trigger: 'manual',
                html: true,
                title: "Alert !"
            });
        });

        $( document ).on( "click", "#accountsClient", function(e) {
            $("#inputAccountClient").val(getNAccount(e.target.innerText));
        });

        $(document).on('input',"#sendMoney",function (e) {
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        $(document).on('submit',"#sendForm",function(e) {
            var account = $(".input-account").val();
            var sendmoney = $("#sendMoney").val();
            if(($(".id").text() == "Id") || (account == "") || (sendmoney == "") ) {
                $("#sendingError").show().fadeOut(3500);
                e.preventDefault();
            }
            return;
        });
    </script>

    <script>
        $.ajax({
            type: "GET",
            url: window.location.origin + "/clients/api/",
            datatype: 'json',
            success: function (dataString) {
                if (dataString.length != 0) {
                    var json = jQuery.parseJSON(dataString);
                    var dataClients = [];
                    for (var i = 0; i < json.length; ++i) {
                        dataClients[i] = {
                            label: json[i].lastName + " " + json[i].firstName + " | " + json[i].address,
                            value: "Start typing client's name...",
                            id: json[i].clientId,
                            name: json[i].lastName + " " + json[i].firstName,
                            address: json[i].address,
                            age: json[i].age
                        };
                    }
                    goOnClients(dataClients);
                } else {
                    $("#noClientsInfo").show();
                }
            }
        });

        function goOnClients(clients) {
            $(".autocomplete").autocomplete({
                source: clients,
                select: function (event, client) {
                    if (client.item.value === null) {
                        return false;
                    }
                    eraseInputAccount();
                    $(".input-group .icon").attr('class','glyphicon glyphicon-ok').css('color','green');
                    setClientDataToTable(client);
                    setAccounts(client.item.id);
                    $(".input-client .dropdown-toggle").attr('disabled',false);
                },
                response: function (event, ui) {
                    if (ui.content.length === 0) {
                        ui.content[0] = {label: "No matches found", value: null};
                    }
                }
            });
        }

        function setClientDataToTable(client) {
            var clientTable = $("#tableClient");
            clientTable.find(".id").html("<strong>"+client.item.id+"</strong>");
            clientTable.find(".name").html("<strong>"+client.item.name+"</strong>");
            clientTable.find(".address").html("<strong>"+client.item.address+"</strong>");
            if (typeof client.item.age === "undefined") {
                clientTable.find(".age").html("<strong>-</strong>");
            } else {
                clientTable.find(".age").html("<strong>"+client.item.age+"</strong>");
            }
        }

        function setAccounts(clientId) {
            $.ajax({
                type: "POST",
                url: window.location.origin + "/clients/accounts/get",
                data: { id : clientId },
                success: function (data) {
                    var accounts = $(".input-client .dropdown-menu");
                    accounts.find("li").remove();
                    if (data.length == 0) {
                        showAlertPopoverNoAccounts(clientId);
                    } else {
                        hidePopoverMsgIfNoAccounts();
                        for (i = 0; i < data.length; ++i) {
                            accounts.append('<li><a href="#">Account #'+data[i]+'</a></li>');
                        }
                    }
                }
            });
        }

        function showAlertPopoverNoAccounts(clientId) {
            var hlink = "<br/><a href='"+window.location.origin+"/clients/accounts/"+clientId+"'>You can create the new one.</a>";
            var name = $("#tableClient").find(".name").text();
            var clientBtnGroup = $(".input-client .input-group-btn");
            clientBtnGroup.data('bs.popover').options.content = name + " has no accounts!" + hlink;
            clientBtnGroup.popover('show');
            if (!clientBtnGroup.hasClass('popover-account')) {
                clientBtnGroup.addClass('popover-account');
            }
            $(".input-client .dropdown-toggle").focus();
        }

        function hidePopoverMsgIfNoAccounts() {
            var inputAccount = $(".input-client .input-group-btn");
            if (inputAccount.hasClass('popover-account')) {
                inputAccount.popover('hide');
                inputAccount.removeClass('popover-account');
            }
        }

        function eraseInputAccount() {
            $(".input-account").val("");
        }

        function eraseFieldAutocompleteClient(obj) {
            $(obj).val("");
        }

        function getNAccount(strAcc) {
            return strAcc.substring(9,strAcc.length)
        }

    </script>

</head>
<body>

<div class="container">
    <tiles:insertDefinition name="nav-bar"/>
    <h2>${operation} page</h2>
</div>

<div class="container">
    <div class="alert alert-info" id="noClientsInfo" style="display: none">
        <strong>Info: </strong> There are no clients registered in the Bank Service !<br><small>Please, click the 'Clients' tab above and register
        at least one client to make ${operation}.</small>
    </div>
    <form:form method="post" action="${operation}/do" commandName="transaction" role="form" id="sendForm">
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <span class="input-group-addon addon-client" style="background-color: grey;color: white;">Client:</span>
                    <span class="input-group-addon" style="background-color: white"><span class="glyphicon glyphicon-remove icon" style="color: indianred" aria-hidden="true"></span></span>
                    <input type="text"
                           onclick="eraseFieldAutocompleteClient($(this))"
                           class="form-control autocomplete"
                           placeholder="Start typing client's name..."
                           aria-describedby="addon-client"
                           data-toggle="popover">
                </div>

                <table class="table table-bordered">
                    <tbody id="tableClient">
                    <tr>
                        <td class="table-td-client">#</td>
                        <td class="id">Id</td>
                    </tr>
                    <tr>
                        <td class="table-td-client">Name</td>
                        <td class="name">Name</td>
                    </tr>
                    <tr>
                        <td class="table-td-client">Address</td>
                        <td class="address">Address</td>
                    </tr>
                    <tr>
                        <td class="table-td-client">Age</td>
                        <td class="age">Age</td>
                    </tr>
                    </tbody>
                </table>

                <div class="input-group input-client">
                    <div class="input-group-btn" data-toggle="popover">
                        <button type="button"
                                class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown"
                                aria-expanded="false"
                                disabled>Choose account <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" id="accountsClient">
                        </ul>
                    </div>
                    <span class="input-group-addon addon-client" style="font-weight: bold">Account #</span>
                    <form:input path="fromAccountId"
                                class="form-control input-account"
                                id="inputAccountClient"
                                readonly="true"
                                style="font-weight: bold;"/>
                </div>

            </div>
        </div>
<hr>
        <div class="input-group">
            <span class="input-group-addon">Money to ${operation}: $</span>
            <form:input path="amountOfMoneyToSend"
                        class="form-control"
                        id="sendMoney"
                        aria-label="Amount (to the nearest dollar)"/>
            <span class="input-group-addon">.00</span>
        </div>
<hr>
        <input type="submit" value="Realize transfer" class="btn btn-info"/>
        <div class="alert alert-danger" id="sendingError" style="display: none;margin-top: 10px">
            <strong>Error !</strong> Some fields are not filled !
        </div>
    </form:form>
<hr>
</div>
</body>
</html>
