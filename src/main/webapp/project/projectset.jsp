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
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" style="min-width: 850px;">
					<div class="cmenuleft">
						<a href="project?id=${project.id}">项目记录</a>
						<a href="progress?id=${project.id}" >项目进度</a>
						<a href="projectuser?id=${project.id}" >项目成员</a> 
						<a class="cur">项目设置</a>
					</div>
					<div class="cmenuright">
						<a href="#" class="cmra1">&nbsp;</a>
						<a href="#" class="cmra2">&nbsp;</a> 
						<a href="#">统计</a>
						<a href="#">附件</a>
						<a href="#">图片</a>
						<a href="#" class="cur">记录</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<form action="project/update" role="form" class="form" id="update_project"  >
						<div class="fenge"></div>
						<div class="fenge"></div>
						<div class="form-group">
							<span class="label">项目名称：</span>
							<input type="hidden" name="id" value="${project.id }" />
							<input type="text" name="name" value="${project.name}" class="input-text" placeholder="项目名称"  />
						</div>
						<div class="form-group">
							<span class="label" >允许加入：</span>
							<input type="checkbox" class="switch" checked />
							
						</div>
						
						<div class="form-group">
							<span class="label" >是否验证：</span>
							<input type="checkbox" class="switch" checked />
						</div>
						
						<div class="form-group" style="padding:10px 0 0 0;">
							<span class="label" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<a href="javascript:update_project('update_project')" class="button button-primary button-rounded button-small">保存</a>
						</div>
					</form>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			$('#update_project .switch').bootstrapSwitch();
			
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
		</script>
	</fms:Content>
</fms:ContentPage>