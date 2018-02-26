<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>关系信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/relationshipInfo/">关系信息列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="relationshipInfo" action="${ctx}/sys/relationshipInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>关系</th>
				<th>姓名</th>
				<th>身份证号</th>
				<th>性别</th>
				<th>电话</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sys:relationshipInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="relationshipInfo">
			<tr>
				<td>
					${fns:getDictLabel(relationshipInfo.relationKey, 'relationKey', '')}
				</td>
				<td>
					${relationshipInfo.name}
				</td>
				<td>
					${relationshipInfo.idCard}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.gender, 'sex', '')}
				</td>
				<td>
					${relationshipInfo.telphone}
				</td>
				<td>
					<fmt:formatDate value="${relationshipInfo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${relationshipInfo.remarks}
				</td>
				<shiro:hasPermission name="sys:relationshipInfo:edit"><td>
    				<a href="${ctx}/sys/relationshipInfo/form?id=${relationshipInfo.id}">修改</a>
					<a href="${ctx}/sys/relationshipInfo/delete?id=${relationshipInfo.id}" onclick="return confirmx('确认要删除该关系信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>