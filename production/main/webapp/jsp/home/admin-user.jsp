<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>警民通后台管理平台</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=basePath%>/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=basePath%>/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="<%=basePath%>/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/admin.css">
</head>
<body>
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
				href="javascript:;"> <shiro:hasRole name="部门管理员">
						<span class="am-icon-users"></span>部门管理员 <span
							class="am-icon-caret-down"></span>
					</shiro:hasRole>
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
				<ul class="am-list admin-sidebar-list">
					<li><a href="jsp/home/admin-index.jsp"><span
							class="am-icon-home"></span> 首页</a></li>
					<li class="admin-parent"><a class="am-cf"
						data-am-collapse="{target: '#collapse-nav'}"><span
							class="am-icon-file"></span> 平台管理 <span
							class="am-icon-angle-right am-fr am-margin-right"></span></a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav">
							<li><a href="findUserInfo?id=${user.id}" class="am-cf"><span
									class="am-icon-check"></span> 个人资料<span
									class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
							<li><a href="admin-help.html"><span
									class="am-icon-puzzle-piece"></span> 首页图文新闻管理</a></li>
							<li><a href="admin-gallery.html"><span
									class="am-icon-th"></span> 文本消息管理<span
									class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
							<li><a href="admin-log.html"><span
									class="am-icon-calendar"></span>警情发布管理</a></li>
							<li><a href="admin-404.html"><span class="am-icon-bug">消息推送历史记录</span>
							</a></li>
							<li><a href="admin-gallery.html"><span
									class="am-icon-th">消息推送</span> <span
									class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
							<li><a href="admin-log.html"><span
									class="am-icon-calendar">DB更新</span></a></li>


						</ul></li>
					<li><a href="admin-table.html"><span class="am-icon-table"></span>
							用户管理</a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav">
							<li><a href="findUserInfo?id=${user.id}" class="am-cf"><span
									class="am-icon-check"></span>账户管理<span
									class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
									<shiro:hasRole name="部门管理员">
							<li><a href="sys/role/findAllOffice"><span
									class="am-icon-puzzle-piece"></span>角色管理</a></li>
									</shiro:hasRole>
									<shiro:hasRole name="admin">
							<li><a href="sys/role/findAllOffice"><span
									class="am-icon-puzzle-piece"></span>角色管理</a></li>
									</shiro:hasRole>
							<li><a href="admin-gallery.html"><span
									class="am-icon-th"></span>策略管理</a></li>
						</ul></li>
					<li><a href="admin-form.html"><span
							class="am-icon-pencil-square-o"></span> 审计管理</a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav">
							<li><a href="findUserInfo?id=${user.id}" class="am-cf"><span
									class="am-icon-check"></span>内部审核<span
									class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
						</ul></li>
					<li><a href="admin-form.html"><span
							class="am-icon-pencil-square-o"></span> 搭(乘)车备案</a>
						<ul class="am-list am-collapse admin-sidebar-sub am-in"
							id="collapse-nav">
							<li><a href="findUserInfo?id=${user.id}" class="am-cf"><span
									class="am-icon-check"></span>备案信息管理<span
									class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
						</ul></li>
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
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal
							information</small>
					</div>
				</div>

				<hr />
	
				<div class="am-g">

					<div class="am-u-sm-12 am-u-md-8">
						<form class="am-form am-form-horizontal" action="updateUserInfo">
						<input type="hidden" name="id" value="${user.id}">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">真实姓名：</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" name="name" value="${user.name}">

								</div>
							</div>

							<div class="am-form-group">
								<label for="user-email" class="am-u-sm-3 am-form-label">邮件地址：</label>
								<div class="am-u-sm-9">
									<input type="email" id="user-email" name="email" value="${user.email}">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-phone" class="am-u-sm-3 am-form-label">手机号码</label>
								<div class="am-u-sm-9">
									<input type="tel" id="user-phone" name="phone" value="${user.phone}">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-QQ" class="am-u-sm-3 am-form-label">固定电话</label>
								<div class="am-u-sm-9">
									<input type="number"   name="mobile"
										value="${user.mobile}">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-weibo" class="am-u-sm-3 am-form-label">通信地址</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-weibo" value="${user.loginName}">
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">备注：</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="user-intro" placeholder="输入备注"></textarea>

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">登录信息：</label></br>
								<div class="am-u-sm-9">
									用户名：${user.loginName}</br> 旧密码：<input type="password"
										value="${user.password}"></br> 新密码：<input></br> 确认密码：<input></br>

								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<button type="submit" class="am-btn am-btn-primary">保存修改</button>
									<button type="button" class="am-btn am-btn-primary">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
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
