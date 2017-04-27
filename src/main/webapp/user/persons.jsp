<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${groups}" var="g" varStatus="stat">
	<li id="person-list">
		<a href="#here" <c:if test="${stat.index == 0}">class="open"</c:if> ><i></i>${g.name}</a>
		<c:if test="${g.childs != null && fn:length(g.childs) > 0}">
			<div>
			<c:forEach items="${g.childs}" var="c" varStatus="cstat">
				<a href="#here"><i></i>${c.name}</a>
				<c:if test="${c.users != null && fn:length(c.users) > 0}">
					<div>
						<c:forEach items="${c.users}" var="cu">
							<a href="#here" user-id="${cu.id}" count="${cu.messageCount}" >
							<i>
								<c:if test="${cu.portrait != ''}">
									<img src="${contextPath}/${cu.portrait}" style="margin-top: -15px;" class="img-radius30" />
								</c:if>
							</i>
							<b>${cu.username}</b> ${cu.mobile}</a> 
							<input type="hidden" name="userid" value="${cu.id}" />
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
			</div>
		</c:if>
		<c:if test="${g.users != null && fn:length(g.users) > 0}">
			<div>
				<c:forEach items="${g.users}" var="u">
					<a href="#here"><i></i><b>${u.username}</b>${u.mobile}</a> 
					<input type="hidden" name="userid" value="${cu.id}" />
				</c:forEach>
			</div>
		</c:if>
	</li>	
</c:forEach>
