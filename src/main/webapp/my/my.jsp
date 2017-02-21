<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="/json-el-common" prefix="el" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
		<script type="text/javascript" src="admin/js/ajaxfileupload.js" ></script> 
		<script type="text/javascript" src="admin/js/jquery.Jcrop.js" ></script> 
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" >
					<div class="cmenuleft">
						<a href="mycontents">我的记录</a>
						<a href="#">我的留言</a>
						<a href="msg">我的日历</a>
						<a href="#">我的消息</a>
					</div>
					<div class="cmenuright">
						<a class="cur">资料</a>
						<a href="#">统计</a>
						<a href="#">访客</a>
					</div>
					<div class="clear"></div>
				</div>	
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<div class="gr_ge">
						<span>
							<a id="upload_a" href="#upload_image_div" rel="leanModal"  ><img class="img-radius64" src="${u.portrait}" /></a>
						</span>
						<div class="gr_ge2" style="padding-top:13px;">
							<font size="+1"><b>${u.username}</b></font> ${u.group.parent.name}·${u.group.name}
							<br/>
							再不折腾我们就老了！
						</div>
					</div>
					
					<div class="row">
						<table class="u-table" cellpadding="10" border="1" bordercolor="#ddd">
							<tr>
								<td><h3>基本资料</h3></td>
							</tr>
							<tr>
								<td>账号：${u.loginName}</td>
							</tr>
							<tr>
								<td>姓名：${u.username}</td>
							</tr>
							<tr>
								<td>部门：${u.group.parent.name}·${u.dept.name}</td>
							</tr>
							<tr>
								<td>座机：${u.dept.phone}</td>
							</tr>
							<tr>
								<td>传真：${u.dept.fax}</td>
							</tr>
							<tr>
								<td>职位：${u.post}</td>
							</tr>
							<tr>
								<td>职级：${u.level.level.name}${u.level.name}
								（${u.level.info}）
								</td>
							</tr>
							<tr>
								<td>电话：${u.mobile}</td>
							</tr>
							<tr>
								<td>
									<h3>修改密码</h3>
								</td>
							</tr>
							<tr>
								<td>旧密码：
									<input type="password" name="oldpass" class="my-pass-input" onblur="check_pass(this.value)" />
									<span id="old-error-span"></span>
								</td>
							</tr>
							<tr>
								<td>新密码：
									<input type="password" name="newpass" class="my-pass-input" onblur="check_new_pass(this.value)" />
									<span id="new-error-span"></span>
								</td>
							</tr>
							<tr>
								<td>
									<button class="button button-primary button-rounded button-small" type="button" onclick="update_pass()"" >
										<i class="icon-ok bigger-110"></i>
										确认修改
									</button>
								</td>
							</tr>
						</table>
					</div>
					
					
				</div>
				<div class="space_h_30 clear"></div>
				
				
				
			</div>
		</div>
		
		<div id="upload_image_div" class="leanmodel_div">
			<form role="form" class="form" method="post" >
				<div style="padding:20px 5px;"><font size="+2"><b>头像修改</b></font> <span style="color:#999;"> >>选择上传头像 </span> </div>
				<div class="form-group">
					<!-- 选择头像 -->
					<input type="hidden" name="x" id="x" value="0" />
					<input type="hidden" name="y" id="y" value="0" />
					<input type="hidden" name="width" id="width" value="0" />
					<input type="hidden" name="height" id="height" value="0" />
					<input type="file" name="file" id="file" accept="image/png,image/jpg,image/jpeg" onchange="changeToop()"  style="display:none;"  />
					<img src="${user.portrait}" width="200" id="target"  />
					<br/><br/>
					<button class="button button-primary button-rounded button-small" type="button" onclick="Id('file').click()">
						<i class="icon-ok bigger-110"></i>
						选择图片
					</button>
					<button class="button button-primary button-rounded button-small" type="button" id="upload" style="display: none;" onclick="headUpload()">
						<i class="icon-ok bigger-110"></i>
						上传
					</button>
					<div style="margin-top: 5px;color: #9B9B9B;">
						<small>仅支持JPG、JPEG、PNG格式（2M以下）</small>
						<small>(选择图片后,根据需要裁切图片上传头像)</small>
					</div>
					
				</div>
			</form>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#upload_a").leanModal();
			});
			
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
				var u = "x="+x+"&y="+y+"&width="+width+"&height="+height;
				$.ajaxFileUpload({
					url:'user/upload?'+u,
					type:'post',
					secureuri:false,
					fileElementId:'file',
					success:function(data,status){
						window.location.reload();
					}
				});
			}	
			
			function check_pass(val){
				$.ajax({
					url:"user/checkpass",
					data:{password:val},
					success:function(data){
						var vdata = eval("("+data+")");
						if(vdata.returnCode=='0'){
							$("#old-error-span").html("<font color='green'><b>√ </b></font>");
						}else{
							$("#old-error-span").html("<font color='red'><b>×旧密码输入错误.</b></font>");
						}
					}
				});
			}
			
			function check_new_pass(val){
				var oldpass = $("input[name='oldpass']").val();
				if(val == oldpass){
					$("#new-error-span").html("<font color='red'><b>×新旧密码不能相同.</b></font>");
				}else{
					$("#new-error-span").html("<font color='green'><b>√ </b></font>");
				}
			}
			
			function update_pass(){
				var oldpass = $("input[name='oldpass']").val();
				var newpass = $("input[name='newpass']").val();
				
				if(oldpass == ''){
					$("#old-error-span").html("<font color='red'><b>×请输入旧密码.</b></font>");
					return;
				}
				if(newpass == ''){
					$("#new-error-span").html("<font color='red'><b>×请输入新密码.</b></font>");
					return;
				}
				
				if(oldpass == newpass){
					$("#new-error-span").html("<font color='red'><b>×新旧密码不能相同.</b></font>");
					return;
				}else{
					$("#new-error-span").html("<font color='green'><b>√ </b></font>");
				}
				
				$.ajax({
					url:"user/updatepass",
					data:{oldpass:oldpass,newpass:newpass},
					success:function(data){
						var vdata = eval("("+data+")");
						if(vdata.returnCode=='0'){
							alert("密码修改成功，重新登录生效！");
						}else{
							alert("密码修改失败，请检查后重新输入!");
						}
					}
				});
				
				
			}
			
		</script>
	</fms:Content>
</fms:ContentPage>