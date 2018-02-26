package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 人员信息Entity
 * @author wzy
 * @version 2018-02-27
 */
public class UserInfo extends DataEntity<UserInfo> {
	
	private static final long serialVersionUID = 1L;
	private String regWorkUnitKey;		// 登记单位
	private String areaPropKey;		// 地区属性
	private String name;		// 姓名
	private String preparedName;		// 填表人
	private String groupKey;		// 小组
	private String idCard;		// 身份证号
	private Date birth;		// 出生时间
	private String gender;		// 性别
	private String nationKey;		// 民族
	private String cultureKey;		// 文化程度
	private String politicalKey;		// 政治面貌
	private String religionKey;		// 宗教信仰
	private String merriageKey;		// 婚姻状况
	private String insuranceKey;		// 社会保险
	private String healthyKey;		// 健康状况
	private String disableLevelKey;		// 残疾等级
	private String occupationKey;		// 职业
	private String workUnitKey;		// 工作单位
	private String lvingNatureKey;		// 居住性质
	private String telphone;		// 电话
	private String address;		// 家庭住址
	private String domicile;		// 户籍地
	private String enterpriseKey;		// enterprise_key
	private String residenceKey;		// residence_key
	private String residenceNo;		// residence_no
	private String hoboKey;		// hobo_key
	private String allowancesAmount;		// allowances_amount
	
	
	private String birthShow;
	private List<RelationshipInfo> rsis = null; // 拥有角色列表
	
	
	
	public String getBirthShow() {
		return birthShow;
	}

	public void setBirthShow(String birthShow) {
		this.birthShow = birthShow;
	}

	public UserInfo() {
		super();
	}

	public UserInfo(String id){
		super(id);
	}
	

	public List<RelationshipInfo> getRsis() {
		return rsis;
	}

	public void setRsis(List<RelationshipInfo> rsis) {
		this.rsis = rsis;
	}

	@Length(min=0, max=100, message="登记单位长度必须介于 0 和 100 之间")
	public String getRegWorkUnitKey() {
		return regWorkUnitKey;
	}

	public void setRegWorkUnitKey(String regWorkUnitKey) {
		this.regWorkUnitKey = regWorkUnitKey;
	}
	
	@Length(min=0, max=100, message="地区属性长度必须介于 0 和 100 之间")
	public String getAreaPropKey() {
		return areaPropKey;
	}

	public void setAreaPropKey(String areaPropKey) {
		this.areaPropKey = areaPropKey;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="填表人长度必须介于 0 和 100 之间")
	public String getPreparedName() {
		return preparedName;
	}

	public void setPreparedName(String preparedName) {
		this.preparedName = preparedName;
	}
	
	@Length(min=0, max=100, message="小组长度必须介于 0 和 100 之间")
	public String getGroupKey() {
		return groupKey;
	}

	public void setGroupKey(String groupKey) {
		this.groupKey = groupKey;
	}
	
	@Length(min=0, max=100, message="身份证号长度必须介于 0 和 100 之间")
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="出生时间不能为空")
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	@Length(min=0, max=100, message="性别长度必须介于 0 和 100 之间")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Length(min=0, max=100, message="民族长度必须介于 0 和 100 之间")
	public String getNationKey() {
		return nationKey;
	}

	public void setNationKey(String nationKey) {
		this.nationKey = nationKey;
	}
	
	@Length(min=0, max=100, message="文化程度长度必须介于 0 和 100 之间")
	public String getCultureKey() {
		return cultureKey;
	}

	public void setCultureKey(String cultureKey) {
		this.cultureKey = cultureKey;
	}
	
	@Length(min=0, max=100, message="政治面貌长度必须介于 0 和 100 之间")
	public String getPoliticalKey() {
		return politicalKey;
	}

	public void setPoliticalKey(String politicalKey) {
		this.politicalKey = politicalKey;
	}
	
	@Length(min=0, max=100, message="宗教信仰长度必须介于 0 和 100 之间")
	public String getReligionKey() {
		return religionKey;
	}

	public void setReligionKey(String religionKey) {
		this.religionKey = religionKey;
	}
	
	@Length(min=0, max=100, message="婚姻状况长度必须介于 0 和 100 之间")
	public String getMerriageKey() {
		return merriageKey;
	}

	public void setMerriageKey(String merriageKey) {
		this.merriageKey = merriageKey;
	}
	
	@Length(min=0, max=100, message="社会保险长度必须介于 0 和 100 之间")
	public String getInsuranceKey() {
		return insuranceKey;
	}

	public void setInsuranceKey(String insuranceKey) {
		this.insuranceKey = insuranceKey;
	}
	
	@Length(min=0, max=100, message="健康状况长度必须介于 0 和 100 之间")
	public String getHealthyKey() {
		return healthyKey;
	}

	public void setHealthyKey(String healthyKey) {
		this.healthyKey = healthyKey;
	}
	
	@Length(min=0, max=100, message="残疾等级长度必须介于 0 和 100 之间")
	public String getDisableLevelKey() {
		return disableLevelKey;
	}

	public void setDisableLevelKey(String disableLevelKey) {
		this.disableLevelKey = disableLevelKey;
	}
	
	@Length(min=0, max=100, message="职业长度必须介于 0 和 100 之间")
	public String getOccupationKey() {
		return occupationKey;
	}

	public void setOccupationKey(String occupationKey) {
		this.occupationKey = occupationKey;
	}
	
	@Length(min=0, max=100, message="工作单位长度必须介于 0 和 100 之间")
	public String getWorkUnitKey() {
		return workUnitKey;
	}

	public void setWorkUnitKey(String workUnitKey) {
		this.workUnitKey = workUnitKey;
	}
	
	@Length(min=0, max=100, message="居住性质长度必须介于 0 和 100 之间")
	public String getLvingNatureKey() {
		return lvingNatureKey;
	}

	public void setLvingNatureKey(String lvingNatureKey) {
		this.lvingNatureKey = lvingNatureKey;
	}
	
	@Length(min=0, max=100, message="电话长度必须介于 0 和 100 之间")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	@Length(min=0, max=255, message="家庭住址长度必须介于 0 和 255 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=255, message="户籍地长度必须介于 0 和 255 之间")
	public String getDomicile() {
		return domicile;
	}

	public void setDomicile(String domicile) {
		this.domicile = domicile;
	}
	
	@Length(min=0, max=100, message="enterprise_key长度必须介于 0 和 100 之间")
	public String getEnterpriseKey() {
		return enterpriseKey;
	}

	public void setEnterpriseKey(String enterpriseKey) {
		this.enterpriseKey = enterpriseKey;
	}
	
	@Length(min=0, max=100, message="residence_key长度必须介于 0 和 100 之间")
	public String getResidenceKey() {
		return residenceKey;
	}

	public void setResidenceKey(String residenceKey) {
		this.residenceKey = residenceKey;
	}
	
	@Length(min=0, max=100, message="residence_no长度必须介于 0 和 100 之间")
	public String getResidenceNo() {
		return residenceNo;
	}

	public void setResidenceNo(String residenceNo) {
		this.residenceNo = residenceNo;
	}
	
	@Length(min=0, max=100, message="hobo_key长度必须介于 0 和 100 之间")
	public String getHoboKey() {
		return hoboKey;
	}

	public void setHoboKey(String hoboKey) {
		this.hoboKey = hoboKey;
	}
	
	@Length(min=0, max=100, message="allowances_amount长度必须介于 0 和 100 之间")
	public String getAllowancesAmount() {
		return allowancesAmount;
	}

	public void setAllowancesAmount(String allowancesAmount) {
		this.allowancesAmount = allowancesAmount;
	}
	
}