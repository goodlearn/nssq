package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.RecordInfo;
import com.thinkgem.jeesite.modules.sys.dao.RecordInfoDao;

/**
 * 档案信息Service
 * @author wzy
 * @version 2018-02-27
 */
@Service
@Transactional(readOnly = true)
public class RecordInfoService extends CrudService<RecordInfoDao, RecordInfo> {

	public RecordInfo get(String id) {
		return super.get(id);
	}
	
	public List<RecordInfo> findList(RecordInfo recordInfo) {
		return super.findList(recordInfo);
	}
	
	public Page<RecordInfo> findPage(Page<RecordInfo> page, RecordInfo recordInfo) {
		return super.findPage(page, recordInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(RecordInfo recordInfo) {
		super.save(recordInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(RecordInfo recordInfo) {
		super.delete(recordInfo);
	}
	
	/**
	 * 查询详细数据
	 * @param recordInfo
	 * @return
	 */
	public RecordInfo findRiDetail(RecordInfo recordInfo) {
		String id = recordInfo.getId();
		RecordInfo query = new RecordInfo();
		query.setRelationshipId(id);
		List<RecordInfo> ris = dao.findList(query);
		recordInfo.setRis(ris);
		return recordInfo;
	}
	
}