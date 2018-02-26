/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.RelationshipInfo;
import com.thinkgem.jeesite.modules.sys.dao.RelationshipInfoDao;

/**
 * 关系信息Service
 * @author wzy
 * @version 2018-02-26
 */
@Service
@Transactional(readOnly = true)
public class RelationshipInfoService extends CrudService<RelationshipInfoDao, RelationshipInfo> {

	public RelationshipInfo get(String id) {
		return super.get(id);
	}
	
	public List<RelationshipInfo> findList(RelationshipInfo relationshipInfo) {
		return super.findList(relationshipInfo);
	}
	
	public Page<RelationshipInfo> findPage(Page<RelationshipInfo> page, RelationshipInfo relationshipInfo) {
		return super.findPage(page, relationshipInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(RelationshipInfo relationshipInfo) {
		super.save(relationshipInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(RelationshipInfo relationshipInfo) {
		super.delete(relationshipInfo);
	}
	
}