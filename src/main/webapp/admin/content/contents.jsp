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
				try{ace.settings.check('breadcrumbs','fixed');}catch(e){}
			</script>
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="${contextPath}/admin/index">Home</a>
				</li>
				<!-- 
				<li>
					<a href="#">Other Pages</a>
				</li> -->
				<li class="active">帖子管理</li>
			</ul><!-- .breadcrumb -->
			
			<div class="nav-search" id="nav-search">
				<form  action="" method="post" onsubmit="return false;" class="form-search">
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
								<span>帖子列表</span>
							</h3>
							
							<div >
								<form action="${contextPath}/admin/content/list" method="post" class="form-horizontal" id="form_post">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"  for="form-field-select-3"> 请输入姓名 </label>
										<div class="col-sm-9">
											<input type="text"  placeholder="用户姓名" class="col-xs-10 col-sm-5" name="username" id="dataInput" value="${username}" />
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"  for="form-field-select-3"> 请选择时间段</label>
										<div class="col-sm-9">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="icon-calendar bigger-110"></i>
												</span>
												<input style="width:180px;" class="form-control" type="text" readonly="readonly" name="dateRangePicker" id="id-date-range-picker-1" value="${dateRangePicker}" />
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"  for="form-field-select-3">
										</label>
										
										<div class="col-sm-9">
											<span class="input-group-btn" >
												<button type="button" class="btn btn-purple btn-sm" onclick="form_submit('form_post',1)">
												数据查询
												<i class="icon-search icon-on-right bigger-110"></i>
												</button>
											</span>
										</div>
										
									</div>
									
								</form>
							</div>
							
							<div class="table-header">
								共有${pu.count}条数据
							</div>
							<div class="table-responsive">
								<table id="sample-table-2" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center">
												<label>
													<input type="checkbox" class="ace" onclick="checkAll(this)" />
													<span class="lbl"></span>
												</label>
											</th>
											<th>项目</th>
											<th>主题</th>
											<th>创建人</th>
											<th>创建时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${contents}" var="c">
										<tr>
											<td class="center">
												<input type="checkbox" class="ace" name="checks" />
												<span class="lbl"></span>
											</td>
											<td>
												<c:if test="${c.project==null}">
													无主题
												</c:if>
												<c:if test="${c.project!=null}">
													${c.project.name}
												</c:if>
											</td>
											<td>
												${c.theme.name}
											</td>
											<td>
												${c.user.username}
											</td>
											<td><date:date value="${c.createTime}" /></td>
											<td class="hidden-480">
												<span class="label label-sm label-success">已创建</span>
											</td>
											<td>
												<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue" href="javascript:void(0)">
														<i class="icon-zoom-in bigger-130"></i>
													</a>
													
													<a class="green" href="javascript:void(0)">
														<i class="icon-pencil bigger-130"></i>
													</a>
	
													<a class="red" href="javascript:void(0)">
														<i class="icon-trash bigger-130"></i>
													</a>
												</div>
												
												<div class="visible-xs visible-sm hidden-md hidden-lg">
													<div class="visible-xs visible-sm hidden-md hidden-lg">
														<div class="inline position-relative">
															<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																<i class="icon-caret-down icon-only bigger-120"></i>
															</button>
															
															<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																<li>
																	<a href="javascript:void(0)" class="tooltip-info" data-rel="tooltip" title="View">
																		<span class="blue">
																			<i class="icon-zoom-in bigger-120"></i>
																		</span>
																	</a>
																</li>
	
																<li>
																	<a href="javascript:void(0)" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>
	
																<li>
																	<a href="javascript:void(0)" class="tooltip-error" data-rel="tooltip" title="Delete">
																		<span class="red">
																			<i class="icon-trash bigger-120"></i>
																		</span>
																	</a>
																</li>
															</ul>
															
														</div>
													</div>
												</div>
										
											</td>
										</tr>
										</c:forEach>
									</tbody>
									
								</table>
							</div>
							<div class="modal-footer no-margin-top">
								<ul class="pagination pull-right no-margin" id="page">
									<!-- 分页组装 -->
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
											<a href="javascript:form_submit('form_post',1)">
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
												<a href="javascript:form_submit('form_post',${p})">${p}</a>
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
											<a href="javascript:form_submit('form_post',${pu.pageCount}">
												<i class="icon-double-angle-right"></i>
											</a>
										</li>
									</c:if>
								</ul>
							</div>
							
					 	</div>
					 </div>
					
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			function form_submit(id,page){
				var form = $("#"+id);
				var action = form.attr("action")+"?page="+page;
				form.attr("action",action);
				form.submit();
			}
			
			$(document).ready(function(){
				$('input[name=dateRangePicker]').daterangepicker().prev().on(ace.click_event, function(){
					$(this).next().focus();
				});
				
			});
			
		</script>
		
	</fms:Content>
</fms:ContentPage>



