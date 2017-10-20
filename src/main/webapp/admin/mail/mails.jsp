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
				<!-- 
				<li>
					<a href="#">Other Pages</a>
				</li> -->
				<li class="active">邮件任务管理</li>
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
								<span>邮件任务列表</span>
								<a class="btn" style="float:right;margin-top: -12px;" href="${contextPath}/admin/mail/add" >
									<i class="icon-pencil align-top bigger-125"></i>邮件任务新增
								</a>
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
													<input type="checkbox" class="ace" onclick="checkAll(this)" />
													<span class="lbl"></span>
												</label>
											</th>
											<th>任务名称</th>
											<th>CRON表达式</th>
											<th>创建时间</th>
											<th>创建人</th>
											<th class="hidden-480">状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${mails}" var="m">
											<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" name="checks" />
														<span class="lbl"></span>
													</label>
												</td>
												<td>
													<a href="javascript:void(0)">${m.jobName}</a>
												</td>
												<td>
													${m.cron}
												</td>
												<td>
													<date:date value="${m.createTime}" />
												</td>
												<td>
													${m.user.username}
												</td>
												<td>
													<a href="javascript:void(0)" onclick="change_status(this,${m.id})" data-status="${m.status}">
														<c:if test="${m.status=='Y'}">
															<span class="label label-sm label-success">运行</span>
														</c:if>
														<c:if test="${m.status=='N'}">
															<span class="label label-sm label-warning">暂停</span>
														</c:if>
													</a>
												</td>
												<td>
													<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<a class="blue" href="javascript:void(0)">
															<i class="icon-zoom-in bigger-130"></i>
														</a>
														<a class="green" href="${contextPath}/admin/mail/upt?id=${m.id}">
															<i class="icon-pencil bigger-130"></i>
														</a>

														<a class="red" href="javascript:del_mail(${m.id})">
															<i class="icon-trash bigger-130"></i>
														</a>
													</div>
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
																	<a href="${contextPath}/admin/mail/upt?id=${m.id}" class="tooltip-success" data-rel="tooltip" title="Edit">
																		<span class="green">
																			<i class="icon-edit bigger-120"></i>
																		</span>
																	</a>
																</li>

																<li>
																	<a href="javascript:del_mail(${m.id})" class="tooltip-error" data-rel="tooltip" title="Delete">
																		<span class="red">
																			<i class="icon-trash bigger-120"></i>
																		</span>
																	</a>
																</li>
																
															</ul>
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
											<a href="${contextPath}/admin/mail/list?page=1">
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
												<a href="${contextPath}/admin/mail/list?page=${p}">${p}</a>
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
											<a href="${contextPath}/admin/mail/list?page=${pu.pageCount}">
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
			function del_mail(id){
				bootbox.confirm("确认删除?",function(result){
					if(result){
						$.ajax({
							url:'${contextPath}/admin/mail/delete.json',
							data:{id:id},
							dataType:"json",
							success:function(data){
								if(data.code==200){
									ace_msg.success(data.msg);
									window.location.reload();
								}else{
									ace_msg.danger(data.msg);
								}
							},
							error:function(data){
								//console.log(data)
							}
						});
					}
				});
			}
			
			function change_status(obj,id){
				var status = $(obj).attr("data-status");
				var success = "<span class='label label-sm label-warning'>暂停</span>";
				var warnning = "<span class='label label-sm label-success'>运行</span>";
				if(status == "N"){
					bootbox.confirm("确认开始任务?",function(result){
						if(result){
							$.ajax({
								url:'${contextPath}/admin/mail/start.json',
								data:{id:id},
								dataType:"json",
								success:function(data){
									if(data.code==200){
										ace_msg.success(data.msg);
										$(obj).html(warnning);
										$(obj).attr("data-status","Y");
									}else{
										ace_msg.danger(data.msg);
									}
								},
								error:function(data){
									//console.log(data)
								}
							});
						}
					});
				}else{
					bootbox.confirm("确认暂停任务?",function(result){
						if(result){
							$.ajax({
								url:'${contextPath}/admin/mail/pause.json',
								data:{id:id},
								dataType:"json",
								success:function(data){
									if(data.code==200){
										ace_msg.success(data.msg);
										$(obj).html(success);
										$(obj).attr("data-status","N");
									}else{
										ace_msg.danger(data.msg);
									}
								},
								error:function(data){
									//console.log(data)
								}
							});
						}
					});
				}
			}
		</script>
	</fms:Content>
</fms:ContentPage>