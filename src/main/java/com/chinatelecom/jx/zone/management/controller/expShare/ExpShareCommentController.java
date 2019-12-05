
package com.chinatelecom.jx.zone.management.controller.expShare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareCommentBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareCommentService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;

@Controller
//@RequestMapping(value = "/expsharecomment")
public class ExpShareCommentController extends BaseController {
	@Autowired
	private IExpShareCommentService expShareCommentService;
	@Autowired
	private IExpShareInfoService expShareInfoService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ExpShareCommentController.class);
 
	/**
	 * -------------------------------------------------------------------
	 *                         通用异步方法
	 * -------------------------------------------------------------------
	 */
	
	/**
	 * 异步新增评论
	 * @param expShareInfo
	 * @param type
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String save(
			@ModelAttribute(value = "expShareComment") ExpShareCommentBean expShareComment, 
			Model model
			){
		String str = "";
		try {
			expShareComment.setCommentId(seq.getNextSeqIdToBigDecimal());
			expShareComment.setAccountId(getCurrentAccountId());
			expShareComment.setAccountName(getCurrentAccountName());
			expShareComment.setCreateTime(new Timestamp(new Date().getTime()));
			expShareCommentService.insert(expShareComment);
			
			//增加评论量
			ExpShareInfoBean expShareInfoBean = expShareInfoService.selectById(expShareComment.getExpId());
			Integer count = Integer.parseInt(expShareInfoBean.getCommentCount())+1;
			expShareInfoBean.setCommentCount(count.toString());
			str = "评论成功！";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			str = "评论失败！";
		}
			return str;
	}
	
	/**
	 * 异步查看列表
	 */
	@RequestMapping(value = "/expShareComment/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean list(
			@ModelAttribute(value = "expShareComment") ExpShareCommentBean expShareComment, 
			@RequestParam(value = "type") int type,//0:全部 1:我发布的
			Page<ExpShareCommentBean> page,
			Model model
			){
		ResultBean resultBean = new ResultBean();
		try {
			if(type==1){
				expShareComment.setAccountId(getCurrentAccountId());
			}
			expShareComment.setOrderByClause("CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareCommentBean>) expShareCommentService.queryByCond(expShareComment);

			List<ExpShareCommentBean> list = new ArrayList<ExpShareCommentBean>(); 
			for(ExpShareCommentBean bean : page){
				list.add(bean);
			}
			if(page.getTotal()==0){
				resultBean.setCode(2);
				return resultBean;
			}

			if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return resultBean;
	}
	
	
	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String delete(
			@RequestParam(value="ids") String ids,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		String str = "";
		try {
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				expShareCommentService.deleteById(new BigDecimal(idsStr[i]));
			}
			str = "删除成功！";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			str = "删除失败！";
		}
		return str;
		
	}
	
	/**
	 * --------------------------------------------------------------
	 */
	
	/**
	 * 列表
	 * @param expShareComment
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/list")
	public String list(@ModelAttribute("expShareComment") ExpShareCommentBean expShareComment, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ExpShareCommentBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ExpShareCommentBean>)expShareCommentService.queryByCond(null);
		setPageInfo(page, model, "expShareComment/list");
		model.addAttribute("searchKey", searchKey);
		return "expShareComment/list";
	}
	
	/**
	 * 新增 
	 * @param commentId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ExpShareCommentBean  expShareComment = new ExpShareCommentBean();
			/* 初始化
			expShareComment.setCommentId(value);//评论id，主键
			expShareComment.setExpId(value);//园区动态id，外键 见t_exp_info
			expShareComment.setAccountId(value);//评论用户id
			expShareComment.setAccountName(value);//评论用户名称
			expShareComment.setCommentText(value);//评论内容
			expShareComment.setReplyCommentId(value);//回复的评论id，外键 见t_exp_comment
			expShareComment.setReplyAccountId(value);//回复评论用户id，外键 见t_exp_comment
			expShareComment.setReplyAccountName(value);//回复评论用户名称，外键 见t_exp_comment
			expShareComment.setIsAnonymous(value);//是否匿名评论 0：否 1：是
			expShareComment.setRemark(value);//备注
			expShareComment.setCreateTime(value);//创建时间
			*/
		 
	  model.addAttribute("expShareComment", expShareComment);
	  model.addAttribute("pageNo", pageNo);
	  return "expShareComment/edit";
	} 
	/**
	 * 编辑
	 * @param commentId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/edit/{id}")
	public String create(
			@PathVariable(value = "commentId" ) BigDecimal commentId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ExpShareCommentBean expShareComment = expShareCommentService.selectById(commentId);
		 
	  model.addAttribute("expShareComment", expShareComment);
	  model.addAttribute("pageNo", pageNo);
	  return "expShareComment/edit";
	}
	
	/**
	 * 保存操作
	 * @param expShareComment
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/save")
	public String save(
			@ModelAttribute(value = "expShareComment") ExpShareCommentBean expShareComment, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(expShareComment.getCommentId()==null){
			/*  
			expShareComment.setCommentId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//评论id，主键
			expShareComment.setExpId(value);//园区动态id，外键 见t_exp_info
			expShareComment.setAccountId(value);//评论用户id
			expShareComment.setAccountName(value);//评论用户名称
			expShareComment.setCommentText(value);//评论内容
			expShareComment.setReplyCommentId(value);//回复的评论id，外键 见t_exp_comment
			expShareComment.setReplyAccountId(value);//回复评论用户id，外键 见t_exp_comment
			expShareComment.setReplyAccountName(value);//回复评论用户名称，外键 见t_exp_comment
			expShareComment.setIsAnonymous(value);//是否匿名评论 0：否 1：是
			expShareComment.setRemark(value);//备注
			expShareComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			expShareCommentService.insert(expShareComment);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			expShareComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			expShareCommentService.updateById(expShareComment);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/expShareComment/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param commentId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/view/{id}")
	public String view(
			@PathVariable(value = "commentId") BigDecimal commentId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ExpShareCommentBean expShareComment = expShareCommentService.selectById(commentId);
		model.addAttribute("expShareComment",expShareComment);
		model.addAttribute("pageNo", pageNo);
		return "expShareComment/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = expShareCommentService.batchDelete(items);
		int i=  expShareCommentService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/expShareComment/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/expShareComment//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "expShareComment") ExpShareCommentBean expShareComment, 
			HttpServletRequest request ) {
		String str =null;
		if(expShareComment.getCommentId()==null){
			/*
			expShareComment.setCommentId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//评论id，主键
			expShareComment.setExpId(value);//园区动态id，外键 见t_exp_info
			expShareComment.setAccountId(value);//评论用户id
			expShareComment.setAccountName(value);//评论用户名称
			expShareComment.setCommentText(value);//评论内容
			expShareComment.setReplyCommentId(value);//回复的评论id，外键 见t_exp_comment
			expShareComment.setReplyAccountId(value);//回复评论用户id，外键 见t_exp_comment
			expShareComment.setReplyAccountName(value);//回复评论用户名称，外键 见t_exp_comment
			expShareComment.setIsAnonymous(value);//是否匿名评论 0：否 1：是
			expShareComment.setRemark(value);//备注
			expShareComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			expShareCommentService.insert(expShareComment);
			
			  str = "创建成功！";
		}else{//编辑
			expShareComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			expShareCommentService.updateById(expShareComment);
			  str = "保存成功！";
			}
	 return str ;
	}
     /**
	 * json删除 
	 * @param itemId
	 * @param type
	 * @return
	 *//*
	@RequestMapping(value = "/expShareComment/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = expShareCommentService.batchDelete(items);
		if(i > 0){
			msg="删除成功！" ;
		}else{
			msg="删除失败！" ;
		}
	  return msg ;
	} */
	/**
	 * json查看
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/expShareComment/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ExpShareCommentBean jsonSave(
			@RequestParam(value = "commentId") BigDecimal commentId,
			HttpServletRequest request ) {
		    ExpShareCommentBean expShareComment = expShareCommentService.selectById(commentId);
	  return  expShareComment ;
	} 
	
}