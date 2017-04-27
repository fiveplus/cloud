<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="master">
	<fms:Content contentPlaceHolderId="title">
		Cloud Admin
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>
			
			<ul class="breadcrumb">
				<li class="active">
					<i class="icon-home home-icon"></i>
					Home
					<!-- <a href="javascript:void(0)">Home</a> -->
				</li>
				<!-- 
				<li>
					<a href="#">Other Pages</a>
				</li>
				<li class="active">Blank Page</li> -->
			</ul><!-- .breadcrumb -->
			
			<div class="nav-search" id="nav-search">
				<form class="form-search" action="" method="post" onsubmit="return false;" >
					<span class="input-icon">
						<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
						<i class="icon-search nav-search-icon"></i>
					</span>
				</form>
			</div><!-- #nav-search -->
		</div>
		
		<div class="page-content" style="padding:0;">
			<!-- PAGE CONTENT BEGINS -->
			<div style="background: #f4f5fa;">
				<div class="center-top">
				<!-- 
				<c:if test="${pcount > 0}">
					<div class="project-stat" >
					<div class="stat-top">
						<div class="stat-left">
							项目看板
						</div>
						<div class="stat-right">
							单位：个
						</div>
						<div class="clear"></div>
					</div>
					<div id="canvasDiv"></div>
					</div>
				</c:if>
				<c:if test="${ccount > 0}">
					<div class="custom-stat">
					<div class="stat-top">
						<div class="stat-left">
							客户看板
						</div>
						<div class="stat-right">
							单位：个
						</div>
						<div class="clear"></div>
					</div>
					<div id="canvasDiv2"></div>
					</div>
				</c:if>
				 -->
				
				<div class="clear"></div>
				</div>
				
			</div>
			
			<div class="center-center">
				<!-- 
				<div class="center-title">
					我的操作
				</div>
				<div class="table-responsive">
					<table  width="100%" cellspacing="0" cellpadding="20" frame="below" >
						<c:forEach items="${logs}" var="l" >
						<tr style="border-bottom: 1px solid #ededed;">
							<td>
								<date:date value="${l.createTime}" format="yyyy年MM月dd日 " />
								<date:date value="${l.createTime}" format="HH:mm " />
							</td>
							<td>
								${l.information}
							</td>
							<td style="color: #999;">
								操作成功
							</td>
						</tr>
						</c:forEach>
					</table>
				</div> -->
			</div>
			<div style="background: #f5f5fa;">
				<div class="bottom"></div>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.page-content -->
		
		
	</fms:Content>
</fms:ContentPage>
