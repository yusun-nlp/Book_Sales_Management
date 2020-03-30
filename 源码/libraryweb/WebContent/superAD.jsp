<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>超级管理员界面</title>
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
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
   <div class="jumbotron">
        <h1><font face="Comic Sans MS">Super administrator</font></h1>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="superAD.jsp">Outline</a></li>
                <li><a href="Account_Ask.jsp">Account</a></li>
                <li><a href="Book_List.jsp">Book</a></li>
                <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					Order <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
				<li><a href="Check_In.jsp">Check In</a></li>
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
            <h2 id="section-1">Outline</h2>
            <p>Welcome to the Book Sale Management!</p>
            <p>Your identity is the <span style="font-weight:bold">super administrator</span>, who has the maximum rights on this system. On the left of the webpage is an navigation bar. If you want to realize some functions, you can <span style="font-weight:bold">click</span> on the relevant button. Pay attention that buttons with an arrow have a hidden menu, which require you to click on them if you want to see the hidden menu.</p>
            <p>The function of each button is as follows:</p>
            <hr>
            <h2 id="section-2">Account</h2>
            <p>In this section you can deal with <span style="font-weight:bold">all</span> administrators' information, including your own.</p>
            <p>However, if you want to use your authority, you have to input
            your UserID and Password again. After you get the authority,
             you can achieve the following function:</p>
            <h4>Create Account:</h4>
            <p>You can Create a new account for <span style="font-weight:bold">normal</span> administrator. You have to input the correct UserID, Password, name, gender, ID, age.</p>
            <h4>Account List:</h4>
            <p>You can check all administrators' information. If needed, you can choose the account that you want to modify.</p>
            <hr>
            <h2 id="section-3">Book</h2>
            <p>In this section, you can deal with books in the store.</p>
            <p>You can check all books in the store, including IBSN, name, press, author, price and inventory.
            Besides, you can modify the information of any book in the store in this part.</p>
            <hr>
            <h2 id="section-4">Order</h2>
            <p>In this section, you can check in books you need. Besides, you can deal with orders.</p>
            <h4>Check In:</h4>
            <p>If you want to add some book to the store, use this part to achieve it. Once you submit the order, the webpage will jump to the payment interface <span style="font-weight:bold">automatically</span>.</p>
            <h4>Pay:</h4>
            <p>If you don't finish the payment in the Check In section, you can still click this button to pay them. Besides, if 
            you want to cancel the order before you pay, you can click <b>cancel</b> in this part.</p>
            <h4>Order List:</h4>
            <p>You can check all order lists in this section, including orders that haven't been paid, have been cancelled, 
            and have successfully finished.</p>
            <hr>
            <h2 id="section-5">Sale</h2>
            <p>In this section, you can sell books out for money.</p> 
            <h4>Sale Out:</h4>
            <p>You can select the book's ISBN and sell it. As a result, the store number will decline and the record will be added into the bill.</p>
            <h4>Deal List:</h4>
            <p>You can check all deal information in this section.</p>
            <hr>
            <h2 id="section-6">Bill</h2>
            <p>In this section, you can check out all bills, including income and expenditure.</p>
            <p>You don't need add the bill record by yourself because once you finish an order or a deal, the system will automatically add a record in the bill.</p>
            <hr>
            <h2>Logout</h2>
            <p>You can click here to logout your account. The webpage will go back to the welcome interface.</p>
        </div>
    </div>
</div>
<footer class="copyright">
	Copyright © 2019 Book Sale Management All Rights Reserved.
</footer>
</body>
</html>