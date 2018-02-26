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
			<li><label>关系：</label>
				<form:select path="relationKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('relationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>登记单位：</label>
				<form:select path="regWorkUnitKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('regWorkUnitKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>地区属性：</label>
				<form:select path="areaPropKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('areaPropKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>填表人：</label>
				<form:input path="preparedName" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>小组：</label>
				<form:select path="groupKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('groupKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>身份证号：</label>
				<form:input path="idCard" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>出生时间：</label>
				<input name="birth" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${relationshipInfo.birth}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>性别：</label>
				<form:select path="gender" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>民族：</label>
				<form:select path="nationKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('nationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>文化程度：</label>
				<form:select path="cultureKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('cultureKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>政治面貌：</label>
				<form:select path="politicalKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('politicalKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>宗教信仰：</label>
				<form:select path="religionKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('have_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>婚姻状况：</label>
				<form:select path="merriageKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('merriageKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>社会保险：</label>
				<form:select path="insuranceKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('insuranceKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>健康状况：</label>
				<form:select path="healthyKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('healthyKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>残疾等级：</label>
				<form:select path="disableLevelKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('disableLevelKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>职业：</label>
				<form:select path="occupationKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('occupationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>居住性质：</label>
				<form:select path="lvingNatureKey" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('lvingNatureKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>电话：</label>
				<form:input path="telphone" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>家庭住址：</label>
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>户籍地：</label>
				<form:input path="domicile" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>关系人编号</th>
				<th>关系</th>
				<th>登记单位</th>
				<th>地区属性</th>
				<th>姓名</th>
				<th>填表人</th>
				<th>小组</th>
				<th>身份证号</th>
				<th>出生时间</th>
				<th>性别</th>
				<th>民族</th>
				<th>文化程度</th>
				<th>政治面貌</th>
				<th>宗教信仰</th>
				<th>婚姻状况</th>
				<th>社会保险</th>
				<th>健康状况</th>
				<th>残疾等级</th>
				<th>职业</th>
				<th>工作单位</th>
				<th>居住性质</th>
				<th>电话</th>
				<th>家庭住址</th>
				<th>户籍地</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sys:relationshipInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="relationshipInfo">
			<tr>
				<td><a href="${ctx}/sys/relationshipInfo/form?id=${relationshipInfo.id}">
					${relationshipInfo.userInfoId}
				</a></td>
				<td>
					${fns:getDictLabel(relationshipInfo.relationKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.regWorkUnitKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.areaPropKey, '', '')}
				</td>
				<td>
					${relationshipInfo.name}
				</td>
				<td>
					${relationshipInfo.preparedName}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.groupKey, '', '')}
				</td>
				<td>
					${relationshipInfo.idCard}
				</td>
				<td>
					<fmt:formatDate value="${relationshipInfo.birth}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.gender, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.nationKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.cultureKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.politicalKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.religionKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.merriageKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.insuranceKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.healthyKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.disableLevelKey, '', '')}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.occupationKey, '', '')}
				</td>
				<td>
					${relationshipInfo.workUnitKey}
				</td>
				<td>
					${fns:getDictLabel(relationshipInfo.lvingNatureKey, '', '')}
				</td>
				<td>
					${relationshipInfo.telphone}
				</td>
				<td>
					${relationshipInfo.address}
				</td>
				<td>
					${relationshipInfo.domicile}
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