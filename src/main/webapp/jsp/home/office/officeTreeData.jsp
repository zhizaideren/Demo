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
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>机构管理</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=basePath%>/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=basePath%>/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="<%=basePath%>/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>/css/layim.css">
<link rel="stylesheet" href="<%=basePath%>/css/zTreeStyle.css">
<%-- <link rel="stylesheet" href="<%=basePath%>/css/officeIndex.css"> --%>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/template.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.treeTable.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/amazeui.ie8polyfill.min.js"></script>
<style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}

#left{
	float: left;
}
	</style>

</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
	<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

	


	<!-- <div class="am-cf admin-main">

		sidebar start
		
		sidebar end
		content start
		<div class="admin-content">
		<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-content"> -->

	<div id="content" class="row">
		<!-- <div id="left" style="background-color:#e7eaec" class="col-sm-1"> -->
		<!-- 测试响应式 -->
		<div id="left" style="background-color:#e7eaec" class="am-show-sm-up">
		<!-- 上面class是测试响应式 -->
			<a onclick="refresh()" class="pull-right">
				<i class="fa fa-refresh"></i>
			</a>
			<div id="ztree" class="ztree"></div>
		</div>
		<!-- <div id="right"  class="col-sm-11  animated fadeInRight"> -->
		<!-- 测试响应式 -->
		
	</div>
	<!-- </div>
	</div>
	</div>
	</div> -->
	<script type="text/javascript">
		var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
			callback:{onClick:function(event, treeId, treeNode){
					var id = treeNode.pId == '0' ? '' :treeNode.pId;
					/* $('#officeContent').attr("src","${pageContext.request.contextPath}/sys/office/list?id="+id+"&parentIds="+treeNode.pIds); */
				}
			}
		};
		
		function refreshTree(){
			$.getJSON("${pageContext.request.contextPath}/sys/office/treeData",function(data){
				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
			});
		}
		refreshTree();
		 
		var leftWidth = 300; // 左侧窗口大小
		var htmlObj = $("html"), mainObj = $("#main");
		var frameObj = $("#left, #openClose, #right, #right iframe");
		function wSize(){
			var strs = getWindowSize().toString().split(",");
			htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
			mainObj.css("width","auto");
			frameObj.height(strs[0] );
			var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
			$("#right").width($("#content").width()- leftWidth - $("#openClose").width() -60);
			$(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
		}
	</script>
	<script src="${pageContext.request.contextPath}/js/wsize.min.js" type="text/javascript"></script>
				<!-- content end -->

		<!-- 	</div> -->

			<a href="#"
				class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
				data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

			<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

			<!--[if (gte IE 9)|!(IE)]><!-->
			<%-- <script src="<%=basePath%>js/jquery.min.js"></script> --%>
			<!--<![endif]-->
			<script src="<%=basePath%>js/amazeui.min.js"></script>
			<script src="<%=basePath%>js/app.js"></script>
			<%-- <script src="<%=basePath%>/js/layer.min.js"></script> --%>
			<%-- <script src="<%=basePath%>/js/layim.js"></script> --%>
</body>
</html>
