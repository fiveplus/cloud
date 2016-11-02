<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<li>
	<a href="#here"><i></i>我创建的</a>
	<c:if test="${cp != null && fn:length(cp) > 0}">
		<div>
			<c:forEach items="${cp}" var="c">
				<a href="proj?id=${c.id}" ><i></i>${c.name}</a>
			</c:forEach>
		</div>
	</c:if>
</li>
<li>
	<a href="#here"><i></i>我管理的</a>
</li>
<li>
	<a href="#here"><i></i>我参与的</a>
</li>
<li>
	<a id="project-addinit" rel="leanModal" href="#add_project_div"  ><i></i>项目新建</a>
	<script type="text/javascript">
		$('#project-addinit').leanModal();
	</script>
</li>
