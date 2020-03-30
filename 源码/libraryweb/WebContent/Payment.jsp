<%@ page language="java" import="java.util.*,java.sql.*,java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>订单界面</title>
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
        <h2><font face="Comic Sans MS" size="10">Payment</font></h2>
        
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li><a href="superAD.jsp">Outline</a></li>
                <li><a href="Account_Ask.jsp">Account</a></li>
                <li><a href="Book_List.jsp">Book</a></li>
                <li class="dropdown-menu">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					Order <span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
				<li><a href="Check_In.jsp">Check In</a></li>
				<li  class="active"><a href="Payment.jsp">Payment</a></li>
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
<br>
        <table class="table table-hover">

	<caption><font size="5">Payment</font></caption>	
	<thead>
		<tr>
			<th>OrderID</th>
			<th>Status</th>
			<th>ISBN</th>
			<th>Name</th>
			<th>Amount</th>
			<th>Prices</th>
			<th>Date</th>
			<th>Payment</th>
			<th>Withdraw</th>
		</tr>
	</thead>
	
	<tbody>
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    //数据库地址
	String DBURL = "jdbc:sqlserver://localhost:1433;DataBaseName=library";
    //数据库登录用户名
	String DBUSER = "julia";
    //数据库用户密码
	String DBPASSWORD = "sunyu0623";
    //数据库连接
    //数据库操作
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;

	try {
        //第一步，加载驱动
           Class.forName(DBDRIVER);
           System.out.println("成功连接!");
    } catch (ClassNotFoundException e) {
           e.printStackTrace();
    }
	try {
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		String sql = "select * from order_form";
		st = (Statement) conn.createStatement();
		rs = (ResultSet) st.executeQuery(sql);
			
		while(rs.next()){
			if (rs.getString("status").equals("non-payment")){
	%>
		<tr>
			<td><%=rs.getString("orderID") %></td>
			<td><%=rs.getString("status") %></td>
			<td><%=rs.getString("ISBN") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("amount") %></td>
			<td><%=rs.getString("prices") %></td>
			<td><%=rs.getString("o_date") %></td>
			<form  action="payBook" method="post" >
			<input type="hidden" name="orderID" value="<%=rs.getString("orderID") %>">
			<td><input name="submit" type="submit" value="Pay" class="btn btn-primary"></td>
			</form>
			<form  action="Withdraw" method="post" >
			<input type="hidden" name="orderID" value="<%=rs.getString("orderID") %>">
			<td><input name="submit" type="submit" value="Cancel" class="btn btn-primary"></td>
			</form>
		</tr>
	<%
			}
	} 
	st.close();
    conn.close();
	rs.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}

	%>
	</tbody>
</table>
        </div>
    </div>
</div>
<footer class="copyright">
	Copyright © 2019 Book Sale Management  All Rights Reserved
</footer>
</body>
</html>