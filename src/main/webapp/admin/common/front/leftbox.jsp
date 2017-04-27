<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="date" uri="/date-tag" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="leftbox">
	<a href="#here" class="logo">&nbsp;</a>
		<div class="searchbox" >
			<div class="fl">
				<input type="text" class="searchinput" style="width:148px;" />
			</div>
			<div class="fr">
				<input name="submit" type="image" src="${contextPath}/images/space.gif" width="32" height="32" />
          	</div>
		</div>
		<ul class="tab">
			<li data-id="0" <c:if test="${dataid==NULL}">class="cur"</c:if><c:if test="${dataid=='0'}">class="cur"</c:if>>通讯录</li>
			<li data-id="1" <c:if test="${dataid=='1'}">class="cur"</c:if>>项目组</li>
			<li data-id="2" <c:if test="${dataid=='2'}">class="cur"</c:if>>最近联系</li>
			<li style="clear:both;"></li>
		</ul>
        <div class="space_h_20"></div>
        <ul class="leftmenu" style="padding-right:5px;">
          <!-- 我来组成左侧菜单 -->
        </ul>
        <a href="#here" class="cloud">&nbsp;</a>
</div>
