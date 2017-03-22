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
						<a href="#">我的留言</a>
						<a href="${contextPath}/my/calendar">我的日历</a>
						<a class="cur">我的消息</a>
					</div>
					<div class="cmenuright">
						<a href="${contextPath}/my/me">资料</a>
						<a href="#">统计</a>
						<a href="#">访客</a>
					</div>
					<div class="clear"></div>
				</div>	
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<c:forEach items="${logs}" var="l">
						<div class="gr_ge">
							<span>
								<img class="img-radius64" src="${contextPath}/${l.user.portrait}" />
							</span>
							<div class="gr_ge2" style="padding-top:13px;">
								<font size="+1">${l.title}</font>
								<br/>
								<b style="font-size:12px;"><a href="#calmsg_div" class="calexam_a" onclick="get_msg(${l.id})" rel="leanModal">${l.content}</a></b>
								<br />
								<strong><date:date value="${l.createTime}" /></strong>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
		<div id="calmsg_div" class="leanmodel_div">
			<form role="form" class="form" id="select_calmsg">
				<div style="padding:20px 5px;">
					<font size="+2"><b>消息查看</b></font>
					<span style="color:#999;"> >>详细信息 </span>
				</div>
				<div class="form-group">
					<span class="label">时间：</span>
					<label class="label" name="start"></label>
				</div>
				<div class="form-group">
					<span class="label">标题：</span>
					<label class="label" name="title"></label>
				</div>
				
				<div class="form-group">
					<span class="label">内容：</span>
					<label class="label" name="content"></label>
				</div>
				<div class="form-group" style="padding:10px 0 20px 0;">
				
				</div>
			</form>
		</div>
		
		<script type="text/javascript">
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
			     	  form.find("label[name='start']").html(start);
			     	  form.find("label[name='title']").html(l.title);
			     	  form.find("label[name='content']").html(l.content);
			     	  
			     	  $(".calexam_a").leanModal();
			      }
			    });
			}
			
		</script>
	</fms:Content>
</fms:ContentPage>