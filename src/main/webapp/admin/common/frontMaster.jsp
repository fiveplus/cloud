<!-- 前端模版 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/master-tag" prefix="fms" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><fms:ContentPlaceHolder id="title" /></title>
	<meta name="renderer" content="webkit">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="css/main.css" rel="stylesheet" type="text/css" />
	<link href="css/default.css" rel="stylesheet" type="text/css" />
	
	<!-- switchs插件 -->
	<link href="css/bootstrap/bootstrap-switch.css" rel="stylesheet" type="text/css" />
	<link href="css/buttons.css" rel="stylesheet" type="text/css" />
	
	<!-- scroll插件 -->
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.jscroll.js"></script>
	<script type="text/javascript" src="js/jquery.scrollto.js"></script>
	<!-- QQ表情库 -->
	<script type="text/javascript" src="js/jquery.qqFace.js"></script>
	
	<!-- 时间选择插件 -->
	<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.datetimepicker.js"></script>
	
	<!-- 滚动条插件 -->
	<link rel="stylesheet" href="js/scroll/jquery.mCustomScrollbar.css" type="text/css" />
	<script type="text/javascript" src="js/scroll/jquery.mousewheel.min.js"></script>
	<script src="js/scroll/jquery.mCustomScrollbar.min.js"></script>
	
	<!-- zhangshenwu插件 -->
	<script src="js/cloud-server.js" ></script>
	
	<!-- 融云WEB-SDK接入 -->
	<script src="http://res.websdk.rongcloud.cn/RongIMClient-0.9.15.min.js"></script>
	<script src="js/rongyun/rongyun.js"></script>
	
	<!-- 弹出框插件 -->
	<!-- <script src="css/bootstrap/js/bootstrap.min.js"></script>  -->
	<script src="css/bootstrap/js/highlight.js"></script>
	<script src="css/bootstrap/js/bootstrap-switch.js"></script>
	<script src="js/jquery.leanModal.min.js"></script>
	
	
	
	<fms:ContentPlaceHolder id="source" />	
	
</head>
<body class="mainbg01">
	<jsp:include page="/admin/common/front/rightbox.jsp" />
	<div class="mainbox">
		<div class="mainb_2">
			<div class="mainb_3">
				<jsp:include page="/admin/common/front/leftbox.jsp" />
				<div class="contentbox">
					<fms:ContentPlaceHolder id="main" />
				</div>
			</div>
		</div>
	</div>
	<div class="index-bg">
		<img src="images/bg01.jpg" />
	</div>
	<div id="add_project_div" class="leanmodel_div">
		<form action="project/add" role="form" class="form" id="add_project" >
			<div style="padding:20px 5px;"><font size="+2"><b>项目新建</b></font> <span style="color:#999;"> >>请输入项目详细信息 </span> </div>
			<div class="form-group">
				<span class="label">项目名称：</span>
				<input type="text" name="name" class="input-text" placeholder="项目名称"  />
			</div>
			<div class="form-group">
				<span class="label" >允许加入：</span>
				<input type="checkbox" checked />
			</div>
			
			<div class="form-group">
				<span class="label" >是否验证：</span>
				<input type="checkbox" checked />
			</div>
			
			<div class="form-group" style="padding:10px 0 20px 0;">
				<span class="label" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a href="javascript:add_project()" class="button button-primary button-rounded button-small">确认</a>
			</div>
		</form>
	</div>
	
	<div id="chat-div" style="padding:0;">
		<form action="rong/send_message" method="post" id="send-message-form">
		<div class="chat-top">
			<div class="chat-top-left">
				<img src="" class="img-radius64" />
			</div>
			<div class="chat-top-right">
				<div class="chat-top-right-top">张三</div>
				<div class="chat-top-right-bottom">超级管理-开发工程师</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="chat-center">
			<!-- 
			<div class="chat-to">
				<div class="item-left">
					<img src="" class="img-radius30" />
				</div>
				<div class="item-right">
					<div class="arrow"></div>
					<div class="text">sdfgdfsgdsfgdfsgsdfgdgf</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="chat-form">
				<div class="item-left">
					<img src="" class="img-radius30" />
				</div>
				<div class="item-right">
					<div class="arrow"></div>
					<div class="text">asddsfgfdfsgsdfgdfsg</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			 -->
		</div>
		<div class="chat-bottom">
			<textarea name="message" class="chat-text"></textarea>
			<div align="right" style="padding:5px 10px;" >
				<input type="hidden" name="id" value="" />
				<a href="javascript:send_message()"  class="button button-primary button-rounded button-small">发送</a>
			</div>
		</div>
		</form>
	</div>
	
	
	<div class="popadd">
		<i><img src="images/main_56.png" width="64" height="64" /></i>
		<div class="popadd_r"><b>刘孟云</b>集团·网络部 <br />
		邮箱：liumengyun@shengquan.com<br />
		职位：网络推广专员<br /><br />
		<img src="images/main_66.png" width="81" height="33" />
		<img src="images/main_68.png" width="81" height="33" />
		</div>
		<div class="clear"></div>
	</div>
	
	<a id="cont-a" rel='leanModal' href='#cont-div'></a>
	<div id="cont-div" style="padding:0;height:500px;overflow-y:auto;background: #f2f2f5;">
	</div>
	
	<script type="text/javascript">
	
		function show_cont(id){
			$("#cont-div").load("content/cont?id="+id,function(){
				$("#cont-a").click();
			});
		}
	
		//高度全屏自适应
		function resizediv(){
			var mainH=$(window).height();
			$(".leftmenu").height(mainH-320);
			$(".contentbox").css("min-height",mainH);
			$(".itembox").width($('.contentbox').width());
			
		}
		
		$(window).resize(function(){
			resizediv();
		});
		
		//组装用户详细信息
		function get_user_info(u){
			var img_url = "images/main_56.png";
			if(u.portrait != ''){
				img_url = u.portrait;
			}
			//JSON.stringify(u)
			var html = "<i><img class='img-radius64' src='"+img_url+"' width='64' height='64' /></i>"
			+"<div class='popadd_r'><b>"+u.username+"</b>   "+u.dept.name+" <br />邮箱："+u.loginName+"<br />"
			+"职位："+u.post+"<br /><br />"
			+"<a id='show-chat-a' onclick='show_chat("+ u.id +")' rel='leanModal' href='#chat-div'><img src='images/main_66.png' width='81' height='33' /></a>"
			+" <img src='images/main_68.png' width='81' height='33' /></div>"
			+"<div class='clear'></div>";
			return html;
		}
		
		//发送聊天消息
		function send_message(){
			var action = $("#send-message-form").attr("action");
			var alldata = $("#send-message-form").serialize();
			
			var imgurl = '${user.portrait}';
			var text = $("#send-message-form .chat-text").val();
			$("#chat-div .chat-center #mCSB_2_container").append(form_message_div(imgurl,text));
			$.ajax( {
				cache : true,
				type : "POST",
				url : action,
				data:alldata,
				error : function(request) {
					alert("服务器连接异常!");
				},
				success : function(data) {
					var vdata = eval("(" + data + ")");
					//var result = eval("(" + vdata.result + ")");
					var text = $("#send-message-form .chat-text").val();
					$("#send-message-form .chat-text").val("");
					
					//var imgurl = vdata.user.portrait;
					
					//$("#chat-div .chat-center #mCSB_2_container").append(form_message_div(imgurl,text));
					
					$("#chat-div .chat-center").mCustomScrollbar("scrollTo","last");
				}
			});
		}
		
		
		$(document).ready(function(){
			//数据初始化
			$("#cont-a").leanModal({top:10});
			
			//左侧数据加载
			var dataid = '${dataid}';
			var url = "user/persons";
			if(dataid == '0'){
				url = "user/persons";
			}else if(dataid == '1'){
				url = "user/projects";
			}
			$(".leftmenu:first").load(url,function(){
				resizediv();
				$(".rm a").each(function(i){
					$(this).html("<span class='c'>"+$(this).html()+"</span><span class='over'>"+$(this).html()+"</span>");
				});
				$(".rm a").prepend( '<span class="bg"></span>' );
				
				//message_init();
				
				load_menus();
				
				$('#add_project_div input[type="checkbox"]').bootstrapSwitch();
				rong_init();
				
			});		
			
			//项目组点击
			$(".leftbox .tab li").click(function(){
				//样式修改
				$(".leftbox .tab li").removeClass("cur");
				$(this).addClass("cur");
				var id = $(this).attr("data-id");
				//数据加载
				if(id == "0"){
					$(".leftmenu:first .mCSB_container").load("user/persons?dataid="+id,function(){
						load_menus();
						message_init();
					});
				}else if(id == "1"){
					$(".leftmenu:first .mCSB_container").load("user/projects?dataid="+id,function(){
						load_menus();
					});
				}else if(id == "2"){
					
				}
			});
			
			
		});
		
		function load_menus(){
			
			var hbout;
			$(".leftmenu").mCustomScrollbar();
			
			
			$(".rm a").hover(function() {
				$(".c",this).stop().animate({'top':'-88px'},250);
				$(".over",this).stop().animate({'top':'0'},250);
				$(".bg",this).stop().animate({'top':'0px'},250);
			}, function() {
				// 鼠标移出时候被触发的函数
				if(!$(this).hasClass('cur')){
				$(".c",this).stop().animate({'top':'0px'},250);
				$(".over",this).stop().animate({'top':'88px'},250);
				$(".bg",this).stop().animate({'top':'-88px'},250);
				}
			});
			$(".rm a").click(function() {
				$(".rm a").not($(this)).find(".c").stop().animate({'top':'0px'},250);
				$(".rm a").not($(this)).find(".over").stop().animate({'top':'88px'},250);
				$(".rm a").not($(this)).find(".bg").stop().animate({'top':'-88px'},250);
				$(".rm a").not($(this)).removeClass("cur");
				$(this).addClass("cur");
				var p = $(this).attr("href").replace("#","");
				window.location.href = p+"?rightMenuId="+p;
			});
			
			
			
			//左侧一级菜单点击事件
			$('.leftmenu li a').not('.leftmenu li div a').click(function(){
				$('.leftmenu li div').not('.leftmenu li div div').slideUp(300);
				if($(this).hasClass("open")){ 
					$('.leftmenu li a').not('.leftmenu li div a').removeClass('open');
				}else{
					$('.leftmenu li a').not('.leftmenu li div a').removeClass('open');
					$(this).addClass('open');
					$(this).next().slideDown(400);
				}
			});
			
			//左侧二级菜单点击事件
			$('.leftmenu li div a').not('.leftmenu li div div a').click(function(){
				$('.leftmenu li div div').slideUp(300);
				if($(this).hasClass("open")){ 
					$('.leftmenu li div a').not('.leftmenu li div div a').removeClass('open');
				}else{
					$('.leftmenu li div a').not('.leftmenu li div div a').removeClass('open');
					$(this).addClass('open');
					$(this).next().slideDown(400);
				}
				
			});
			
			//左侧二级菜单更改样式
			$('.leftmenu div div a').hover(function(){
				var obj = $(this).next("input[name='userid']");
				var id = obj.val();
				if(typeof(id) != "undefined"){
					$.ajax({
						type:"POST",
						url:"user/info?id="+id,
						async:false,
						error:function(request){
							alert("数据请求错误!");
						},
						success:function(data){
							var user = eval("("+data+")");
							
							var val = get_user_info(user);
							
							$('.popadd').html(val);
							$("#show-chat-a").leanModal();
						}
					});
					//$('#div01').css("top",temp);
					$('.popadd').css('top',$(this).offset().top-70);
					$('.popadd').css('left',$(this).offset().left-25);
					$('.popadd').fadeIn(200);
					//$(this).addClass('cur');
					$('.leftmenu div div a').not($(this)).removeClass('cur');
				}
			},function(e){
				var popadd = $('.popadd');
				if(!get_mouse(popadd,e)){
					$('.popadd').fadeOut(0);
					$(this).removeClass('cur');
				}
				//$('.leftmenu div div a').not($(this)).removeClass('cur');
			});
			
			$('.popadd').mouseleave(function(){
				$('.popadd').fadeOut(0);
			});
			
			$('.leftmenu div div span').hover(function(){
				$('.leftmenu div div span').not($(this)).fadeOut(0);
				$(this).fadeIn(0);
				$(this).prev().addClass('cur');
				//$('.leftmenu div div a').not($(this).pre()).removeClass('cur');
			},function(){
				$(this).fadeOut(0);
				$(this).prev().removeClass('cur');
				//$('.leftmenu div div a').not($(this)).removeClass('cur');
			});
			
			//分享
			$("#project a").click(function(){
				$("#project a").removeClass("active");
				$(this).addClass("active");
				//var val = $(this).next().children().html();
				var val = $(this).attr("data-id");
				$("#project input").attr("value",val);
			});
			$("#topical a").click(function(){
				$("#topical a").removeClass("active");
				$(this).addClass("active");
				//var val = $(this).next().children().html();
				var val = $(this).attr("data-id");
				$("#topical input").attr("value",val);
			});
			
			
		}
		
		function show_chat(uid){

			$.ajax({
				cache:true,
				type:"POST",
				url:"rong/get_messages?id="+uid,
				error: function(request) {
					alert("服务器连接失败!");
				},
				success: function(data) {
					
					stopa(uid);
					
					$("#chat-div .chat-center").mCustomScrollbar({theme:'dark'});
					
					var vdata = eval("("+data+")");
					var img_url = "images/main_56.png";
					var u = vdata.user;
					if(u.portrait != ''){
						img_url = u.portrait;
					}
					
					$("#chat-div .chat-center #mCSB_2_container").empty();
					
					for(var i = 0;i < vdata.msgs.length;i++){
						if(u.id == vdata.msgs[i].toUser.id){
							var html = form_message_div(vdata.msgs[i].fromUser.portrait,vdata.msgs[i].content);
							$("#chat-div .chat-center #mCSB_2_container").append(html);
						}
						if(u.id == vdata.msgs[i].fromUser.id){
							var html = to_message_div(vdata.msgs[i].fromUser.portrait,vdata.msgs[i].content);
							$("#chat-div .chat-center #mCSB_2_container").append(html);
						}
					}
					
					
					
					$("#chat-div input[name='id']").val(u.id);
					$("#chat-div .chat-top-left img").attr("src",img_url);
					$("#chat-div .chat-top-right .chat-top-right-top").html(u.username);
					$("#chat-div .chat-top-right .chat-top-right-bottom").html(u.dept.name+"-"+u.post);
					
					$("#chat-div .chat-center").mCustomScrollbar("scrollTo","last");
					
				}
			});
		}
		
		//创建项目
		function add_project(){
			var action = $("#add_project").attr("action");
			var alldata = $("#add_project").serialize();
			$.ajax({
				type:"POST",
				url:action,
				data:alldata,
				error:function(request){
					alert("服务器连接失败!");
				},
				success:function(data){
					var vdata = eval("("+data+")");
					//alert(vdata.message);
					if(vdata.code==200){
						alert(vdata.message);
						window.location.href="project?id="+vdata.id;
					}
					
					//$("#add_project_div").attr("style","");
					//$("#lean_overlay").remove();
					
					//$("#add_project_div .form input[type=text]").val("");
				}
			});
			
		}
		
		function getX(e) {
		  	e = e || window.event;
			return e.pageX || e.clientX + document.body.scroolLeft;
		}

		function getY(e) {
			e = e|| window.event;
			return e.pageY || e.clientY + document.boyd.scrollTop;
		}
		
		function get_mouse(obj,e){
			var flag = false;
			var x = getX(e);
			var y = getY(e);
			var left = obj.offset().left;
			var top = obj.offset().top;
			var width = obj.outerWidth();
			var height = obj.outerHeight();
			if(x >= left && x<=left+width && y >= top && y <= top+height){
				flag = true;
			}
			return flag;
		}
		
	</script>
</body>
</html>