<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
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
				<div class="cmenu" style="min-width:850px;">
					<div class="cmenuleft">
						<a href="calen">日历</a>
						<a class="cur">事件审核</a>
					</div>
					<div class="cmenuright"></div>
					<div class="clear"></div>
				</div>	
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<c:forEach items="${calendars}" var="c">
						<div class="gr_ge">
							<span>
								<img class="img-radius64" src="${c.createUser.portrait}" />
							</span>
							<div class="gr_ge2">
								<b><a href="#calexam_div" class="calexam_a" onclick="get_calexam(${c.id})" rel="leanModal">${c.title}</a></b>
								<br/><br/>
								创建人:
								<strong>${c.createUser.username}</strong>
								起止时间:
								<strong><date:date value="${c.startTime}" />-<date:date value="${c.endTime}" /></strong>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
		<div id="calexam_div" class="leanmodel_div">
			<form action="calexam/update" role="form" class="form" id="update_calexam">
				<div style="padding:20px 5px;">
					<font size="+2"><b>日程审核</b></font>
					<span style="color:#999;"> >>日程详细信息 </span>
				</div>
				<div class="form-group">
					<span class="label">创建人：</span>
					<input type="hidden" id="calendarid" value="" />
					<label class="label" id="username"></label>
				</div>
				<div class="form-group">
					<span class="label">起止时间：</span>
					<label class="label" id="startend"></label>
				</div>
				<div class="form-group">
					<span class="label">标题：</span>
					<label class="label" id="title"></label>
				</div>
				<div class="form-group">
					<span class="label">内容：</span>
					<label class="label" id="body"></label>
				</div>
				<div class="form-group" style="padding:10px 0 20px 0;">
					<a href="javascript:update_calexam('Y')" class="button button-primary button-rounded button-small">通过</a>
					<a href="javascript:update_calexam('N')" class="button button-primary button-rounded button-small">不通过</a>
				</div>
			</form>
		</div>
		
		
		
		
		
		
		<script type="text/javascript">
			function get_calexam(id){
				$.ajax({
			      url: "calexam/get",
			      data: {id:id}, // Page parameter to make sure we load new data
			      success: function(data){
			    	  var vdata = eval("("+data+")");
			     	  var c = vdata.calendar;
			     	  var start = new Date(c.startTime).Format("yyyy-MM-dd HH:mm:ss");
			     	  var end = new Date(c.endTime).Format("yyyy-MM-dd HH:mm:ss");
			     	  $("#calendarid").val(c.id);
			     	  $("#username").html(c.createUser.username);
			     	  $("#startend").html(start+" - "+end);
			     	  $("#title").html(c.title);
			     	  $("#body").html(c.content);
			     	  $(".calexam_a").leanModal();
			      }
			    });
			}
			
			function update_calexam(status){
				var id = $("#calendarid").val();
				$.ajax({
					url:"calexam/update",
					data:{id:id,status:status},
					success:function(data){
						var vdata = eval("("+data+")");
						$.alert({title:'提示信息',content:vdata.message,type:'blue'});
						window.location.reload();
					}
				});
			}
			
		</script>
	</fms:Content>
</fms:ContentPage>