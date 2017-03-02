<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>

	<!-- 项目/部门列表 -->
	<div id="content" style="margin: auto;border-top: 3px solid #3dc768;">
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
				$(".comment-input").val("");
			});
			
		});
	</script>