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
		<script src='${contextPath}/js/echarts.min.js'></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div id="cb_4" style="position:relative">
				<div class="cmenu">
					<div class="cmenuleft">
						<a href="#" class="h">数据统计</a>
					</div>
					<div class="cmenuright">
						<a href="#" class="cmra1">&nbsp;</a>
						<a href="#" class="cmra2">&nbsp;</a>
					</div>
					<div class="clear"></div>
	            </div>
				<!-- 项目、部门列表 -->
				<div class="item"><a href="#">2015集团信息化建设项目化建设</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a><a href="#">2015集团信息化建设项目</a>
					<div class="clear">此处显示  class "clear" 的内容</div>
            	</div>
				<div class="item altmenu"><a href="#">分享</a><a href="#">汇报</a><a href="#">计划</a><a href="#">总结</a><a href="#">报告</a><a href="#">项目</a><a href="#">分析</a><a href="#">圣泉</a><a href="#">你好</a><a href="#">新年</a><a href="#">2015</a>
					<div class="clear">此处显示  class "clear" 的内容</div>
				</div>
				<div class="item depmenu"><a href="#">网络部</a><a href="#">人事部</a><a href="#">信息中心</a><a href="#">财务部</a><a href="#">技术科</a><a href="#">总裁办</a><a href="#">综合办公室</a><a href="#">ERP小组</a><a href="#">酚醛一车间</a><a href="#">铸造市场部</a><a href="#">2015</a>
					<div class="clear">此处显示  class "clear" 的内容</div>
				</div>
				<div class="space_h_40"></div>
				<!-- main div -->
				<div>
					<div style="padding:5px;">&nbsp;</div>
					<!-- 折线图 -->
					<div id="fold_line" style="width:100%;height:400px;">
					</div>
					<!-- 项目近况 -->
					<div class="project_stat">
						<div style="margin: 10px;">
							<h4>项目近况 <small>TOP5</small></h4> 
						</div>
						<c:forEach items="${projects}" var="p" end="4">
							<div class="project_item">
								<div class="item_left" style="margin-left: 5px;">
									<img src="${p.user.portrait}" class="img-radius37" />
								</div>
								<div class="item_left">
									<div>${p.name}</div>
									<div>Design & Development </div>
								</div>
								<div class="item_right">
									<div style="margin-top:10px;">
										<font>CreateTime By <date:date value="${p.createTime}" /> </font>
									</div>
								</div>
								<div class="item_right">
									<div style="margin-top:10px;">
										<font >人数：${fn:length(p.users)}</font>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</c:forEach>
					</div>
					<div style="padding:10px;">&nbsp;</div>
					<!-- 排行榜 -->
					<div id="bar_charts" style="width:100%;height:400px;">
					</div>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			
			$.get("${contextPath}/stat/content_stat.json",function(data,status){
				var cdata = init_datas("帖数",data.contents);
				var cdata2 = init_datas("评论",data.comments);
				var pdata = init_datas("赞",data.praises);
				var datalist = new Array();
				datalist.push(cdata);
				datalist.push(cdata2);
				datalist.push(pdata);
				load_image("fold_line",datalist);
			});
			
			$.get("${contextPath}/stat/dept_stat.json",function(data,status){
				var depts = data.depts;
				bar_charts("bar_charts",depts);
			});
			
			
			
			function init_datas(name,datas){
				var xdata = new Array();
				var ydata = new Array();
				for(var i = 0;i < datas.length;i++){
					xdata.push(datas[i].name);
					ydata.push(datas[i].count);
				}
				var data = {
					name:name,
					xdata:xdata,
					ydata:ydata
				};
				return data;
			}
			
			function load_image(id,datalist){
				var eid = echarts.init(document.getElementById(id));
				var names = new Array();
				var xdata = new Array();
				var series = new Array();
				for(var i = 0;i < datalist.length;i++){
					names.push(datalist[i].name);
					if(i == 0){
						var x = datalist[i].xdata;
						for(var k = 0;k < x.length;k++){
							xdata.push(new Date(x[k]).Format("yyyy-MM-dd"));
						}
					}
					series.push({
						name:datalist[i].name,
						type:'line',
						stack:'总量',
						data:datalist[i].ydata
					});
				}
				var option = {
					title:{
						text:'碎片云三十日分析图'
					},
					tooltip:{
						trigger:'axis'
					},
					legend:{
						data:names
					},
					grid:{
						left:'3%',
						right:'4%',
						bottom:'3%',
						containLabel:true
					},
					toolbox:{
						feature:{
							saveAsImage:{}
						}
					},
					xAxis:{
						type:'category',
						boudaryGap:false,
						data:xdata
					},
					yAxis:{
						type:'value'
					},
					series: series
				};
				eid.setOption(option);
			}
			
			function bar_charts(id,datalist){
				var names = new Array();
				var datas = new Array();
				for(var i = 0;i<datalist.length;i++){
					names.push(datalist[i].name);
					datas.push(datalist[i].count);
				}
				var eid = echarts.init(document.getElementById(id));
				var option = {
					title:{
						text:"碎片云三十日排行榜"
					},
					tooltip:{
						trigger:"axis",
						axisPointer:{
							type:"shadow"
						}
					},
					grid:{
						left:"3%",
						right:"4%",
						bottom:"3%",
						containLabel:true
					},
					xAxis:{
						type:"value",
						boundaryGap:[0,0.01]
					},
					yAxis:{
						type:'category',
						data:names
					},
					series:[
						{
							name:"帖数",
							type:"bar",
							data:datas
						} 
					]
				};
				eid.setOption(option);
			}
			
		</script>
	</fms:Content>
</fms:ContentPage>