<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN"SS>
<head>
	<title>Sign in</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/login.css">
	<link rel="stylesheet" href="static/css/iconfont.css">
	<script type="text/javascript" src="static/jQuery/jquery-3.1.1.min.js"></script>
	<script src = "static/js/Login.js"></script>
</head>


<body>	
	<div class="container">
        <div class="wrap">
            <div class="wall wall-top"></div>
            <div class="wall wall-bottom"></div>
            <div class="wall wall-left"></div>
            <div class="wall wall-right"></div>
            <div class="wall wall-back"></div>
        </div>
        <div class="form-box">
        	<h1 style="color:#87cefa;font-size:40px" align="center">欢迎来到公共物品借还系统!</h1>
            <div class="tit">Login</div>
            <span class="iconfont icon-yonghu-yuan">
            <input type="text" id="user-username" name="username" placeholder="Username" ></span>
            <span class="iconfont icon-mima">
            <input type="password" id="user-password" name="password" placeholder="Password"></span>
            <button class="btn" onclick="loginTestify()" >登录</button>
            <span>没有账号？<a href="register.jsp">去注册</a></span>
        </div>
    </div>
</body>
</html>