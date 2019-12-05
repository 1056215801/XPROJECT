package com.chinatelecom.jx.zone.management.controller.logisticsInfo;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.service.IAccountBindBeanService;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.proxy.ICompanyInfoBeanProxy;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.ZwbSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IWanjiLogisticsInfoService;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IZwbLogisticsInfoService;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.util.StringUtils;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;

@Controller
public class LogisticsFrontController extends BaseController{
	@Autowired
	private IWanjiLogisticsInfoService wanjiLogisticsInfoService;
	@Autowired
	private IZwbLogisticsInfoService zwbLogisticsInfoService;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;
	@Autowired
	private ICompanyInfoBeanProxy companyInfoBeanProxy;
	
	@RequestMapping(value = "/front/logistics/main")
	public String main(Model model){
		try{
			long[] time = new long[30];
			for(int i=0;i<30;i++){
				time[i] = System.currentTimeMillis()-Math.round(Math.random()*480)*60*1000;
			}
			Arrays.sort(time);
			String[] str = new String[30];
			int i=29;
			for(int j=0;j<time.length;j++){
				str[i] = new SimpleDateFormat("MM月dd日 HH:mm").format(new Date(time[j]));
				i--;
			}
			
			model.addAttribute("str", str);
		}catch(Exception ex){
			logger.error("详细原因："+ex.getMessage(),ex);
		}
		return "front/logistics/main";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/front/logistics/publish")
	public String publish(@RequestParam(value="type", defaultValue="1")Integer type,Model model){
		try{
			//获取万佶数据字典
			Map<String, List<?>> wanjiDict = wanjiLogisticsInfoService.getInitCargo(getId());
			
			//登录个人信息
			AccountInfoBean accountInfoBean = accountInfoBeanProxy
					.selectByPrimaryKey(getCurrentAccountId());
			
			model.addAttribute("wanjiDict", wanjiDict);
			model.addAttribute("type", type);
			model.addAttribute("accountName", accountInfoBean.getAccountName());
			model.addAttribute("accountCode", accountInfoBean.getAccountCode());
			
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("详细原因："+ex.getMessage(),ex);
		}
		return "front/logistics/publish";
	}
	
	/**
	 * 中危宝编辑编辑货源
	 * @return
	 */
	@RequestMapping(value = "/front/logistics/edit")
	public String editGoods(
			@RequestParam(value = "goodsId", required = false)Integer goodsId, 
			@RequestParam(value = "type")Integer type, 
			Model model){
		ZwbPublishgoodsLogBean zwbPublishgoodsLogBean = new ZwbPublishgoodsLogBean();
		try{
			String beginAreaIds = "";
			String endAreaIds = "";
			if(goodsId != null){
				//获取货源详情，本地数据
				zwbPublishgoodsLogBean = zwbLogisticsInfoService.selectByPrimaryKey(goodsId);
				for(int i=0;i<zwbPublishgoodsLogBean.getBeginAreaIds().length;i++){
					if(zwbPublishgoodsLogBean.getBeginAreaIds()[i]!=null){
						beginAreaIds += (zwbPublishgoodsLogBean.getBeginAreaIds()[i] + ",");
					}
				}
				for(int i=0;i<zwbPublishgoodsLogBean.getEndAreaIds().length;i++){
					if(zwbPublishgoodsLogBean.getEndAreaIds()[i]!=null){
						endAreaIds += (zwbPublishgoodsLogBean.getEndAreaIds()[i] + ",");
					}
				}
			}
			
			model.addAttribute("zwbPublishgoodsLogBean", zwbPublishgoodsLogBean);
			model.addAttribute("accountCode", zwbPublishgoodsLogBean.getBeginContacts());
			model.addAttribute("beginAreaIds", beginAreaIds.substring(0,beginAreaIds.length()-1));
			model.addAttribute("endAreaIds", endAreaIds.substring(0,endAreaIds.length()-1));
			model.addAttribute("type", type);
		}catch(Exception ex){
			logger.error("获取本地货源记录失败，"+ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		
		return "front/logistics/publish";
	}
	
	/**
	 * type 物流种类 1：万佶  2：中危宝
	 * @return
	 */
	@RequestMapping(value = "/front/logistics/search")
	public String search(@RequestParam(value="type", defaultValue="1")Integer type, 
			@ModelAttribute(value="WanjiSourceSearchBean")WanjiSourceSearchBean wanjiSourceSearchBean, 
			HttpServletRequest request, Model model){
		try{
			if(type==1){
				/*
				 * 万佶
				 */
				BigDecimal[] paramId = getId();
				//万佶搜车字典
				Map<String, List<?>> result = wanjiLogisticsInfoService.getPlatCarDict(paramId);			

				model.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
				model.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
				model.addAttribute("wanjiSourceSearchBean", wanjiSourceSearchBean);
				model.addAttribute("AdCodes", wanjiSourceSearchBean.getAdCodes());
				model.addAttribute("TargetAdCodes", wanjiSourceSearchBean.getTargetAdCodes());
				model.addAttribute("TypeCode", wanjiSourceSearchBean.getTypeCode());
				model.addAttribute("CarLoadType", wanjiSourceSearchBean.getCarLoadType());
			}else if(type==2){
				/*
				 * 中危宝
				 */
				model.addAttribute("zwbSourceSearchBean",new ZwbSourceSearchBean());
			}
			
			model.addAttribute("type", type);
		}catch(Exception ex){
			logger.error("详细原因："+ex.getMessage(),ex);
		}
		return "front/logistics/search";
	}
	
	@RequestMapping(value = "/front/logistics/detail")
	public String detail(@RequestParam(value="info")String info, 
			@RequestParam(value="type")Integer type,
			HttpServletRequest request, Model model){
		try{
			String xReq = request.getHeader("x-requested-with");
			if (request.getHeader("x-requested-with") != null
					&&"XMLHttpRequest".equalsIgnoreCase(xReq)) {
				return "redirect:/error/404";
			}else{
				
				info = xssFilter(info);
				info = sqlFilter(info);
				
				model.addAttribute("info", StringEscapeUtils.unescapeHtml4(info));
				model.addAttribute("type", type);
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("详细原因："+ex.getMessage(),ex);
		}
		return "front/logistics/detail";
	}
	
	
	/**
	 * 根据地区id获取经纬度信息
	 */
	@RequestMapping(value="/json/logistics/distance", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getDistance(@RequestParam(value = "code")String code){
		ResultBean resultBean = new ResultBean();
		String[] codes = code.split(",");
		try{
			String sql = "select * from t_wanji_address where code in (?,?) ";
			List<?> list = jdbcTemplate.queryForList(sql, new Object[]{codes[0], codes[1]});
			if(list.size()>0){
				resultBean.setCode(1);
				resultBean.setValue(list);
			}else{
				resultBean.setCode(0);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("详细原因："+ex.getMessage(),ex);
		}
		return resultBean;
	}
	
	
	//取企业id，没有则给公共id
	private BigDecimal[] getId(){
		BigDecimal[] paramId = null;
		BigDecimal accountId = getCurrentAccountId();
		if(accountId!=null){
			BigDecimal companyId = getCompanyId();
			if(companyId==null){
				CompanyInfoBean info =  personalCenterService
						.selectDefaultCompanyForVisitor(getCurrentAccountId());
				
				List<AccountBindBean> list = accountBindBeanService
						.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(getCurrentAccountId(), new BigDecimal(1001), null);	
				if(info==null&&list.isEmpty()){
					paramId = new BigDecimal[]{new BigDecimal("2016062216360980800018"),new BigDecimal("120")};
				}else{
					if(info!=null){						
						paramId = new BigDecimal[]{accountId,info.getCompanyId()};
					}else{
						paramId = new BigDecimal[]{accountId,organizationIdSessionHelper.getRootIdBySessionAttribute()};
					}
				}
			}else{
				paramId = new BigDecimal[]{accountId,companyId};
			}
			
			
		}else{
			paramId = new BigDecimal[]{new BigDecimal("2016062216360980800018"),new BigDecimal("120")};
		}
		return paramId;
	}
	
	@RequestMapping(value = "/logistics/wanji/json/mylist", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean myList(){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			}else{
				if(!isSetDefaultCompany()){
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean =  wanjiLogisticsInfoService.getShipperCargoes(getId());
		}catch(Exception ex){
			logger.error("万佶我发布的货源列表加载失败，详细原因："+ex.getMessage(),ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶我发布的货源列表加载失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	
	private boolean isSetDefaultCompany(){
		CompanyInfoBean info = null;
		try{
			info = personalCenterService
					.selectDefaultCompanyForVisitor(getCurrentAccountId());
		}catch(Exception ex){
			logger.error("万佶物流，查询账户是否设置默认企业异常，详细原因："+ex.getMessage(),ex);
		}
		
		if(info!=null){
			return true;
		}else{
			List<AccountBindBean> list = accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(getCurrentAccountId(), new BigDecimal(1001), null);	
			if(!list.isEmpty()){
				return true;
			}
			return false;
		}
	}
	
	
	/**
	 * XSS 非法字符过滤
	 * 内容以<!--HTML-->开头的用以下规则（保留标签，去掉js脚本）：
	 * 	1、<\s*(script|link|style|iframe)\s([\s\S]+?)<\/\s*\1\s*>
	 * 	2、\s*on[a-z]+\s*=\s*("[^"]+"|'[^']+'|[^\s]+)\s*(?=>) 
	 * 	3、\s*(href|src)\s*=\s*("\s*(javascript|vbscript):[^"]+"|'\s*(javascript|vbscript):[^']+'|(javascript|vbscript):[^\s]+)\s*(?=>) 
	 * 	4、epression\((.|\n)*\);? 
	 * 其它情况下：进行HTML4编码
	 * @author ThinkGem
	 */
	private static Pattern p1 = Pattern.compile("<\\s*(script|link|style|iframe)\\s([\\s\\S]+?)<\\/\\s*\\1\\s*>", Pattern.CASE_INSENSITIVE);
	private static Pattern p2 = Pattern.compile("\\s*on[a-z]+\\s*=\\s*(\"[^\"]+\"|'[^']+'|[^\\s]+)\\s*(?=>)", Pattern.CASE_INSENSITIVE);
	private static Pattern p3 = Pattern.compile("\\s*(href|src)\\s*=\\s*(\"\\s*(javascript|vbscript):[^\"]+\"|'\\s*(javascript|vbscript):[^']+'|(javascript|vbscript):[^\\s]+)\\s*(?=>)", Pattern.CASE_INSENSITIVE);
	private static Pattern p4 = Pattern.compile("epression\\((.|\n)*\\);?", Pattern.CASE_INSENSITIVE);
	
	public static String xssFilter(String text) {
		if (text != null){
			String oriValue = StringUtils.trim(text), value = oriValue;
			
			value = p1.matcher(value).replaceAll("");
			value = p2.matcher(value).replaceAll("");
			value = p3.matcher(value).replaceAll("");
			value = p4.matcher(value).replaceAll("");
			// 如果开始不是HTML，XML，JOSN格式，则再进行HTML的 "、<、> 转码。
			if (!StringUtils.startsWithIgnoreCase(value, "<!--HTML-->") 	// HTML
					&& !StringUtils.startsWithIgnoreCase(value, "<?xml ") 	// XML
					&& !StringUtils.contains(value, "id=\"FormHtml\"") 		// JFlow
					&& !(StringUtils.startsWith(value, "{") && StringUtils.endsWith(value, "}")) // JSON Object
					&& !(StringUtils.startsWith(value, "[") && StringUtils.endsWith(value, "]")) // JSON Array
				){
				value = value.replaceAll("\"", "&quot;").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
			}
			return value;
		}
		return null;
	}
	
	// 预编译SQL过滤正则表达式
	private static Pattern p5 = Pattern.compile("(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)", Pattern.CASE_INSENSITIVE);
			
	/**
	 * SQL过滤，防止注入，传入参数输入有select相关代码，替换空。
	 * @author ThinkGem
	 */
	public static String sqlFilter(String text){
		if (text != null){
			String value = p5.matcher(text).replaceAll("");
			return value;
		}
		return null;
	}
	
	
	
	//万佶单点登录
	@RequestMapping(value = "/interface/json/wanji/SSOLogin")
	public String SSOLogin(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response){
		try {
			
			Map<String,String> parameters = ServletHelper.buildFirst(request);
			/*判断是否企业用户*/
			CompanyInfoBean infoBean = companyInfoBeanProxy.selectByPrimaryKey(new BigDecimal(parameters.get("companyId").toString()));
			if(infoBean==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", -1);
				modelMap.addAttribute("errorMsg", "请使用企业账号登录！");
				return "jsonView";
			}
			
			JSONObject jo = wanjiLogisticsInfoService.getSSOLoginUrlByAccountId(parameters);
			
			modelMap.addAttribute("success", jo.getBoolean("success"));
			modelMap.addAttribute("errorCode", jo.getShort("errorCode"));
			modelMap.addAttribute("errorMsg", jo.getString("errorMsg"));
			modelMap.addAttribute("loginUrl", jo.getString("loginUrl"));
			
		} catch (Exception e) {
			logger.error("【物流】SSOLogin方法出现异常，详细信息：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常！"+e);
		}
		return "jsonView";
	}
}
