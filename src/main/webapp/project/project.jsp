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
		<!-- 瀑布流插件 -->
		<script src="js/wookmark/jquery.wookmark.js"></script>
		<script src="js/wookmark/jquery.imagesloaded.js"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" style="min-width: 850px;">
					<div class="cmenuleft">
						<a class="cur">项目记录</a>
						<a href="progress?id=${project.id}" >项目进度</a>
						<a href="projectuser?id=${project.id}" >项目成员</a> 
						<a href="projectset?id=${project.id}" >项目设置</a>
					</div>
					<div class="cmenuright">
						<a href="#" class="cmra1">&nbsp;</a>
						<a href="#" class="cmra2">&nbsp;</a> 
						<a href="#">统计</a>
						<a href="#">附件</a>
						<a href="#">图片</a>
						<a href="#" class="cur">记录</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<div class="gr_ge">
						<span>
							<img class="img-radius64" src="${project.user.portrait}" />
						</span>
						<div class="gr_ge2">
							<b><a href="#">${project.name}</a></b>
							<br/><br/>
							负责人:
							<strong>${project.user.username}</strong>
							建立时间:
							<strong><date:date value="${project.createTime}" /></strong>
							项目组人员:
							<strong>${fn:length(users)+1}人</strong>
						</div>
					</div>
				</div>
				<div id="list-content" style="min-height:750px;">
					<ul class="list_1" id="list_1" style="position: relative">
           				<!-- 这里显示列表 -->
           				
           			</ul>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				
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
							
							var vdata = eval("("+data+")");
							if(vdata.code == 200){
								//点赞
								a.css("background","url(images/libg04.png) no-repeat 0 4px");
								num = parseInt(num) + 1;
								a.html("("+num+")");
							}else{
								//消赞
								a.css("background","url(images/libg04.png) no-repeat 0 -13px");
								num = parseInt(num) - 1;
								a.html("("+num+")");
							}
							
						}
					});
				});
				
				var projectId = '${project.id}';
				var $list = $("#list_1"),
				$handler=$("li",$list),
				page = 1,
				isLoading = false,
				apiURL = "content/plist?projectId="+projectId,
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
				      data: {page: page,deptId:0}, // Page parameter to make sure we load new data
				      success: onLoadData
				    });
				};
				
				//组装发布文章
				function get_content(c){
					var off = "style='background:url(images/libg04.png) no-repeat 0 -13px'";
					var on = "style='background:url(images/libg04.png) no-repeat 0 4px'";
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
					"<a href='#' class='share'>"+c.theme.name+"</a>"+
					"<a href='#' class='hphoto'><img src='"+c.user.portrait+"'"+
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