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
						<a href="${contextPath}/project/get?id=${project.id}">项目记录</a>
						<a href="${contextPath}/progress/get?id=${project.id}" >项目进度</a>
						<a href="${contextPath}/projectuser/get?id=${project.id}" >项目成员</a> 
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
					<div class="fenge"></div>
					<div style="padding:0 0 5px 10px;">
						<h4> 项目设置 <small> >>修改项目配置 </small> </h4>
					</div>
					<form action="${contextPath}/project/update.json" role="form" class="form" id="update_project"  >
						<table class="table table-hover" cellpadding="10" border="1" bordercolor="#ddd">
							<tr>
								<td>
									项目名称：
									<input type="hidden" name="id" value="${project.id }" />
									<input type="text" name="name" value="${project.name}" class="input-text" placeholder="项目名称"  />
								</td>
							</tr>
							<tr>
								<td>
									允许加入：
									<input type="checkbox" class="switch" checked />
								</td>
							</tr>
							<tr>
								<td>
									是否验证：
									<input type="checkbox" class="switch" checked />
								</td>
							</tr>
							<tr>
								<td>
									<button class="btn btn-danger" onclick="del_project(${project.id})">删除</button>
									<button onclick="update_project('update_project')" class="btn btn-primary">保存设置</button>
								</td>
							</tr>
						</table>
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
					type:"POST",
					url:action,
					data:alldata,
					error:function(request){
						//alert("数据请求错误!");
					},
					success:function(data){
						//var vdata = eval("("+data+")");
						var vdata = data;
						$.alert({title:'提示信息',content:vdata.message});
					}
				});
			}
			
			function del_project(id){
				
				$.confirm({
					title:'提示信息',
					content:'确认删除吗？删除后无法恢复！！！',
					buttons:{
						confirm:function(){
							$.ajax({
								type:"POST",
								url:"${contextPath}/project/delete.json",
								data:{id:id},
								success:function(data){
									var vdata = data;
									//跳转到首页
									window.location.href="${contextPath}/index";
								}
							});
						},
						cancel:function(){
							//取消
						}
					}
				});
				
			}
			
		</script>
	</fms:Content>
</fms:ContentPage>