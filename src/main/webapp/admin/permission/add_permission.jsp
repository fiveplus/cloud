<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="master">
	<fms:Content contentPlaceHolderId="title">
		Cloud Admin
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
					<a href="../index">Home</a>
				</li>
				<li>
					<a href="../permission/list?page=1">权限管理</a>
				</li>
				<li class="active">权限新增</li>
			</ul><!-- .breadcrumb -->
			
			<div class="nav-search" id="nav-search">
				<form action="" method="post" onsubmit="return false;" class="form-search">
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
						<h1>权限新增
						<small>
							<i class="icon-double-angle-right">
							请输入权限详细资料 (*为必填项)
							</i>
						</small>
						</h1>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<form action="../permission/add" role="form" class="form-horizontal" method="post" id="form_post" >
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择父权限ID </label>
									<div class="col-sm-9">
										<select name="parentId">
											<option value="admin">请选择</option>
											<c:forEach items="${parents}" var="p">
												<c:if test="${permission.parentId == p.id}">
													<option value="${p.id}" selected="selected">${p.name}</option>
												</c:if>
												<c:if test="${permission.parentId != p.id}">
													<option value="${p.id}">${p.name}</option>
												</c:if>
												
											</c:forEach>
										</select>
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入权限ID </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="权限ID" class="col-xs-10 col-sm-5" name="id" value="${permission.id}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
										
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入权限名称 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="权限名称" class="col-xs-10 col-sm-5" name="name" value="${permission.name}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入ClassName</label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="ClassName" class="col-xs-10 col-sm-5" name="className" value="${permission.className}" />
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入权限坐标</label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="权限坐标" class="col-xs-10 col-sm-5" name="menuIndex" value="${permission.menuIndex}" />
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入URL</label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="URL" class="col-xs-10 col-sm-5" name="url" value="${permission.url}" />
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 是否为菜单</label>
									<div class="col-sm-9">
										<select name="isMenu">
											<c:if test="${permission.isMenu == 'Y'}">
												<option value="Y" selected="selected">是</option>
												<option value="N" >否</option>
											</c:if>
											<c:if test="${permission.isMenu != 'Y'}">
												<option value="Y" >是</option>
												<option value="N" selected="selected">否</option>
											</c:if>
										</select>
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
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
				var form = $("#"+id);
				
				form.submit();
			}
			
		</script>
		
	</fms:Content>
</fms:ContentPage>
    