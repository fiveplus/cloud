<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content.content") != null ? request.getParameter("content.content") : "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>-碎片云3.0-</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/swz.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />

<!-- switchs插件 -->
<link href="css/bootstrap/bootstrap-switch.css" rel="stylesheet" type="text/css" />
<link href="css/buttons.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.jscroll.js"></script>
<script type="text/javascript" src="js/jquery.scrollto.js"></script>
<!-- QQ表情库 -->
<script type="text/javascript" src="js/jquery.qqFace.js"></script>

<!-- 时间选择插件 -->
<script src="js/jquery.datetimepicker.js"></script>
<!-- 复文本编辑器 -->
<link rel="stylesheet" href="js/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="js/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="js/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="js/kindeditor-4.1.10/plugins/code/prettify.js"></script>

<!-- tree插件 -->
<link rel="stylesheet" href="css/metroStyle/metroStyle.css" type="text/css" />
<script type="text/javascript" src="js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/ztree/jquery.ztree.exedit-3.5.js"></script>

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

<!-- 日历插件 -->
<link rel='stylesheet' type='text/css' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/start/jquery-ui.css' />
<link rel="stylesheet" href="js/jquery-week-calendar/jquery.weekcalendar.css" type="text/css" />
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js'></script>
<script src="js/jquery-week-calendar/jquery.weekcalendar.js"></script>

<script type="text/javascript"> 
var editor;
editor_init();
function editor_init(){
	if($("#send-text")){
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content.content"]', {
					width:"100%",
					cssPath : 'js/kindeditor-4.1.10/plugins/code/prettify.css',
					uploadJson : 'js/kindeditor-4.1.10/jsp/upload_json.jsp',
					fileManagerJson : 'js/kindeditor-4.1.10/jsp/file_manager_json.jsp',
					allowFileManager : true,
					resizeType : 0,
					items:["source", "|", "undo", "redo", "|", "preview", "print", "template", "code", "cut", "copy", "paste", "plainpaste", "wordpaste",
						"|", "justifyleft", "justifycenter", "justifyright", "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent",
						"subscript", "superscript", "clearhtml", "quickformat", "selectall", "|", "/", "formatblock", "fontname", "fontsize", 
						"|", "forecolor", "hilitecolor", "bold", "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image", 
						"multiimage", "flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak", "anchor", "link", "unlink", 
						"|" ], //"fullscreen" 全屏  , "about" 关于
					afterCreate : function() {
						
						var self = this;
						/*
						K.ctrl(document, 13, function() {
							self.sync();
							//document.forms['example'].submit();
						});
						
						K.ctrl(self.edit.htmc, 13, function() {
							self.sync();
							//document.forms['example'].submit();
						});*/
					},
					afterBlur : function(){
						this.sync();
					}
				});
			prettyPrint();
			});
		
	}
	
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

//发布帖子
function add_content(){
	var action =  $("#add_content").attr("action");
	var alldata = $("#add_content").serialize();
	var remindTime = $("#datetimepicker").val();
	alldata += "&remindTime="+remindTime;
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		error: function(request) {
			alert("服务器连接失败!");
		},
		success: function(data) {
			
			var vdata = eval("("+data+")");
			
			KindEditor.instances[0].html("");
			//浏览数据加载
			$(".list_1").prepend(get_content(vdata.content));
			ScrollToId("cb_2");
			//alert(vdata.message);
			
		}
	});
}

//组装发布文章
function get_content(c){
	var date = new Date(c.createTime);
	var time = date.Format("yyyy-MM-dd HH:mm:ss");
	var imgs = "";
	for(var i =0;i<c.imgs;i++){
		var s = "<div class='content-img-div'>";
		s+="<img src='"+c.imgs[i]+"' />";
		s+= "</div>";
		imgs += s;
	}
	var st = "<li>"+
		"<div class='libox'>"+
	"<a href='#' class='share'>"+c.theme.name+"</a>"+
	"<a href='#' class='hphoto'><img src='"+c.user.portrait+"'"+
			"class='img-radius30' />"+
	"</a>"+
	"<b><a href='#'>"+c.user.username+"</a>"+
	"</b>"+
	"<i>"+c.user.group.parent.name+"·"+c.user.group.name+"</i>"+
	"<br />"+
	time+
	"<span style='font-size: 12px;'> "+
			"<a href='#'>"+
			c.str+"<br />"+imgs+
			"</a>"+
	"</span>"+
"</div>"+
"<div class='lib'>"+
	"<a href='#' class='la2'>("+c.readCount+")</a>"+
	"<a href='#' class='la1'>(0)</a>"+
	"<b>山东省济南市舜泰广场8号楼东12B</b>"+
"</div>"+
"</li>";
	return st;
}


//新增项目组成员
function add_project_user(){
	var action = $("#add_project_user_form").attr("action");
	var alldata = $("#add_project_user_form").serialize();
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		error:function(request){
			alert("服务器连接失败!");
		},
		success:function(data){
			var vdata = eval("("+data+")");
			//alert(vdata.message);
			
			$("#add_project_div").attr("style","");
			$("#lean_overlay").remove();
			
			get_projects('project_user.s?id='+vdata.projectId);
		}
	});
}


//创建项目
function add_project(){
	var action = $("#add_project").attr("action");
	var alldata = $("#add_project").serialize();
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		error:function(request){
			alert("服务器连接失败!");
		},
		success:function(data){
			var vdata = eval("("+data+")");
			//alert(vdata.message);
			
			$("#add_project_div").attr("style","");
			$("#lean_overlay").remove();
			
			$("#add_project_div .form input[type=text]").val("");
		}
	});
	
}

//添加项目计划
function add_project_progress(){
	var action = $("#add_project_progress_form").attr("action");
	var alldata = $("#add_project_progress_form").serialize();
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		error:function(request){
			alert("服务器连接失败!");
		},
		success:function(data){
			var vdata = eval("("+data+")");
			//alert(vdata.message);
			
			$("#add_project_progress_div").attr("style","");
			$("#lean_overlay").remove();
			
			$("#add_project_progress_div .form input[type=text]").val("");
			$("#add_project_progress_div .form textarea").val("");
			
			get_projects('project_progress.s?id='+vdata.projectId);
		}
	});
}

//修改项目计划
function update_project_progress(){
	var action = $("#update_project_progress_form").attr("action");
	var alldata = $("#update_project_progress_form").serialize();
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		error:function(request){
			alert("服务器连接失败!");
		},
		success:function(data){
			var vdata = eval("("+data+")");
			//alert(vdata.message);
			
			$("#update_project_progress_div").attr("style","");
			$("#lean_overlay").remove();
			
			$("#update_project_progress_div .form input[type=text]").val("");
			$("#update_project_progress_div .form textarea").val("");
			
			get_projects('project_progress.s?id='+vdata.projectId);
		}
	});
}


//高度全屏自适应
function resizediv(){
	mainH=$(window).height();
	$(".leftmenu").height(mainH-320);
	$(".contentbox").css("min-height",mainH);
	$(".itembox").width($('.contentbox').width());
}

$(window).resize(function(){
	resizediv();
	if($("a.post4")){
		var offset = $("a.post4").position();
		var top = offset.top + $("a.post4").outerHeight();
		$('#tx').css('top',top+10);
		$('#tx').css('left',offset.left+358);
	}
	
	
	//var offset = $("a.post1").position();
	//var top = offset.top + $("a.post1").outerHeight();
	//$('#facebox').css('top',top+10);
	//$('#facebox').css('left',offset.left);
	
});



$(document).ready(function() {
	$(".leftmenu:first").load("persons.s",function(){
		
		//高度全屏自适应
		resizediv();
		ScrollToId("cb_2");
		
		$(".rm a").each(function(i){
			$(this).html("<span class='c'>"+$(this).html()+"</span><span class='over'>"+$(this).html()+"</span>");
		});
		$(".rm a").prepend( '<span class="bg"></span>' );
		
		load_menus();	
		
	});

	//项目组点击
	$(".leftbox .tab li").click(function(){
		//样式修改
		$(".leftbox .tab li").removeClass("cur");
		$(this).addClass("cur");
		var id = $(this).attr("data-id");
		//数据加载
		if(id == "0"){
			$(".leftmenu:first .mCSB_container").load("persons.s",function(){
				load_menus();
			});
		}else if(id == "1"){
			$(".leftmenu:first .mCSB_container").load("projects.s",function(){
				load_menus();
			});
		}else if(id == "2"){
			
		}
	});
	
	
	
	get_contents_init();
	
	
	
	
	$('#datetimepicker').datetimepicker();
});


function load_menus(){
	
	message_init();
	var hbout;
	$(".leftmenu").mCustomScrollbar();
	$("#chat-div .chat-center").mCustomScrollbar();
	
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
	});
	
	$('#h1, #hb1').hover(function(){
		$("#hb1").show();
		$("#hb1").stop(true).animate({ top: "45px",opacity:"1" }, 500);
		$("#h1").addClass("h");
		if(hbout){
			clearTimeout(hbout);
		}
		},function(){
		$("#hb1").stop(true).animate({ top: "-100px" , opacity:"0" }, 300);
		$("#h1").removeClass("h");
		hbout=setTimeout(function(){$("#hb1").hide()},300);
	});
	$('#h2, #hb2').hover(function(){
		$("#hb2").show();
		$("#hb2").stop(true).animate({ top: "45px",opacity:"1" }, 500);
		$("#h2").addClass("h");
		if(hbout){
			clearTimeout(hbout);
		}
	},function(){
		$("#hb2").stop(true).animate({ top: "-100px" , opacity:"0" }, 300);
		$("#h2").removeClass("h");
		hbout=setTimeout(function(){$("#hb2").hide()},300);
	});
	$('#h3, #hb3').hover(function(){
		$("#hb3").show();
		$("#hb3").stop(true).animate({ top: "45px",opacity:"1" }, 500);
		if(hbout){
			clearTimeout(hbout);
		}
	},function(){
		$("#hb3").stop(true).animate({ top: "-200px",opacity:"0" }, 300);
		hbout=setTimeout(function(){$("#hb3").hide()},300);
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
		//项目跳转
		var action = $(this).attr("action");
		if(action){
			var id = $(this).next("input[name='projectid']").val();
			get_projects(action+"?id="+id);
		}
	});
		
	//左侧二级菜单更改样式
	$('.leftmenu div div a').hover(function(){
		var obj = $(this).next("input[name='userid']");
		var id = obj.val();
		if(typeof(id) != "undefined"){
			$.ajax({
				cache:true,
				type:"POST",
				url:"user_info.s?id="+id,
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
		
		
	//表情
	/*$("a.post1").qqFace({
		id:"facebox", //face id
		assign:"send-text", //给控件赋值
		path:"images/face/"		
	});*/
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
	//是否公开
	$("a.post5").toggle(function(){
		$(this).html("公开");
		$(this).css({"background":"transparent url('images/_f_05.png') no-repeat scroll center center","color":"#39d17e"});
		$("input[name='content.isPublic']").attr("value","Y");
	},function(){
		$(this).html("私密");
		$(this).css({"background":"transparent url('images/f_05.png') no-repeat scroll center center","color":"#999"});
		$("input[name='content.isPublic']").attr("value","N");
	});
	//提醒
	$("a.post4").toggle(function(){
		var offset = $(this).position();
		var top = offset.top + $(this).outerHeight();
		
		$('#tx').css('top',top + 10);
		$('#tx').css('left',offset.left + 359);
		
		if($("#tx").is(":hidden")){
			$("#tx").show();
		}else{
			$("#tx").hide();
		}
	},function(){
		var offset = $(this).position();
		var top = offset.top + $(this).outerHeight();
		
		$('#tx').css('top',top + 10);
		$('#tx').css('left',offset.left + 359);
		
		if($("#tx").is(":hidden")){
			$("#tx").show();
		}else{
			$("#tx").hide();
		}
	});
		
	$(document).click(function(e){
		//时间点击去BUG
		var tx = $("#tx");
		var dp = $(".xdsoft_datetimepicker");
		if(!get_mouse(tx,e) && !get_mouse(dp,e)){
			$(tx).hide();
			$(tx).next().hide();
		}
		
	});
		
	
	//@功能
}



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

function show_chat(uid){

	$.ajax({
		cache:true,
		type:"POST",
		url:"rong/get_messages.s?id="+uid,
		error: function(request) {
			alert("服务器连接失败!");
		},
		success: function(data) {
			
			stopa(uid);
			
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
//项目
function get_projects(url){
	//加载项目界面
	//$("#main").css({"height":"auto"});
	$("#cb_5").load("project/"+url,function(){
		ScrollToId("cb_5");
	});
}

function update_project(formid){
	var action = $("#"+formid).attr("action");
	var alldata = $("#"+formid).serialize();
	$.ajax({
		cache:true,
		type:"POST",
		url:action,
		data:alldata,
		async:false,
		error:function(request){
			//alert("数据请求错误!");
		},
		success:function(data){
			var vdata = eval("("+data+")");
			alert(vdata.message);
		}
	});
}

function emptyText(id){
	$("#"+id).attr("value","");
}

function contents_list_more(){
	var page = $(".content-page:last").attr("value");
	
	$.ajax({
		type:"POST",
		url:"content/_list.s?pu.pageNum="+page,
		error:function(request){
			alert("数据请求错误!");
		},
		success:function(data){
			data = data.trim();
			if(data == ''){
				$(".read-more").remove();
				$("#cb_2_hr").css("height",100);
			}else{
				$(".list_1").append(data);
				$("#cb_2").ScrollTo2();
				
			}
			
		}
	});
}






function get_contents_init(){
	//浏览数据加载
	$(".list_1").empty();
	$(".list_1").load("content/_list.s?pu.pageNum=1",function(){
		ScrollToId("cb_2");
	});
}

function get_calendar(){
	$("#cb_6").load("calendar/_list.s?pu.pageNum=1",function(){
		$("#cb_6").ScrollTo(0);
	});
}

</script>
</head>

<body class="mainbg01">
<div class="rightbox"><a href="#" class="gr_t"><img class="img-radius37" src="<c:if test="${user.portrait == ''}">images/right01.png</c:if><c:if test="${user.portrait != ''}">${user.portrait}</c:if>" alt="头像" width="37" height="37"/></a>
  <div class="rm"> <a href="#here" onclick="ScrollToId('cb_1');" class="post"><i class="i1"></i>发帖</a> <a href="#here" onclick="ScrollToId('cb_2');" class="cur"><i class="i2"></i>浏览</a> <a href="#here" onclick="ScrollToId('cb_3');"><i class="i3"></i>应用</a> <a href="#here" onclick="ScrollToId('cb_4');"><i class="i4"></i>统计</a> </div>
  <div class="rb"><a href="#" class="ra1">&nbsp;</a><a href="#" class="ra2">&nbsp;</a><i></i><a href="#" class="ra3">&nbsp;</a><i></i><a href="logout.s" class="ra4">&nbsp;</a></div>
</div>
<div class="mainbox">
  <div class="mainb_2">
    <div class="mainb_3">
      <div class="leftbox"> <a href="#here" class="logo">&nbsp;</a>
        <div class="searchbox">
          <div class="fr">
            <input name="submit" type="image" src="images/space.gif" width="32" height="32" />
          </div>
          <input name="input" type="text" class="searchinput" value="" />
        </div>
        <ul class="tab">
          <li data-id="0" class="cur">通讯录</li>
          <li data-id="1">项目组</li>
          <li data-id="2">最近联系</li>
        </ul>
        <div class="space_h_20"></div>
        <ul class="leftmenu" style="padding-right:5px;">
          <!-- 我来组成左侧菜单 -->
        </ul>
       
        <a href="#here" class="cloud">&nbsp;</a> </div>
      <div class="contentbox">
        <div id="main" style="overflow:hidden;">
          <div id="cb_1" style="position:relative">
            <div class="cmenu" >
              <div class="cmenuleft"><a href="#" class="h">我的发帖</a></div>
              <div class="cmenuright"><a href="javascript:get_calendar()" class="cmra1">&nbsp;</a><a href="#" class="cmra2">&nbsp;</a></div>
              <div class="clear"></div>
            </div>
            <!-- 项目、部门列表 -->
            <div class="item">
            <a href="#">2015集团信息化建设项目化建设</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item altmenu"><a href="#">分享</a><a href="#">汇报</a><a href="#">计划</a><a href="#">总结</a><a href="#">报告</a><a href="#">项目</a><a href="#">分析</a><a href="#">圣泉</a><a href="#">你好</a><a href="#">新年</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item depmenu"><a href="#">网络部</a><a href="#">人事部</a><a href="#">信息中心</a><a href="#">财务部</a><a href="#">技术科</a><a href="#">总裁办</a><a href="#">综合办公室</a><a href="#">ERP小组</a><a href="#">酚醛一车间</a><a href="#">铸造市场部</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="space_h_40"></div>
            <div class="post" style="padding-left:25px;padding-bottom:20px;min-height: 830px;">
            <form action="content/add.s" method="post" id="add_content">
            <input type="hidden" name="content.isPublic" value="N" />
            <div class="fenge"></div>
            
               <div class="category-choose-wrap">
				  <div class="category-title">项目：</div>
				  <ul class="seletc-choose" id="project">
				    <a data-id="0" class="active"><li>无项目组</li></a>
				    <c:forEach items="${projects}" var="p"  >
				    	<a data-id="${p.id}" ><li>${p.name}</li></a>
				    </c:forEach>
				    <input type="hidden" name="content.project.id" askuy-form="value" value="0" />
				  </ul>
				  <div class="clear"></div>
				</div>
				
				<div class="fenge"></div>
				
				<div class="category-choose-wrap">
				  <div class="category-title">主题：</div>
				  <ul id="topical" class="seletc-choose">
				     <c:forEach items="${themes}" var="t" varStatus="stat"  >
				    	<a data-id="${t.id}" <c:if test="${stat.index == 0}"> class="active" </c:if> ><li>${t.name}</li></a>
				    </c:forEach>
				    <input type="hidden" name="content.theme.id" askuy-form="value" value="${themes.get(0).id}" />
				  </ul>
				  <div class="clear"></div>
				</div>
				<!-- 分隔 -->
				<div class="fenge"></div>
				
				
              <div class="post_l t16">你正在 <span>分享</span> 中...</div>
              <!-- main_27.png -->
              <div class="post_r" style="margin-right: 12px;">
              <!-- <a href="#" class="post1">表情</a>  
              <a href="#" class="post2">附件</a>
              <a href="#" class="post3">指定</a>-->
              <a href="#" class="post4">提醒</a>
              <a href="#" class="post5">私密</a>
                <div class="clear"></div>
              </div>
              <div class="send-div">
                <textarea id="send-text" name="content.content" class="send-text" >${content.content}<%=htmlspecialchars(htmlData)%></textarea>
              </div>
              <div style="float:right;">
              	<a href="javascript:add_content()" class="w_btn_a_btn" >发布</a>
              </div>
              <div class="clear"></div>
              </form>
            </div>
            <div class="space_h_30 clear"></div>
          </div>
          <div id="cb_2" style="position:relative">
            <div class="cmenu">
              <div class="cmenuleft"><a href="#" class="cur">我的部门</a> <a href="#" id="h1">我的项目</a> <a href="#" id="h2">其他部门</a> </div>
              <div class="cmenuright"><a href="#" class="cmra1">&nbsp;</a><a href="#" class="cmra2">&nbsp;</a> <a href="#">沟通</a><a href="#">记录</a><a href="#">文档</a></div>
              <div class="clear"></div>
            </div>
            <!-- 项目、部门列表 -->
            <div class="item" id="hb1">
           		<c:forEach items="${projects}" var="p">
           			<a href="javascript:get_projects('project_info.s?id=${p.id}')">${p.name}</a>
           		</c:forEach>
            
            
              <div class="clear"></div>
            </div>
            <div class="item depmenu" id="hb2">
            	<c:forEach items="${depts}" var="d">
           			<a href="#">${d.name}</a>
           		</c:forEach>
              <div class="clear"></div>
            </div>
            <div class="item altmenu" id="hb3"><a href="#">分享</a><a href="#">汇报</a><a href="#">计划</a><a href="#">总结</a><a href="#">报告</a><a href="#">项目</a><a href="#">分析</a><a href="#">圣泉</a><a href="#">你好</a><a href="#">新年</a><a href="#">2015</a>
              <div class="clear"></div>
            </div>
            <div class="space_h_40"></div>
            <div id="list-content" style="min-height:750px;">
	            <ul class="list_1">
	             	<li>
	                <div class="libox"><a href="#" class="share">分享</a> <a href="#" class="hphoto"></a> <b><a href="#">马昇</a></b> <i>集团·网络部</i><br />
	                  2014-06-06（今天11:12） <span><a href="#">1关于圣泉酚醛化工2014年5月北京展会展位关于圣泉酚醛化工2014年5月北京展会展系统的风格固定了，下面开展下面的工作位布置的若干通知 ...</a></span></div>
	                <div class="lib"><a href="#" class="la2">(11)</a> <a href="#" class="la1">(3)</a> <b>山东省济南市舜泰广场8号楼东12B</b></div>
	              </li>
	            </ul>
            </div>
            <div id="cb_2_hr" style="height:10px;clear:both;"></div>
            <div class="read-more" align="center" onclick="contents_list_more()">
            	加载更多...
            </div>
            <div class="space_h_30 clear"></div>
          </div>
          <div id="cb_3" style="position:relative">
            <div class="cmenu" >
              <div class="cmenuleft"><a href="#" class="h">我的应用</a></div>
              <div class="cmenuright"><a href="#" class="cmra1">&nbsp;</a><a href="#" class="cmra2">&nbsp;</a></div>
              <div class="clear"></div>
            </div>
            <!-- 项目、部门列表 -->
            <div class="item"><a href="#">2015集团信息化建设项目化建设</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item altmenu"><a href="#">分享</a><a href="#">汇报</a><a href="#">计划</a><a href="#">总结</a><a href="#">报告</a><a href="#">项目</a><a href="#">分析</a><a href="#">圣泉</a><a href="#">你好</a><a href="#">新年</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item depmenu"><a href="#">网络部</a><a href="#">人事部</a><a href="#">信息中心</a><a href="#">财务部</a><a href="#">技术科</a><a href="#">总裁办</a><a href="#">综合办公室</a><a href="#">ERP小组</a><a href="#">酚醛一车间</a><a href="#">铸造市场部</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="space_h_40"></div>
            <div class="use">
              <ul>
                <li><img src="images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
                <li><img src="images/use_02.png" width="64" height="64" /><span>携程旅行</span><a> 立刻安装</a></li>
                <li><img src="images/use_03.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
                <li><img src="images/use_04.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门</span><a> 立刻安装</a></li>
                <li><img src="images/use_02.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
                <li><img src="images/use_03.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
                <li><img src="images/use_04.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门</span><a> 立刻安装</a></li>
                <li><img src="images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
                <li><img src="images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
             	<!-- <div class="clear"></div>   -->
             </ul>
            </div>
            <div class="space_h_30 clear"></div>
          </div>
          <div id="cb_4" style="position:relative">
            <div class="cmenu">
              <div class="cmenuleft"><a href="#" class="h">数据统计</a></div>
              <div class="cmenuright"><a href="#" class="cmra1">&nbsp;</a><a href="#" class="cmra2">&nbsp;</a></div>
              <div class="clear"></div>
            </div>
            <!-- 项目、部门列表 -->
            <div class="item"><a href="#">2015集团信息化建设项目化建设</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item altmenu"><a href="#">分享</a><a href="#">汇报</a><a href="#">计划</a><a href="#">总结</a><a href="#">报告</a><a href="#">项目</a><a href="#">分析</a><a href="#">圣泉</a><a href="#">你好</a><a href="#">新年</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="item depmenu"><a href="#">网络部</a><a href="#">人事部</a><a href="#">信息中心</a><a href="#">财务部</a><a href="#">技术科</a><a href="#">总裁办</a><a href="#">综合办公室</a><a href="#">ERP小组</a><a href="#">酚醛一车间</a><a href="#">铸造市场部</a><a href="#">2015</a>
              <div class="clear">此处显示  class "clear" 的内容</div>
            </div>
            <div class="space_h_40"></div>
            <div style="width:890px;"><img src="images/dsd.png"  /></div>
            <div class="space_h_30 clear"></div>
          </div>
          
          <!-- 项目界面 -->
          <div id="cb_5" style="position:relative">
          </div>
          <!-- 日历 -->
          <div id="cb_6" style="position:relative">
          </div>
          
        </div>
      </div>
    </div>
  </div>
</div>

<div class="index-bg">
	<img src="images/bg01.jpg" />
</div>

<div id="add_project_div">
		<form action="project/_add.s" role="form" class="form" id="add_project" >
			<div style="padding:20px 5px;"><font size="+2"><b>项目新建</b></font> <span style="color:#999;"> >>请输入项目详细信息 </span> </div>
			<div class="form-group">
				<span class="label">项目名称：</span>
				<input type="text" name="project.name" class="input-text" placeholder="项目名称"  />
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
	<form action="rong/send_message.s" method="post" id="send-message-form">
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


<div id="tx" >
	<em><m></m></em>
	<span>时间：</span>
	<input type='text' name="content.remindTime" style="width:200px;margin:5px 0 10px 0;" id="datetimepicker" readonly="readonly" />
	<div align="right">
		<a href="#" class="button button-primary button-rounded button-small">确认</a>
		<a href="javascript:emptyText('datetimepicker')" class="button button-primary button-rounded button-small">取消</a>
	</div>
</div>



<script type="text/javascript">
	//初始化方法
	//创建项目选择框初始化
	$('#add_project_div input[type="checkbox"]').bootstrapSwitch();
	rong_init();
</script>

</body>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>

