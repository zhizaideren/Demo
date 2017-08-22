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
<%@ taglib tagdir="/WEB-INF/tags/" prefix="sys"%>
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
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/template.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.treeTable.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.treeTable.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/amazeui.ie8polyfill.min.js"></script>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
	<script type="text/javascript"></script>
	<script>
	
	</script>
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
			<shiro:hasRole name="部门管理员">
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
			</shiro:hasRole>
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
				<form id="inputForm" modelAttribute="role" name="roleForm"
					action="/jmt/role/updateRole.action" method="post">
					<form:hidden path="id" />

					<!--  总table-->
					<!--  主table-->
					<table width="99%" border="0" cellspacing="0" cellpadding="0"
						style="margin-left: 4px; margin-top: 0px">
						<tr>
							<!-- left area -->
							<td width="70%" valign="top">
								<div class="framDiv">



									<table
										class="am-table am-table-bordered am-table-striped am-table-compact">
										<thead>
											<tr>
												<th>归属机构</th>
												<th>角色名称</th>
												<th>英文名称</th>
												<th>角色类型</th>
												<th>是否系统数据</th>
												<th>是否可用</th>
												<th>数据范围</th>
												<th>备注</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<%-- <input id="office" onclick="onShow()" type="text" name="officeId"
													value="${roleMenu.office.id}"> --%> <%-- <sys:treeselect
														id="office" name="office.id" value="${role.office.id}"
														labelName="office.name" labelValue="${role.office.name}"
														title="机构" url="${pageContext.request.contextPath}/jsp/home/office/officeTreeData.jsp"
														cssClass="form-control required" /> --%> <%-- <iframe id="officeContent" name="officeContent" src="${pageContext.request.contextPath}/sys/office/treeData" width="100%" height="91%" frameborder="0"></iframe> --%>
												<!-- 创建模态窗口 -->
												<input id="office"  type="hidden" name="officeId"
													value="${roleMenu.office.id}">
													<button type="button" class="am-btn am-btn-primary" 
																data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 500}">
																河南省公安厅</button>														
															<div class="am-modal am-modal-no-btn" tabindex="-1"
																id="doc-modal-1">
																<div class="am-modal-dialog">
																	<div class="am-modal-hd">
																		机构选择<a href="javascript: void(0)"
																			class="am-close am-close-spin" data-am-modal-close>&times;</a>
																	</div>
																	<div class="am-modal-bd">
																		<iframe class="J_iframe" name="iframe0" width="350px"
																			height="400px"
																			src="${pageContext.request.contextPath}/jsp/home/office/officeTreeData.jsp"
																			frameborder="0"
																			data-id="${pageContext.request.contextPath}/jsp/home/office/officeTreeData.jsp"
																			seamless></iframe>
																	</div>
																	<span class="layui-layer-setwin"><a
																		class="layui-layer-min" href="javascript:;"><cite></cite></a><a
																		class="layui-layer-ico layui-layer-max"
																		href="javascript:;"></a><a
																		class="layui-layer-ico layui-layer-close layui-layer-close1"
																		href="javascript:;"></a></span>
																	
																</div>
															</div>
												<!-- 上面是创建模态窗口 -->
												</td>
												<td><input type="text" name="name"
													value="${roleMenu.name}" readonly="readonly" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 400, height: 500}"></td>
												<td><input type="text" name="enname"
													value="${roleMenu.enname}" readonly="readonly"></td>
												<td><select id="roleMenu.roleType" name="roleType">

														<c:if test="${roleMenu.roleType=='security-role'}">
															<option value="security-role" selected="selected">管理角色</option>
														</c:if>
														<c:if test="${roleMenu.roleType=='assignment'}">
															<option value="assignment" selected="selected">管理角色</option>
														</c:if>
														<c:if test="${roleMenu.roleType=='user'}">
															<option value="user" selected="selected">普通角色</option>
														</c:if>
												</select></td>
												<td><select name="sysData">
														<c:if test="${roleMenu.sysData=='1'}">
															<option value="1" >是</option>
														</c:if>
														<c:if test="${roleMenu.sysData=='0'}">
															<option value="0">否</option>
														</c:if>
												</select></td>
												<td><select name="useable">
														<c:if test="${roleMenu.useable=='1'}">
															<option value="1">是</option>
														</c:if>
														<c:if test="${roleMenu.useable=='0'}">
															<option value="0">否</option>
														</c:if>
												</select></td>
												<td><select id="dataScope" name="dataScope"
													class="form-control ">
														<c:if test="${roleMenu.dataScope=='1'}"></c:if>
														<option value="1" selected="selected">所有数据</option>
														<c:if test="${roleMenu.dataScope=='2'}">
															<option value="2" selected="selected">所在公司及以下数据</option>
														</c:if>
														<c:if test="${roleMenu.dataScope=='3'}">
															<option value="3" selected="selected">所在公司数据</option>
														</c:if>
														<c:if test="${roleMenu.dataScope=='4'}">
															<option value="4" selected="selected">所在部门及以下数据</option>
														</c:if>
														<c:if test="${roleMenu.dataScope=='5'}">
															<option value="5" selected="selected">所在部门数据</option>
														</c:if>
														<c:if test="${roleMenu.dataScope=='8'}">
															<option value="8" selected="selected">仅本人数据</option>
														</c:if>
														<c:if test="${roleMenu.dataScope=='9'}">
															<option value="9" selected="selected">按明细设置</option>
														</c:if>
												</select></td>
												<td><textarea rows="" cols="" name="remarks">${roleMenu.remarks}</textarea></td>
												<td><input id="back" type="button" value="返回"
													onclick="javascript:history.back(-1);"></br></td>
											</tr>

										</tbody>
									</table>
								</div>
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
			<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<!--<![endif]-->
			<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
			<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
