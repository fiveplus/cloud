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
				<li class="active">部门修改</li>
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
						<h1>部门修改
						<small>
							<i class="icon-double-angle-right">
							请输入部门详细资料
							</i>
						</small>
						</h1>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<form action="../dept/update" role="form" class="form-horizontal" method="post" id="form_post" >
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">请输入部门名称 </label>
									<div class="col-sm-9">
										<input type="hidden" name="id" value="${dept.id}" />
										<input type="text" id="form-field-1" placeholder="部门名称" class="col-xs-10 col-sm-5" name="name" value="${dept.name}" />
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">请输入部门座机 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="部门座机" class="col-xs-10 col-sm-5" name="phone" value="${dept.phone}" />
									</div>
								</div>
								<div class="space-4"></div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">请输入部门传真 </label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="部门传真" class="col-xs-10 col-sm-5" name="fax" value="${dept.fax}" />
									</div>
								</div>
								<div class="space-4"></div>
											
								<div class="form-group" >
									<h4 class="header green clearfix" >
										请输入部门介绍
										<span class="block pull-right">
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
									<div class="wysiwyg-editor" id="editor1" >${dept.info}</div>
									<input type="hidden" name="info" value="${dept.info}" />
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
			
			var html = $("#editor1").html();
			$("#"+id+" [name='info']").val(html);
			
			form.submit();
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