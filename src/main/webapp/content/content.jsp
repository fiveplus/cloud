<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>

	<!-- 项目/部门列表 -->
	<div id="content" style="margin: auto;border-top: 3px solid #3dc768;">
		<div class="main-content" style="position: relative; ">
			<!-- 这里显示详细内容 -->
			<div class="user">
				<span class="user-img">
					<img class="img-radius64" src="${content.user.portrait}" />
				</span>
				<div class="user-content">
					<font size="+2"><b>${content.user.username}</b></font> 
					&nbsp;&nbsp;${content.user.group.parent.name}·${content.user.group.name}
					<br />
					<date:date value="${content.createTime}" /> 来自 碎片云 suipianyun.com
				</div>
				<div class="clear"></div>
			</div>
			<div style="height:400px;overflow-y:auto;background: #f2f2f5;">
				<div style="padding:20px;min-height:200px;background: #fff;">
				${content.content}
				</div>
				<div class="content_div" style="border-top: 1px solid #ccc;border-bottom: 1px solid #ccc;padding-top: 5px;padding-bottom:10px;height:17px;">
					<div style="float:left;width:24%;text-align: center;border-right:1px solid #ccc;"><a href="#">收藏</a></div>
					<div style="float:left;width:25%;text-align: center;border-right:1px solid #ccc;">
						<a href="javascript:void(0)" data-id="comment_div">评论</a>
						<div class="arrow-up-border"></div>
						<div class="arrow-up"></div>	
					</div>
					<div style="float:left;width:25%;text-align: center;border-right:1px solid #ccc;">
						<a href="javascript:void(0)">阅读(${content.readCount})</a>
					</div>
					<div style="float:left;width:25%;text-align: center;">
						<a href="javascript:void(0)" data-id="praise_div">赞(${content.praiseCount})</a>
					</div>
					<div class="clear"></div>
				</div>
				<!-- 点赞区域 -->
				<div id="praise_div" class="content-bot" style="background: #f2f2f5;min-height:100px;display: none;">
					<c:forEach items="${users}" var="u">
						<img class="img-radius37" style="margin:10px;" src="${u.portrait}" alt="${u.username}" />
					</c:forEach>
				</div>
				<!-- 评论区 -->
				<div id="comment_div" class="content-bot" style="background: #f2f2f5;">
					<div style="padding:15px 20px;border-bottom: 1px solid #ccc;">
						<form action="comment/save" method="post" id="comment_form">
							<input type="hidden" name="cont.id" value="${content.id}" />
							<input type="text" value="" name="content" class="comment-input" style="width:99%"  />
							<div align="right" style="padding-top: 15px;" >
								<input type="button" disabled="disabled" class="comment-button disabled" value="评论" />
							</div>
						</form>
					</div>
					<div class="commit_list_div">
						<!-- 
						<div style="padding: 5px;" align="center">
							此帖当前暂无评论。
						</div>
						
						<div class="commit_item">
							<span class="commit_user"><img class="img-radius37" src="" /></span>
							<div class="commit_content">
								<a href="#">姓名</a>：评论内容
								<br />
								<font color="gray">2017-12-12 12:12:12</font>
							</div>
							<div class="clear"></div>
						</div>
						 -->
					</div>
				</div>
			</div>
			
		</div>
		
    </div>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			//中间头部js
			var hbout;
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
			
			$(".comment-input").on('input',function(e){
				$(".comment-button").removeClass("disabled");
				if(this.value != ''){
					$(".comment-button").removeAttr("disabled");
					$(".comment-button").removeClass("disabled");
				}else{
					$(".comment-button").attr("disabled","disabled");
					$(".comment-button").addClass("disabled");
				}
			});
			
			$(".content_div div a").click(function(){
				var id = $(this).attr("data-id");
				if(id){
					$(".content-bot").hide();
					$("#"+id).show();
					$(".content_div div .arrow-up-border").remove();
					$(".content_div div .arrow-up").remove();
					var html = "<div class='arrow-up-border'></div><div class='arrow-up'></div>";
					$(this).parent().append(html);
				}
			});
			
			
			$(".comment-button").click(function(){
				var val = $(".comment-input").val();
				if(val != null){
					var form = $("#comment_form");
					var action = form.attr("action");
					var alldata = form.serialize();
					$.ajax({
						type:"POST",
						url:action,
						data:alldata,
						error: function(request) {
							//alert("服务器连接失败!");
						},
						success: function(data) {
							$(".comment-input").val("");
							$(".comment-button").attr("disabled","disabled");
							$(".comment-button").addClass("disabled");
							var vdata = eval("("+data+")");
							//后续处理
							var comment = vdata.comment;
							var html = show_comment(comment);
							$(".commit_list_div").prepend(html);
							
						}
					});
				}
			});
			
			var contentId = '${content.id}';
			init_comments(contentId);
			
			$(document).off('click','.commit_list_div .commit_item .commit_content .del').on('click','.commit_list_div .commit_item .commit_content .del',function(){
				var obj = $(this);
				var id = obj.attr("data-id");
				$.confirm({
					title:'提示信息',
					content:'确认删除？确认删除后无法恢复！！！',
					buttons:{
						confirm:function(){
							obj.parent().parent().parent().remove();
							$.ajax({
								type:"POST",
								url:"comment/delete",
								data:{id:id},
								success:function(data){
									
								}
							});
						},
						cancel:function(){}
					}
				});
			});
			
		});
		
		function init_comments(contentId){
			$.ajax({
				type:"POST",
				url:"comment/list",
				data:{page:1,contentId:contentId},
				error: function(request) {
					//alert("服务器连接失败!");
				},
				success: function(data) {
					var vdata = eval("("+data+")");
					
					//后续处理
					var comments = vdata.comments;
					var html = show_comments(comments);
					$(".commit_list_div").html(html);
					
				}
			});
		}
		
		function show_comment(comment){
			if($(".no-comment")) $(".no-comment").remove();
			var html = "";
			var c = comment;
			var date = new Date(c.createTime);
			var time = date.Format("yyyy-MM-dd HH:mm:ss");
			html += "<div class='commit_item'>"
					+"<span class='commit_user'><img class='img-radius37' src='"+c.user.portrait+"' /></span>"
					+"<div class='commit_content'>"
						+"<div><a href='#'>"+c.user.username+"</a>："+c.content+"</div>"
						+"<div style='margin-top:2px;'><font color='gray'>"+time+"</font>  "
						+"<a data-id='"+c.id+"' href='javascript:void(0)' class='del'><b>删除评论</b></a></div>"
					+"</div>"
					+"<div class='clear'></div>"
					+"</div>";
			return html;
		}
		
		function show_comments(comments){
			var html = "";
			var user_id = '${user.id}';
			if(comments.length > 0){
				for(var i = 0;i < comments.length;i++){
					var c = comments[i];
					var del_a = "<a data-id='"+c.id+"' href='javascript:void(0)' class='del'><b>删除评论</b></a>";
					if(c.user.id != user_id){
						del_a = "";
					}
					var date = new Date(c.createTime);
					var time = date.Format("yyyy-MM-dd HH:mm:ss");
					var str = "<div class='commit_item'>"
					+"<span class='commit_user'><img class='img-radius37' src='"+c.user.portrait+"' /></span>"
					+"<div class='commit_content'>"
						+"<div><a href='#'>"+c.user.username+"</a>："+c.content+"</div>"
						+"<div style='margin-top:2px;'><font color='gray'>"+time+"</font>  "
						+ del_a
						+"</div>"
					+"</div>"
					+"<div class='clear'></div>"
					+"</div>";
					html+=str;
				}
			}else{
				html+="<div class='no-comment' align='center'>此帖当前暂无评论。</div>";
			}
			return html;
		}
		
	</script>