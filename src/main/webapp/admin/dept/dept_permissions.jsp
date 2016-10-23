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
					<a href="../dept/list?page=1">部门管理</a>
				</li> 
				<li class="active">部门授权</li>
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
					<div class="row">
						<div class="col-xs-12">
							<h3 class="header smaller lighter blue">
								<span>[${department.name}]权限列表</span><button class="btn" style="float:right;margin-top: -12px;" onclick="go_back()" ><i class="icon-pencil align-top bigger-125"></i>Back</button>
								</h3>
								<div class="table-header">
									共有${pu.count}条数据
								</div>
								<div class="table-responsive">
									<table id="sample-table-2" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</th>
												<th>名称</th>
												<th>Index</th>
												<th class="hidden-480">URL</th>
												<th>
													<i class="icon-time bigger-110 hidden-480"></i>
													创建时间
												</th>
												<th class="hidden-480">状态</th>
												<!-- <th>操作</th> -->
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${permissions}" var="p" >
												<tr>
													<td class="center">
														<label>
															<c:if test="${p.flag == 0}">
																<input type="checkbox" checked="checked" class="ace" onclick="deptCheck(this,'${p.id}','${department.id}')" />
															</c:if>
															<c:if test="${p.flag != 0}">
																<input type="checkbox" class="ace" onclick="deptCheck(this,'${p.id}','${department.id}')" />
															</c:if>															
															<span class="lbl"></span>
														</label>
													</td>

													<td>
														<a href="javascript:void(0)">${p.name}</a>
													</td>
													<td>${p.menuIndex}</td>
													<td class="hidden-480">${p.url}</td>
													<td><date:date value="${p.createTime}" /></td>
													<td class="hidden-480">
														<span class="label label-sm label-success">已创建</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								
								<div class="modal-footer no-margin-top">
									<ul class="pagination pull-right no-margin" id="page">
										<!-- 分页 -->
										<c:if test="${pu.page==1}">
											<li class="prev disabled">
												<a href="javascript:void(0)">
													<i class="icon-double-angle-left"></i>
												</a>
											</li>
										</c:if>
										<c:if test="${pu.page!=1}">
											<li class="prev">
												<a href="../deptPermission/list?page=1&id=${department.id}">
													<i class="icon-double-angle-left"></i>
												</a>
											</li>
										</c:if>
										<c:forEach items="${pu.pageList}" var="p">
											<c:if test="${p==pu.page}">
												<li class="active">
													<a href="javascript:void(0)">${p}</a>
												</li>
											</c:if>
											<c:if test="${p!=pu.page}">
												<li>
													<a href="../deptPermission/list?page=${p}&id=${department.id}">${p}</a>
												</li>
											</c:if>
										</c:forEach>
										<c:if test="${pu.page==pu.pageCount}">
											<li class="next disabled">
												<a href="javascript:void(0)">
													<i class="icon-double-angle-right"></i>
												</a>
											</li>
										</c:if>
										<c:if test="${pu.page!=pu.pageCount}">
											<li class="next">
												<a href="../deptPermission/list?page=${pu.pageCount}&id=${department.id}">
													<i class="icon-double-angle-right"></i>
												</a>
											</li>
										</c:if>
									
									</ul>
								</div>
								
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
		<script type="text/javascript">
			//ajax请求
			function ajaxJSON(url){
				var action = url;
				$.ajax({
					type:"POST",
					url:action,
					error:function(request){
						alert("Connection Error");
					},
					success:function(data){
					}
				});
			}
		
			//删除或增加权限
			function deptCheck(obj,id,deptId){
				var url = "";
				if(obj.checked){
					url = "../deptPermission/add?permissionId="+id+"&deptId="+deptId+"";
				}else{
					url = "../deptPermission/delete?permissionId="+id+"&deptId="+deptId+"";
				}
				ajaxJSON(url);
			}
		</script>
	</fms:Content>
</fms:ContentPage>
