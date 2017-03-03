<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
		<!-- 复文本编辑器 -->
		<link rel="stylesheet" href="js/kindeditor-4.1.10/themes/default/default.css" />
		<link rel="stylesheet" href="js/kindeditor-4.1.10/plugins/code/prettify.css" />
		<script charset="utf-8" src="js/kindeditor-4.1.10/kindeditor.js"></script>
		<script charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
		<script charset="utf-8" src="js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
		<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<%
		request.setCharacterEncoding("UTF-8");
		String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
		%>
		<div id="main" style="overflow:hidden;">
			<div id="cb_1" style="position:relative">
				<div class="cmenu" >
					<div class="cmenuleft">
						<a href="#" class="h">我的发帖</a>
					</div>
		            <div class="cmenuright">
		            	<a href="#" class="cmra1">&nbsp;</a>
		            	<a href="#" class="cmra2">&nbsp;</a>
		            </div>
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
					<form action="content/add" method="post" id="add_content">
						<input type="hidden" name="isPublic" value="N" />
						<input type="hidden" name="address" value="" />
						<div class="fenge"></div>
						<div class="category-choose-wrap">
							<div class="category-title">项目：</div>
							<ul class="seletc-choose" id="project">
								<a data-id="0" class="active"><li>无项目组</li></a>
								<c:forEach items="${projects}" var="p"  >
				    				<a data-id="${p.id}" ><li>${p.name}</li></a>
				    			</c:forEach>
				    			<input type="hidden" name="project.id" askuy-form="value" value="0" />
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
				    			<input type="hidden" name="theme.id" askuy-form="value" value="${themes.get(0).id}" />
							</ul>
							<div class="clear"></div>
						</div>
						<div class="fenge"></div>
						<div class="post_l t16">你正在 <span>分享</span> 中...  
						</div> 
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
							<textarea id="send-text" name="content" class="send-text" >${content.content}<%=htmlspecialchars(htmlData)%></textarea>
						</div>
						<div>
							<div style="float:left;margin:15px 0 0 0;padding:4px 0 0 15px;background: url(images/libg02.png) no-repeat 0 7px;font-size: 12px;color:#666;"><b id="address"></b></div>
							<div style="float:right;">
								<a href="javascript:add_content()" class="w_btn_a_btn" >发布</a>
							</div>
						</div>
						<div class="clear"></div>
					</form>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<div id="tx" >
			<em><m></m></em>
			<span>时间：</span>
			<input type='text' name="content.remindTime" style="margin:5px 0 10px 0;" id="datetimepicker" readonly="readonly" />
			<div align="right">
				<a href="javascript:okText()" class="button button-primary button-rounded button-small">确认</a>
				<a href="javascript:emptyText()" class="button button-primary button-rounded button-small">取消</a>
			</div>
		</div>
		<script type="text/javascript">
			//console.log(returnCitySN["cip"]+','+returnCitySN["cname"])//117.89.35.98,江苏省南京市
			$("#add_content input[name='address']").val(returnCitySN["cname"]);
			$("#address").html(returnCitySN["cname"]);
			var editor;
			function editor_init(){
				if($("#send-text")){
					KindEditor.ready(function(K) {
						editor = K.create('textarea[name="content"]', {
								width:"100%",
								cssPath : 'js/kindeditor-4.1.10/plugins/code/prettify.css',
								uploadJson : 'ke/upload',
								fileManagerJson : 'ke/manager',
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
			
			function add_content(){
				var action =  $("#add_content").attr("action");
				var alldata = $("#add_content").serialize();
				var remindTime = $("#datetimepicker").val();
				alldata += "&remindTime="+remindTime;
				var text = editor.html();
				if(text=='') return;
				$.ajax({
					type:"POST",
					url:action,
					data:alldata,
					error: function(request) {
						alert("服务器连接失败!");
					},
					success: function(data) {
						
						var vdata = eval("("+data+")");
						
						if(vdata.code == 200){
							alert(vdata.message);
							window.location.href="index?rightMenuId=index";
						}else{
							alert(vdata.message);
						}
						
						//KindEditor.instances[0].html("");
						
						
					}
				});
			}
			
			function emptyText(){
				$("#datetimepicker").val("");
				$("#remind_a").remove();
				$("#tx").hide();
			}
			
			function okText(){
				$("#tx").hide();
				$(".post_r").prepend("<a id='remind_a' href='javascript:emptyText()'>"+"提醒时间 "+$("#datetimepicker").val()+"</a>");
			}
			
			$(document).ready(function(){
				editor_init();
				//是否公开
				$("a.post5").toggle(function(){
					$(this).html("公开");
					$(this).css({"background":"transparent url('images/_f_05.png') no-repeat scroll center center","color":"#39d17e"});
					$("input[name='isPublic']").attr("value","Y");
				},function(){
					$(this).html("私密");
					$(this).css({"background":"transparent url('images/f_05.png') no-repeat scroll center center","color":"#999"});
					$("input[name='isPublic']").attr("value","N");
				});
				//提醒
				$('#datetimepicker').datetimepicker();
				$("a.post4").toggle(function(){
					var offset = $(this).position();
					var top = offset.top + $(this).outerHeight();
					
					$('#tx').css('top',top + 12);
					$('#tx').css('left',offset.left + 18);
					
					if($("#tx").is(":hidden")){
						$("#tx").show();
					}else{
						$("#tx").hide();
					}
				},function(){
					var offset = $(this).position();
					var top = offset.top + $(this).outerHeight();
					
					$('#tx').css('top',top + 12);
					$('#tx').css('left',offset.left + 18);
					
					if($("#tx").is(":hidden")){
						$("#tx").show();
					}else{
						$("#tx").hide();
					}
				});
				/*
				$(document).click(function(e){
					//时间点击去BUG
					var tx = $("#tx");
					var dp = $(".xdsoft_datetimepicker");
					if(!get_mouse(tx,e) && !get_mouse(dp,e)){
						$(tx).hide();
						$(tx).next().hide();
					}
					
				});*/
				
				//@功能
			});
		</script>
		<%!
		private String htmlspecialchars(String str) {
			str = str.replaceAll("&", "&amp;");
			str = str.replaceAll("<", "&lt;");
			str = str.replaceAll(">", "&gt;");
			str = str.replaceAll("\"", "&quot;");
			return str;
		}
		%>
	</fms:Content>
</fms:ContentPage>