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
				<li class="active">
					<i class="icon-home home-icon"></i>
					Home
					<a href="../index">Home</a>
				</li>
				<li>
					<a href="../user/updateUserInit?id=${us.id}">用户资料修改</a>
				</li>
				<li class="active">用户头像</li> 
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
						<h1>修改头像
							<small><i class="icon-double-angle-right">请上传头像</i></small>
						</h1>
						<button class="btn" style="float:right;margin-top: -30px;" onclick="go_back()" ><i class="icon-pencil align-top bigger-125"></i>Back</button>
					</div>
					<div>
						<div style="float:left;">
							<div style="background: #F2F2F2;color:#9B9B9B;padding:30px;">
								<c:if test="${us.portrait == ''}">
									<div style="padding-bottom:10px;">
										<img src="${contextPath}/admin/assets/avatars/user.jpg" width="100" height="100" alt="${us.username}">
										<div style="margin-top: 2px;" align="center"><small>大头像 头像预览</small></div>
									</div>
									<div >
										<div style="float:left;">
											<img src="${contextPath}/admin/assets/avatars/user.jpg" width="50" height="50"  alt="${us.username}">
											<div style="margin-top: 2px;" align="center"><small>中头像</small></div>
										</div>
										<div style="float:left;margin-left: 10px;">
											<img src="${contextPath}/admin/assets/avatars/user.jpg" width="30" height="30" alt="${us.username}">
											<div style="margin-top: 2px;" align="center"><small>小头像</small></div>
										</div>
										<div style="clear:both;"></div>
									</div>
								</c:if>
								<c:if test="${us.portrait != ''}">
									<div style="padding-bottom:10px;">
										<img src="${contextPath}/${us.portrait}" width="100" height="100" alt="${us.username}">
										<div style="margin-top: 2px;" align="center"><small>大头像 头像预览</small></div>
									</div>
									<div >
										<div style="float:left;">
											<img src="${contextPath}/${us.portrait}" width="50" height="50"  alt="${us.username}">
											<div style="margin-top: 2px;" align="center"><small>中头像</small></div>
										</div>
										<div style="float:left;margin-left: 10px;">
											<img src="${contextPath}/${us.portrait}" width="30" height="30" alt="${us.username}">
											<div style="margin-top: 2px;" align="center"><small>小头像</small></div>
										</div>
										<div style="clear:both;"></div>
									</div>
								</c:if>
							</div>
						</div>
						<div style="float:left;margin-left: 20px;">
							<div style="padding-top: 10px;">
								<form role="form" class="form-horizontal" method="post" >
									<input type="hidden" name="x" id="x" value="" />
									<input type="hidden" name="y" id="y" value="" />
									<input type="hidden" name="width" id="width" value="" />
									<input type="hidden" name="height" id="height" value="" />
									<input type="file" name="file" id="file" accept="image/png,image/jpg,image/jpeg" onchange="changeToop()"  style="display:none;"  />
									<img src="" id="target"  />
									<br/><br/>
									<button class="btn btn-info" type="button" onclick="Id('file').click()">
										<i class="icon-ok bigger-110"></i>
										选择图片
									</button>
									<button class="btn btn-info" type="button" id="upload" style="display: none;" onclick="headUpload()">
										<i class="icon-ok bigger-110"></i>
										上传
									</button>
									<div style="margin-top: 5px;color: #9B9B9B;">
										<small>仅支持JPG、JPEG、PNG格式（2M以下）</small>
										<small>(选择图片后,根据需要裁切图片上传头像)</small>
									</div>
								</form>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					
					<script type="text/javascript">
						var jcrop_api, boundx, boundy; 
						function Id(id){
							return document.getElementById(id);
						}
						function changeToop(){
							var file = Id("file");
							if(file.value==''){
								//设置默认图片
								//Id("target").src='http://sandbox.runjs.cn/uploads/rs/72/huvtowwn/zanwu.png';
							}else{
								preImg("file","target");
								//cq();
							}
						}
						//获取input[file]图片的url Important
						function getFileUrl(fileId) { 
							var url; 
							var file = Id(fileId);
							var agent = navigator.userAgent;
							if (agent.indexOf("MSIE")>=1) {
								url = file.value; 
							} else if(agent.indexOf("Firefox")>0) { 
								url = window.URL.createObjectURL(file.files.item(0)); 
							} else if(agent.indexOf("Chrome")>0) {
								url = window.URL.createObjectURL(file.files.item(0)); 
							}else{
								url = window.URL.createObjectURL(file.files.item(0)); 
							}
							return url; 
						} 
						//读取图片后预览
						function preImg(fileId,imgId) { 
							var imgPre =Id(imgId);
							$("#"+imgId).attr("style","");
							$(".jcrop-holder").remove();
							var img = new Image();
							img.src = getFileUrl(fileId);
							img.onload= function(){
								if(img.width > 760 || img.height > 500){
									alert("请选择小于760*500的图片。");
								}else{
									imgPre.src = getFileUrl(fileId);
									cq();
									$("#upload").show();
								}
								img = null;
							};
						}
						function cq(){
							if(jcrop_api){
								jcrop_api.destroy();
							}
							$('#target').Jcrop({  
							    onChange: updatePreview,  
								onSelect: updatePreview,  
								aspectRatio: 1  
							},function(){  
								// Use the API to get the real image size  
								var bounds = this.getBounds();  
								boundx = bounds[0];  
								boundy = bounds[1];  
								// Store the API in the jcrop_api variable  
								jcrop_api = this;  
							});  
						}
						function updatePreview(c){  
							if (parseInt(c.w) > 0){    
								$("#width").val(c.w);  //c.w 裁剪区域的宽  
								$("#height").val(c.h); //c.h 裁剪区域的高  
								$("#x").val(c.x);  //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标  
								$("#y").val(c.y);  //c.y 裁剪区域顶点的y坐标</span>  
							} 
						}
														
						function headUpload(){
							var x = $("#x").val();
							var y = $("#y").val();
							var width = $("#width").val();
							var height = $("#height").val();
							var u = "&x="+x+"&y="+y+"&width="+width+"&height="+height;
							$.ajaxFileUpload({
								url:'../user/upload?id=${us.id}'+u,
								type:'post',
								secureuri:false,
								fileElementId:'file',
								success:function(data,status){
									window.location.reload();
								}
							});
						}							
					</script>
					
				</div>
			</div>
		</div>
		
	</fms:Content>
</fms:ContentPage>

