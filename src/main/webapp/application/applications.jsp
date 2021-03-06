<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		${title}
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div id="main" style="overflow:hidden;">
			<div id="cb_3" style="position:relative">
				<div class="cmenu">
					<div class="cmenuleft">
						<a href="#" class="h">我的应用</a>
					</div>
					<div class="cmenuright">
						<!-- 
						<a href="#" class="cmra1">&nbsp;</a>
						<a href="#" class="cmra2">&nbsp;</a>
						 -->
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
	            <div class="use">
		              <ul>
		                <li><img src="${contextPath}/images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_02.png" width="64" height="64" /><span>携程旅行</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_03.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_04.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_02.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_03.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_04.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		                <li><img src="${contextPath}/images/use_01.png" width="64" height="64" /><span>携程旅行 酒店机票火车票旅游门票攻略团购</span><a> 立刻安装</a></li>
		             	<!-- <div class="clear"></div>   -->
		             </ul>
            	</div>
	            <div class="space_h_30 clear"></div>
			</div>
		</div>
	</fms:Content>
</fms:ContentPage>