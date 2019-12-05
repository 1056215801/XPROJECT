
package com.chinatelecom.jx.zone.management.controller.projectActivity;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityComplainBean;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityComplainService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;

@Controller
//@RequestMapping(value = "/projectactivitycomplain")
public class ProjectActivityComplainController extends BaseController {
	@Autowired
	private IProjectActivityComplainService projectActivityComplainService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectActivityComplainController.class);
 
	/**
	 * 列表
	 * @param projectActivityComplain
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComplain/list")
	public String list(@ModelAttribute("projectActivityComplain") ProjectActivityComplainBean projectActivityComplain, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectActivityComplainBean> page, Model model) {
		try{
			projectActivityComplain.setOrderByClause("a.submit_time desc");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectActivityComplainBean>)projectActivityComplainService
					.queryByCondRewrite(projectActivityComplain);
			setPageInfo(page, model, "projectActivityComplain/list");
			model.addAttribute("searchKey", searchKey);
		}catch(Exception ex){
			logger.error("获取审核列表失败，"+ex.getMessage(), ex);
		}
		return "projectActivityInfo/complainList";
	}
	
	
	
	/*==================================================json数据============================================================*/	
	
	/**
	 * 异步保存审核信息
	 * @param projectActivityComplain
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComplain/json/audit", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonAudit(
			@ModelAttribute(value = "projectActivityComplain") ProjectActivityComplainBean projectActivityComplain, 
			HttpServletRequest request ) {
		ResultBean resultBean = new ResultBean();
		int rst = 0;
		try{
			ProjectActivityComplainBean record = projectActivityComplainService
					.selectById(projectActivityComplain.getComplainId());
			MyBeanUtils.copyProperties(projectActivityComplain, record);
			record.setResponseRst((short)1);
			record.setResponseTime(new Timestamp(new Date().getTime()));
			rst = projectActivityComplainService.updateById(record);
			
			if(rst==1){
				resultBean.setCode(1);
				resultBean.setMsg("审核信息保存成功");
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("审核信息保存失败");
			}
			
		}catch(Exception ex){
			logger.error("审核信息保存失败，"+ex.getMessage(),ex);
			resultBean.setCode(-1);
			resultBean.setMsg("审核信息保存失败");
		}
		return resultBean;
	}
}
	