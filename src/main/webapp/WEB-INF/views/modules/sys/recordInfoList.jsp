<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>档案信息管理</title>
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
		<li class="active"><a href="${ctx}/sys/recordInfo/">档案信息列表</a></li>
		<shiro:hasPermission name="sys:recordInfo:edit"><li><a href="${ctx}/sys/recordInfo/form">档案信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="recordInfo" action="${ctx}/sys/recordInfo/" method="post" class="breadcrumb form-search">
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
				<th>所属户主</th>
				<th>姓名</th>
				<th>关系</th>
				<th>身份证号</th>
				<th>性别</th>
				<th>婚姻状况</th>
				<th>健康状况</th>
				<th>社会保险状况</th>
				<th>低保金额（元）</th>
				<th>电话</th>
				<th>更新时间</th>
				<shiro:hasPermission name="sys:recordInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="recordInfo">
			<tr>
				<td>
					<c:if test = "${recordInfo.relationshipId != '201802271713'}">
						<a href="${ctx}/sys/recordInfo/detail?id=${recordInfo.relationshipId}">${recordInfo.hzName}</a>
					</c:if>
				</td>
				<td>
					${recordInfo.name}
				</td>
				<td>
					${fns:getDictLabel(recordInfo.relationKey, 'relationKey', '')}
				</td>
				<td>
					${recordInfo.idCard}
				</td>
				<td>
					${fns:getDictLabel(recordInfo.gender, 'sex', '')}
				</td>
				<td>
					${fns:getDictLabel(recordInfo.merriageKey, 'merriageKey', '')}
				</td>
				<td>
					${fns:getDictLabel(recordInfo.healthyKey, 'healthyKey', '')}
					${fns:getDictLabel(recordInfo.disableLevelKey, 'disableLevelKey', '')}
				</td>
				<td>
					${fns:getDictLabels(recordInfo.insuranceKey,'insuranceKey','')}
				</td>
				<td>
					${recordInfo.allowancesAmount}
				</td>
				<td>
					${recordInfo.telphone}
				</td>
				<td>
					<fmt:formatDate value="${recordInfo.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="sys:recordInfo:edit"><td>
    				<c:if test = "${recordInfo.relationshipId == '201802271713'}">
    					<a href="${ctx}/sys/recordInfo/addRf?relationshipId=${recordInfo.id}">添加关系</a>
					    <a href="${ctx}/sys/recordInfo/detail?id=${recordInfo.id}">详细信息</a>
					    <a href="${ctx}/sys/recordInfo/form?id=${recordInfo.id}">修改</a>
					</c:if>
					<c:if test = "${recordInfo.relationshipId != '201802271713'}">
    					 <a href="${ctx}/sys/recordInfo/addRf?id=${recordInfo.id}">修改</a>
					</c:if>
					<a href="${ctx}/sys/recordInfo/delete?id=${recordInfo.id}" onclick="return confirmx('确认要删除该档案信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>