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
<link rel="stylesheet" href="<%=basePath%>/css/zTreeStyle.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.exedit-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script>
<script type="text/javascript">
	  	var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }

		  return false;
		}
			
		$(document).ready(function(){
			$("#name").focus();
			validateForm = $("#inputForm").validate({
			
				submitHandler: function(form){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			//设置ztree的参数配置
			var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
					data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}}};
			
			// 用户-菜单
			var zNodes=[
					<c:forEach items="${menuUserlist}" var="menu">{id:"${menu.id}", pId:"${not empty menu.parent.id?menu.parent.id:0}", name:"${not empty menu.parent.id?menu.name:'功能菜单'}"},
		            </c:forEach>];
			// 初始化树结构
			var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			// 不选择父节点
			tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			
			// 默认选择节点
			var ids = "${role.menuIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			} 
			// 默认展开全部节点
			tree.expandAll(true);
		
		});		
	</script>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
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
			<div class="admin-content-body">
			<%-- 	<c:forEach items="${menuUserlist}" var="menu" varStatus="idxStatus">
		<c:if
			test="${menu.parent.id eq (not empty param.parentId ? param.parentId:'1')&&menu.isShow eq '1'}">
			<div class="accordion-group" id="${menu.id}">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse"
						data-parent="#menu-${param.parentId}"
						data-href="#collapse-${menu.id}" href="#collapse-${menu.id}"
						title="${menu.remarks}"><i
						class="icon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;${menu.name}</a>
				</div>
				<div id="collapse-${menu.id}"
					class="accordion-body collapse ${not empty firstMenu && firstMenu ? 'in' : ''}">
					<div class="accordion-inner">
						<ul class="nav nav-list">
							<c:forEach items="${menuUserlist}" var="menu2">
								<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
									<li><a data-href=".menu3-${menu2.id}"
										href="${not empty menu2.href ? menu2.href : '/404'}"
										target="${not empty menu2.target ? menu2.target : 'mainFrame'}"><i
											class="icon-${not empty menu2.icon ? menu2.icon : 'circle-arrow-right'}"></i>&nbsp;${menu2.name}</a>
										<ul class="nav nav-list hide"
											style="margin:0;padding-right:0;">
											<c:forEach items="${menuUserlist}" var="menu3">
												<c:if
													test="${menu3.parent.id eq menu2.id&&menu3.isShow eq '1'}">
													<li class="menu3-${menu2.id} hide"><a
														href="${not empty menu3.href ? menu3.href : '/404'}"
														target="${not empty menu3.target ? menu3.target : 'mainFrame'}"><i
															class="icon-${not empty menu3.icon ? menu3.icon : 'circle-arrow-right'}"></i>&nbsp;${menu3.name}</a></li>
												</c:if>
											</c:forEach>
										</ul></li>
									<c:set var="firstMenu" value="false" />
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach> --%>
	<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/role/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<input  name="office.id" type="hidden" value="${role.officeId}">
		<input  name="office.name" type="hidden" value="${name}">
	
		<input  name="name" type="hidden" value="${role.name}">
		<input  name="oldName" type="hidden" value="${role.name}">
		<input  name="enname" type="hidden" value="${role.enname}">
		<input  name="oldEnname" type="hidden" value="${role.enname}">
		<input  name="roleType" type="hidden" value="${role.roleType}">
		<input  name="sysData" type="hidden" value="${role.sysData}">
		<input  name="useable" type="hidden" value="${role.useable}">
		<input  name="dataScope" type="hidden" value="${role.dataScope}">
		<input  name="remarks" type="hidden" value="${role.remarks}">
		<div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
					<form:hidden path="menuIds"/>
		<form:hidden path="officeIds"/>
	</form:form>
				<!-- content end -->
		</div>
			</div>

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
</html>
