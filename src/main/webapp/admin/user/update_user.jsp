<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="master">
	<fms:Content contentPlaceHolderId="title">
		${adminTitle}
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="${contextPath}/admin/index">Home</a>
				</li>
				<li>
					<a href="${contextPath}/admin/user/list?page=1">用户管理</a>
				</li>
				<li class="active">用户修改</li>
			</ul><!-- .breadcrumb -->
			<div class="nav-search" id="nav-search">
				<form class="form-search">
					<span class="input-icon">
						<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!-- #nav-search -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="page-header">
						<h1>用户修改
						<small>
							<i class="icon-double-angle-right">
							请输入用户详细资料
							</i>
						</small>
						</h1>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<form action="${contextPath}/admin/user/update.json" role="form" class="form-horizontal" method="post" id="form_post" >
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择部门 </label>
									<div class="col-sm-9">
										<input type="hidden" name="id" value="${us.id}" />
										<select name="dept.id">
											<c:forEach items="${depts}" var="d">
												<c:if test="${us.dept.id == d.id}">
													<option value="${d.id}" selected="selected">${d.name}</option>
												</c:if>
												<c:if test="${us.dept.id != d.id}">
													<option value="${d.id}">${d.name}</option>
												</c:if>
												
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="space-4"></div>
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择分组 </label>
									<div class="col-sm-9">
										<select name="parentid" onchange="selectGroup(this)">
											<option value="">请选择</option>
											<c:forEach items="${parents}" var="p">
												<option value="${p.id}" <c:if test="${us.group.parent.id == p.id}">selected="selected"</c:if> >${p.name}</option>
											</c:forEach>
										</select>
										<select name="group.id" id="group-id">
											<option value="">请选择</option>
											<c:forEach items="${childs}" var="c">
												<option value="${c.id}" <c:if test="${us.group.id == c.id}">selected="selected"</c:if> >${c.name}</option>
											</c:forEach>
										</select>
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
										
								<script type="text/javascript">
									function selectGroup(obj){
										var list = [];
										var index = obj.selectedIndex;
										
										
										<c:forEach items="${parents}" var="p">
											var child = [];
											<c:forEach items="${p.childs}" var="c">
												child.push({"id":"${c.id}","name":"${c.name}"});
											</c:forEach>
											list.push(child);
										</c:forEach>
										var text = "<option value=''>请选择</option>";
										//遍历list
										if(index > 0){
											for(var i = 0;i<list[index-1].length;i++){
												var child = list[index-1][i];
												text += "<option value='"+child.id+"' >"+child.name+"</option>";
											}
										}
										text += "";
										
										
										
										$("#group-id").empty();
										$("#group-id").html(text);
										
									}
								</script>
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入用户账号 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="用户账号" class="col-xs-10 col-sm-5" name="loginName" value="${us.loginName}" />
									</div>
								</div>
								<div class="space-4"></div>
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入用户姓名 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="用户姓名 " class="col-xs-10 col-sm-5" name="username" value="${us.username}" />
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入联系电话 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="联系电话" class="col-xs-10 col-sm-5" name="mobile" value="${us.mobile}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入用户职位 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="用户职位 " class="col-xs-10 col-sm-5" name="post" value="${us.post}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择职位级别</label>
									<div class="col-sm-9">
										<select onchange="select_level(this.value)">
											<option value="">请选择</option>
											<c:forEach items="${plevels}" var="p">
												<c:if test="${us.level.level.id==p.id}">
													<option value="${p.id}" selected="selected">${p.name}</option>
												</c:if>
												<c:if test="${us.level.level.id!=p.id}">
													<option value="${p.id}">${p.name}</option>
												</c:if>
											</c:forEach>
										</select>
										<select name="level.id">
											<option value="">请选择</option>
											<c:forEach items="${lchilds}" var="l">
												<c:if test="${us.level.id==l.id}">
													<option value="${l.id}" selected="selected">${l.name}</option>
												</c:if>
												<c:if test="${us.level.id!=l.id}">
													<option value="${l.id}" >${l.name}</option>
												</c:if>
												
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="button" onclick="form_submit('form_post')">
											<i class="icon-ok bigger-110"></i>
											提交
										</button>
										&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset" onclick="go_back()">
											<i class="icon-undo bigger-110"></i>
											返回
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
		<script type="text/javascript">
			function form_submit(id){
				bootbox.confirm("确认修改?",function(result){
					if(result){
						var form = $("#"+id);
						$.ajax({
							url:form.attr('action'),
							type:"POST",
							data:form.serialize(),
							dataType:'json',
							success:function(data){
								if(data.code == 200){
									ace_msg.success(data.msg);
									go_back();
								}else{
									ace_msg.danger(data.msg);
								}
							},
							error:function(data){
								//console.log(data);
							}
						});
					}
				});
			}
			function select_level(val){
				$.ajax({
					url:"${contextPath}/admin/level/childs",
					data:{id:val},
					success:function(data){
						var vdata = eval("("+data+")");
						var html = "<option value=''>请选择</option>";
						var childs = vdata.childs;
						for(var i = 0;i<childs.length;i++){
							html += "<option value='"+childs[i].id+"'>"+childs[i].name+"</option>";
						}
						$("#form_post select[name='level.id']").html(html);	
					}
				});
			}
		</script>
		
	</fms:Content>
</fms:ContentPage>
    						