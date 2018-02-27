<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>档案信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
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
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/recordInfo/">档案信息列表</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="recordInfo" action="${ctx}/sys/recordInfo/saveArf" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="relationshipId"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">关系：</label>
			<div class="controls">
				<form:select path="relationKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('relationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">登记单位：</label>
			<div class="controls">
				<form:select path="regWorkUnitKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('regWorkUnitKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地区属性：</label>
			<div class="controls">
				<form:select path="areaPropKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('areaPropKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">填表人：</label>
			<div class="controls">
				<form:input path="preparedName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小组：</label>
			<div class="controls">
				<form:select path="groupKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('groupKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idCard" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出生时间：</label>
			<div class="controls">
				<input name="birth" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${relationshipInfo.birth}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:select path="gender" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">民族：</label>
			<div class="controls">
				<form:select path="nationKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('nationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">文化程度：</label>
			<div class="controls">
				<form:select path="cultureKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('cultureKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">政治面貌：</label>
			<div class="controls">
				<form:select path="politicalKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('politicalKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">宗教信仰：</label>
			<div class="controls">
				<form:select path="religionKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('have_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">婚姻状况：</label>
			<div class="controls">
				<form:select path="merriageKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('merriageKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">社会保险：</label>
			<div class="controls">
				<form:checkboxes path="insuranceKey" items="${fns:getDictList('insuranceKey')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">健康状况：</label>
			<div class="controls">
				<form:select path="healthyKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('healthyKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">残疾等级：</label>
			<div class="controls">
				<form:select path="disableLevelKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('disableLevelKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职业：</label>
			<div class="controls">
				<form:select path="occupationKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('occupationKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作单位：</label>
			<div class="controls">
				<form:input path="workUnitKey" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">居住性质：</label>
			<div class="controls">
				<form:select path="lvingNatureKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('lvingNatureKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话：</label>
			<div class="controls">
				<form:input path="telphone" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">家庭住址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">户籍地：</label>
			<div class="controls">
				<form:input path="domicile" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">户口性质：</label>
			<div class="controls">
				<form:select path="residenceKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('residenceKey')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">户口薄号：</label>
			<div class="controls">
				<form:input path="residenceNo" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否属于流动人口：</label>
			<div class="controls">
				<form:select path="hoboKey" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">低保金额：</label>
			<div class="controls">
				<form:input path="allowancesAmount" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="sys:recordInfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>