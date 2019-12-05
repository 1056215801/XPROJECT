
package com.chinatelecom.jx.zone.management.controller.weixinConfigReply;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinatelecom.jx.zone.management.bean.weixinConfigReply.WeixinConfigReplyBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.weixinConfigReply.IWeixinConfigReplyService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/weixinconfigreply")
public class WeixinConfigReplyController extends BaseController {
	@Autowired
	private IWeixinConfigReplyService weixinConfigReplyService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinConfigReplyController.class);
 
	/**
	 * 列表
	 * @param weixinConfigReply
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/list")
	public String list(@ModelAttribute("weixinConfigReply") WeixinConfigReplyBean weixinConfigReply, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<WeixinConfigReplyBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<WeixinConfigReplyBean>)weixinConfigReplyService.queryByCond(null);
		setPageInfo(page, model, "weixinConfigReply/list");
		model.addAttribute("searchKey", searchKey);
		return "weixinConfigReply/list";
	}
	
	/**
	 * 新增 
	 * @param replyId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 WeixinConfigReplyBean  weixinConfigReply = new WeixinConfigReplyBean();
			/* 初始化
			weixinConfigReply.setReplyId(value);//主键
			weixinConfigReply.setInputWord(value);//输入语（为空表示匹配任何输入语）
			weixinConfigReply.setJumpUrl(value);//点击跳转地址
			weixinConfigReply.setReplyWord(value);//回复内容
			weixinConfigReply.setCreateTime(value);//创建时间
			weixinConfigReply.setCreateUser(value);//创建人
			weixinConfigReply.setReplyAttachment(value);//附件（声音图片视频）url
			weixinConfigReply.setRemark(value);//备注
			weixinConfigReply.setStatus(value);//状态
			weixinConfigReply.setType(value);//类型（NewsMsg,TextMsg）
			weixinConfigReply.setTitle(value);//回复标题
			weixinConfigReply.setPicUrl(value);//图片地址
			weixinConfigReply.setShowSubscribe(value);//关注时是否显示
			weixinConfigReply.setShowSubscribeOrder(value);//排序
			*/
		 
	  model.addAttribute("weixinConfigReply", weixinConfigReply);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigReply/edit";
	} 
	/**
	 * 编辑
	 * @param replyId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   WeixinConfigReplyBean weixinConfigReply = weixinConfigReplyService.selectById(id);
		 
	  model.addAttribute("weixinConfigReply", weixinConfigReply);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigReply/edit";
	}
	
	/**
	 * 保存操作
	 * @param weixinConfigReply
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/save")
	public String save(
			@ModelAttribute(value = "weixinConfigReply") WeixinConfigReplyBean weixinConfigReply, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(weixinConfigReply.getReplyId()==null){
			weixinConfigReply.setReplyId(seq.getNextSeqIdToBigDecimal());//主键
			weixinConfigReply.setCreateTime(new Timestamp(new Date().getTime()));//创建时间
			weixinConfigReply.setCreateUser(this.getCurrentAccountName());//创建人
			weixinConfigReplyService.insert(weixinConfigReply);
			String str = "创建成功！";
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			weixinConfigReplyService.updateById(weixinConfigReply);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/weixinConfigReply/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param replyId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal  id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		WeixinConfigReplyBean weixinConfigReply = weixinConfigReplyService.selectById(id);
		model.addAttribute("weixinConfigReply",weixinConfigReply);
		model.addAttribute("pageNo", pageNo);
		return "weixinConfigReply/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = weixinConfigReplyService.batchDelete(items);
		int i=  weixinConfigReplyService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/weixinConfigReply/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigReply//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "weixinConfigReply") WeixinConfigReplyBean weixinConfigReply, 
			HttpServletRequest request ) {
		String str =null;
		if(weixinConfigReply.getReplyId()==null){
			/*
			weixinConfigReply.setReplyId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinConfigReply.setInputWord(value);//输入语（为空表示匹配任何输入语）
			weixinConfigReply.setJumpUrl(value);//点击跳转地址
			weixinConfigReply.setReplyWord(value);//回复内容
			weixinConfigReply.setCreateTime(value);//创建时间
			weixinConfigReply.setCreateUser(value);//创建人
			weixinConfigReply.setReplyAttachment(value);//附件（声音图片视频）url
			weixinConfigReply.setRemark(value);//备注
			weixinConfigReply.setStatus(value);//状态
			weixinConfigReply.setType(value);//类型（NewsMsg,TextMsg）
			weixinConfigReply.setTitle(value);//回复标题
			weixinConfigReply.setPicUrl(value);//图片地址
			weixinConfigReply.setShowSubscribe(value);//关注时是否显示
			weixinConfigReply.setShowSubscribeOrder(value);//排序
			*/
			weixinConfigReplyService.insert(weixinConfigReply);
			
			  str = "创建成功！";
		}else{//编辑
			weixinConfigReplyService.updateById(weixinConfigReply);
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
	@RequestMapping(value = "/weixinConfigReply/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = weixinConfigReplyService.batchDelete(items);
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
	@RequestMapping(value = "/weixinConfigReply/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public WeixinConfigReplyBean jsonSave(
			@RequestParam(value = "replyId") BigDecimal replyId,
			HttpServletRequest request ) {
		    WeixinConfigReplyBean weixinConfigReply = weixinConfigReplyService.selectById(replyId);
	  return  weixinConfigReply ;
	} 
	
}