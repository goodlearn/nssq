<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/userInfo/">人员信息列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="userInfo" action="${ctx}/sys/userInfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<fieldset>
		<legend>户主信息</legend>
		<table class="table-form">
				<tr>
					<td class="tit">姓名</td>
					<td colspan="2">${userInfo.name}</td>
					<td class="tit">性别</td>
					<td colspan="2">
						${fns:getDictLabel(userInfo.gender,'sex','')}
					</td>							
					<td class="tit">登记单位</td>
					<td colspan="2">
						${fns:getDictLabel(userInfo.regWorkUnitKey,'regWorkUnitKey','')}
					</td>
					<td class="tit">地区属性</td>
					<td colspan="2">${fns:getDictLabel(userInfo.areaPropKey,'areaPropKey','')}</td>
					<td class="tit">填表人</td>
					<td colspan="2">${rsi.preparedName}</td>
				</tr>
				<tr>
					<td class="tit">小组</td>
					<td colspan="2">${fns:getDictLabel(userInfo.groupKey,'groupKey','')}</td>
					<td class="tit">身份证号</td>
					<td colspan="2">${userInfo.idCard}</td>
					<td class="tit">出生日期</td>
					<td colspan="2">${userInfo.birthShow}</td>
					<td class="tit">民族</td>
					<td colspan="2">${fns:getDictLabel(userInfo.nationKey,'nationKey','')}</td>
					<td class="tit">文化程度</td>
					<td colspan="2">${fns:getDictLabel(userInfo.cultureKey,'cultureKey','')}</td>
				</tr>
				<tr>
					<td class="tit">政治面貌</td>
					<td colspan="2">${fns:getDictLabel(userInfo.politicalKey,'politicalKey','')}</td>
					<td class="tit">宗教信仰</td>
					<td colspan="2">${fns:getDictLabel(userInfo.religionKey,'have_no','')}</td>
					<td class="tit">婚姻状况</td>
					<td colspan="2">${fns:getDictLabel(userInfo.merriageKey,'merriageKey','')}</td>
					<td class="tit">社会保险</td>
					<td colspan="2">${fns:getDictLabels(userInfo.insuranceKey,'insuranceKey','')}</td>
					<td class="tit">健康状况</td>
					<td colspan="2">${fns:getDictLabel(userInfo.healthyKey,'healthyKey','')}</td>
				</tr>
				<tr>
					<td class="tit">残疾等级</td>
					<td colspan="2">${fns:getDictLabel(userInfo.disableLevelKey,'disableLevelKey','')}</td>
					<td class="tit">职业</td>
					<td colspan="2">${fns:getDictLabel(userInfo.occupationKey,'occupationKey','')}</td>
					<td class="tit">工作单位</td>
					<td colspan="2">${userInfo.workUnitKey}</td>
					<td class="tit">居住性质</td>
					<td colspan="2">${fns:getDictLabel(userInfo.lvingNatureKey,'lvingNatureKey','')}</td>
					<td class="tit">电话</td>
					<td colspan="2">${userInfo.telphone}</td>
				</tr>
				<tr>
					<td class="tit">家庭住址</td>
					<td colspan="2">${userInfo.address}</td>
					<td class="tit">户籍地</td>
					<td colspan="2">${userInfo.domicile}</td>
					<td class="tit">企业实体</td>
					<td colspan="2">${fns:getDictLabel(userInfo.enterpriseKey,'enterpriseKey','')}</td>
					<td class="tit">户口性质</td>
					<td colspan="2">${fns:getDictLabel(userInfo.residenceKey,'residenceKey','')}</td>
					<td class="tit">是否属于流动人口</td>
					<td colspan="2">${fns:getDictLabel(userInfo.hoboKey,'yes_no','')}</td>
				</tr>
				<tr>
					<td class="tit">低保金额</td>
					<td colspan="2">${userInfo.allowancesAmount}</td>
					<td class="tit">备注</td>
					<td colspan="3">
						${userinfo.remarks}
					</td>
				</tr>
			</table>
			<c:if test = "${rlsNum > 0}">
					<c:forEach items="${userInfo.rsis}" var="rsi" varStatus="status">
						<legend>关系信息</legend>
						<table class="table-form">
						<tr>
							<td class="tit">姓名</td>
							<td colspan="2">${rsi.name}</td>
							<td class="tit">性别</td>
							<td colspan="2">
								${fns:getDictLabel(rsi.gender,'sex','')}
							</td>							
							<td class="tit">登记单位</td>
							<td colspan="2">
								${fns:getDictLabel(rsi.regWorkUnitKey,'regWorkUnitKey','')}
							</td>
							<td class="tit">地区属性</td>
							<td colspan="2">${fns:getDictLabel(rsi.areaPropKey,'areaPropKey','')}</td>
							<td class="tit">填表人</td>
							<td colspan="2">${rsi.preparedName}</td>
						</tr>
						<tr>
							<td class="tit">小组</td>
							<td colspan="2">${fns:getDictLabel(rsi.groupKey,'groupKey','')}</td>
							<td class="tit">身份证号</td>
							<td colspan="2">${rsi.idCard}</td>
							<td class="tit">出生日期</td>
							<td colspan="2">${rsi.birthShow}</td>
							<td class="tit">民族</td>
							<td colspan="2">${fns:getDictLabel(rsi.nationKey,'nationKey','')}</td>
							<td class="tit">文化程度</td>
							<td colspan="2">${fns:getDictLabel(rsi.cultureKey,'cultureKey','')}</td>
						</tr>
						<tr>
							<td class="tit">政治面貌</td>
							<td colspan="2">${fns:getDictLabel(rsi.politicalKey,'politicalKey','')}</td>
							<td class="tit">宗教信仰</td>
							<td colspan="2">${fns:getDictLabel(rsi.religionKey,'have_no','')}</td>
							<td class="tit">婚姻状况</td>
							<td colspan="2">${fns:getDictLabel(rsi.merriageKey,'merriageKey','')}</td>
							<td class="tit">社会保险</td>
							<td colspan="2">${fns:getDictLabels(rsi.insuranceKey,'insuranceKey','')}</td>
							<td class="tit">健康状况</td>
							<td colspan="2">${fns:getDictLabel(rsi.healthyKey,'healthyKey','')}</td>
						</tr>
						<tr>
							<td class="tit">残疾等级</td>
							<td colspan="2">${fns:getDictLabel(rsi.disableLevelKey,'disableLevelKey','')}</td>
							<td class="tit">职业</td>
							<td colspan="2">${fns:getDictLabel(rsi.occupationKey,'occupationKey','')}</td>
							<td class="tit">工作单位</td>
							<td colspan="2">${userInfo.workUnitKey}</td>
							<td class="tit">居住性质</td>
							<td colspan="2">${fns:getDictLabel(rsi.lvingNatureKey,'lvingNatureKey','')}</td>
							<td class="tit">电话</td>
							<td colspan="2">${rsi.telphone}</td>
						</tr>
						<tr>
							<td class="tit">家庭住址</td>
							<td colspan="2">${rsi.address}</td>
							<td class="tit">户籍地</td>
							<td colspan="2">${rsi.domicile}</td>
							<td class="tit">企业实体</td>
							<td colspan="2">${fns:getDictLabel(rsi.enterpriseKey,'enterpriseKey','')}</td>
							<td class="tit">户口性质</td>
							<td colspan="2">${fns:getDictLabel(rsi.residenceKey,'residenceKey','')}</td>
							<td class="tit">是否属于流动人口</td>
							<td colspan="2">${fns:getDictLabel(rsi.hoboKey,'yes_no','')}</td>
						</tr>
						<tr>
							<td class="tit">低保金额</td>
							<td colspan="2">${rsi.allowancesAmount}</td>
							<td class="tit">关系</td>
							<td colspan="2">${rsi.relationKey}</td>
							<td class="tit">备注</td>
							<td colspan="3">
								${rsi.remarks}
							</td>
						</tr>
						</table>
					</c:forEach>
			</c:if>
			<c:if test = "${rlsNum == 0}">
				<legend>关系信息</legend>
				无关系信息
			</c:if>
		</fieldset>
	</form:form>
</body>
</html>