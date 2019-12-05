
package com.chinatelecom.jx.zone.management.controller.projectActivity;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
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
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.chinatelecom.jx.zone.management.service.projectActivity.IProjectActivityCommentService;

@Controller
//@RequestMapping(value = "/projectactivitycomment")
public class ProjectActivityCommentController extends BaseController {
	@Autowired
	private IProjectActivityCommentService projectActivityCommentService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(ProjectActivityCommentController.class);
 
	/**
	 * 列表
	 * @param projectActivityComment
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/list")
	public String list(@ModelAttribute("projectActivityComment") ProjectActivityCommentBean projectActivityComment, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ProjectActivityCommentBean> page, Model model,
			HttpServletRequest request) {
		
		projectActivityComment.setActivityId(new BigDecimal(request.getSession().getAttribute("activityId").toString()));
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<ProjectActivityCommentBean>)projectActivityCommentService.queryByCond(projectActivityComment);
		setPageInfo(page, model, "projectActivityComment/list");
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("currentAccount",1);
		
		
		return "projectActivityComment/list";
	}
	
	/**
	 * 新增 
	 * @param commentId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 ProjectActivityCommentBean  projectActivityComment = new ProjectActivityCommentBean();
 
	  model.addAttribute("projectActivityComment", projectActivityComment);
	  model.addAttribute("pageNo", pageNo);
	  return "projectActivityComment/edit";
	} 
	/**
	 * 编辑
	 * @param commentId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/edit/{id}")
	public String create(
			@PathVariable(value = "commentId" ) BigDecimal commentId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   ProjectActivityCommentBean projectActivityComment = projectActivityCommentService.selectById(commentId);
		 
	  model.addAttribute("projectActivityComment", projectActivityComment);
	  model.addAttribute("pageNo", pageNo);
	  return "projectActivityComment/edit";
	}
	
	/**
	 * 保存操作
	 * @param projectActivityComment
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/save")
	public String save(
			@ModelAttribute(value = "projectActivityComment") ProjectActivityCommentBean projectActivityComment, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			HttpServletRequest request) {
		int n = 0;
		try{
			if(projectActivityComment.getCommentId()==null){
				
				projectActivityComment.setCommentId(seq.getNextSeqIdToBigDecimal());
				projectActivityComment.setActivityId(new BigDecimal(request.getSession().getAttribute("activityId").toString()));
//				projectActivityComment.setCommentAccount(value);
//				projectActivityComment.setCommentUser(value);
				projectActivityComment.setCommentAccount(new BigDecimal(1));
				projectActivityComment.setCommentUser("alice");
				projectActivityComment.setCommentTime(new Timestamp(new Date().getTime()));
//				projectActivityComment.setRemark(value);
//				projectActivityComment.setSortGrade(value);
				projectActivityComment.setCreateTime(new Timestamp(new Date().getTime()));
				
				n = projectActivityCommentService.insert(projectActivityComment);
				
				redirectAttributes.addFlashAttribute("message", n==1?"发布成功！":"发布失败！");
			}else{//编辑
				/*projectActivityComment.setCommentTime(new Timestamp(new Date().getTime()));//评论时间
				projectActivityComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
				projectActivityCommentService.updateById(projectActivityComment);
				String str = "保存成功！";
				 
				redirectAttributes.addFlashAttribute("message", str);*/
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectActivityComment/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param commentId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/view/{id}")
	public String view(
			@PathVariable(value = "commentId") BigDecimal commentId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		ProjectActivityCommentBean projectActivityComment = projectActivityCommentService.selectById(commentId);
		model.addAttribute("projectActivityComment",projectActivityComment);
		model.addAttribute("pageNo", pageNo);
		return "projectActivityComment/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/delete")
	public String delete(
			@RequestParam(value = "commentId") BigDecimal commentId,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		int i = 0;
		try{
			i = projectActivityCommentService.deleteById(commentId);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		redirectAttributes.addFlashAttribute("message", i==1?"删除成功！":"删除失败！");
		
		return "redirect:/projectActivityComment/list";
	}
	
	/*==================================================json数据============================================================*/	
	
	
	/**
	 * 评论列表
	 */
	@RequestMapping(value = "/projectActivityComment/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ProjectActivityCommentBean> list(
			@ModelAttribute("projectActivityCommentBean") ProjectActivityCommentBean projectActivityCommentBean,
			@ModelAttribute("page") Page<ProjectActivityCommentBean> page
			){
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page = (Page<ProjectActivityCommentBean>) projectActivityCommentService
				.queryByCond(projectActivityCommentBean);
		return page;
	}
	
	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "projectActivityComment") ProjectActivityCommentBean projectActivityComment, 
			HttpServletRequest request ) {
		String str =null;
		if(projectActivityComment.getCommentId()==null){
			/*
			projectActivityComment.setCommentId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//评论Id，记录主键。
			projectActivityComment.setActivityId(value);//活动Id，值外键，见T_Project_Activity_Info表Activity_Id。
			projectActivityComment.setCommentAccount(value);//评论账户，账户Id，值外键，见T_Account_Info表Account_Id。
			projectActivityComment.setCommentUser(value);//评论人名，冗余字段，值外键，见T_Account_Info表Account_Name。
			projectActivityComment.setCommentContent(value);//评论内容
			projectActivityComment.setCommentTime(new Timestamp(new Date().getTime()));//评论时间
			projectActivityComment.setReplyId(value);//评论针对的以往的评论Id。值外键，见T_Project_Activity_Comment表Comment_Id。
			projectActivityComment.setReplyAccount(value);//评论针对的以往的评论账号。值外键，见T_Project_Activity_Comment表Comment_Account。
			projectActivityComment.setReplayUser(value);//评论针对的以往的评论人名。值外键，见T_Project_Activity_Comment表Comment_User。
			projectActivityComment.setRemark(value);//备注，内部查看。
			projectActivityComment.setSortGrade(value);//排序序号，序号越小越往前排序。
			projectActivityComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			*/
			projectActivityCommentService.insert(projectActivityComment);
			
			  str = "创建成功！";
		}else{//编辑
			projectActivityComment.setCommentTime(new Timestamp(new Date().getTime()));//评论时间
			projectActivityComment.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			projectActivityCommentService.updateById(projectActivityComment);
			  str = "保存成功！";
			}
	 return str ;
	}
	/**
	 * json删除 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = projectActivityCommentService.batchDelete(items);
		if(i > 0){
			msg="删除成功！" ;
		}else{
			msg="删除失败！" ;
		}
	  return msg ;
	} 
	/**
	 * json查看
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectActivityComment/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectActivityCommentBean jsonSave(
			@RequestParam(value = "commentId") BigDecimal commentId,
			HttpServletRequest request ) {
		    ProjectActivityCommentBean projectActivityComment = projectActivityCommentService.selectById(commentId);
	  return  projectActivityComment ;
	} 
	
}