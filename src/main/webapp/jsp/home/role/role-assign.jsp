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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>分配角色</title>
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
<link rel="stylesheet" href="<%=basePath%>/css/zTreeStyle.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script> --%>

</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
	
	
	<div class="wrapper wrapper-content">
	<div class="container-fluid breadcrumb">
		<div class="row-fluid span12">
			<span class="span4">角色名称: <b>${role.name}</b></span>
			<span class="span4">归属机构: ${role.office.name}</span>
			<span class="span4">英文名称: ${role.enname}</span>
		</div>
		<div class="row-fluid span8">
			<span class="span4">角色类型: ${role.roleType}</span>
			<c:set var="dictvalue" value="${role.dataScope}" scope="page" />
			<%-- <span class="span4">数据范围: ${fns:getDictLabel(dictvalue, 'sys_data_scope', '')}</span> --%>
	<div id="msg" style="color: red">${message}</div>
		</div>
	</div>
	<div class="breadcrumb">
		<form id="assignRoleForm" action="${ctx}/sys/role/assignrole" method="post" class="hide">
			<input type="hidden" name="id" value="${role.id}"/>
			<input id="idsArr" type="hidden" name="idsArr" value=""/>
		</form>
			<button id="assignButton" type="submit"  class="btn btn-outline btn-primary btn-sm" title="添加人员"><i class="fa fa-plus"></i> 添加人员</button>
		<script type="text/javascript">
			$("#assignButton").click(function(){
				
		top.layer.open({
		    type: 2, 
		    area: ['800px', '600px'],
		    title:"选择用户",
	        maxmin: true, //开启最大化最小化按钮
		    content: "${ctx}/sys/role/usertorole?id=${role.id}" ,
		    btn: ['确定', '关闭'],
		    yes: function(index, layero){
    	       var pre_ids = layero.find("iframe")[0].contentWindow.pre_ids;
				var ids = layero.find("iframe")[0].contentWindow.ids;
				if(ids[0]==''){
						ids.shift();
						pre_ids.shift();
					}
					if(pre_ids.sort().toString() == ids.sort().toString()){
						top.$.jBox.tip("未给角色【${role.name}】分配新成员！", 'info');
						return false;
					};
			    	// 执行保存
			    	loading('正在提交，请稍等...');
			    	var idsArr = "";
			    	for (var i = 0; i<ids.length; i++) {
			    		idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
			    	}
			    	$('#idsArr').val(idsArr);
			    	$('#assignRoleForm').submit();
				    top.layer.close(index);
			  },
			  cancel: function(index){ 
    	       }
		}); 
			});
		</script>
	</div>
	</div>
<%-- 	<!--[if lte IE 9]>
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
		</div> --%>
		<!-- sidebar end -->
		<!-- content start -->
		<div class="admin-content">
			<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead><tr><th>归属公司</th><th>归属部门</th><th>登录名</th><th>姓名</th><th>电话</th><th>手机</th><shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.company.name}</td>
				<td>${user.office.name}</td>
				<td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.phone}</td>
				<td>${user.mobile}</td>
				<shiro:hasPermission name="sys:role:edit"><td>
					<a href="<%=basePath%>sys/role/outrole?userId=${user.id}&roleId=${role.id}" 
						onclick="return isDel()">移除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
				
			</div>
		<!-- content end -->
			<!-- <a href="#"
				class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
				data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
 -->
			<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${ctxStatic}/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

			<!--[if (gte IE 9)|!(IE)]><!-->
		<%-- 	<script src="<%=basePath%>js/jquery.min.js"></script> --%>
			<!--<![endif]-->
			<%-- <script src="<%=basePath%>js/amazeui.min.js"></script>
			<script src="<%=basePath%>js/app.js"></script> --%>
</body>
<script >
	function isDel(){
	if(confirm("确认要将用户移除吗？")){
		return true;
	}
	return false;
	};
	
</script>
</html>
