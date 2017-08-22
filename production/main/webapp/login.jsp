<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>警民通登录界面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="<%=basePath%>/i/favicon.png">
<link rel="stylesheet" href="<%=basePath%>/css/amazeui.min.css" />
<style>
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="am-g">
			<h1>警民通</h1>
			<p>后台管理平台</p>
		</div>
		<hr />
	</div>
	<div class="am-g">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h3 align="center">登录</h3>
			<hr>

			<br> <br>

			<form method="post" class="am-form" action="login">
				<label for="text">用户名:</label> <input type="text" name="loginName"
					id="email" value=""> <br> <label for="password">密码:</label>
				<input type="password" name="password" id="password" value="">${msg}
				<br> <label for="remember-me"> <input id="remember-me"
					type="checkbox"> 记住密码
				</label> <br />
				<div class="am-cf">
					<input type="submit" name="" value="登 录"
						class="am-btn am-btn-primary am-btn-sm am-fl"> <input
						type="submit" name="" value="忘记密码 ^_^? "
						class="am-btn am-btn-default am-btn-sm am-fr">
				</div>
			</form>
			<hr>
			<p align="center">
				© 2015-2017,版权所有 北京正信方达信息技术有限公司 </br> Ver 1.0 build 20140709
			</p>
		</div>
	</div>
</body>
</html>
