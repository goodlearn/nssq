<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/recordInfo/">信息列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="recordInfo" action="${ctx}/sys/recordInfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<fieldset>
		<legend>户主信息</legend>
		<table class="table-form">
				<tr>
					<td class="tit">姓名</td>
					<td colspan="2">${recordInfo.name}</td>
					<td class="tit">性别</td>
					<td colspan="2">
						${fns:getDictLabel(recordInfo.gender,'sex','')}
					</td>							
					<td class="tit">登记单位</td>
					<td colspan="2">
						${fns:getDictLabel(recordInfo.regWorkUnitKey,'regWorkUnitKey','')}
					</td>
					<td class="tit">地区属性</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.areaPropKey,'areaPropKey','')}</td>
					<td class="tit">填表人</td>
					<td colspan="2">${recordInfo.preparedName}</td>
				</tr>
				<tr>
					<td class="tit">小组</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.groupKey,'groupKey','')}</td>
					<td class="tit">身份证号</td>
					<td colspan="2">${recordInfo.idCard}</td>
					<td class="tit">出生日期</td>
					<td colspan="2">${recordInfo.birthShow}</td>
					<td class="tit">民族</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.nationKey,'nationKey','')}</td>
					<td class="tit">文化程度</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.cultureKey,'cultureKey','')}</td>
				</tr>
				<tr>
					<td class="tit">政治面貌</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.politicalKey,'politicalKey','')}</td>
					<td class="tit">宗教信仰</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.religionKey,'have_no','')}</td>
					<td class="tit">婚姻状况</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.merriageKey,'merriageKey','')}</td>
					<td class="tit">社会保险</td>
					<td colspan="2">${fns:getDictLabels(recordInfo.insuranceKey,'insuranceKey','')}</td>
					<td class="tit">健康状况</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.healthyKey,'healthyKey','')}</td>
				</tr>
				<tr>
					<td class="tit">残疾等级</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.disableLevelKey,'disableLevelKey','')}</td>
					<td class="tit">职业</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.occupationKey,'occupationKey','')}</td>
					<td class="tit">工作单位</td>
					<td colspan="2">${recordInfo.workUnitKey}</td>
					<td class="tit">居住性质</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.lvingNatureKey,'lvingNatureKey','')}</td>
					<td class="tit">电话</td>
					<td colspan="2">${recordInfo.telphone}</td>
				</tr>
				<tr>
					<td class="tit">家庭住址</td>
					<td colspan="2">${recordInfo.address}</td>
					<td class="tit">户籍地</td>
					<td colspan="2">${recordInfo.domicile}</td>
					<td class="tit">户口性质</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.residenceKey,'residenceKey','')}</td>
					<td class="tit">是否属于流动人口</td>
					<td colspan="2">${fns:getDictLabel(recordInfo.hoboKey,'yes_no','')}</td>
				</tr>
				<tr>
					<td class="tit">低保金额</td>
					<td colspan="2">${recordInfo.allowancesAmount}</td>
					<td class="tit">备注</td>
					<td colspan="3">
						${recordInfo.remarks}
					</td>
				</tr>
			</table>
			<c:if test = "${risNum > 0}">
					<c:forEach items="${recordInfo.ris}" var="rsi" varStatus="status">
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
							<td colspan="2">${rsi.workUnitKey}</td>
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
			<c:if test = "${risNum == 0}">
				<legend>关系信息</legend>
				无关系信息
			</c:if>
		</fieldset>
	</form:form>
</body>
</html>