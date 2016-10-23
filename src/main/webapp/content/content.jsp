<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div id="main" style="overflow:hidden;">
			<div id="cb_2" style="position: relative;">
				<div class="cmenu">
					<div class="cmenuleft">
						<c:if test="${content.user.dept.id==user.dept.id}">
							<a href="#" class="cur" >我的部门</a> 
						</c:if>
						<c:if test="${content.user.dept.id!=user.dept.id}">
							<a href="index" >我的部门</a> 
						</c:if>
						<a href="#" id="h1">我的项目</a>
						<a href="#" id="h2">其他部门</a> 
					</div>
					<div class="cmenuright">
						<a href="#" class="cmra1">&nbsp;</a>
              			<a href="#" class="cmra2">&nbsp;</a> 
              			<a href="#">沟通</a>
              			<a href="#">记录</a>
              			<a href="#">文档</a>
					</div>
					<div class="clear"></div>
				</div>
				<!-- 项目/部门列表 -->
				<div class="item" id="hb1">
					<c:forEach items="${projects}" var="p">
						<a href="project?id=${p.id}">${p.name}</a>
					</c:forEach>
					<div class="clear"></div>
				</div>
				<div class="item deptmenu" id="hb2">
					<c:forEach items="${depts}" var="d">
           				<a href="contents?deptId=${d.id}">${d.name}</a>
           			</c:forEach>
           			<div class="clear"></div>
				</div>
				<div class="item altmenu" id="hb3">
					<a href="#">分享</a>
					<a href="#">汇报</a>
					<a href="#">计划</a>
					<a href="#">总结</a>
					<a href="#">报告</a>
					<a href="#">项目</a>
					<a href="#">分析</a>
					<a href="#">新年</a>
					<a href="#">2016</a>
              		<div class="clear"></div>
           		</div>
           		<div class="space_h_40"></div>
				<div id="content" style="min-height:750px;">
           			<div style="padding: 15px 0 0 5px;">
           				
           			</div> 
           			<div class="main-content" style="position: relative; ">
           				<!-- 这里显示详细内容 -->
           				<div class="user">
           					<span class="user-img">
           						<img class="img-radius64" src="${content.user.portrait}" />
           					</span>
           					<div class="user-content">
           						${content.user.username} 
           						${content.user.group.parent.name}·${content.user.group.name}
           						<br />
           						<date:date value="${content.createTime}" /> 来自 碎片云 suipianyun.com
           					</div>
           					<div class="clear"></div>
           				</div>
           				<div style="margin: 10px;">
           					${content.content}
           				</div>
           				<div style="border-top: 1px solid #ccc;border-bottom: 1px solid #ccc;padding-top: 5px;padding-bottom:10px;height:17px;">
           					<div style="float:left;width:24%;text-align: center;border-right:1px solid #ccc;"><a href="#">收藏</a></div>
           					<div style="float:left;width:25%;text-align: center;border-right:1px solid #ccc;">
           						<a href="#">评论</a>
           						<div class="arrow-up-border"></div>
           						<div class="arrow-up"></div>
           						
           					</div>
           					<div style="float:left;width:25%;text-align: center;border-right:1px solid #ccc;"><a href="#">阅读(${content.readCount})</a></div>
           					<div style="float:left;width:25%;text-align: center;"><a href="#">赞(0)</a></div>
           					<div class="clear"></div>
           				</div>
           				<!-- 评论区 -->
           				<div style="background: #f2f2f5;">
           					<div style="padding:10px;border-bottom: 1px solid #ccc;">
           						<input type="text" value="" class="comment-input" style="width:99%"  />
           						<div align="right" style="padding-top: 5px;" >
           							<input type="button" disabled="disabled" class="comment-button disabled"   value="评论" />
           						</div>
           					</div>
           					<div>
           						<div style="padding: 5px;" align="center">
           							此帖当前暂无评论。
           						</div>
           					</div>
           				</div>
           			</div>
           		</div>
           		<div id="cb_2_hr" style="height:10px;clear:both;"></div>
				
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			
			$(document).ready(function(){
				//中间头部js
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
				
				$(".comment-input").on('input',function(e){
					$(".comment-button").removeClass("disabled");
					if(this.value != ''){
						$(".comment-button").removeAttr("disabled");
						$(".comment-button").removeClass("disabled");
					}else{
						$(".comment-button").attr("disabled","disabled");
						$(".comment-button").addClass("disabled");
					}
				});
				
				$(".comment-button").click(function(){
					alert("aaa");
				});
				
			});
		</script>
	</fms:Content>
</fms:ContentPage>