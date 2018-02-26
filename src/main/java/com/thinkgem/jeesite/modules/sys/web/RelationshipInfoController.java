package com.thinkgem.jeesite.modules.sys.web;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.RelationshipInfo;
import com.thinkgem.jeesite.modules.sys.service.RelationshipInfoService;

/**
 * 关系信息Controller
 * @author wzy
 * @version 2018-02-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/relationshipInfo")
public class RelationshipInfoController extends BaseController {

	@Autowired
	private RelationshipInfoService relationshipInfoService;
	
	@ModelAttribute
	public RelationshipInfo get(@RequestParam(required=false) String id) {
		RelationshipInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = relationshipInfoService.get(id);
		}
		if (entity == null){
			entity = new RelationshipInfo();
		}
		return entity;
	}
	
	/**
	 * 添加关系信息
	 * @param relationshipInfo
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:relationshipInfo:view")
	@RequestMapping(value = "addRf")
	public String addRf(RelationshipInfo relationshipInfo, Model model) {
		model.addAttribute("userInfoId", relationshipInfo.getUserInfoId());
		return "modules/sys/relationshipInfoForm";
	}
	
	@RequiresPermissions("sys:relationshipInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(RelationshipInfo relationshipInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RelationshipInfo> page = relationshipInfoService.findPage(new Page<RelationshipInfo>(request, response), relationshipInfo); 
		model.addAttribute("page", page);
		return "modules/sys/relationshipInfoList";
	}

	@RequiresPermissions("sys:relationshipInfo:view")
	@RequestMapping(value = "form")
	public String form(RelationshipInfo relationshipInfo, Model model) {
		model.addAttribute("relationshipInfo", relationshipInfo);
		return "modules/sys/relationshipInfoForm";
	}

	@RequiresPermissions("sys:relationshipInfo:edit")
	@RequestMapping(value = "save")
	public String save(RelationshipInfo relationshipInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, relationshipInfo)){
			return form(relationshipInfo, model);
		}
		relationshipInfoService.save(relationshipInfo);
		addMessage(redirectAttributes, "保存关系信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/userInfo/?repage";
	}
	
	@RequiresPermissions("sys:relationshipInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(RelationshipInfo relationshipInfo, RedirectAttributes redirectAttributes) {
		relationshipInfoService.delete(relationshipInfo);
		addMessage(redirectAttributes, "删除关系信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/relationshipInfo/?repage";
	}

}