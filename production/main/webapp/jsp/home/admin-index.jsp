<%@page import="com.jmt.pojo.MenuUser"%>
<%@page import="com.jmt.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>警民通后台管理平台</title>
<meta name="description" content="这是一个form页面">
<meta name="keywords" content="form">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=basePath%>/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=basePath%>/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="<%=basePath%>/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/admin.css">
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user=(User)session.getAttribute("user");
 %>
</head>
<body>
<script  src="<%=basePath%>/js/jquery-1.8.3.min.js"></script>
<script >
$(document).ready(function(){
var dis=$("${menu.id}").val();
	$("[name=dispaly]").click(function(){
		$("[name=isShow]").fadeToggle();
	});
});

</script>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

	<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<strong>警民通</strong> <small>后台管理平台</small>
	</div>

	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
	</button>

	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

		<ul
			class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<li><a href="javascript:;"><span class="am-icon-envelope-o"></span>
					收件箱 <span class="am-badge am-badge-warning">3</span></a></li>
			<li class="am-dropdown" data-am-dropdown><a
				class="am-dropdown-toggle" data-am-dropdown-toggle
				href="javascript:;"> <span class="am-icon-users"></span>部门管理员 <span
					class="am-icon-caret-down"></span>

			</a>
				<ul class="am-dropdown-content">
					<li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
					<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
					<li><a href="loginout"><span class="am-icon-power-off"></span>
							退出</a></li>
				</ul></li>
			<li class="am-hide-sm-only"><a href="javascript:;"
				id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span
					class="admin-fullText">开启全屏</span></a></li>
		</ul>
	</div>
	</header>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
			<div class="am-offcanvas-bar admin-offcanvas-bar">
		<!-- =========================================================== -->
		
	<c:set var="firstMenu" value="true" />
	<c:forEach items="${menuUserlist}" var="menu" varStatus="idxStatus">
		<c:if
			test="${menu.parent.id eq (not empty param.parentId ? param.parentId:'1')&&menu.isShow eq '1'}">
			<div class="accordion-group" id="${menu.id}">
				<div class="accordion-heading" name="dispaly" >
					<%-- <a class="accordion-toggle" data-toggle="collapse"
						data-parent="#menu-${param.parentId}"
						data-href="#collapse-${menu.id}" href="#collapse-${menu.id}"
						title="${menu.remarks}"> --%><i 
						class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;${menu.name}</a>
				</div>
				<div id="collapse-${menu.id}" 
					class="accordion-body collapse ${not empty firstMenu && firstMenu ? 'in' : ''}">
					<div class="accordion-inner" >
						<ul class="nav nav-list">
							<c:forEach items="${menuUserlist}" var="menu2">
								<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
									<li name="isShow"><a data-href=".menu3-${menu2.id}"
										href="<%=basePath%>${not empty menu2.href ? menu2.href : '/404'}"
										target="${not empty menu2.target ? menu2.target : 'mainFrame'}"><i
											class="icon-${not empty menu2.icon ? menu2.icon : 'circle-arrow-right'}"></i>&nbsp;${menu2.name}</a>
										<ul class="nav nav-list hide"
											style="margin:0;padding-right:0;">
											
										</ul></li>
									<c:set var="firstMenu" value="false" />
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>	
		<!-- =============================================================== -->		
		
					<%--  <li class="admin-parent"><c:if test="${not empty menuUserlist}">
					
							<c:forEach items="${menuUserlist}" var="list" varStatus="varIndex">
								<c:forEach items="${menuUserlist}" var="list2"  >
															
								<c:if test="${list.id eq list2.parent.id &&list2.isShow eq '1'}">
								<c:choose>
									<c:when test="${empty list.href}">

										<a class="am-cf" href="findallChildrenByUserId?id=${list.id}&userId=<%=user.getId()%>"><span
											class="am-icon-file">${list.name}</span><span
											class="am-icon-angle-right am-fr am-margin-right"></span></a>
											<input type="hidden" name="id" value="${list.id}">
									</c:when>
									
									<c:otherwise>
									
											<li><a href="${list.href}"><span
													class="am-icon-file"></span>${list.name}</a></li>
												<input type="hidden" name="id" value="${list.id}">
									</c:otherwise>
								</c:choose>
								</c:if>
							
							</c:forEach>
							</c:forEach>
						</c:if></li> --%>
					<li><a href="loginout"><span class="am-icon-sign-out"></span>
							注销</a></li>
				</ul>
				<div class="am-panel am-panel-default admin-sidebar-panel">
					<div class="am-panel-bd">
						<p>
							<span class="am-icon-bookmark"></span> 公告
						</p>
						<p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
					</div>
				</div>

				<div class="am-panel am-panel-default admin-sidebar-panel">
					<div class="am-panel-bd">
						<p>
							<span class="am-icon-tag"></span> wiki
						</p>
						<p>Welcome to the Amaze UI wiki!</p>
					</div>

				</div>

			</div>
		</div>

		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
			
			</div>
			<footer class="admin-content-footer">
			<hr>
			<p class="am-padding-left">
				© 2015-2017,版权所有 北京正信方达信息技术有限公司 </br> Ver 1.0 build 20140709
			</p>
			</footer>
		</div>
		<!-- content end -->

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/app.js"></script>
</body>
</html>
