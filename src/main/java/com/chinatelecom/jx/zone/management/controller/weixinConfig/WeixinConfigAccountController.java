
package com.chinatelecom.jx.zone.management.controller.weixinConfig;

import java.math.BigDecimal;

import javax.servlet.ServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.service.IAccountWeixinBeanService;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
//@RequestMapping(value = "/weixinConfigAccount")
public class WeixinConfigAccountController extends BaseController {
	@Autowired
	private  IAccountWeixinBeanService accountWeixinBeanService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(WeixinConfigAccountController.class);
 
	/**
	 * 微信关注用户管理
	 * @param model
	 * @param request
	 * @return
	 * 范例：{
	   "subscribe": 1, 
	   "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M", 
	   "nickname": "Band", 
	   "sex": 1, 
	   "language": "zh_CN", 
	   "city": "广州", 
	   "province": "广东", 
	   "country": "中国", 
	   "headimgurl":  "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4
	eMsv84eavHiaiceqxibJxCfHe/0",
	  "subscribe_time": 1382694957,
	  "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
	  "remark": "",
	  "groupid": 0,
	  "tagid_list":[128,2]
	}
	 */
	@RequestMapping(value = "/weixinConfigAccount/list")
	public String list(@ModelAttribute("accountWeixinBean") AccountWeixinBean accountWeixinBean, 
			@RequestParam(value = "searchText", required = false) String searchText,
			@ModelAttribute("page") Page<AccountWeixinBean> page, Model model) {
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		if(!StringUtil.checkNotNull(searchText)){
			searchText=null;
		}
		accountWeixinBean.setNickName(searchText);
		accountWeixinBean.setAppId("wxe2612226be2bf0dd");

	 	page=(Page<AccountWeixinBean>)accountWeixinBeanService
	 			.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName	 			
	 			(accountWeixinBean.getAccountId(), accountWeixinBean.getOpenId(), accountWeixinBean.getAppId(), 
	 					accountWeixinBean.getUnionId(),accountWeixinBean.getNickName()) ;

	 	setPageInfo(page, model, "weixinConfigAccount/list");
		model.addAttribute("searchText", searchText);
		return "weixinConfigAccount/list";
	}
	
	/**
	 * 新增 
	 * @param configId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigAccount/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 AccountWeixinBean  accountWeixinBean = new AccountWeixinBean();
		  
		 
	//  accountWeixinBeanService.validateInsert(accountWeixinBean) ; 
	  model.addAttribute("accountWeixinBean", accountWeixinBean);
	  model.addAttribute("pageNo", pageNo);
	  return "weixinConfigAccount/edit";
	} 
	/**
	 * 编辑
	 * @param configId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigAccount/edit")
	public String edit( 
			Model model, ServletRequest request) {
		   AccountWeixinBean accountWeixinBean = accountWeixinBeanService.selectByPrimaryKey(new BigDecimal(0));
	  model.addAttribute("accountWeixinBean", accountWeixinBean);
	  return "weixinConfigAccount/edit";
	}
	
	/**
	 * 保存操作
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigAccount/save")
	public String save(
			@ModelAttribute(value = "accountWeixinBean") AccountWeixinBean accountWeixinBean, 
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(accountWeixinBean.getBindId()==null){
			/*  
			weixinConfigAccount.setConfigId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//主键
			weixinConfigAccount.setWxName(value);//微信名称
			weixinConfigAccount.setOpenid(value);//微信公众号
			weixinConfigAccount.setAppid(value);//公众appid
			weixinConfigAccount.setAppsecret(value);//公众appsecret
			weixinConfigAccount.setQrcode(value);//微信二维码
			weixinConfigAccount.setToken(value);//token
			weixinConfigAccount.setDescription(value);//菜单描述
			weixinConfigAccount.setWelcomeImg(value);//关注时欢迎图
			weixinConfigAccount.setWelcomeText(value);//关注时欢迎词
			*/
		//	 accountWeixinBeanService.validateInsert(accountWeixinBean);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			//accountWeixinBeanService.validateUpdateByPrimaryKey(accountWeixinBean);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("weixinConfigAccount", accountWeixinBean);
		return "redirect:/weixinConfigAccount/edit" ;
		
	}
	
	/**
	 * 查看详细
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigAccount/view/{id}")
	public String view(
			@PathVariable(value = "configId") BigDecimal configId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		AccountWeixinBean accountWeixinBean = accountWeixinBeanService.selectByPrimaryKey(configId);
		model.addAttribute("accountWeixinBean",accountWeixinBean);
		model.addAttribute("pageNo", pageNo);
		return "weixinConfigAccount/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigAccount/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = weixinConfigAccountService.batchDelete(items);
		InvokeInfoBean<Integer> rst =  accountWeixinBeanService.validateDeleteByPrimaryKey(id);
		if(rst.isSuccess()){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/Spring/weixinConfigAccount/list";
	}
	
	
}