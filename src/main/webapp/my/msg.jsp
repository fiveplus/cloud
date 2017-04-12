<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="/json-el-common" prefix="el" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" >
					<div class="cmenuleft">
						<a href="${contextPath}/my/contents">我的记录</a>
						<a href="${contextPath}/my/calendar">我的日历</a>
						<a class="cur">我的消息</a>
					</div>
					<div class="cmenuright">
						<a href="${contextPath}/my/me">资料</a>
						<a href="${contextPath}/my/stats">统计</a>
						<a href="#">访客</a>
					</div>
					<div class="clear"></div>
				</div>	
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<c:forEach items="${logs}" var="l">
						<div class="gr_ge" style="border:1px solid #ccc;height: auto;">
							<span>
								<img class="img-radius64" src="${contextPath}/images/notify.png" />
							</span>
							<div class="gr_ge2" style="padding-top:13px;">
								<font>${l.title}</font>
								<br/>
								<b style="font-size:12px;">
									<a href="#calmsg_div" class="calexam_a<c:if test="${l.isRead != 'Y'}"> b</c:if>" onclick="get_msg(${l.id})" rel="leanModal">
									${l.content}
									</a>
								</b>
								<br />
								<strong><date:date value="${l.createTime}" /></strong> 
								<a class="calexam_del" href="javascript:del_msg(${l.id})">删除</a>
							</div>
							<div class="clear"></div>
							<c:if test="${l.title == '回复消息'}">
								<div class="commit_msg">
									<div class="commit-item" align="center">
										<a href="#comment_div" onclick="show_comment_div(this)" class="commit_read_a">查看对话</a>
									</div>
									<div style="float:left;padding:10px 0;">
										|
									</div>
									<div class="commit-item" align="center">
										<a href="javascript:void(0)" onclick="show_commit(this)" class="commit_a">回复</a>
									</div>
									<div class="clear"></div>
								</div>
							</c:if>
							<c:if test="${l.title == '评论消息'}">
								<div class="commit_msg">
									<div align="center" style="padding:10px 0;">
										<a href="javascript:void(0)" onclick="show_commit(this)" class="commit_a">回复</a>
									</div>
									<div class="clear"></div>
								</div>
							</c:if>
							<c:if test="${l.title == '评论消息' || l.title == '回复消息' }">
								<div style="display:none;border-top: 1px solid #ccc;padding-top: 10px;background: #eee">
									<div style="float: left;padding-left:6px;">
										<img class="img-radius37" src="${contextPath}/${user.portrait}" />
									</div>
									<form action="${contextPath}/comment/reply.json" method="post" onkeydown="if(event.keyCode==13) return false;">
										<div style="float: left;padding: 5px 10px;width:90%;">
											<input type="hidden" name="logId" value="${l.id}" />
											<input type="hidden" name="comment.id" value="" />
											<input type="hidden" name="toUser.id" value="" />
											<input type="text" name="content" class="comment-input" style="width:100%;" />
										</div>
										<div class="clear"></div>
										<div align="right" style="padding: 13px;">
											<input type="button" onclick="comment(this)" disabled="disabled" class="comment-button disabled" value="评论" />
										</div>
									</form>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
		<div id="calmsg_div" class="leanmodel_div">
				<div class="modal-header">
					<h4 class="modal-title">消息查看<small> >>详细信息 </small></h4>
				</div>
				<form role="form" class="modal-body" id="select_calmsg">
					<div class="form-group">
						<label class="control-label" name="start"></label>
					</div>
					<div class="form-group">
						<label class="control-label" name="title"></label>
					</div>
					
					<div class="form-group">
						<label class="control-label" name="content"></label>
					</div>
				</form>
		</div>
		
		<div id="comment_div" class="leanmodel_div">
			<div class="modal-header">
				<h4 class="modal-title">查看对话<small> >>详细信息 </small></h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div style="float:left;width:90px;">
						<font color="gray">2017-12-12 12:12:12</font>
					</div>
					<div style="float:left;">
						<img src="" class="img-radius37" />&nbsp;&nbsp;<b>张三</b> ：内容
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(".calexam_a").leanModal();
			$(".commit_read_a").leanModal();
			function get_msg(id){
				var form = $("#select_calmsg");
				$.ajax({
			      url: "${contextPath}/my/getlog.json",
			      data:{id:id},
			      success: function(data){
			    	  //var vdata = eval("("+data+")");
			    	  var vdata = data;
			     	  var l = vdata.log;
			     	  var start = new Date(l.createTime).Format("yyyy-MM-dd HH:mm:ss");
			     	  form.find("label[name='start']").html("时间："+start);
			     	  form.find("label[name='title']").html("标题："+l.title);
			     	  form.find("label[name='content']").html("内容："+l.content);
			      }
			    });
			}
			
			function show_commit(obj){
				var next = $(obj).parent().parent().next();
				if(next.is(":hidden")){
					next.show();
				}else{
					next.hide();
				}
			}
			
			function comment(obj){
				var form = $(obj).parent().parent();
				var comment_id = form.parent().parent().find(".gr_ge2 b a font").attr("data-id");
				var user_id = form.parent().parent().find(".gr_ge2 b a font").attr("user-id");
				form.find("input[name='comment.id']").val(comment_id);
				form.find("input[name='toUser.id']").val(user_id);
				var action = form.attr("action");
				var alldata = form.serialize();
				$.ajax({
					type:"POST",
					url:action,
					data:alldata,
					success:function(data){
						var vdata = data;
						$.alert({title:"提示信息",content:vdata.message,type:"blue"});
						form.find("input[name='content']").val("");
						form.parent().hide();
					}
				});
			}
			
			function del_msg(id){
				$.confirm({
					title:'提示信息',
					content:'确认删除吗？删除后无法恢复！！！',
					buttons:{
						confirm:function(){
							$.ajax({
								url:'${contextPath}/my/msg/delete.json',
								data:{id:id},
								success:function(data){
									$.alert({title:'提示信息',content:"消息删除成功！",type:'red'});
									window.location.reload();
								}
							});
						},
						cancel:function(){
							//取消
						}
					}
				});
			}
			
			function show_comment_div(obj){
				var item = $(obj).parent().parent().parent();
				var comment_id = item.find(".gr_ge2 b a font").attr("data-id");
				$.ajax({
					type:"POST",
					url:"${contextPath}/comment/getlist.json",
					data:{id:comment_id},
					success:function(data){
						var vdata = data;
						var html = show_history(vdata.comments);		
						$("#comment_div .modal-body").html(html);
					}
				});
			}
			
			function show_history(comments){
				var html = "";
				for(var i = 0;i < comments.length;i++){
					var c = comments[i];
					var time = new Date(c.createTime).Format("yyyy-MM-dd HH:mm:ss");
					html += "<div class='form-group'>"
								+"<div style='float:left;width:90px;'>"
									+"<font color='gray'>"+time+"</font>"
								+"</div>"
								+"<div style='float:left;'>"
									+"<img src='${contextPath}/"+c.user.portrait+"' class='img-radius37' />&nbsp;&nbsp;<b>"
									+c.user.username+"</b> ："
									+c.content
								+"</div>"
								+"<div class='clear'></div>"
							+"</div>";
				}
				return html;
			}
			
			$(document).ready(function(){
				$(".comment-input").on('input',function(e){
					var form = $(this).parent().parent();
					var btn = form.find(".comment-button");
					if(this.value != ''){
						btn.removeAttr("disabled");
						btn.removeClass("disabled");
					}else{
						btn.attr("disabled","disabled");
						btn.addClass("disabled");
					}
				});
				
				
			});
			
		</script>
	</fms:Content>
</fms:ContentPage>