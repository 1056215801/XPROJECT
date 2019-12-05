
package com.chinatelecom.jx.zone.management.controller.weixinConfig;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigInfoService;

@Controller
//@RequestMapping(value = "/weixinconfiginfo")
public class WeixinConfigInfoController extends BaseController {
	@Autowired
	private IWeixinConfigInfoService weixinConfigInfoService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinConfigInfoController.class);
 
	/**
	 * 微信账号设置
	 * @param weixinConfigInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/list")
	public String list(@ModelAttribute("weixinConfigInfo") WeixinConfigInfoBean weixinConfigInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<WeixinConfigInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<WeixinConfigInfoBean>)weixinConfigInfoService.queryByCond(null);
		setPageInfo(page, model, "weixinConfigInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "weixinConfigInfo/list";
	}
	
	/**
	 * 新增 
	 * @param configId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 WeixinConfigInfoBean  weixinConfigInfo = new WeixinConfigInfoBean();
			/* 初始化
			weixinConfigInfo.setConfigId(value);//主键
			weixinConfigInfo.setWxName(value);//微信名称
			weixinConfigInfo.setOpenid(value);//微信公众号
			weixinConfigInfo.setAppid(value);//公众appid
			weixinConfigInfo.setAppsecret(value);//公众appsecret
			weixinConfigInfo.setQrcode(value);//微信二维码
			weixinConfigInfo.setToken(value);//token
			weixinConfigInfo.setDescription(value);//菜单描述
			weixinConfigInfo.setWelcomeImg(value);//关注时欢迎图
			weixinConfigInfo.setWelcomeText(value);//关注时欢迎词
			*/
		 
	  model.addAttribute("weixinConfigInfo", weixinConfigInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigInfo/edit";
	} 
	/**
	 * 编辑
	 * @param configId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/setup")
	public String edit( 
			Model model, ServletRequest request) {
		   WeixinConfigInfoBean weixinConfigInfo = weixinConfigInfoService.selectById(new BigDecimal(0));
	  model.addAttribute("weixinConfigInfo", weixinConfigInfo);
	  return "weixinConfigInfo/edit";
	}
	
	/**
	 * 保存操作
	 * @param weixinConfigInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/save")
	public String save(
			@ModelAttribute(value = "weixinConfigInfo") WeixinConfigInfoBean weixinConfigInfo, 
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		if(weixinConfigInfo.getConfigId()==null){
			weixinConfigInfoService.insert(weixinConfigInfo);
			redirectAttributes.addFlashAttribute("message",  "创建成功！");
		}else{//编辑
			weixinConfigInfoService.updateById(weixinConfigInfo);
			redirectAttributes.addFlashAttribute("message", "保存成功！");
			}
		model.addAttribute("weixinConfigInfo", weixinConfigInfo);
		return "redirect:/weixinConfigInfo/setup" ;
	}
	
	/**
	 * 查看详细
	 * @param configId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/view/{id}")
	public String view(
			@PathVariable(value = "configId") BigDecimal configId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		WeixinConfigInfoBean weixinConfigInfo = weixinConfigInfoService.selectById(configId);
		model.addAttribute("weixinConfigInfo",weixinConfigInfo);
		model.addAttribute("pageNo", pageNo);
		return "weixinConfigInfo/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = weixinConfigInfoService.batchDelete(items);
		int i=  weixinConfigInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/Spring/weixinConfigInfo/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "weixinConfigInfo") WeixinConfigInfoBean weixinConfigInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(weixinConfigInfo.getConfigId()==null){
			/*
			weixinConfigInfo.setConfigId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinConfigInfo.setWxName(value);//微信名称
			weixinConfigInfo.setOpenid(value);//微信公众号
			weixinConfigInfo.setAppid(value);//公众appid
			weixinConfigInfo.setAppsecret(value);//公众appsecret
			weixinConfigInfo.setQrcode(value);//微信二维码
			weixinConfigInfo.setToken(value);//token
			weixinConfigInfo.setDescription(value);//菜单描述
			weixinConfigInfo.setWelcomeImg(value);//关注时欢迎图
			weixinConfigInfo.setWelcomeText(value);//关注时欢迎词
			*/
			weixinConfigInfoService.insert(weixinConfigInfo);
			
			  str = "创建成功！";
		}else{//编辑
			weixinConfigInfoService.updateById(weixinConfigInfo);
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
	@RequestMapping(value = "/weixinConfigInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = weixinConfigInfoService.batchDelete(items);
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
	@RequestMapping(value = "/weixinConfigInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public WeixinConfigInfoBean jsonSave(
			@RequestParam(value = "configId") BigDecimal configId,
			HttpServletRequest request ) {
		    WeixinConfigInfoBean weixinConfigInfo = weixinConfigInfoService.selectById(configId);
	  return  weixinConfigInfo ;
	} 
	
}