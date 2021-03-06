<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>-碎片云3.0-</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">
<style type="text/css">
 * {margin:0; padding:0;}
 ul {list-style:none;}
 a {text-decoration:none;}
 html, body {width:100%;height:100%;font-family: "Microsoft Yahei"}

.clearfix:after,.clearfix:before{display:table;line-height:0;content:""}
.clearfix:after{clear:both}
 .claer {claer:both;}
 .main {width:100%;min-width:1190px;height:100%;margin:0 auto;}
 .content {width:1190px;margin:0 auto;text-align:center;position:relative;z-index:2;}
 .pic {width:400px;height:231px;position:absolute;top:10px;right:395px;z-index:3;}
 .login {width:350px;height:385px;background:url(image/login_bg2.png) no-repeat;position:absolute;top:240px;right:420px;z-index:4;}
 .switch {width:350px;height:51px;position:relative;z-index:6;}
 .switch_bg {width:175px;height:4px;background:#3dc768;margin:48px 0 0 0;position:absolute;z-index:7}
 .switch ul {text-decoration:none;text-align:center;z-index:9;}
 .switch ul li {width:175px;height:51px;color:#FFF;display:inline-block;line-height:58px;font-size:18px;float:left;text-decoration:none;cursor:pointer;}
 .switch ul li:hover {color:#3dc768;}
 .web_login>div {width:350px;height:334px;position:relative;margin:o auto;}
 .tips  {color:#FFF;line-height:60px;font-size:16px;display:block;}
 .loginform {width:300px;height:334px;text-align:center;margin:0 auto;}
 .uinArea {float:left;width:300px;height:70px;text-align:center;}

 .inputStyle_1 {position:relative;width:300px;height:40px;background:url(image/login1.png) no-repeat;border:none;outline:none;position:relative;color:#FFF;font-size:16px;}
 .inputStyle_1:hover {background:url(image/login88.png) no-repeat;}
 .pwdArea {float:left;width:300px;height:70px;text-align:center;}

 .inputStyle {position:relative;width:300px;height:40px;background:url(image/login1.png) no-repeat;border:none;outline:none;position:relative;color:#FFF;font-size:16px;}
 .inputStyle:hover {background:url(image/login88.png) no-repeat;}
 .tips2 {color:#FFF;font-size:16px;text-decoration:none;float:right;position:relative;text-align:center;}
 .tips2:hover {color:#3dc768;}
 .login_button {width:300px;height:40px;border:none;background:#27984a;border-radius:3px;float:left;cursor:pointer;color:#FFF;font-size:20px;margin-top:10px;}
 .login_button:hover {background:#3dc768;}
 .loginform2 {width:350px;height:334px;}
 .loginform2 img {width:180px;height:180px;}
 .web_login2 {display:none;}
 .tips3 {color:#FFF;line-height:70px;font-size:18px;display:block;}
 .point {width:200px;height:29px;position:relative;left:50%;margin-left:-100px;top:720px;}
 .point ul li {width:50px;height:29px;text-decoration:none;float:left;text-align:center;margin:0 auto;display:block;padding-top:10px;cursor:pointer;}
 .point ul li.pointer-selected {background:url(image/point2.png) no-repeat center;}
 .bg {width:100%;min-height:800px;min-width:1190px;height:100%;overflow:hidden;position:absolute;top:0;right:0;}
 .bg li{position:absolute;top:0;right:0;float:left;z-index:0;width:100%;height:100%;overflow:hidden;text-align:center;}
 .bg li img {width:100%;height:100%;min-height:800px;}
 .jc-bs3-container.container {width: 300px;margin: auto;}
</style>

<script type="text/javascript" src="${contextPath}/js/jquery.min.js" ></script>

<!-- jquery confirm -->
<link href="${contextPath}/css/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css" />
<script src="${contextPath}/css/jquery-confirm/jquery-confirm.js"></script>
<script type="text/javascript" src="${contextPath}/js/login.js" ></script>

</head>

<body>

<div class="main">
 <div class="content clearfix">
        <div class="pic"><img src="${contextPath}/image/pic.png"/></div>
        <div class="login">
             <div class="switch">
                  
                   <ul>
                      <li class="switch_btn_focus">邮箱登录</li>
                      <li class="switch_btn">二维码登录</li>
                   </ul>
                    <div class="switch_bg"></div>
             </div>
             <div class="web_login">
                <div class="web_login1">
                     <div class="tips">
                     	<p>&nbsp;<!-- 请输入正确的邮箱和密码 --></p>
                     </div>
                     <form action="${contextPath}/user/login.json" class="loginform" methood="post" id="loginform" path="${contextPath}">
                     <div class="uinArea">
                    
                     <input type="text" id="username" name="username" class="inputStyle_1"  style="color:#969696;padding-left:10px;"  tabindex="1"  autofocus/>
                     </div>
                     <div class="pwdArea">
                     
                     <input type="password" id="password" name="password" class="inputStyle"  style="color:#969696;padding-left:10px;"  tabindex="2"  />
                    </div>
                    <a class="tips2" href="#"><p>忘记密码？</p></a>
                    <input type="button" id="login" value="登&nbsp;&nbsp;录" class="login_button" tabindex="3"/>
                    </form>
                </div>
                <div class="web_login2">
                 <div class="tips3"><p>请扫描以下二维码登录</p></div> 
                 <div class="loginform2"><img src="${contextPath}/image/erwei.png" alt="" /></div>
                </div>
             </div>
            </div>
 <div class="point">
     <ul>
      <li class="pointer"><img src="${contextPath}/image/point.png"/></li>
      <li class="pointer"><img src="${contextPath}/image/point.png"/></li>
      <li class="pointer"><img src="${contextPath}/image/point.png"/></li>
      <li class="pointer"><img src="${contextPath}/image/point.png"/></li>
     </ul>
 </div>
 </div>

     <ul class="bg">
        <li class="tu"><img src="${contextPath}/image/bg.jpg"/></li>
        <li class="tu"><img src="${contextPath}/image/bg2.jpg"/></li>
        <li class="tu"><img src="${contextPath}/image/bg3.jpg"/></li>
        <li class="tu"><img src="${contextPath}/image/bg4.jpg"/></li>
     </ul>  
</div>

</body>
</html>
