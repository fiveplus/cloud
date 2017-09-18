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
					<a href="${contextPath}/admin/index">Home</a>
				</li>
				<li>
					<a href="${contextPath}/admin/mail/list?page=1">邮件任务管理</a>
				</li>
				<li class="active">邮件任务修改</li>
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
						<h1>邮件任务新增</h1>
						<small>
							<i class="icon-double-angle-right">
							请输入邮件任务详细资料
							</i>
						</small>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<form action="${contextPath}/admin/mail/update.json" role="form" class="form-horizontal" method="post" id="form_post">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入任务名称 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="任务名称" class="col-xs-10 col-sm-5" name="jobName" value="${mail.jobName}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入CRON表达式 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="CRON表达式" class="col-xs-10 col-sm-5" name="cron" value="${mail.cron}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入邮件标题 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="邮件标题" class="col-xs-10 col-sm-5" name="title" value="${mail.title}" />
										<font style="color:red; height:25px;line-height:25px;overflow:hidden;"><b>&nbsp;*</b></font>
									</div>
								</div>
								
								<div class="form-group">
									<h4 class="header green clearfix">
										请输入邮件内容
										<span class="black pull-right">
											<small class="grey middle">Choose style: &nbsp;</small>
											<span class="btn-toolbar inline middle no-margin">
												<span data-toggle="buttons" class="btn-group no-margin">
													<label class="btn btn-sm btn-yellow">
														1
														<input type="radio" value="1" />
													</label>
	
													<label class="btn btn-sm btn-yellow active">
														2
														<input type="radio" value="2" />
													</label>
	
													<label class="btn btn-sm btn-yellow">
														3
														<input type="radio" value="3" />
													</label>
												</span>
											</span>
										</span>
									</h4>
									<div class="wysiwyg-editor" id="editor1">${mail.content}</div>
									<input type="hidden" name="content" value="${mail.content}" />
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
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function form_submit(id){
				bootbox.confirm("确认新增?",function(result){
					if(result){
						var form = $("#"+id);
						var html = $("#editor1").html();
						$("#"+id+" [name='content']").val(html);
						
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
			
			$(document).ready(function(){
				function showErrorAlert (reason, detail) {
					var msg='';
					if (reason==='unsupported-file-type') { 
						msg = "Unsupported format " +detail; 
					}else {
						console.log("error uploading file", reason, detail);
					}
					$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
						 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
				}
				
				$('#editor1').ace_wysiwyg({
					toolbar:
					[
						'font',
						null,
						'fontSize',
						null,
						{name:'bold', className:'btn-info'},
						{name:'italic', className:'btn-info'},
						{name:'strikethrough', className:'btn-info'},
						{name:'underline', className:'btn-info'},
						null,
						{name:'insertunorderedlist', className:'btn-success'},
						{name:'insertorderedlist', className:'btn-success'},
						{name:'outdent', className:'btn-purple'},
						{name:'indent', className:'btn-purple'},
						null,
						{name:'justifyleft', className:'btn-primary'},
						{name:'justifycenter', className:'btn-primary'},
						{name:'justifyright', className:'btn-primary'},
						{name:'justifyfull', className:'btn-inverse'},
						null,
						{name:'createLink', className:'btn-pink'},
						{name:'unlink', className:'btn-pink'},
						null,
						{name:'insertImage', className:'btn-success'},
						null,
						'foreColor',
						null,
						{name:'undo', className:'btn-grey'},
						{name:'redo', className:'btn-grey'}
					],
					'wysiwyg': {
						fileUploadError: showErrorAlert
					}
				}).prev().addClass('wysiwyg-style2');
				
			});
			
		</script>
	</fms:Content>
</fms:ContentPage>