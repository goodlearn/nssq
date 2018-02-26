<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员信息管理</title>
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
		<li class="active"><a href="${ctx}/sys/userInfo/">户主信息列表</a></li>
		<shiro:hasPermission name="sys:userInfo:edit"><li><a href="${ctx}/sys/userInfo/form">户主信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="userInfo" action="${ctx}/sys/userInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idCard" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>	
			<li><label>电话：</label>
				<form:input path="telphone" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>婚姻状况：</label>
				<form:select path="merriageKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('merriageKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>社会保险：</label>
				<form:checkboxes path="insuranceKey" items="${fns:getDictList('insuranceKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>身份证号</th>
				<th>性别</th>
				<th>婚姻状况</th>
				<th>电话</th>
				<th>更新时间</th>
				<shiro:hasPermission name="sys:userInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="userInfo">
			<tr>
				<td>
					${userInfo.name}
				</td>
				<td>
					${userInfo.idCard}
				</td>
				<td>
					${fns:getDictLabel(userInfo.gender, 'sex', '')}
				</td>
				<td>
					${fns:getDictLabel(userInfo.merriageKey, 'merriageKey', '')}
				</td>
				<td>
					${userInfo.telphone}
				</td>
				<td>
					<fmt:formatDate value="${userInfo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${userInfo.remarks}
				</td>
				<shiro:hasPermission name="sys:userInfo:edit"><td>
				    <a href="${ctx}/sys/userInfo/detail?id=${userInfo.id}">详细信息</a>
					<a href="${ctx}/sys/relationshipInfo/addRf?userInfoId=${userInfo.id}">添加关系</a>
    				<a href="${ctx}/sys/userInfo/form?id=${userInfo.id}">修改</a>
					<a href="${ctx}/sys/userInfo/delete?id=${userInfo.id}" onclick="return confirmx('确认要删除该人员信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>