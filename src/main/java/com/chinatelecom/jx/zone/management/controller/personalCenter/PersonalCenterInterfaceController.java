package com.chinatelecom.jx.zone.management.controller.personalCenter;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.hcdy.util.StringUtil;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;

/**
 * 
 * 1.账号关联企业列表；
 * 2.新增企业
 * 2.设为默认企业；
 * 4.删除企业；
 * 5.企业详情；
 * success: 接口运行结果，true成功 false失败
 * errorCode：接口返回错误吗，0运行成功，-1系统异常，1运行失败
 * errorMsg：接口返回提示信息
 */

@Controller
public class PersonalCenterInterfaceController {
	@Autowired(required = true)
	@Qualifier("primaryKeySeq")
	protected SeqIdType primaryKeySeq;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanService;
	
	private static final Logger logger = LoggerFactory.getLogger(PersonalCenterInterfaceController.class);

	/**
	 * 获取账号所有关联企业列表
	 * 入参：accountId 
	 * 出参：
	 * @return
	 */
	@RequestMapping(value="/interface/json/personalCenter/selectCompanyList")
	public String selectCompanyList(
			@RequestParam(value="accountId", required=false)BigDecimal accountId, 
			ModelMap modelMap, HttpServletResponse response){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if (accountId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数accountId未设置！");
				return "jsonView";
			}
			
			List<JSONObject> list = personalCenterService.selectCompanyListByAccountId(accountId);
			
			CompanyInfoBean info = personalCenterService.selectDefaultCompanyForVisitor(accountId);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取该账户关联企业列表成功！");
			modelMap.addAttribute("total", list.size());
			modelMap.addAttribute("compList", list);
			modelMap.addAttribute("defaultCompInfo", info);
			
		}catch (Exception e) {
			logger.error("【个人中心接口】selectCompanyList方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，获取该账户关联企业列表失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 新增企业
	 * 入参：  accountId：账户id 
	 * 		companyInfoBean：企业信息对象
	 * 出参：
	 * @return
	 */
	@RequestMapping(value = "/interface/json/personalCenter/savingCommonCompanyInfo")
	public String savingCommonCompanyInfo(
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@ModelAttribute(value = "companyInfoBean") CompanyInfoBean companyInfoBean, 
			ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(accountId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数accountId未设置！");
				return "jsonView";
			}
			
			if(companyInfoBean.getSocialCreditNo() == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数socialCreditNo未设置！");
				return "jsonView";
			}
			
			if(!StringUtil.checkNotNull(companyInfoBean.getCompanyName())){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数companyName未设置！");
				return "jsonView";
			}
			
			AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(accountId);
			if(accountInfoBean == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "用户信息不存在！");
				return "jsonView";
			}
			
				
			//设置parentId
			BigDecimal parentId = null;
			if (companyInfoBean.getSpaceId() != null) {
				parentId = companyInfoBean.getSpaceId();
			} else {
				if (companyInfoBean.getAreaId() != null) {
					parentId = companyInfoBean.getAreaId();
				} else {
					parentId = companyInfoBean.getProvinceId();
				}
			}
			
			ResultBean resultBean = new ResultBean();
			if(companyInfoBean.getCompanyId()==null){//新增企业
				/*
				 * 判断企业信息是否重复
				 */
				String sql = "select company_id from t_company_info where company_name = ?";
				List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{companyInfoBean.getCompanyName()});
				
				if(!list.isEmpty()){
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 1);
					modelMap.addAttribute("errorMsg", "该企业已被收录！");
					modelMap.addAttribute("companyId", list.get(0).get("COMPANY_ID"));
					return "jsonView";
				}
				
				companyInfoBean.setCreaterId(accountInfoBean.getAccountId());
				companyInfoBean.setCompanyId(primaryKeySeq.getNextSeqIdToBigDecimal());
				companyInfoBean.setCreaterName(accountInfoBean.getAccountName());
				companyInfoBean.setContactName(accountInfoBean.getAccountName());
				companyInfoBean.setContactPhone(accountInfoBean.getContactPhone());
				resultBean = personalCenterService.saveCompanyInfoForVisitor(parentId, companyInfoBean);
			}else{
				if(accountId.equals(companyInfoBean.getCreaterId())){ //编辑企业
					resultBean = personalCenterService.updateCompanyInfo(parentId, companyInfoBean);
				}else{ //关联企业
					resultBean = personalCenterService.connectCompanyInfo(accountId, companyInfoBean.getCompanyId());
				}
			}
			
			modelMap.addAttribute("success", resultBean.getCode()>0?true:false);
			modelMap.addAttribute("errorCode", resultBean.getCode()>0?0:1);
			modelMap.addAttribute("errorMsg", resultBean.getMsg());
			
		}catch (Exception e) {
			logger.error("【个人中心接口】savingCommonCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，新增企业失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 设为默认企业
	 * 入参：  accountId：账户id  
	 * 	    companyId：企业id 
	 * 出参：
	 * @return
	 */
	@RequestMapping(value = "/interface/json/personalCenter/savingDefaultCompanyInfo")
	public String savingDefaultCompanyInfo(
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@RequestParam(value = "companyId", required = false)BigDecimal companyId,
			ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(accountId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数accountId未设置！");
				return "jsonView";
			}
			
			if(companyId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数companyId未设置！");
				return "jsonView";
			}
			
			ResultBean resultBean = personalCenterService
					.saveDefaultCompanyInfoForVisitor(accountId, companyId);
			
			modelMap.addAttribute("success", resultBean.getCode()>0?true:false);
			modelMap.addAttribute("errorCode", resultBean.getCode()>0?0:1);
			modelMap.addAttribute("errorMsg", resultBean.getMsg());
			
		}catch (Exception e) {
			logger.error("【个人中心接口】savingDefaultCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，设为默认企业失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 删除企业信息
	 * 入参：  accountId：账户id  
	 * 	    companyId：企业id 
	 * 出参：
	 * @return
	 */
	@RequestMapping(value = "/interface/json/personalCenter/delCompanyInfo")
	public String delCompanyInfo(
			@RequestParam(value = "accountId", required = false)BigDecimal accountId,
			@RequestParam(value = "companyId", required = false)BigDecimal companyId,
			ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(accountId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数accountId未设置！");
				return "jsonView";
			}
			
			if(companyId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数companyId未设置！");
				return "jsonView";
			}
			
			ResultBean resultBean = personalCenterService
					.deleteCommonCompanyForVisitor(accountId, companyId);
			
			modelMap.addAttribute("success", resultBean.getCode()>0?true:false);
			modelMap.addAttribute("errorCode", resultBean.getCode()>0?0:1);
			modelMap.addAttribute("errorMsg", resultBean.getMsg());
			
		}catch (Exception e) {
			logger.error("【个人中心接口】delCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，删除企业信息失败！");
		}
		return "jsonView";
	}
	
	/**
	 * 获取企业信息
	 * 入参：companyId：企业id 
	 * 出参：companyInfoBean：企业信息对象
	 * @return
	 */
	
	@RequestMapping(value = "/interface/json/personalCenter/getCompanyInfo")
	public String getCompanyInfo(
			@RequestParam(value = "companyId", required = false)BigDecimal companyId,
			ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(companyId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数companyId未设置！");
				return "jsonView";
			}
			
			CompanyInfoBean companyInfoBean = companyInfoBeanService.selectByPrimaryKey(companyId);
			
			if(companyInfoBean == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "企业信息不存在！");
			}else{
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "获取企业信息成功！");
				modelMap.addAttribute("companyInfo", companyInfoBean);
			}
			
			
		}catch (Exception e) {
			logger.error("【个人中心接口】getCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，获取企业信息失败！");
		}
		return "jsonView";
	}
	
	/**
	 * 获取地址信息
	 * 入参：parentId：父节点id 
	 * 出参：
	 * @return
	 */
	
	@RequestMapping(value = "/interface/json/personalCenter/getAreaInfo")
	public String getAreaInfo(
			@RequestParam(value = "parentId", required = false)BigDecimal parentId,
			ModelMap modelMap, HttpServletResponse response){
		try{
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(parentId == null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数parentId未设置！");
				return "jsonView";
			}
			
			ResultBean resultBean = personalCenterService.selectAreaInfo(parentId);
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取地址信息成功！");
			modelMap.addAttribute("areaInfoList", resultBean.getValue());
			
		}catch (Exception e) {
			logger.error("【个人中心接口】getCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，获取企业信息失败！");
		}
		return "jsonView";
	}
	
	
	/**
	 * 判断企业信息是否存在
	 * 入参：companyName：企业名称 
	 * 出参：0：不存在 1：存在
	 * @return
	 */
	
	@RequestMapping(value = "/interface/json/personalCenter/companyIsExit")
	public String companyIsExit(
			@RequestParam(value = "companyName", required = false)String companyName,
			ModelMap modelMap, HttpServletResponse response){
		try{
			
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			
			if(companyName==null||companyName==""){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数companyName未设置！");
				return "jsonView";
			}
			
			/*
			 * 判断企业信息是否重复
			 */
			String sql = "select company_id from t_company_info where company_name = ?";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{companyName});
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorMsg", "接口调用成功！");
			if(list.isEmpty()){
				modelMap.addAttribute("errorCode", 0);
			}else{
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("companyId", list.get(0).get("company_id"));
			}
			
		}catch (Exception e) {
			logger.error("【个人中心接口】getCompanyInfo方法出现异常，详细原因："+e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常，获取企业信息失败！");
		}
		return "jsonView";
	}
}
