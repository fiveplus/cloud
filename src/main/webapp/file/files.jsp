<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div id="main" style="overflow:hidden;">
			<div id="cb_2" style="position: relative;">
				<div class="cmenu">
					<div class="cmenuleft">
						<c:if test="${user.dept.id != dept.id}">
							<a href="${contextPath}/index" >我的部门</a> 
						</c:if>
						<c:if test="${user.dept.id == dept.id}">
							<a href="${contextPath}/index" class="cur">我的部门</a> 
						</c:if>
						<a href="#" id="h1">我的项目</a>
						<a href="#" id="h2">其他部门</a> 
					</div>
					<div class="cmenuright">
              			<a href="#" class="cmra1">&nbsp;</a>
              			<a href="#" id="h3" class="cmra2">&nbsp;</a>
              			<!--  
              			<a href="#">沟通</a>  
              			-->
              			<c:if test="${user.dept.id != dept.id}">
              				<a href="${contextPath}/content/list?deptId=${dept.id}">记录</a>
              			</c:if>
              			<c:if test="${user.dept.id == dept.id}">
              				<a href="${contextPath}/index">记录</a>
              			</c:if>
              			<a href="javascript:void(0)" class="cur" >文档</a>
              		</div>
              		<div class="clear"></div>
				</div>
				<!-- 项目/部门列表 -->
				<div class="item" id="hb1">
					<c:forEach items="${projects}" var="p">
						<a href="${contextPath}/project/get?id=${p.id}">${p.name}</a>
					</c:forEach>
					<div class="clear"></div>
				</div>
				<div class="item deptmenu" id="hb2">
					<c:forEach items="${depts}" var="d">
           				<a href="${contextPath}/content/list?deptId=${d.id}">${d.name}</a>
           			</c:forEach>
           			<div class="clear"></div>
				</div>
				<div class="item altmenu" id="hb3">
					<c:forEach items="${themes}" var="t">
						<a href="${contextPath}/content/list?themeId=${t.id}&deptId=${dept.id}">${t.name}</a>
					</c:forEach>
              		<div class="clear"></div>
           		</div>
				<div class="space_h_40"></div>
				<div style="min-height:750px;">
					<c:if test="${user.dept.id != dept.id}">
						<div style="margin: 15px 0 0 5px;">
	           				<span><a href="index">首页</a> >> ${dept.name}</span>
	           			</div>
					</c:if>
           			<div>
           				<!-- 这里是文件列表 -->
           				<c:forEach items="${list}" var="l">
           					<div class="gr_ge">
           						<span>
           							<img class="img-radius64" src="${contextPath}/${l.user.portrait}" />
           						</span>
           						<div class="gr_ge2" style="padding-top:10px;">
           							<font>
           								<b>${l.user.username}</b> ${l.user.group.parent.name} · ${l.user.group.name} 
           							</font>
           							<br/>
           							<div >
           								<strong><font color="red">文件名：${l.fileName} </font></strong>
           								&nbsp;&nbsp;<date:date value="${l.createTime}" /> &nbsp;&nbsp;
										<a href="${l.url}" class="btn btn-primary" >文件下载</a>
										<c:if test="${user.id == l.user.id}">
											<button onclick="del_file(${l.id})" class="btn btn-danger">删除</button>
										</c:if>
           							</div>
           						</div>
           					</div>
           				</c:forEach>
           				<c:if test="${list != null && fn:length(list) > 0}">
           					<div align="center">
		           				<c:if test="${user.dept.id != dept.id}">
		           					<c:if test="${pu.page > 1}">
		           						<a href="${contextPath}/file/list?page=${pu.page-1}&deptId=${dept.id}" class="calexam_a">上一页</a>
		           					</c:if>
		           					${pu.page}
		           					<c:if test="${pu.page < pageCount}">
		           						<a href="${contextPath}/file/list?page=${pu.page+1}&deptId=${dept.id}" class="calexam_a">上一页</a>
		           					</c:if>
		           				</c:if>
		           				<c:if test="${user.dept.id == dept.id}">
		           					<c:if test="${pu.page > 1}">
		           						<a href="${contextPath}/file/list?page=${pu.page-1}&deptId=0" class="calexam_a">上一页</a>
		           					</c:if>
		           					${pu.page}
		           					<c:if test="${pu.page < pageCount}">
		           						<a href="${contextPath}/file/list?page=${pu.page+1}&deptId=0" class="calexam_a">上一页</a>
		           					</c:if>
		           				</c:if>
	           				</div>
           				</c:if>
           				
           			</div>
				</div>
				<div id="cb_2_hr" style="height:10px;clear:both;"></div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
		
			function del_file(id){
				$.confirm({
					title:'提示信息',
					content:'确认删除吗？删除后无法恢复！！！',
					buttons:{
						confirm:function(){
							$.ajax({
								url:'${contextPath}/file/delete.json',
								data:{id:id},
								success:function(data){
									$.alert({title:'提示信息',content:data.message,type:'red'});
									window.location.reload();
								}
							});
						},
						cancel:function(){
							//取消
						}
					}
				});
			}
		
			$(document).ready(function(){
				var hbout;
				$('#h1, #hb1').hover(function(){
					$("#hb1").show();
					$("#hb1").stop(true).animate({ top: "45px",opacity:"1" }, 500);
					$("#h1").addClass("h");
					if(hbout){
						clearTimeout(hbout);
					}
					},function(){
					$("#hb1").stop(true).animate({ top: "-100px" , opacity:"0" }, 300);
					$("#h1").removeClass("h");
					hbout=setTimeout(function(){$("#hb1").hide()},300);
				});
				$('#h2, #hb2').hover(function(){
					$("#hb2").show();
					$("#hb2").stop(true).animate({ top: "45px",opacity:"1" }, 500);
					$("#h2").addClass("h");
					if(hbout){
						clearTimeout(hbout);
					}
				},function(){
					$("#hb2").stop(true).animate({ top: "-100px" , opacity:"0" }, 300);
					$("#h2").removeClass("h");
					hbout=setTimeout(function(){$("#hb2").hide()},300);
				});
				$('#h3, #hb3').hover(function(){
					$("#hb3").show();
					$("#hb3").stop(true).animate({ top: "45px",opacity:"1" }, 500);
					if(hbout){
						clearTimeout(hbout);
					}
				},function(){
					$("#hb3").stop(true).animate({ top: "-200px",opacity:"0" }, 300);
					hbout=setTimeout(function(){$("#hb3").hide()},300);
				});
			});
		</script>
	</fms:Content>
</fms:ContentPage>