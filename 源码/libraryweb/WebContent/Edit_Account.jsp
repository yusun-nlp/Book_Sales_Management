<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改账户信息</title>
    <base href="<%=basePath%>">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
    .copyright {
    font-size: 12px;
    color: #999;
    margin: 0 auto;
    width: 100%;
    text-align: center;
    padding: 20px 0;
	}
	.hy-radio {
    width: 20px;
    height: 0px;
    background-color: #000;
    /*margin-right: 30px;*/
    border-radius: 50%;
    position: relative;
    top: -15px;
}
.hy-radio:before,.hy-radio:after {
    content: '';
    display: block;
    position: absolute;
    border-radius: 50%;
    transition: .3s ease;
}
.hy-radio:before {
    top: 0px;
    left: 0px;
    width: 18px;
    height: 18px;
    background-color: #fff;
    border: 1px solid #314d89;
}
.hy-radio:after {
    top: 6px;
    left: 6px;
    width: 8px;
    height: 8px;
    background-color: #fff; 
}
.hy-radio:checked:after {
    top: 3px;
    left: 3px;
    width: 12px;
    height: 12px;
    background-color: #314d89; 
}
.hy-radio:checked:before {
    border-color:#314d89; 
}


.login-form input[type="text"], .login-form input[type="password"] {
  width: 100%;
  border: 1px solid #314d89;
  outline: none;
  padding: 12px 100px;
  color: #afafaf;
  font-weight: 400;
  font-family: 'Lato', sans-serif;
  cursor: pointer;
}
.login-form input[type="text"] {
  border-radius: 4px 4px 4px 4px;
  padding-bottom: 13px;
  box-shadow: 0 -1px 0 #e0e0e0 inset, 0 1px 2px rgba(0, 0, 0, 0.23) inset;
}
.login-form input[type="password"] {
  border-radius: 4px 4px 4px 4px;
  padding-bottom: 13px;
  box-shadow: 0 -1px 2px rgba(0, 0, 0, 0.23) inset, 0 1px 2px rgba(255, 255, 255, 0.1);
}
.login-form input[type="submit"] {
  font-family: 'Lato', sans-serif;
  font-weight: 400;
  background: #e0e0e0;
  background: -moz-linear-gradient(top, #e0e0e0 0%, #cecece 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e0e0e0), color-stop(100%, #cecece));
  background: -webkit-linear-gradient(top, #e0e0e0 0%, #cecece 100%);
  background: -o-linear-gradient(top, #e0e0e0 0%, #cecece 100%);
  background: -ms-linear-gradient(top, #e0e0e0 0%, #cecece 100%);
  background: linear-gradient(to bottom, #e0e0e0 0%, #cecece 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e0e0e0', endColorstr='#cecece',GradientType=0 );
  display: block;
  margin: 20px auto 0 auto;
  width: 43%;
  border: none;
  border-radius: 3px;
  padding: 8px;
  font-size: 17px;
  color: #636363;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.45);
  font-weight: 700;
  box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.17), 0 1px 0 rgba(255, 255, 255, 0.36) inset;
}
.login-form input[type="submit"]:hover {
  background: #DDD;
}
.login-form input[type="submit"]:active {
  padding-top: 9px;
  padding-bottom: 7px;
  background: #C9C9C9;
}
body{margin:0}
article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary
{display:block
}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}
audio:not([controls]){display:none;height:0}[hidden],template{display:none}
a{background:transparent}
a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:bold}dfn{font-style:italic}h1{font-size:2em;margin:0.67em 0}mark{background:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace, monospace;font-size:1em}button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}button{overflow:visible}button,select{text-transform:none}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}input{line-height:normal}input[type="checkbox"],input[type="radio"]{-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{height:auto}input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;box-sizing:content-box}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em}legend{border:0;padding:0}textarea{overflow:auto}optgroup{font-weight:bold}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}

</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
   <div class="jumbotron">
        <h2><font face="Comic Sans MS" size="10">Edit Account</font></h2>
        
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li><a href="superAD.jsp">Outline</a></li>
                <li class="dropdown-menu">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					Account <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
				<li><a href="Create_Account.jsp">Create Account</a></li>
				<li  class="active"><a href="Account_List.jsp">Account List</a></li>
				</ul>
				</li>
				<li ><a href="Book_List.jsp">Book</a></li>
                <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					Order <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
				<li ><a href="Check_In.jsp">Check In</a></li>
				<li><a href="Payment.jsp">Pay</a></li>
				<li><a href="Order_List.jsp">Order List</a></li>
				</ul>
				</li>
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					Sale <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
				<li><a href="Sale.jsp">Sale Out</a></li>
				<li><a href="Deal_List.jsp">Deal List</a></li>
				</ul>
				</li>
				<li><a href="Bill_List.jsp">Bill</a></li>
				<li><a href="welcome.jsp">Logout</a></li>
            </ul>
        </div>
        <div class="col-xs-9">

        <h3 align="center"><font face="Comic Sans MS">Account Information</font></h3>
        <p><font size="3">If you want to edit the information, just change the corresponding input box, then click the "edit".</form></p>
        <br>
        <form class="login-form" action="UpdateAccount" method="post" align="center">
		<c:forEach items="${account}" var="account" varStatus="index">
		<label>
			<input type="text" name="UserID" value=${account.UserID}>
        </label>
        <div></div>
        <label>
			<input type="password" name="Password" required placeholder="New Password">
        </label>
        <div></div>
		<label>
			<input type="text" name="name" value=${account.name}>
        </label>
        <div></div>
        <label>
			<input type="text" name="gender" value=${account.gender}>
        </label>
        <div></div>
        <label>
			<input type="text" name="age" value=${account.age}>
        </label>
        <input name="rights" type="hidden" value="super">
        <input name="submit" type="submit" value="Edit">
        <br>
        <%= (new java.util.Date()).toLocaleString()%>
        </form>
        </c:forEach>
        </div>
    </div>
</div>
<footer class="copyright">
	Copyright © 2019 Book Sale Management  All Rights Reserved
</footer>
</body>
</html>