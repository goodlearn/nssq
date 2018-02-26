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
import com.thinkgem.jeesite.common.utils.CasUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.UserInfo;
import com.thinkgem.jeesite.modules.sys.service.UserInfoService;

/**
 * 人员信息Controller
 * @author wzy
 * @version 2018-02-26
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/userInfo")
public class UserInfoController extends BaseController {

	@Autowired
	private UserInfoService userInfoService;
	
	@ModelAttribute
	public UserInfo get(@RequestParam(required=false) String id) {
		UserInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = userInfoService.get(id);
		}
		if (entity == null){
			entity = new UserInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:userInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(UserInfo userInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<UserInfo> page = userInfoService.findPage(new Page<UserInfo>(request, response), userInfo); 
		model.addAttribute("page", page);
		return "modules/sys/userInfoList";
	}

	/**
	 * 详细信息
	 * @param userInfo
	 * @param model
	 * @return
	 */
	@RequiresPermissions("sys:userInfo:view")
	@RequestMapping(value = "detail")
	public String detail(UserInfo userInfo, Model model) {
		UserInfo detailUserInfo = userInfoService.findDetail(userInfo);
		
		/**
		 * 转换下时间格式
		 */
		detailUserInfo.setBirthShow(CasUtils.convertDate2DefaultString(detailUserInfo.getBirth()));
		
		model.addAttribute("userInfo", detailUserInfo);
		if(null == detailUserInfo.getRsis() || detailUserInfo.getRsis().size() == 0) {
			model.addAttribute("rlsNum", 0);
		}else {
			/**
			 * 转换下时间格式
			 */
			for(int i = 0;i<detailUserInfo.getRsis().size();i++) {
				detailUserInfo.getRsis().get(i).setBirthShow(CasUtils.convertDate2DefaultString(detailUserInfo.getBirth()));
			}
			model.addAttribute("rlsNum", detailUserInfo.getRsis().size());
		}
		return "modules/sys/userInfoDetail";
	}

	
	@RequiresPermissions("sys:userInfo:view")
	@RequestMapping(value = "form")
	public String form(UserInfo userInfo, Model model) {
		model.addAttribute("userInfo", userInfo);
		return "modules/sys/userInfoForm";
	}

	@RequiresPermissions("sys:userInfo:edit")
	@RequestMapping(value = "save")
	public String save(UserInfo userInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, userInfo)){
			return form(userInfo, model);
		}
		userInfoService.save(userInfo);
		addMessage(redirectAttributes, "保存人员信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/userInfo/?repage";
	}
	
	@RequiresPermissions("sys:userInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(UserInfo userInfo, RedirectAttributes redirectAttributes) {
		userInfoService.delete(userInfo);
		addMessage(redirectAttributes, "删除人员信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/userInfo/?repage";
	}

}