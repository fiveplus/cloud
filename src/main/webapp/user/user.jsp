<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="content-user" >
	<div class="user-top">
		<div class="user-left">
			<img class="img-radius64" src="${u.portrait}">
		</div>
		<div class="user-right">
			<div style="margin-bottom: 5px;">
				<b>${u.username}</b>
			</div>
			<div>
				${u.level.info} ( ${u.level.level.name}${u.level.name} )
			</div>
			<div style="margin-top: 10px;">
				★★★★★
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="user-stat">
		<div class="stat-item" style="padding-top: 18px;">
			帖数：${count}
		</div>
		<div class="stat-item" style="padding-top: 18px;">
			访问：${sum}
		</div>
		<div class="stat-item" style="padding-top: 18px;">
			评论：${ccount}
		</div>
		<div class="stat-item" style="padding-left: 18px;">
			<a name="show-chat-a" rel='leanModal' href='#chat-div' onclick="show_chat(${u.id})" class="btn btn-success" >发消息</a>
		</div>
		 <div class="clear"></div>
	</div>
</div>
<script type="text/javascript">
	$("a[name='show-chat-a']").leanModal();
</script>