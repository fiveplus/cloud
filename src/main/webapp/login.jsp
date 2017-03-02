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
 .claer {claer:both;}
 .nav {height:117px;background:url(image/bg02.jpg) repeat-x; width:100%;}
 .inner {width:1190px;height:117px;margin:0 auto;}
 .inner img {width:233px;height:68px;float:left;padding-top:28px;}
 .inner p {width:160px;font-family:SimSun;font-size:14px;color:#FFF;line-height:117px;display:block;float:left;margin-left:17px;}
 .right {width:322px;height:117px;float:right;}
 .op p {width:194px;height:117px;float:left;font-family:SimSun;font-size:14px;color:#FFF;line-height:118px;display:block;}
 .tp {width:119px;height:117px;float:right;font-family:SimSun;font-size:14px;color:#FFF;line-height:118px;display:block;}
 .tp:hover{color:#3dc768;}
 .main {width:100%;height:1150px;margin:0 auto;text-align:center;position:relative;}
 .content {width:1190px;height:1150px;margin:0 auto;text-align:center;position:relative;z-index:2;}
 .pic {width:435px;height:251px;position:absolute;top:83px;right:377px;z-index:3;}
 .login {width:350px;height:385px;background:url(image/login_bg2.png) no-repeat;position:absolute;top:386px;right:420px;z-index:4;}
 .switch {width:350px;height:51px;position:relative;z-index:6;}
 .switch_bg {width:175px;height:4px;background:#3dc768;margin:48px 0 0 0;position:absolute;z-index:7}
 .switch ul {text-decoration:none;text-align:center;z-index:9;}
 .switch ul li {width:175px;height:51px;color:#FFF;display:inline-block;line-height:58px;font-size:20px;font-weight:700;font-family:Microsoft YaHei;float:left;text-decoration:none;cursor:pointer;}
 .switch ul li:hover {color:#3dc768;}
 .web_login>div {width:350px;height:334px;position:relative;margin:o auto;}
 .tips  {color:#FFF;line-height:90px;font-size:18px;font-family:Microsoft YaHei;display:block;}
 .loginform {width:300px;height:334px;text-align:center;margin:0 auto;}
 .uinArea {float:left;width:300px;height:70px;text-align:center;}

 .inputStyle_1 {position:relative;width:300px;height:40px;line-height:40px;background:url(image/login1.png) no-repeat;border:none;outline:none;position:relative;color:#FFF;font-size:16px;}
 .inputStyle_1:hover {background:url(image/login88.png) no-repeat;}
 .pwdArea {float:left;width:300px;height:70px;text-align:center;}

 .inputStyle {position:relative;width:300px;height:40px;line-height:40px;background:url(image/login1.png) no-repeat;border:none;outline:none;position:relative;color:#FFF;font-size:16px;}
 .inputStyle:hover {background:url(image/login88.png) no-repeat;}
 .tips2 {color:#FFF;font-size:18px;text-decoration:none;float:right;position:relative;font-family:Microsoft YaHei;text-align:center;}
 .tips2:hover {color:#3dc768;}
 .login_button {width:300px;height:40px;border:none;background:#27984a;border-radius:3px;float:left;cursor:pointer;color:#FFF;font-size:20px;margin-top:20px;font-family:Microsoft YaHei;}
 .login_button:hover {background:#3dc768;}
 .loginform2 {width:350px;height:334px;}
 .loginform2 img {width:180px;height:180px;}
 .web_login2 {display:none;}
 .tips3 {color:#FFF;line-height:109px;font-size:18px;font-family:Microsoft YaHei;display:block;}
 .point {width:200px;height:29px;position:absolute;left:50%;margin-left:-100px;bottom:112px;}
 .point ul li {width:50px;height:29px;text-decoration:none;float:left;text-align:center;margin:o auto;display:block;padding-top:10px;cursor:pointer;}
 .point ul li.pointer-selected {background:url(image/point2.png) no-repeat center;}
 .main {width:100%;height:1150px;margin:0 auto;text-align:center;}
 .bg li{position:absolute;float:left;z-index:0;text-align:center;width:100%;top:0;left:0;height:auto;overflow:hidden;display:block;}
 .bg li img {display:block;}
 .footer {height:160px;background:#313131;}
 .download {width:1190px;height:160px;margin:0 auto;background:#313131;}
 .op{font-family:Microsoft YaHei;font-size:18px;color:#FFF;line-height:50px;text-align:center;}
 .download_inner {width:320px;height:50px;margin:0 auto;}
 .dow1 {float:left;width:150px;height:50px;diaplay:block;background:#666;}
 .and {text-align:center;font-size:18px;line-height:50px;font-family:Microsoft YaHei;color:#FFF;}
 .dow2 {float:right;width:150px;height:50px;;diaplay:block;background:#666;}
 .iph {text-align:center;font-size:18px;line-height:50px;font-family:Microsoft YaHei;color:#FFF;}
 .download_inner a:hover {background:#3dc768;color:#FFF;border:#000;}
 .company_ {font-family:Microsoft YaHei;font-size:14px;color:#CCC;text-align:center;line-height:20px;margin-top:20px;}
 .hidden{display:none;}
</style>
<script type="text/javascript" src="js/jquery-1.8.2.min.js" ></script>
<script type="text/javascript" src="js/login.js" ></script>
</head>

<body>
<div class="nav">
  <div class="inner">
    <a href="#"><img src="image/LOGO.png"/></a>
    <p>组织碎片化信息共享系统</p>
    <div class="right">
    <p class="op">第一次使用碎片云平台？</p>
    <a href="#"><p class="tp"><u>立即注册>></u></p></a>
    </div>
  </div>
</div>
<div class="main">
 <div class="content">
        <div class="pic"><img src="image/pic.png"/></div>
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
                     <div class="tips"><p>请输入正确的邮箱和密码</p></div>
                     <form class="loginform" methood="get">
                     <div class="uinArea">
                    
                     <input type="text" id="username" name="username" class="inputStyle_1"  style="color:#969696;padding-left:10px;"  tabindex="1"  autofocus/>
                     </div>
                     <div class="pwdArea">
                     
                     <input type="password" id="password" name="password" class="inputStyle"  style="color:#969696;padding-left:10px;"  tabindex="2"  />
                    </div>
                    <a class="tips2" href="#"><p>忘记密码？</p></a>
                    <input type="button" id="login" value="登录" class="login_button" tabindex="3"/>
                    </form>
                </div>
                <div class="web_login2">
                 <div class="tips3"><p>请扫描以下二维码登录</p></div> 
                 <div class="loginform2"><img src="image/erwei.png" width="215px" height="215px"/></div>
                </div>
             </div>
            </div>
 <div class="point">
     <ul>
      <li class="pointer"><img src="image/point.png"/></li>
      <li class="pointer"><img src="image/point.png"/></li>
      <li class="pointer"><img src="image/point.png"/></li>
      <li class="pointer"><img src="image/point.png"/></li>
     </ul>
 </div>
 </div>

     <ul class="bg">
        <li class="tu"><img src="image/bg.jpg"/></li>
        <li class="tu"><img src="image/bg2.jpg"/></li>
        <li class="tu"><img src="image/bg3.jpg"/></li>
        <li class="tu"><img src="image/bg4.jpg"/></li>
     </ul>  
</div>
<div class="footer">
   <div class="download">
       <p class="op">点击下载移动客户端</p>
       <div class="download_inner">
          <a class="dow1" href="#"><p class="and">Android版</p></a> <a class="dow2" href="#"><p class="iph">iPhone版</p></a>
       </div>
    <p class="company_">百创汇国际生物科技（武汉）股份有限公司</p>
   </div>
  </div>
</body>
</html>
