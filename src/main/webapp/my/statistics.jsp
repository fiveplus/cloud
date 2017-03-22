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
		<script src="${contextPath}/js/echarts.min.js"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div id="cb_4" style="position:relative">
				<div class="cmenu">
					<div class="cmenuleft">
						<a href="${contextPath}/my/contents">我的记录</a>
						<a href="${contextPath}/my/calendar">我的日历</a>
						<a href="${contextPath}/my/msg">我的消息</a>
					</div>
					<div class="cmenuright">
						<a href="${contextPath}/my/me">资料</a>
						<a class="cur">统计</a>
						<a href="#">访客</a>
					</div>
					<div class="clear"></div>
	            </div>
				<div class="space_h_40"></div>
				<!-- main div -->
				<div>
					<!-- 用户信息 -->
					<div class="gr_ge">
						<span>
							<img class="img-radius64" src="${u.portrait}" />
						</span>
						<div class="gr_ge2" style="padding-top:5px;">
							<b>${user.username}</b> ${user.group.parent.name}·${user.group.name} 
							<br />
							<b><font size="-1" color="red"> ${user.level.info} ( ${user.level.level.name}${user.level.name} ) </font></b>
							<div style="margin-top: 5px;">
								帖数：<strong>${count}</strong> &nbsp;&nbsp;
								访问：<strong>${sum}</strong> &nbsp;&nbsp;
								评论：<strong>${ccount}</strong>
							</div>
						</div>
					</div>
					<div style="padding:5px;"></div>
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
									<img src="${contextPath}/${p.user.portrait}" class="img-radius37" />
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
										<font >人数：${fn:length(p.users)+1}</font>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</c:forEach>
					</div>
					<!-- 排行榜 -->
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		<script type="text/javascript">
			
			$.get("${contextPath}/my/content_stat.json",function(data,status){
				var cdata = init_datas("帖数",data.contents);
				var cdata2 = init_datas("评论",data.comments);
				var pdata = init_datas("赞",data.praises);
				var datalist = new Array();
				datalist.push(cdata);
				datalist.push(cdata2);
				datalist.push(pdata);
				load_image("fold_line",datalist);
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
						text:'个人数据七日分析图'
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
			
		</script>
	</fms:Content>
</fms:ContentPage>