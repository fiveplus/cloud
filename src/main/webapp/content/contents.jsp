<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
		<!-- 瀑布流插件 -->
		<script src="${contextPath}/js/wookmark/jquery.wookmark.js"></script>
		<script src="${contextPath}/js/wookmark/jquery.imagesloaded.js"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div id="main" style="overflow:hidden;">
			<div id="cb_2" style="position: relative;">
				<div class="cmenu">
					<div class="cmenuleft">
						<a href="${contextPath}/index" >我的部门</a> 
						<a href="#" id="h1">我的项目</a>
						<a href="#" id="h2">其他部门</a> 
					</div>
					<div class="cmenuright">
              			<a href="#" class="cmra1">&nbsp;</a>
              			<a href="#" id="h3" class="cmra2">&nbsp;</a> 
              			<a href="#">沟通</a>
              			<a href="#">记录</a>
              			<a href="#">文档</a>
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
           		<div id="list-content" style="min-height:750px;">
           			<div style="margin: 15px 0 0 5px;">
           				<span><a href="index">首页</a> >> ${dept.name}</span>
           			</div>
           			<ul class="list_1" id="list_1" style="position: relative">
           				<!-- 这里显示列表 -->
           				
           			</ul>
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
				
				/* 移出详情 */
				$("#user-div").mouseleave(function(){
					$("#user-div").hide();
				});
				/* 移入用户头像 */
				$(document).on('mouseover mouseout','#list_1 li .libox .hphoto',function(event){
					if(event.type == "mouseover"){
						var x = event.pageX + 10;
						var y = event.pageY + 10;
						var id = $(this).attr("data-id");
						$("#user-div").load("${contextPath}/user/user?id="+id,function(){
							$("#user-div").css({"left":x+"px","top":y+"px"});
							$("#user-div").show();
						});
					}else if(event.type == "mouseout"){
						//鼠标离开
					}
				});
				
				$(document).on('click','#list_1 li .lib .la1',function(){
					var contentId = $(this).attr("data-id");
					var val = $(this).html();
					var num = val.substring(1,val.length-1);
					var a = $(this);
					$.ajax({
						type:"POST",
						url:"praise/save",
						data:{contentId:contentId},
						success: function(data) {
							
							//var vdata = eval("("+data+")");
							var vdata = data;
							if(vdata.code == 200){
								//点赞
								a.css("background","url(${contextPath}/images/libg04.png) no-repeat 0 4px");
								num = parseInt(num) + 1;
								a.html("("+num+")");
							}else{
								//消赞
								a.css("background","url(${contextPath}/images/libg04.png) no-repeat 0 -13px");
								num = parseInt(num) - 1;
								a.html("("+num+")");
							}
							
						}
					});
				});
				
				
				
				var deptId = '${dept.id}';
				var themeId = '${themeId}';
				var $list = $("#list_1"),
				$handler=$("li",$list),
				page = 1,
				isLoading = false,
				apiURL = "${contextPath}/content/list.json?deptId="+deptId+"&themeId="+themeId,
				lastRequestTimestamp = 0,
				fadeInDelay = 2000,
				$window = $(window),
				$document = $(document);
				// Prepare layout options.
			    var options = {
			      autoResize: true, // This will auto-update the layout when the browser window is resized.
			      container: $('#list_1'), // Optional, used for some extra CSS styling
			      offset: 10, // Optional, the distance between grid items
			      //itemWidth: 349   //Optional, the width of a grid item
			    };
				
			    function applyLayout($html){
			        options.container.imagesLoaded(function(){
			          // Destroy the old handler
			          if ($handler.wookmarkInstance) {
			            $handler.wookmarkInstance.clear();
			          }

			          // Create a new layout handler.
			          $list.append($html);
			          $handler = $('li', $list);
			          $handler.wookmark(options);

			          // Set opacity for each new image at a random time
			          $html.each(function(){
			            var $self = $(this);
			            window.setTimeout(function(){
			              $self.css('opacity', 1);
			            }, Math.random() * fadeInDelay);
			          });
			        });
			      };
				
			    function onScroll(event){
					// Only check when we're not still waiting for data.
			        if (!isLoading) {
			          // Check if we're within 100 pixels of the bottom edge of the broser window.
			          var closeToBottom = ($window.scrollTop() + $window.height() > $document.height() - 100);
			          if (closeToBottom) {
			            // Only allow requests every second
			            var currentTime = new Date().getTime();
			            if (lastRequestTimestamp < currentTime - 1000) {
			              lastRequestTimestamp = currentTime;
			              loadData();
			            }
			          }
			        }
				};
				
				function loadData(){
				    isLoading = true;

				    $.ajax({
				      url: apiURL,
				      dataType: 'json', // Set to jsonp if you use a server on a different domain and change it's setting accordingly
				      data: {page: page}, // Page parameter to make sure we load new data
				      success: onLoadData
				    });
				};
				
				//组装发布文章
				function get_content(c){
					var off = "style='background:url(${contextPath}/images/libg04.png) no-repeat 0 -13px'";
					var on = "style='background:url(${contextPath}/images/libg04.png) no-repeat 0 4px'";
					var style = c.isPraise == 0 ? on : off;
					var date = new Date(c.createTime);
					var time = date.Format("yyyy-MM-dd HH:mm:ss");
					var imgs = "";
					for(var i =0;i<c.imgs.length;i++){
						var s = "<div class='content-img-div'>";
						s+="<img src='"+c.imgs[i]+"' />";
						s+= "</div>";
						imgs += s;
					}
					var st = "<li>"+
						"<div class='libox'>"+
					"<a href='${contextPath}/content/list?themeId="+c.theme.id+"&deptId="+deptId+"' class='share'>"+c.theme.name+"</a>"+
					"<a href='javascript:void(0)' data-id='"+c.user.id+"' class='hphoto'><img src='${contextPath}/"+c.user.portrait+"'"+
							"class='img-radius30' />"+
					"</a>"+
					"<b><a href='#'>"+c.user.username+"</a>"+
					"</b>&nbsp;&nbsp;"+
					"<i>"+c.user.group.parent.name+"·"+c.user.group.name+"</i>"+
					"<br />"+
					time+
					"<span style='font-size: 12px;'> "+
							"<a href='javascript:show_cont("+c.id+")'>"+
							c.str+"<br />"+imgs+
							"</a>"+
					"</span>"+
				"</div>"+
				"<div class='lib'>"+
					"<a href='javascript:void(0)' class='la2'>("+c.readCount+")</a>"+
					"<a href='javascript:void(0)' data-id='"+c.id+"' class='la1' "+style+" >("+c.praiseCount+")</a>"+
					"<b>"+c.address+"</b>"+
				"</div>"+
				"</li>";
					return st;
				}
				
				function onLoadData(response){
					response = eval("("+response+")");
					isLoading = false;
					page++;
					var html = "",data=response.contents;
					for(var i = 0;i<data.length;i++){
						html += get_content(data[i]);
					}
					if (response.count == 0) {
						$document.off('scroll', onScroll);
					}
					
					$html = $(html);
					
					applyLayout($html);
				};
				  
				$document.on('scroll', onScroll);
				loadData();
				
			});
		</script>
	</fms:Content>
</fms:ContentPage>