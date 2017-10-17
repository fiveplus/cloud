<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>-碎片云3.0-</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="${contextPath}/css/login.css">

<script type="text/javascript" src="${contextPath}/js/jquery.min.js" ></script>

<!-- jquery confirm -->
<link href="${contextPath}/css/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css" />
<script src="${contextPath}/css/jquery-confirm/jquery-confirm.js"></script>
</head>
<body>
		<div class="main-body">
			<div class="main-header">
				<h1 class="logo" align="center">碎片云</h1>
				<h2 class="subtitle" align="center">管理从碎片开始</h2>
			</div>
			<div class="view-select" align="center">
				<div class="login" align="center">
					<label class="subtitle">登录</label>
				</div>
			</div>
			<div class="view-login">
				<form action="${contextPath}/user/login.json" class="loginform" methood="post" id="loginform" path="${contextPath}">
					<div class="username">
						<input type="text" name="username" id="username" placeholder="邮箱" tabindex="1"  autofocus/>
					</div>
					<div class="password">
						<input type="password" name="password" id="password" placeholder="密码" tabindex="2" />
					</div>
					<div class="login-submit">
						<input class="login-button" id="login" type="button" value="登录" tabindex="3"  />
					</div>
				</form>
				<div class="signin-misc" align="right">
					<a href="#">无法登录？</a>
				</div>
			</div>
			<!-- more -->
			<div class="more" align="center">
				<a href="#">碎片云</a> · <a href="#">移动应用</a> · <a href="#">联系我们</a>
			</div>
			<div class="more" align="center">
				© 2017 碎片云 · <a href="http://www.12377.cn">网上有害信息举报专区</a>
			</div>
		</div>
		
	<canvas id="canvas"></canvas>
	<script type="text/javascript" src="${contextPath}/js/anim.js"></script>
	<script type="text/javascript" src="${contextPath}/js/login.js" ></script>
</body>
</html>