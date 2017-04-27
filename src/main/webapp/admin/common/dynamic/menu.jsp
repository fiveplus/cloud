<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

					
<!-- 
	<li>
		<a href="javascript:loadHTML('menu/list.htm?pu.pageNum=1&')">
			<i class="icon-dashboard"></i>
			<span class="menu-text"> 菜单管理 </span>
		</a>
	</li>
	
	

	<li>
		<a href="typography.html">
			<i class="icon-text-width"></i>
			<span class="menu-text"> Typography </span>
		</a>
	</li>
		-->
 						
		<c:forEach items="${menus}" var="m">
			<li <c:if test="${m.permission.id==parentId}">class="open"</c:if> >
				<a href="#" class="dropdown-toggle">
				<i class="${m.permission.className}"></i>
				<span class="menu-text"> ${m.permission.name} </span>
				<b class="arrow icon-angle-down"></b>
			</a>
			<ul class="submenu" <c:if test="${m.permission.id==parentId}">style="display:block;"</c:if> >
				<c:forEach items="${m.pers}" var="per">
					<li>
						<a href="${contextPath}/${per.url}&menuId=${per.id}">
						<i class="icon-double-angle-right"></i>
						${per.name}
						</a>
					</li>
				</c:forEach>
			</ul>
			
			</li>	
		</c:forEach>
		
		<!-- 
	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-desktop"></i>
			<span class="menu-text"> 后台管理 </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
		
			<li>
				<a href="javascript:loadHTML('permission/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					菜单/权限
				</a>
			</li>
		
			<li>
				<a href="javascript:loadHTML('user/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					用户管理
				</a>
			</li>

			<li>
				<a href="javascript:loadHTML('dept/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					部门管理
				</a>
			</li>
			
		
			<li>
				<a href="treeview.html">
					<i class="icon-double-angle-right"></i>
					Treeview
				</a>
			</li>

			<li>
				<a href="jquery-ui.html">
					<i class="icon-double-angle-right"></i>
					jQuery UI
				</a>
			</li>

			<li>
				<a href="nestable-list.html">
					<i class="icon-double-angle-right"></i>
					Nestable Lists
				</a>
			</li>

			<li>
				<a href="#" class="dropdown-toggle">
					<i class="icon-double-angle-right"></i>

					Three Level Menu
					<b class="arrow icon-angle-down"></b>
				</a>

				<ul class="submenu">
					<li>
						<a href="#">
							<i class="icon-leaf"></i>
							Item #1
						</a>
					</li>

					<li>
						<a href="#" class="dropdown-toggle">
							<i class="icon-pencil"></i>

							4th level
							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a href="#">
									<i class="icon-plus"></i>
									Add Product
								</a>
							</li>

							<li>
								<a href="#">
									<i class="icon-eye-open"></i>
									View Products
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</li>-->
		<!-- 
	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-list"></i>
			<span class="menu-text"> 客户管理 </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="javascript:loadHTML('custom/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					客户管理
				</a>
			</li>
			<li>
				<a href="javascript:loadHTML('customtype/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					客户类型管理
				</a>
			</li>
			<li>
				<a href="javascript:loadHTML('cuslocation/list.htm?pu.pageNum=1&')">
					<i class="icon-double-angle-right"></i>
					区域管理
				</a>
			</li>
			
			<li>
				<a href="jqgrid.html">
					<i class="icon-double-angle-right"></i>
					添加客户
				</a>
			</li>
		</ul>
	</li> -->
	<!-- 
	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-edit"></i>
			<span class="menu-text"> Forms </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="form-elements.html">
					<i class="icon-double-angle-right"></i>
					Form Elements
				</a>
			</li>

			<li>
				<a href="form-wizard.html">
					<i class="icon-double-angle-right"></i>
					Wizard &amp; Validation
				</a>
			</li>

			<li>
				<a href="wysiwyg.html">
					<i class="icon-double-angle-right"></i>
					Wysiwyg &amp; Markdown
				</a>
			</li>

			<li>
				<a href="dropzone.html">
					<i class="icon-double-angle-right"></i>
					Dropzone File Upload
				</a>
			</li>
		</ul>
	</li>

	<li>
		<a href="widgets.html">
			<i class="icon-list-alt"></i>
			<span class="menu-text"> Widgets </span>
		</a>
	</li>

	<li>
		<a href="calendar.html">
			<i class="icon-calendar"></i>

			<span class="menu-text">
				Calendar
				<span class="badge badge-transparent tooltip-error" title="2&nbsp;Important&nbsp;Events">
					<i class="icon-warning-sign red bigger-130"></i>
				</span>
			</span>
		</a>
	</li>

	<li>
		<a href="gallery.html">
			<i class="icon-picture"></i>
			<span class="menu-text"> Gallery </span>
		</a>
	</li>

	<li>
		<a href="#" class="dropdown-toggle">
			<i class="icon-tag"></i>
			<span class="menu-text"> More Pages </span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="profile.html">
					<i class="icon-double-angle-right"></i>
					User Profile
				</a>
			</li>

			<li>
				<a href="inbox.html">
					<i class="icon-double-angle-right"></i>
					Inbox
				</a>
			</li>

			<li>
				<a href="pricing.html">
					<i class="icon-double-angle-right"></i>
					Pricing Tables
				</a>
			</li>

			<li>
				<a href="invoice.html">
					<i class="icon-double-angle-right"></i>
					Invoice
				</a>
			</li>

			<li>
				<a href="timeline.html">
					<i class="icon-double-angle-right"></i>
					Timeline
				</a>
			</li>

			<li>
				<a href="login.html">
					<i class="icon-double-angle-right"></i>
					Login &amp; Register
				</a>
			</li>
		</ul>
	</li>

	<li class="active open">
		<a href="#" class="dropdown-toggle">
			<i class="icon-file-alt"></i>

			<span class="menu-text">
				Other Pages
				<span class="badge badge-primary ">5</span>
			</span>

			<b class="arrow icon-angle-down"></b>
		</a>

		<ul class="submenu">
			<li>
				<a href="faq.html">
					<i class="icon-double-angle-right"></i>
					FAQ
				</a>
			</li>

			<li>
				<a href="error-404.html">
					<i class="icon-double-angle-right"></i>
					Error 404
				</a>
			</li>

			<li>
				<a href="error-500.html">
					<i class="icon-double-angle-right"></i>
					Error 500
				</a>
			</li>

			<li>
				<a href="grid.html">
					<i class="icon-double-angle-right"></i>
					Grid
				</a>
			</li>

			<li class="active">
				<a href="blank.html">
					<i class="icon-double-angle-right"></i>
					Blank Page
				</a>
			</li>
		</ul>
	</li>
 -->
					
					

		
