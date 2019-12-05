
package com.chinatelecom.jx.zone.management.controller.projectActivity;

import java.math.BigDecimal;

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

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityTagService;

@Controller
public class ProjectActivityTagController extends BaseController {
	@Autowired
	private IProjectActivityTagService projectActivityTagService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectActivityTagController.class);
 
	/**
	 * 列表
	 * @param projectActivityTag
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityTag/list")
	public String list(
			@ModelAttribute("projectActivityTag") ProjectActivityTagBean projectActivityTag, 
			@ModelAttribute("page") Page<ProjectActivityTagBean> page, Model model) {
		try{
			ProjectActivityTagBean projectActivityTagBean = new ProjectActivityTagBean();
			projectActivityTagBean.setOrderByClause("kind asc, sort_grade asc");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page=(Page<ProjectActivityTagBean>)projectActivityTagService.queryByCond(projectActivityTagBean);
			setPageInfo(page, model, "projectActivityTag/list");
		}catch(Exception ex){
			logger.error("获取标签列表失败，" + ex.getMessage(),ex);
		}
		return "projectActivityTag/list";
	}
	
	
	/*==================================================json数据============================================================*/	

	
	@RequestMapping(value = "/projectActivityTag/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonSave(
			@ModelAttribute(value="info") ProjectActivityTagBean info,
			@RequestParam(value="type") Integer type){
		ResultBean resultBean = new ResultBean();
		try{
			if(info.getTagId()==null){
			info.setTagId(seq.getNextSeqIdToBigDecimal());
			info.setStatus((short) 1);
			}
			resultBean = projectActivityTagService.insertByValidate(info,type);
			
		}catch(Exception ex){
			logger.error("标签异步保存失败，" + ex.getMessage(),ex);
			resultBean.setCode(-1);
			resultBean.setMsg("标签异步保存失败!");
		}
		return resultBean;
	}
	
	@RequestMapping(value = "/projectActivityTag/json/changeStatus", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonChangeStatus(
			@RequestParam("id")BigDecimal id,
			@RequestParam("status")Short status
			){
		ResultBean resultBean = new ResultBean();
		try{
			ProjectActivityTagBean bean = new ProjectActivityTagBean();
			bean.setTagId(id);
			bean.setStatus(status);
			resultBean = projectActivityTagService.updateById(bean);
		}catch(Exception ex){
			logger.error("标签异步停用失败，" + ex.getMessage(),ex);
			resultBean.setCode(-1);
			resultBean.setMsg("标签异步停用失败!");
		}
		return resultBean;
	}
	
	@RequestMapping(value = "/projectActivityTag/json/detail", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonDetail(@RequestParam("id")BigDecimal id){
		ResultBean resultBean = new ResultBean();
		try{
			ProjectActivityTagBean record = projectActivityTagService.selectById(id);
			resultBean.setCode(1);
			resultBean.setMsg(record.getSortGrade().toString()+","+record.getTagName()+","+record.getKind()+","+record.getTagId());
		}catch(Exception ex){
			logger.error("标签异步查看详情失败，" + ex.getMessage(),ex);
			resultBean.setCode(-1);
			resultBean.setMsg("标签异步查看详情失败!");
		}
		return resultBean;
	}
}