<%@page import="com.jmt.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="<%=basePath%>/css/layim.css">
<script >
/* function close_this(){
document.getElementById("doc-modal-1").style.display="none";
} */

</script>


</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
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
			<%-- <shiro:hasRole name="部门管理员"> --%>
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
		<%-- 	</shiro:hasRole> --%>
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
							<li><a
								href="/sys/user/info/findUserInfofindUserInfo?id=${user.id}"
								class="am-cf"><span class="am-icon-check"></span> 个人资料<span
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

							<li><a href="sys/role/findAllOffice"><span
									class="am-icon-puzzle-piece"></span>角色管理</a></li>


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
		<div class="admin-content">
			<div class="admin-content-body">
				<form id="roleForm" name="roleForm"
					action="/jmt/role/updateRole.action" method="post">


					<!--  总table-->
					<!--  主table-->
					<table width="99%" border="0" cellspacing="0" cellpadding="0"
						style="margin-left: 4px; margin-top: 0px">
						<tr>
							<!-- left area -->
							<td width="70%" valign="top">
								<div class="framDiv">
									<table id="contentTable"
										class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
										<thead>
											<tr>
												<th><input type="checkbox" class="i-checks"></th>
												<th>角色名称</th>
												<th>英文名称</th>
												<th>归属机构</th>
												<th>数据范围</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>

											<shiro:hasAnyRoles name="管理员,部门管理员">
												<tr>
													<td><input type="checkbox"
														id="caacf61017114120bcf7bf1049b6d4c3" class="i-checks"></td>
													<td><a
														href="<%=basePath%>sys/role/form?id=caacf61017114120bcf7bf1049b6d4c3">部门管理员</a></td>
													<td><a
														href="<%=basePath%>sys/role/form?id=caacf61017114120bcf7bf1049b6d4c3">tech</a></td>
													<td></td>
													<td>所有数据</td>
													<td><shiro:hasPermission name="sys:role:view">
															<a
																href="<%=basePath%>sys/role/form?id=caacf61017114120bcf7bf1049b6d4c3"></i>
																查看</a>
														</shiro:hasPermission> <shiro:hasPermission name=" sys:role:edit">
															<a
																href="<%=basePath%>/sys/role/edit?id=caacf61017114120bcf7bf1049b6d4c3"></i>
																修改</a>
														</shiro:hasPermission> <shiro:hasPermission name=" sys:role:del">
															<a
																href="<%=basePath%>sys/role/del?id=caacf61017114120bcf7bf1049b6d4c3"
																onclick="return confirmx('确认要删除该角色吗？', this.href)"
																class="btn  btn-danger btn-xs"><i
																class="fa fa-trash"></i> 删除</a>
														</shiro:hasPermission> <shiro:hasPermission name="sys:role:auth">
															<%-- <a
																href="<%=basePath%>sys/role/auth?id=caacf61017114120bcf7bf1049b6d4c3&userId=<%=user.getId()%>"
																class="am-btn am-btn-primary"
																data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 225}"><i
																class="fa fa-edit"></i> 权限设置</a> --%>
															<!-- ============创建模态窗口=============== -->
															<button type="button" class="am-btn am-btn-primary" 
																data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 500}">
																权限设置</button>														
															<div class="am-modal am-modal-no-btn" tabindex="-1"
																id="doc-modal-1">
																<div class="am-modal-dialog">
																	<div class="am-modal-hd">
																		权限设置<a href="javascript: void(0)"
																			class="am-close am-close-spin" data-am-modal-close>&times;</a>
																	</div>
																	<div class="am-modal-bd">
																		<iframe class="J_iframe" name="iframe0" width="350px"
																			height="400px"
																			src="<%=basePath%>sys/role/auth?id=caacf61017114120bcf7bf1049b6d4c3&userId=<%=user.getId()%>"
																			frameborder="0"
																			data-id="<%=basePath%>sys/role/auth?id=caacf61017114120bcf7bf1049b6d4c3&userId=<%=user.getId()%>"
																			seamless></iframe>
																	</div>
																	<span class="layui-layer-setwin"><a
																		class="layui-layer-min" href="javascript:;"><cite></cite></a><a
																		class="layui-layer-ico layui-layer-max"
																		href="javascript:;"></a><a
																		class="layui-layer-ico layui-layer-close layui-layer-close1"
																		href="javascript:;"></a></span>
																	<div class="layui-layer-btn">
																		<input type="button" value="确定">
																		<input type="button" value="关闭" data-am-modal-close>
																	</div>
																</div>
															</div>
															<!-- =========================== -->
														</shiro:hasPermission> <shiro:hasPermission name="sys:role:assign">
															<a
																href="<%=basePath%>sys/role/assign?id=caacf61017114120bcf7bf1049b6d4c3"
																class="btn  btn-warning btn-xs"><i
																class="glyphicon glyphicon-plus"></i> 分配用户</a>
														</shiro:hasPermission></td>
												</tr>
											</shiro:hasAnyRoles>
											<shiro:hasRole name="管理员">
												<tr>
													<td><input type="checkbox"
														id="1c54e003c1fc4dcd9b087ef8d48abac3" class="i-checks"></td>
													<td><a
														href="<%=basePath%>sys/role/form?id=1c54e003c1fc4dcd9b087ef8d48abac3">管理员</a></td>
													<td><a
														href="<%=basePath%>sys/role/form?id=1c54e003c1fc4dcd9b087ef8d48abac3">system</a></td>
													<td></td>
													<td>所有数据</td>
													<td><shiro:hasPermission name="sys:role:view">
															<a
																href="<%=basePath%>sys/role/form?id=1c54e003c1fc4dcd9b087ef8d48abac3"></i>
																查看</a>
														</shiro:hasPermission> <shiro:hasPermission name=" sys:role:edit">
															<a
																href="<%=basePath%>sys/role/edit?id=1c54e003c1fc4dcd9b087ef8d48abac3""></i>
																修改</a>
														</shiro:hasPermission> <shiro:hasPermission name=" sys:role:del">
															<a
																href="<%=basePath%>sys/role/del?id=1c54e003c1fc4dcd9b087ef8d48abac3"
																onclick="Isdel()"
																class="btn  btn-danger btn-xs"><i
																class="fa fa-trash"></i> 删除</a>
														</shiro:hasPermission> <shiro:hasPermission name="sys:role:auth">
															<a
																href="<%=basePath%>sys/role/auth?id=1c54e003c1fc4dcd9b087ef8d48abac3&userId=<%=user.getId()%>"
																class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>
																权限设置</a>
														</shiro:hasPermission> <shiro:hasPermission name="sys:role:assign">
															<a
																href="<%=basePath%>sys/role/assign?id=1c54e003c1fc4dcd9b087ef8d48abac3"
																class="btn  btn-warning btn-xs"><i
																class="glyphicon glyphicon-plus"></i> 分配用户</a>
														</shiro:hasPermission></td>
												</tr>
											</shiro:hasRole>
											<shiro:hasAnyRoles name="一般用户,管理员,部门管理员,公司管理员">
											<tr>
												<td><input type="checkbox"
													id="91766cc228e34269a65f0564ba956bd7" class="i-checks"></td>
												<td><a href="<%=basePath%>sys/role/form?id=91766cc228e34269a65f0564ba956bd7">一般用户
												</a></td>
												<td><a href="<%=basePath%>sys/role/form?id=91766cc228e34269a65f0564ba956bd7">common</a></td>
												<td></td>
												<td>仅本人数据</td>
												<td><a
													href="<%=basePath%>sys/role/form?id=91766cc228e34269a65f0564ba956bd7"><i
														class="fa fa-search-plus"></i> 查看</a> <a
													href="<%=basePath%>sys/role/edit?id=91766cc228e34269a65f0564ba956bd7"></i>
														修改</a> <a
													href="<%=basePath%>sys/role/del?id=91766cc228e34269a65f0564ba956bd7"
													onclick="return confirmx('确认要删除该角色吗？', this.href)"
													class="btn  btn-danger btn-xs"><i class="fa fa-trash"></i>
														删除</a> <a
													href="<%=basePath%>sys/role/auth?id=91766cc228e34269a65f0564ba956bd7&userId=<%=user.getId()%>"
													class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>
														权限设置</a> <a
													href="<%=basePath%>sys/role/assign?id=91766cc228e34269a65f0564ba956bd7"
													class="btn  btn-warning btn-xs"><i
														class="glyphicon glyphicon-plus"></i> 分配用户</a></td>
											</tr>
											</shiro:hasAnyRoles>
											<shiro:hasAnyRoles name="管理员,总公司管理员">
											<tr>
												<td><input type="checkbox"
													id="dace0cab49a7428584eb57c163f45082" class="i-checks"></td>
												<td><a href="<%=basePath%>sys/role/form?id=dace0cab49a7428584eb57c163f45082">总公司管理员</a></td>
												<td><a href="<%=basePath%>sys/role/form?id=dace0cab49a7428584eb57c163f45082">zgly</a></td>
												<td></td>
												<td>所在公司及以下数据</td>
												<td><shiro:hasPermission name="sys:role:view">
														<a
															href="<%=basePath%>sys/role/form?id=dace0cab49a7428584eb57c163f45082"></i>
															查看</a>
													</shiro:hasPermission> <shiro:hasPermission name=" sys:role:edit">
														<a
															href="<%=basePath%>sys/role/edit?id=dace0cab49a7428584eb57c163f45082"></i>
															修改</a>
													</shiro:hasPermission> <shiro:hasPermission name=" sys:role:del">
														<a
															href="<%=basePath%>sys/role/del?id=dace0cab49a7428584eb57c163f45082"
															onclick="return confirmx('确认要删除该角色吗？', this.href)"
															class="btn  btn-danger btn-xs"><i class="fa fa-trash"></i>
															删除</a>
													</shiro:hasPermission> <shiro:hasPermission name="sys:role:auth">
														<a
															href="<%=basePath%>sys/role/auth?id=dace0cab49a7428584eb57c163f45082&userId=<%=user.getId()%>"
															class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>
															权限设置</a>
													</shiro:hasPermission> <shiro:hasPermission name="sys:role:assign">
														<a
															href="<%=basePath%>sys/role/assign?id=dace0cab49a7428584eb57c163f45082"
															class="btn  btn-warning btn-xs"><i
															class="glyphicon glyphicon-plus"></i> 分配用户</a>
													</shiro:hasPermission></td>
											</tr>
											</shiro:hasAnyRoles>

										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right">
								<!-- <table width="780px" border="0" cellspacing="0" cellpadding="0">
									空行
									<tr>
										<td height="10px"></td>
									</tr>
									<tr>
										<td><span class="spanred">
												注:角色修改完成后，与该角色关联的账户需重新登录方可生效</span>&nbsp;&nbsp; <input
											type="button" class="btnyh" id="btnSave"
											onclick="return subData();" value="保  存" /> <input
											type="button" class="btnyh" id="btnCancel"
											onclick="window.location.href='>/jmt/role/queryRole.action?order=create_date';"
											value="取  消" /></td>
									</tr>
								</table>  --><!--  左侧table-->
							</td>
						</tr>
					</table>
				</form>


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
			<script src="<%=basePath%>/js/jquery.min.js"></script>
			<!--<![endif]-->
			<script src="<%=basePath%>/js/amazeui.min.js"></script>
			<script src="<%=basePath%>/js/app.js"></script>
			<script src="<%=basePath%>/js/layer.min.js"></script>
			<script src="<%=basePath%>/js/layim.js"></script>
</body>
</html>
