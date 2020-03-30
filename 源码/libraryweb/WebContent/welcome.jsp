<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <base href="<%=basePath%>">
	<title>Welcome</title>
	<style>
	* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

html {
  background: #E2E2E2;
}

body {
  background: #E2E2E2;
  margin: 0;
  padding: 0;
  font-family: 'Lato', sans-serif;
}

.login-form-wrap {
  background: #5170ad;
  background: -moz-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);
  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #5170ad), color-stop(100%, #355493));
  background: -webkit-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);
  background: -o-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);
  background: -ms-radial-gradient(center, ellipse cover, #5170ad 0%, #355493 100%);
  background: radial-gradient(ellipse at center, #5170ad 0%, #355493 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#5170ad', endColorstr='#355493',GradientType=1 );
  border: 1px solid #2d416d;
  box-shadow: 0 1px #5670a4 inset, 0 0 10px 5px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  position: relative;
  width: 360px;
  height: 380px;
  margin: 10px auto 20px auto;
  padding: 50px 30px 0 30px;
  text-align: center;
}
.login-form-wrap:before {
  background: url(http://i.imgur.com/0vLxyVB.png);
  display: block;
  content: '';
  width: 58px;
  height: 19px;
  top: 10px;
  left: 10px;
  position: absolute;
}
.login-form-wrap > h1 {
  margin: 0 0 50px 0;
  padding: 0;
  font-size: 26px;
  color: #fff;
}
.login-form-wrap > h5 {
  margin-top: 40px;
}
.login-form-wrap > h5 > a {
  font-size: 14px;
  color: #fff;
  text-decoration: none;
  font-weight: 400;
}

.login-form input[type="text"], .login-form input[type="password"] {
  width: 100%;
  border: 1px solid #314d89;
  outline: none;
  padding: 12px 20px;
  color: #afafaf;
  font-weight: 400;
  font-family: 'Lato', sans-serif;
  cursor: pointer;
}
.login-form input[type="text"] {
  border-bottom: none;
  border-radius: 4px 4px 0 0;
  padding-bottom: 13px;
  box-shadow: 0 -1px 0 #e0e0e0 inset, 0 1px 2px rgba(0, 0, 0, 0.23) inset;
}
.login-form input[type="password"] {
  border-top: none;
  border-radius: 0 0 4px 4px;
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
  width: 100%;
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
	html{
    font-family:sans-serif;
    -ms-text-size-adjust:100%;
    -webkit-text-size-adjust:100%
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
<body>
<%Object message = request.getAttribute("message");
if(message!=null){
%>
<script type="text/javascript">
	alert("<%=message %>");
</script>
<%} %>
<h1 align="center">
	<font face="Comic Sans MS">Book Sale Management</font>
</h1>
<section class="login-form-wrap">
	<h1>Administrator</h1>
	<form class="login-form" action="login" method="post" align="center">
		<label>
			<input type="text" name="UserID" required placeholder="UserID">
        </label>
        <label>
        	<input type="password" name="Password" required placeholder="Password">
        </label>
        <input name="submit" type="submit" value="Login">
        <br>
        <%= (new java.util.Date()).toLocaleString()%>
        </form>
</section>



</body>
</html>