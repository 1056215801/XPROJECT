
package com.chinatelecom.jx.zone.management.controller.weixinReceivedMsg;

import java.math.BigDecimal;

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

import com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg.WeixinReceivedMsgBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.weixinReceivedMsg.IWeixinReceivedMsgService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/weixinreceivedmsg")
public class WeixinReceivedMsgController extends BaseController {
	@Autowired
	private IWeixinReceivedMsgService weixinReceivedMsgService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinReceivedMsgController.class);
 
	/**
	 * 列表
	 * @param weixinReceivedMsg
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinReceivedMsg/list")
	public String list(@ModelAttribute("weixinReceivedMsg") WeixinReceivedMsgBean weixinReceivedMsg, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<WeixinReceivedMsgBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<WeixinReceivedMsgBean>)weixinReceivedMsgService.queryByCond(null);
		setPageInfo(page, model, "weixinReceivedMsg/list");
		model.addAttribute("searchKey", searchKey);
		return "weixinReceivedMsg/list";
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinReceivedMsg/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal  id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		WeixinReceivedMsgBean weixinReceivedMsg = weixinReceivedMsgService.selectById(id);
		model.addAttribute("weixinReceivedMsg",weixinReceivedMsg);
		model.addAttribute("pageNo", pageNo);
		return "weixinReceivedMsg/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinReceivedMsg/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = weixinReceivedMsgService.batchDelete(items);
		int i=  weixinReceivedMsgService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/weixinReceivedMsg/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/weixinReceivedMsg//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "weixinReceivedMsg") WeixinReceivedMsgBean weixinReceivedMsg, 
			HttpServletRequest request ) {
		String str =null;
		if(weixinReceivedMsg.getId()==null){
			/*
			weixinReceivedMsg.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinReceivedMsg.setContent(value);//文本消息内容
			weixinReceivedMsg.setFromUserName(value);//发送方微信号
			weixinReceivedMsg.setToUserName(value);//接收方微信号
			weixinReceivedMsg.setCreateTime(value);//消息创建时间 （整型）
			weixinReceivedMsg.setStatus(value);//状态（1=有效，-1已删）
			weixinReceivedMsg.setMediaId(value);//媒体ID
			weixinReceivedMsg.setPicUrl(value);//图片链接
			weixinReceivedMsg.setFormat(value);//语音格式，如amr，speex等
			weixinReceivedMsg.setType(value);//收到的类型类型（文本text，图片image，语音voice，视频video，小视频shortvideo，地理位置location，链接link）
			weixinReceivedMsg.setTitle(value);//回复标题
			weixinReceivedMsg.setUrl(value);//消息链接
			weixinReceivedMsg.setDescription(value);//消息描述
			weixinReceivedMsg.setMsgId(value);//消息ID
			weixinReceivedMsg.setThumbMediaId(value);//媒体缩略图ID
			weixinReceivedMsg.setLocationY(value);//地理位置维度
			weixinReceivedMsg.setLocationX(value);//地理位置经度
			weixinReceivedMsg.setScale(value);//地图缩放大小
			weixinReceivedMsg.setLabel(value);//地理位置信息
			*/
			weixinReceivedMsgService.insert(weixinReceivedMsg);
			
			  str = "创建成功！";
		}else{//编辑
			weixinReceivedMsgService.updateById(weixinReceivedMsg);
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
	@RequestMapping(value = "/weixinReceivedMsg/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = weixinReceivedMsgService.batchDelete(items);
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
	@RequestMapping(value = "/weixinReceivedMsg/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public WeixinReceivedMsgBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    WeixinReceivedMsgBean weixinReceivedMsg = weixinReceivedMsgService.selectById(id);
	  return  weixinReceivedMsg ;
	} 
	
}