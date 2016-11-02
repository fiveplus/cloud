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
		<script src="js/wookmark/jquery.wookmark.js"></script>
		<script src="js/wookmark/jquery.imagesloaded.js"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div id="main" style="overflow:hidden;">
			<div id="cb_2" style="position: relative;">
				<div class="cmenu" >
					<div class="cmenuleft">
						<a class="cur">我的记录</a>
						<a href="#">我的留言</a>
						<a href="msg">我的日历</a>
						<a href="#">我的消息</a>
					</div>
					<div class="cmenuright">
						<a href="config">资料</a>
						<a href="#">统计</a>
						<a href="#">访客</a>
              		</div>
              		<div class="clear"></div>
				</div>
				
           		<div class="space_h_40"></div>
           		<div id="list-content" style="min-height:750px;">
           			
           			<ul class="list_1" id="list_1" style="position: relative">
           				<!-- 这里显示列表 -->
           				
           			</ul>
           		</div>
           		<div id="cb_2_hr" style="height:10px;clear:both;"></div>
				
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			var $handler;
			$(document).ready(function(){
				
				
				var $list = $("#list_1"),
				$handler=$("li",$list),
				page = 1,
				isLoading = false,
				apiURL = "content/mylist",
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
					var date = new Date(c.createTime);
					var time = date.Format("yyyy-MM-dd HH:mm:ss");
					var imgs = "";
					for(var i =0;i<c.imgs;i++){
						var s = "<div class='content-img-div'>";
						s+="<img src='"+c.imgs[i]+"' />";
						s+= "</div>";
						imgs += s;
					}
					var st = "<li data-id='"+c.id+"'>"+
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
							"<a href='content?id="+c.id+"'>"+
							c.str+"<br />"+imgs+
							"</a>"+
					"</span>"+
				"</div>"+
				"<div class='lib'>"+
					"<a href='#del' data-id='"+c.id+"' class='del' style='float:right;margin:0 8px 0 0;'>删除</a>"+
					"<a href='#' class='la2' style='margin-top:1px;'>("+c.readCount+")</a>"+
					"<b>山东省济南市舜泰广场8号楼东12B</b>"+
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
				
				$(".list_1").delegate('.del','click',function(){
					var dataid = $(this).attr("data-id");
					if(confirm("确认删除?")){
						$.ajax({
							url:'content/del',
							data:{id:dataid},
							success:function(data){
								alert("删除成功!");
								//删除完成后移除
								$(".list_1 li[data-id='"+dataid+"']").remove();
								loadData();
							}
						});
						
					}
				});
				
			});
			
		
			
		</script>
	</fms:Content>
</fms:ContentPage>