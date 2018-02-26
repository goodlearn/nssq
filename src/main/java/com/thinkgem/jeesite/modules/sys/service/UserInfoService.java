package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.RelationshipInfo;
import com.thinkgem.jeesite.modules.sys.entity.UserInfo;
import com.thinkgem.jeesite.modules.sys.dao.RelationshipInfoDao;
import com.thinkgem.jeesite.modules.sys.dao.UserInfoDao;

/**
 * 人员信息Service
 * @author wzy
 * @version 2018-02-26
 */
@Service
@Transactional(readOnly = true)
public class UserInfoService extends CrudService<UserInfoDao, UserInfo> {
	
	@Autowired
	private RelationshipInfoDao relationshipInfoDao;

	public UserInfo get(String id) {
		return super.get(id);
	}
	
	public List<UserInfo> findList(UserInfo userInfo) {
		return super.findList(userInfo);
	}
	
	public Page<UserInfo> findPage(Page<UserInfo> page, UserInfo userInfo) {
		return super.findPage(page, userInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(UserInfo userInfo) {
		super.save(userInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(UserInfo userInfo) {
		super.delete(userInfo);
	}
	
	/**
	 * 详细信息
	 */
	public UserInfo findDetail(UserInfo userInfo) {
		RelationshipInfo queryRelationshipInfo = new RelationshipInfo();
		queryRelationshipInfo.setUserInfoId(userInfo.getId());
		List<RelationshipInfo> rsiList = relationshipInfoDao.findList(queryRelationshipInfo);
		userInfo.setRsis(rsiList);
		return userInfo;
	}
	
}