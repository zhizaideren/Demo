<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>机构管理</title>
<base href="<%=basePath%>">
<meta name="decorator" content="default" />

<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=basePath%>js/template.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.treeTable.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/json2.js"></script>

</head>
<body>
	<div class="wrapper wrapper-content">
		<%-- 	<sys:message content="${message}"/> --%>
		<!-- 工具栏 -->
		<div class="row">
			<div class="col-sm-12">
				<div class="pull-left">
					<%-- <shiro:hasPermission name="sys:office:add">
						<table:addRow url="<%=basePath%>/sys/office/form?parent.id=${office.id}"
							title="机构" width="800px" height="620px" target="officeContent"></table:addRow>
						<!-- 增加按钮 -->
					</shiro:hasPermission> --%>
					<button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="refresh()" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i> 刷新
					</button>
				</div>
			</div>
		</div>
		<table id="treeTable"
			class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
				<tr>
					<th>机构名称</th>
					<th>归属区域</th>
					<th>机构编码</th>
					<th>机构类型</th>
					<th>备注</th>
					<shiro:hasPermission name="sys:office:edit">
						<th>操作</th>
					</shiro:hasPermission>
				</tr>
			</thead>
			<!-- <tbody id="treeTableList"></tbody> -->
			<!-- =================测试======= -->
			<c:forEach items="${list}" var='row'>
			<tr id="${row.id}" pId="${pid}">
			<td><a  href="${pageContext.request.contextPath}/sys/office/form?id=${row.id}" >${row.name}</a></td>
			<td><%-- ${row.area.name} --%></td>
			<td>${row.code}</td>
			<c:if test="${row.type=='1'}">
				<td>公司</td>
			</c:if>
			<c:if test="${row.type=='2'}">
				<td>部门</td>
			</c:if>
			<c:if test="${row.type=='3'}">
				<td>小组</td>
			</c:if>
			
			<td>${row.remarks}</td>
			<td>
				<shiro:hasPermission name="sys:office:view">
					<a href="#" onclick="openDialogView('查看机构', '${ctx}/sys/office/form?id={{row.id}}','800px', '620px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:edit">
					<a href="#" onclick="openDialog('修改机构', '${ctx}/sys/office/form?id={{row.id}}','800px', '620px', 'officeContent')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:del">
					<a href="${ctx}/sys/office/delete?id={{row.id}}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:add">
					<a href="#" onclick="openDialog('添加下级机构', '${ctx}/sys/office/form?parent.id={{row.id}}','800px', '620px', 'officeContent')" class="btn  btn-primary btn-xs"><i class="fa fa-plus"></i> 添加下级机构</a>
				</shiro:hasPermission>
			</td>
		</tr>
			</c:forEach>
			<!-- <!-- ===================================== -->
		</table>
	</div>
	<!-- 以下方法不再使用 -->
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a  href="#" onclick="openDialogView('查看机构', '${ctx}/sys/office/form?id={{row.id}}','800px', '620px')">{{row.name}}</a></td>
			<td>{{row.area.name}}</td>
			<td>{{row.code}}</td>
			<td>{{dict.type}}</td>
			<td>{{row.remarks}}</td>
			<td>
				<shiro:hasPermission name="sys:office:view">
					<a href="#" onclick="openDialogView('查看机构', '${ctx}/sys/office/form?id={{row.id}}','800px', '620px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:edit">
					<a href="#" onclick="openDialog('修改机构', '${ctx}/sys/office/form?id={{row.id}}','800px', '620px', 'officeContent')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:del">
					<a href="${ctx}/sys/office/delete?id={{row.id}}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="sys:office:add">
					<a href="#" onclick="openDialog('添加下级机构', '${ctx}/sys/office/form?parent.id={{row.id}}','800px', '620px', 'officeContent')" class="btn  btn-primary btn-xs"><i class="fa fa-plus"></i> 添加下级机构</a>
				</shiro:hasPermission>
			</td>
		</tr>
	</script>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var tpl = $("#treeTableTpl").html().replace(
								/(\/\/\<!\-\-)|(\/\/\-\->)/g, "");
						var data = ${fns:toJson(list)}, rootId = "${not empty office.id ? office.id : '0'}";
						addRow("#treeTableList",1 /* tpl */,1 /* data */, rootId, true);
						$("#treeTable").treeTable({
							expandLevel : 5
						});
					});
	function addRow(list, tpl, data, pid, root) {
		for (var i = 0; i < data.length; i++) {
			var row = data[i];
			if ((${fns:jsGetVal('row.parentId')}) == pid) {
				$(list)
						.append(
								Mustache
										.render(
												tpl,
												{
													dict : {
														type : getDictLabel(
																${fns:toJson(fns:getDictList('sys_office_type'))},
																row.type)
													},
													pid : (root ? 0 : pid),
													row : row
												}));
				addRow(list, tpl, data, row.id);
			}
		}
	}
	function refresh() {//刷新或者排序，页码不清零

		window.location = "${ctx}/sys/office/list";
	}
</script>
</html>