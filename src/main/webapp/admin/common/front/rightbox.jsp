<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="date" uri="/date-tag" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="rightbox">
	<a href="${contextPath}/my/contents" class="gr_t">
		<img class="img-radius37" src="${contextPath}/<c:if test="${user.portrait == ''}">images/right01.png</c:if><c:if test="${user.portrait != ''}">${user.portrait}</c:if>" alt="头像" width="37" height="37"/>
	</a>
	<div class="rm">
		<a href="${contextPath}/content/addcontent?rightMenuId=addcontent" class="post<c:if test="${rightMenuId=='addcontent'}"> cur</c:if>"><i class="i1"></i>发帖</a>
		<a href="${contextPath}/index?rightMenuId=index" <c:if test="${rightMenuId==NULL}">class="cur"</c:if><c:if test="${rightMenuId=='index'}">class="cur"</c:if>><i class="i2"></i>浏览</a>
		<a href="${contextPath}/app/list?rightMenuId=applist" <c:if test="${rightMenuId=='applist'}">class="cur"</c:if>><i class="i3"></i>应用</a> 
		<a href="${contextPath}/stat/stats?rightMenuId=stat" <c:if test="${rightMenuId=='stat'}">class="cur"</c:if>><i class="i4"></i>统计</a> 
	</div>
	<div class="rb">
  		<a href="#" class="ra1">&nbsp;</a>
  		<a href="${contextPath}/my/msg" class="ra2">&nbsp;</a><i></i>
  		<a href="javascript:show_modal('skin-div')" class="ra3">&nbsp;</a><i></i>
  		<a href="${contextPath}/logout" class="ra4">&nbsp;</a>
  	</div>
</div>