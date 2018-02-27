package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.CasUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.RecordInfo;
import com.thinkgem.jeesite.modules.sys.service.RecordInfoService;

/**
 * 档案信息Controller
 * @author wzy
 * @version 2018-02-27
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/recordInfo")
public class RecordInfoController extends BaseController {

	@Autowired
	private RecordInfoService recordInfoService;
	
	@ModelAttribute
	public RecordInfo get(@RequestParam(required=false) String id) {
		RecordInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = recordInfoService.get(id);
		}
		if (entity == null){
			entity = new RecordInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:recordInfo:view")
	@RequestMapping(value = "detail")
	public String detail(RecordInfo recordInfo, Model model) {
		RecordInfo ris = recordInfoService.findRiDetail(recordInfo);
		ris.setBirthShow(CasUtils.convertDate2DefaultString(ris.getBirth()));
		model.addAttribute("recordInfo", ris);
		if(null == ris.getRis()|| ris.getRis().size() == 0) {
			model.addAttribute("risNum", 0);
		}else {
			/**
			 * 转换下时间格式
			 */
			for(int i = 0;i<ris.getRis().size();i++) {
				ris.getRis().get(i).setBirthShow(CasUtils.convertDate2DefaultString(ris.getBirth()));
			}
			model.addAttribute("risNum", ris.getRis().size());
		}
		return "modules/sys/recordInfoDetail";
	}
	
	/**
	 * 添加关系信息
	 * @param relationshipInfo
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:recordInfo:view")
	@RequestMapping(value = "addRf")
	public String addRf(RecordInfo recordInfo, Model model) {
		model.addAttribute("recordInfo", recordInfo);
		return "modules/sys/recordInfoRForm";
	}
	
	/**
	 * 关系数据保存
	 * @param recordInfo
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("sys:recordInfo:edit")
	@RequestMapping(value = "saveArf")
	public String saveArf(RecordInfo recordInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, recordInfo)){
			return form(recordInfo, model);
		}
		
		recordInfoService.save(recordInfo);
		addMessage(redirectAttributes, "保存档案信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/recordInfo/?repage";
	}
	
	@RequiresPermissions("sys:recordInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(RecordInfo recordInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RecordInfo> page = recordInfoService.findPage(new Page<RecordInfo>(request, response), recordInfo); 
		//有户主的 补充户主名称
		setHzName(page.getList());
		model.addAttribute("page", page);
		return "modules/sys/recordInfoList";
	}
	
	//有户主的 补充户主名称
	private void setHzName(List<RecordInfo> ris) {
		if(null == ris || ris.size() == 0) {
			return;
		}
		for(RecordInfo ri : ris) {
			if(!ri.getRelationshipId().equals(Global.DEFAULT_RELATION_ID)) {
				RecordInfo hz = recordInfoService.get(ri.getRelationshipId());
				if(null!=hz) {
					ri.setHzName(hz.getName());
				}
			}
		}
	}

	@RequiresPermissions("sys:recordInfo:view")
	@RequestMapping(value = "form")
	public String form(RecordInfo recordInfo, Model model) {
		model.addAttribute("recordInfo", recordInfo);
		return "modules/sys/recordInfoForm";
	}

	@RequiresPermissions("sys:recordInfo:edit")
	@RequestMapping(value = "save")
	public String save(RecordInfo recordInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, recordInfo)){
			return form(recordInfo, model);
		}
		
		//默认保存户主
		recordInfo.setRelationshipId(Global.DEFAULT_RELATION_ID);
		
		recordInfoService.save(recordInfo);
		addMessage(redirectAttributes, "保存档案信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/recordInfo/?repage";
	}
	
	@RequiresPermissions("sys:recordInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(RecordInfo recordInfo, RedirectAttributes redirectAttributes) {
		recordInfoService.delete(recordInfo);
		addMessage(redirectAttributes, "删除档案信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/recordInfo/?repage";
	}

}