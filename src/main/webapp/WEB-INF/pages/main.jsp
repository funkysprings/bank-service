<%--
  Created by IntelliJ IDEA.
  User: 777
  Date: 30.01.2015
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .dropdown-submenu{position:relative;}
    .dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px;}
    .dropdown-submenu:hover>.dropdown-menu{display:block;}
    .dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#cccccc;margin-top:5px;margin-right:-10px;}
    .dropdown-submenu:hover>a:after{border-left-color: #cccccc;}
    .dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px;}

    .main-header {
        color: grey;
    }
    .page-header {
        margin-top: 20px;
    }
</style>
    <div class="page-header">
        <h3 class="main-header">Bank Service</h3>
    </div>
    <div class="container">
        <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="/">Home</a></li>
                    <li role="presentation"><a href="/clients/">Clients</a></li>
                    <li role="presentation" class="dropdown">
                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                            Investments <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">Payments</a>
                                <ul class="dropdown-menu">
                                    <li><a href="/payment/deposit">Deposit</a></li>
                                    <li><a href="/payment/withdraw">Withdraw</a></li>
                                </ul>
                            </li>
                            <li role="presentation"><a href="/transfer/" role="menuitem">Transfer</a></li>
                        </ul>
                    </li>
                    <li role="presentation"><a href="/transactions/">List of Transactions</a></li>
        </ul>
    </div>

