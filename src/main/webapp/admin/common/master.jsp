<!-- 后端模版 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/master-tag" prefix="fms" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><fms:ContentPlaceHolder id="title" /></title>
	<meta name="renderer" content="webkit">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- basic styles -->
	<link href="${contextPath}/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/font-awesome.min.css" />
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
	<![endif]-->
	
	<!-- page specific plugin styles -->
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/jquery-ui-1.10.3.custom.min.css" />
		
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/jquery.gritter.css" />
		
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/chosen.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/datepicker.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/daterangepicker.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/colorpicker.css" /> 
	
	<!-- fonts -->
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/ace-fonts.css" />
	
	<!-- ace styles -->
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/ace.min.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="${contextPath}/admin/assets/css/ace-skins.min.css" />
	
	<!--[if lte IE 8]>
		<link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->
	
	<!-- inline styles related to this page -->
	<!-- ace settings handler -->
	<script src="${contextPath}/admin/assets/js/ace-extra.min.js"></script>
	
	<!-- zhangshenwu js -->
	<link rel="stylesheet" href="${contextPath}/admin/js/ajaxfileupload.css" />
	<link rel="stylesheet" href="${contextPath}/admin/common/dynamic/css/stat.css" />
		
	<link rel="stylesheet" href="${contextPath}/admin/js/jquery.Jcrop.css" />
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

	<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	<!-- <link rel="stylesheet" href="../admin/css/index.css" /> -->
	
	<!-- basic scripts -->
	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='${contextPath}/admin/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
	</script>
	<!-- <![endif]-->

	<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
		</script>
	<![endif]-->
	
	<script type="text/javascript">
		if("ontouchend" in document) document.write("<script src='${contextPath}/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	
	<!-- tree -->
	<script src="${contextPath}/admin/assets/js/fuelux/fuelux.tree.min.js"></script>
	
	<script src="${contextPath}/admin/js/acemsg.js"></script>
	
</head>
<body>
	<div class="navbar navbar-default" id="navbar">
		<!-- 头部组成 -->
		<jsp:include page="/admin/common/dynamic/initTop.jsp" />
	</div>
	<div class="main-container" id="main-container">
		<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success"  >
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<a class="btn btn-danger">
							<i class="icon-cogs"></i>
						</a>
					</div>
					
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>
						<span class="btn btn-info"></span>
						<span class="btn btn-warning"></span>
						<span class="btn btn-danger"></span>
					</div>
				</div><!-- #sidebar-shortcuts -->
				<!-- 我来组成菜单 -->
				<ul class="nav nav-list" id="nav_nav-list">
					<jsp:include page="/admin/common/dynamic/menu.jsp" />
				</ul><!-- /.nav-list -->
					
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
				</div>
					
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
					
			</div>
				
			<div class="main-content" id="main-content">
				<!-- 我来组成身体 -->
				<fms:ContentPlaceHolder id="main" />
			</div><!-- /.main-content -->
				
			<div class="ace-settings-container" id="ace-settings-container" >
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>
				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; Choose Skin</span>
					</div>
						
					<div>
						<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
						<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
					</div>
						
					<div>
						<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
						<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
					</div>
						
					<div>
						<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
						<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
					</div>
						
					<div>
						<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
						<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
					</div>
						
					<div>
						<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
						<label class="lbl" for="ace-settings-add-container">
							Inside
							<b>.container</b>
						</label>
					</div>
				</div>
			</div><!-- /#ace-settings-container -->
		</div><!-- /.main-container-inner -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div><!-- /.main-container -->
	

	
	<script type="text/javascript" src="${contextPath}/admin/js/ajaxfileupload.js" ></script> 
	<script type="text/javascript" src="${contextPath}/admin/js/jquery.Jcrop.js" ></script> 
		
	<!-- comet4j服务器消息推送 -->
	<script type="text/javascript" src="${contextPath}/admin/js/comet4j.js"></script> 	
	
	<!-- 消息统计框架 -->
	<script src="${contextPath}/admin/js/ichart.1.2.min.js"></script> 
	<!-- 
	<script src="${contextPath}/admin/js/echarts.min.js"></script>	
	 -->
	<script src="${contextPath}/admin/assets/js/bootstrap.min.js"></script>
	<script src="${contextPath}/admin/assets/js/typeahead-bs2.min.js"></script>	
	
	<!-- page specific plugin scripts -->
	<script src="${contextPath}/admin/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.ui.touch-punch.min.js"></script>
	
	<script src="${contextPath}/admin/assets/js/chosen.jquery.min.js"></script>
	<script src="${contextPath}/admin/assets/js/fuelux/fuelux.spinner.min.js"></script>
	<script src="${contextPath}/admin/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/admin/assets/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="${contextPath}/admin/assets/js/date-time/moment.min.js"></script>
	<script src="${contextPath}/admin/assets/js/date-time/daterangepicker.min.js"></script>
	<script src="${contextPath}/admin/assets/js/bootstrap-colorpicker.min.js"></script> 
	<script src="${contextPath}/admin/assets/js/jquery.knob.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.autosize.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.maskedinput.min.js"></script>
	<script src="${contextPath}/admin/assets/js/bootstrap-tag.min.js"></script>
	
	<script src="${contextPath}/admin/assets/js/markdown/markdown.min.js"></script>
	<script src="${contextPath}/admin/assets/js/markdown/bootstrap-markdown.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.hotkeys.min.js"></script>
	<script src="${contextPath}/admin/assets/js/bootstrap-wysiwyg.min.js"></script>
	<script src="${contextPath}/admin/assets/js/bootbox.min.js"></script>
	
	<script src="${contextPath}/admin/assets/js/jquery.easy-pie-chart.min.js"></script>
	<script src="${contextPath}/admin/assets/js/jquery.gritter.min.js"></script>
	<script src="${contextPath}/admin/assets/js/spin.min.js"></script>
	
	<!-- ace scripts -->
	<script src="${contextPath}/admin/assets/js/ace-elements.min.js"></script>
	<script src="${contextPath}/admin/assets/js/ace.min.js"></script>
	
	<script type="text/javascript">
		function go_url(url){
			window.location.href=url;
		}
		function go_back(){
			self.location=document.referrer;
		}
	
		$(document).ready(function(){
			$('[data-toggle="buttons"] .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				var toolbar = $('#editor1').prev().get(0);
				if(which == 1 || which == 2 || which == 3) {
					toolbar.className = toolbar.className.replace(/wysiwyg\-style(1|2)/g , '');
					if(which == 1) $(toolbar).addClass('wysiwyg-style1');
					else if(which == 2) $(toolbar).addClass('wysiwyg-style2');
				}
			});
			
			//Add Image Resize Functionality to Chrome and Safari
			//webkit browsers don't have image resize functionality when content is editable
			//so let's add something using jQuery UI resizable
			//another option would be opening a dialog for user to enter dimensions.
			if ( typeof jQuery.ui !== 'undefined' && /applewebkit/.test(navigator.userAgent.toLowerCase()) ) {
				
				var lastResizableImg = null;
				function destroyResizable() {
					if(lastResizableImg == null) return;
					lastResizableImg.resizable( "destroy" );
					lastResizableImg.removeData('resizable');
					lastResizableImg = null;
				}
		
				var enableImageResize = function() {
					$('.wysiwyg-editor')
					.on('mousedown', function(e) {
						var target = $(e.target);
						if( e.target instanceof HTMLImageElement ) {
							if( !target.data('resizable') ) {
								target.resizable({
									aspectRatio: e.target.width / e.target.height,
								});
								target.data('resizable', true);
								
								if( lastResizableImg != null ) {//disable previous resizable image
									lastResizableImg.resizable( "destroy" );
									lastResizableImg.removeData('resizable');
								}
								lastResizableImg = target;
							}
						}
					})
					.on('click', function(e) {
						if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {
							destroyResizable();
						}
					})
					.on('keydown', function() {
						destroyResizable();
					});
			    }
				enableImageResize();
				/**
				//or we can load the jQuery UI dynamically only if needed
				if (typeof jQuery.ui !== 'undefined') enableImageResize();
				else {//load jQuery UI if not loaded
					$.getScript($path_assets+"/js/jquery-ui-1.10.3.custom.min.js", function(data, textStatus, jqxhr) {
						if('ontouchend' in document) {//also load touch-punch for touch devices
							$.getScript($path_assets+"/js/jquery.ui.touch-punch.min.js", function(data, textStatus, jqxhr) {
								enableImageResize();
							});
						} else	enableImageResize();
					});
				}
				*/
			}
			
		});
	</script>
	<!-- inline scripts related to this page -->
</body>
</html>