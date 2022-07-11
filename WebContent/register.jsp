<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <title>Sign up</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/register.css">
    <link rel="stylesheet" href="static/css/iconfont.css">
    <script src="static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="static/js/Register.js"></script>
</head>

<body>
	<div class="form-box">
   		<h1 style="color:#ee82ee;font-size:40px" align="center">欢迎来到公共物品借还系统!</h1>
     	<div class="tit">Sign up</div>
     	<span class="iconfont icon-yonghu-yuan">
		<input type="text" class="input" id="user-username" name="username" required="required" placeholder="Username"></span>
		<span class="iconfont icon-mima">
		<input type="password" class="input" id="user-password" name="password" required="required" placeholder="Password"></span>
		<span class="iconfont icon-zuoxixingming">
		<input type="text" class="input" id="user-name" name="name" required="required" placeholder="Name"></span>
		<span class="iconfont icon-youxiang">
		<input type="text" class="input" id="user-email" name="email" required="required" placeholder="E-mail"></span>
		<span class="iconfont icon-top_lianxifangshi">
		<input type="text" class="input" id="user-phone" name="phone" required="required" placeholder="Tel"></span>
        <button type="button" onclick="registerTestify()" >提交</button>
		<span>已经注册?<a href="index.jsp">去登录</a></span>
    </div>
</body>
</html>