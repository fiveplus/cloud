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
<meta name="description" content="">
<meta name="author" content="">
<style type="text/css">
input:focus{outline:none;}
 * {margin:0; padding:0;}
 ul {list-style:none;}
 .claer {claer:both;}
 .nav {height:117px;background:url(image/bg02.jpg) repeat-x; width:100%;}
 .nav .inner {width:1190px;height:117px;margin:0 auto;}
 .nav .inner img {width:233px;height:68px;float:left;padding-top:28px;}
 .nav .inner p {width:160px;font-family:SimSun;font-size:14px;color:#FFF;line-height:117px;display:block;float:left;margin-left:17px;}
 .nav .inner .right {width:322px;height:117px;float:right;}
 .nav .inner .right .op p {width:194px;height:117px;float:left;font-family:SimSun;font-size:14px;color:#FFF;line-height:118px;display:block;}
 .nav .inner .right .tp {width:119px;height:117px;float:right;font-family:SimSun;font-size:14px;color:#FFF;line-height:118px;display:block;}
 .nav .inner .right .tp:hover{color:#3dc768;}
 .main {width:100%;height:1150px;margin:0 auto;text-align:center;position:relative;}
 .main .content {width:1190px;height:1150px;margin:0 auto;text-align:center;position:relative;z-index:2;}
 .main .content .pic {width:435px;height:251px;position:absolute;top:83px;right:367px;z-index:3;}
 .main .content .login {width:500px;height:550px;background:url(image/login_bg2.png) no-repeat;position:absolute;top:366px;right:345px;z-index:4;}
 .main .content .login .switch {width:500px;height:71px;position:relative;z-index:6;}
 .main .content .login .switch .switch_bg {width:250px;height:5px;background:#3dc768;margin:69px 0 0 0;position:absolute;z-index:7}
 .main .content .login .switch ul {text-decoration:none;text-align:center;z-index:9;}
 .main .content .login .switch ul li {width:250px;height:71px;color:#FFF;display:inline-block;line-height:71px;font-size:25px;font-family:Microsoft YaHei;display:block;float:left;text-decoration:none;cursor:pointer;}
 .main .content .login .switch ul li:hover {color:#3dc768;}
 .main .content .login .web_login>div {width:500px;height:479px;position:relative;margin:o auto;position:absolute;}
 .main .content .login .web_login .web_login1 .tips  {color:#FFF;line-height:109px;font-size:25px;font-family:Microsoft YaHei;display:block;}
 .main .content .login .web_login .web_login1 .loginform {width:400px;height:370px;text-align:center;margin:0 auto;}
 .main .content .login .web_login .web_login1 .loginform .uinArea {float:left;width:400px;height:90px;text-align:center;}
 .main .content .login .web_login .web_login1 .loginform .uinArea .Icon {width:28px;height:21px;float:left;position:absolute;z-index:3;margin:19px 0 0 11px;}
 .main .content .login .web_login .web_login1 .loginform .uinArea .inputStyle {position:relative;width:400px;height:60px;line-height:60px;background:url(image/login1.png) no-repeat;border:none;text-align:center;position:relative;color:#FFF;font-size:22px;}
 .main .content .login .web_login .web_login1 .loginform .uinArea .inputStyle:hover {background:url(image/login88.png)}
 .main .content .login .web_login .web_login1 .loginform .pwdArea {float:left;width:400px;height:90px;text-align:center;}
 .main .content .login .web_login .web_login1 .loginform .pwdArea .Icon {width:28px;height:21px;float:left;position:absolute;z-index:3;margin:19px 0 0 11px;}
 .main .content .login .web_login .web_login1 .loginform .pwdArea .inputStyle {position:relative;width:400px;height:60px;line-height:60px;background:url(image/login1.png) no-repeat;border:none;text-align:center;position:relative;color:#FFF;font-size:22px;}
 .main .content .login .web_login .web_login1 .loginform .pwdArea .inputStyle:hover {background:url(image/login88.png) no-repeat;}
 .main .content .login .web_login .web_login1 .loginform .tips2 {color:#FFF;font-size:25px;text-decoration:none;float:right;position:relative;font-family:Microsoft YaHei;text-align:center;}
 .main .content .login .web_login .web_login1 .loginform .tips2:hover {color:#3dc768;}
 .main .content .login .web_login .web_login1 .loginform .login_button {width:400px;height:60px;border:none;background:url(image/button.png);float:left;cursor:pointer;color:#FFF;font-size:25px;margin-top:30px;font-family:Microsoft YaHei;}
 .main .content .login .web_login .web_login1 .loginform .login_button:hover {background:url(image/button1.png);}
 .main .content .login .web_login .web_login2 .loginform2 {width:500px;height:479px;}
 .main .content .login .web_login .web_login2 {display:none;}
 .main .content .login .web_login .web_login2 .tips3 {color:#FFF;line-height:109px;font-size:25px;font-family:Microsoft YaHei;display:block;}
 .main .content .point {width:200px;height:29px;position:absolute;left:50%;margin-left:-100px;bottom:112px;}
 .main .content .point ul li {width:50px;height:29px;text-decoration:none;float:left;text-align:center;margin:o auto;display:block;padding-top:10px;cursor:pointer;}
 .main .content .point ul li.pointer-selected {background:url(image/point2.png) no-repeat center;}
 .main {width:100%;height:1150px;margin:0 auto;text-align:center;}
 .main .bg li{position:absolute;float:left;z-index:0;text-align:center;width:100%;top:0;left:0;height:auto;overflow:hidden;display:block;}
 .main .bg li img {display:block;}
 .footer {height:160px;background:#313131;}
 .footer .download {width:1190px;height:160px;margin:0 auto;background:#313131;}
 .footer .download p{font-family:Microsoft YaHei;font-size:20px;color:#FFF;line-height:50px;text-align:center;}
 .footer .download .download_inner {width:500px;height:50px;margin:0 auto;padding-top:20px;}
 .footer .download .download_inner a {width:200px;height:50px;text-align:center;border:1px solid #FFF;font-size:18px;line-height:50px;diaplay:block;float:left;font-family:Microsoft YaHei;color:#FFF;background:#666;}
 .footer .download .download_inner .dow2 {float:right;}
 .footer .download .download_inner a:hover {background:#3dc768;color:#FFF;border:#000;}
 .footer .name {height:30px;background:#313131;}
 .footer .name p {font-family:Microsoft YaHei;font-size:14px;color:#CCC;text-align:center;background:#313131;}
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
                     <div class="Icon"><img src="image/lcon1.png"/></div>
                     <input type="text" id="username" name="username" class="inputStyle" tabindex="1" maxlength="30" autofocus/>
                     </div>
                     <div class="pwdArea">
                     <div class="Icon"><img src="image/locn2.png"/></div>
                     <input type="password" id="password" name="password" class="inputStyle" tabindex="2" maxlength="18" />
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
       <div class="op"><p>点击下载移动客户端</p></div>
       
       <div class="download_inner">
          <a href="#"><p>Android版</p></a> <a class="dow2" href="#"><p>iPhone版</p></a>
       </div>
    
   </div>
    <div class="name"><p>百创汇国际生物科技（武汉）股份有限公司</p></div>  
  </div>
</body>
</html>
