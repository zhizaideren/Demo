<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<li><a href="/sys/user/info/findUserInfofindUserInfo?id=${user.id}" class="am-cf"><span
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
		<div class="admin-content">
			<div class="admin-content-body">
				<form id="RoleForm" name="RoleForm"
					action="/jmt/role/queryRole.action" method="post">


					<input type="hidden" name="selRoleName" value="" /> <input
						type="hidden" name="selRoleUserLoginName" value="" />
					<table width="99%" border="0" cellspacing="0" cellpadding="0"
						style="margin-left: 4px; margin-top: 0px">
						<!-- 空行 -->
						<tr>
							<td></td>
						</tr>

						<tr>
							<td>
								<div class="box">

									<div class="right">

										<input type="button" value="添加" class="btnstyle"
											style="margin-right:5px;margin-top:-2px"
											onclick="location.href='/jmt/role/editRole.action?order=';" />

										<input type="button" value="删除"
											style="margin-right:12px;margin-top:-2px" class="btnstyle"
											onclick="deleteRole();" />
									</div>

									<span class="kuaiju">快速搜索</span> <input type="text"
										id="keyword" value="" name="keyword" class="jianju"
										style="height: 15px;" /> <img src="/jmt/images/search.jpg"
										onclick="query();" style="margin-left:5px"> <a href="#"
										class="jianju" onclick="extQueryDlg();">高级</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="sbox">
									<div class="cont">
										<!-- information area -->
										<div id="dataList">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0" class="tab2" id="myTable">
												<thead>
													<tr height="28" class="biaoti">
														<td width="8%" class="biaoti"><input type="checkbox"
															id="chkAll" name="chkAll" class="check-box not_checked" />
														</td>
														<th width="25%" class="biaoti">用户名称</th>
														<th width="15%" class="biaoti">登录名</th>
														<th width="35%" class="biaoti">角色</th>
														<th width="25%" class="biaoti">状态</th>
														<th width="25%" class="biaoti">邮箱</th>
													</tr>
												</thead>
												<tbody>

													<!--<input type="hidden" name="roleId" id="roleId"
											value="411" /> -->
											<c:forEach items="${officeList}" var="officeList">
													<tr>
														<td class="biaocm" valign="middle"><input
															type="checkbox" name="id" id="${officeList.id}" value="${officeList.id}"
															class="check-box" /></td>
														<td valign="middle"><a
															href="/jmt/role/editRole.action?roleId=${officeList.id}">${officeList.name}</a></td>
															
														<td valign="middle">  <fmt:formatDate value="${officeList.createDate}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />  </td>
															
														<td valign="middle" align="center"></td>
														<td valign="middle" align="center"><img alt="拷贝角色"
															title="拷贝角色" class="hand" src="/jmt/images/copy.png"
															onclick="copyRoleDlg('411');"></td>
													</tr>
											</c:forEach>
													
													
												</tbody>
												<tr>
													<td colspan="5" width="100%"><script
															type="text/javascript">
														function check() {
															if (document
																	.getElementById("keyword")) {
																var checkVal = "";
																if (checkVal == ""
																		|| checkVal == null) {
																	document
																			.getElementById("keyword").value = "";
																}
															}
														}

														function changeRecord(
																num) {
															check();
															document
																	.getElementById('startIndex').value = num;
															document.forms[0]
																	.submit();
														}
														function gopage(lastnum) {
															var page = document
																	.getElementById('page').value;

															var num = parseInt(page * 15)
																	- parseInt(15);

															//if(num>lastnum)num=lastnum;
															if (num > lastnum) {
																alert("错误页数");
																return false;
															}
															var regex = /^\d$/;
															if (regex
																	.test(lastnum)) {
																num = 0;
															}
															if (num < 0)
																num = 0;

															document
																	.getElementById('startIndex').value = num;
															document.forms[0]
																	.submit();
														}
													</script>
														<table align="right">
															<tr>
																<td style="padding-top:2px">共282记录 <input
																	type="hidden" name="startIndex" id="startIndex"
																	value="0"> <input type="hidden"
																	name="lastIndex" id="lastIndex" value='270'>
																</td>
																<td style="padding-top:2px">
																	<!-- 首页 --> 首页


																</td>
																<td style="padding-top:2px">上一页</td>
																<td style="padding-top:2px"><a
																	href="javascript:changeRecord('15')">下一页</a></td>
																<td style="padding-top:2px"><a
																	href="javascript:changeRecord('270')">末页</a></td>
																<td style="padding-top:2px"><input type="text"
																	style="width: 30px; height:15px;" name="page" id="page"
																	size="3"
																	onkeyup="this.value=this.value.replace(/[^\d]/g,'')">
																	<input type="button" value="GO" class="btn1"
																	onclick="gopage('270')"> 当前第1/19页</td>
																<td>
															</tr>
														</table></td>
												</tr>
											</table>
										</div>
										<!-- information area -->
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
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
