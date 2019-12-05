package com.chinatelecom.jx.zone.management.controller.showProduct;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.showInfo.ShowSupplyDemandBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;
import com.chinatelecom.jx.zone.management.service.showSupply.IshowSupplyService;
import com.jfinal.kit.StrKit;

/**
 *  供求展示微信端
 * @author Administrator
 *
 */
@Controller
public class ShowSupplyController extends BaseController  {

	@Autowired
	private IshowSupplyService showSupplyService;
	@Autowired
	private IshowProductService showProductService;


	/**
	 * 首页 找供求
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/auth/page/mobile/weixin/supply/main" )
	public String main(
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("parkId", parkId);
			String backJson = showSupplyService.getSupplyDemandSearch(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//关键字列表
			List<?> keys = JSON.parseObject(jsonObject.getString("keys"), List.class);
			//产品类别列表
			List<?> sortInfoList = JSON.parseObject(jsonObject.getString("sortInfoList"), List.class);
			//List<?> rootNodes= JSON.parseObject(jsonObject.getString("rootNodes"),List.class);

			model.addAttribute("keys", keys);
			model.addAttribute("sortInfoList", sortInfoList);
			//model.addAttribute("rootNodes", rootNodes);

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "/weixinPage/supply/main";
	}

	/**
	 * 异步加载找供求列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/supply/json/main", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMain(
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "categoryId", required = false) String categoryId,
			@RequestParam(value = "provinceName", required = false) String provinceName,
			@RequestParam(value = "areaName", required = false) String areaName,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "typeKey",required = false) String typeKey,
			@RequestParam(value = "isSearch", required = false) String isSearch,
			@RequestParam(value = "userId", defaultValue="-1") BigDecimal userId,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "ip", required = false) String ip,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			if(StrKit.notBlank(searchKey)){
				paramMap.put("searchKey", searchKey);
				model.addAttribute("searchKey", searchKey);
			}
			if(StrKit.notBlank(typeKey)){
				paramMap.put("typeKey", typeKey);
				model.addAttribute("typeKey", typeKey);
			}
			if(StrKit.notBlank(provinceName)){
				paramMap.put("provinceName", provinceName);
				model.addAttribute("provinceName", provinceName);
			}
			if(StrKit.notBlank(areaName)){
				paramMap.put("areaName", areaName);
				model.addAttribute("areaName", areaName);
			}
			if(StrKit.notBlank(isSearch)){
				paramMap.put("isSearch", isSearch);
			}
			if(userId!=null){
				paramMap.put("userId", userId);
			}
			if(StrKit.notBlank(userName)){
				paramMap.put("userName", userName);
			}
			if(StrKit.notBlank(ip)){
				paramMap.put("ip", ip);
			}
			if(StrKit.notBlank(searchType)){
				paramMap.put("searchType", searchType);
			}
			if(StrKit.notBlank(categoryId)){
				paramMap.put("categoryId", categoryId);
			}
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			paramMap.put("parkId", parkId);
			String backJson = showSupplyService.getSupplyDemandSearch(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//供需列表
			List<?> supplyList = JSON.parseObject(jsonObject.getString("pageList"), List.class);
			
			if(supplyList.size()!=0){
				resultBean.setValue(supplyList);
				JSONObject isCollectMap = JSON.parseObject(jsonObject.getString("collectMap"));
				JSONObject addressMap = JSON.parseObject(jsonObject.getString("addressMap"));
				resultBean.setJsonValue(isCollectMap);
				resultBean.setJsonValue1(addressMap);
				paramMap.put("pageNumber", pageNumber+1);
				backJson = showSupplyService.getSupplyDemandSearch(paramMap);
				jsonObject = JSON.parseObject(backJson);
				jsonObject = JSON.parseObject(jsonObject.getString("value"));
				//供需列表
				supplyList = JSON.parseObject(jsonObject.getString("pageList"), List.class);
				if(supplyList.size()!=0){
					resultBean.setCode(1);
				}else{
					resultBean.setCode(0);
				}
			}else{
				resultBean.setCode(2);
			}
		}catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return resultBean;
	}


	/**
	 * 供求详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/productDetails" )
	public String productDetails( 
			@RequestParam(value = "id") BigDecimal id,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "isTemp",defaultValue="0") String isTemp,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			@RequestParam(value = "type",required=false) BigDecimal type,
			Model model) {
		try {
			if(isTemp.equals("0")){
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("id", id);
				paramMap.put("parkId", parkId);
				paramMap.put("userId", userId);
				paramMap.put("userName", userName);
				String backJson = showSupplyService.getSupplyDemanView(paramMap);
				JSONObject jsonObject = JSON.parseObject(backJson);
				jsonObject = JSON.parseObject(jsonObject.getString("value"));
				//供求信息列表
				JSONObject info = JSON.parseObject(jsonObject.getString("info"), JSONObject.class);
				String isCollect = jsonObject.getString("isCollect");
				String address = jsonObject.getString("address");
				//图册列表
				List<?> attList = JSON.parseObject(jsonObject.getString("attList"), List.class);
				//分类名称
				String categoryName= jsonObject.getString("categoryName");
				model.addAttribute("categoryName", categoryName);
				model.addAttribute("attList", attList);
				model.addAttribute("address", address);
				model.addAttribute("info", info);
				model.addAttribute("isCollect", isCollect);
				model.addAttribute("type", type);
			}else{
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("id", id);
				String backJson = showSupplyService.getSupplyDemandViewTemp(paramMap);
				JSONObject jsonObject = JSON.parseObject(backJson);
				jsonObject = JSON.parseObject(jsonObject.getString("value"));
				//供求信息列表
				JSONObject info = JSON.parseObject(jsonObject.getString("info"), JSONObject.class);
				//审核信息
				List<?> auditLog = JSON.parseObject(jsonObject.getString("auditLog"), List.class);
				//图册列表
				List<?> attList = JSON.parseObject(jsonObject.getString("attList"), List.class);
				//分类名称
				String categoryName= jsonObject.getString("categoryName");
				model.addAttribute("categoryName", categoryName);
				model.addAttribute("attList", attList);
				model.addAttribute("auditLog", auditLog);
				model.addAttribute("info", info);
			}
		
			
			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("parkId", parkId);
			String backJson1 = showProductService.getCompanySearch(paramMap1);
			JSONObject jsonObject1 = JSON.parseObject(backJson1);
			jsonObject1 = JSON.parseObject(jsonObject1.getString("value"));
			//推荐企业列表
			List<?> popCompany = JSON.parseObject(jsonObject1.getString("list1"), List.class);
			model.addAttribute("popCompany", popCompany);
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/supply/supplyDemandDetails";
	}

	
	/**
	 * 找企业
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/findEnterprise" )
	public String findEnterprise(
			@RequestParam(value = "searchKey",defaultValue="") String searchKey,
			@RequestParam(value = "categoryId",defaultValue="") String categoryId,
			@RequestParam(value = "categoryName",required=false) String categoryName,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			@RequestParam(value = "isSearch",required=false) String isSearch,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",required=false) BigDecimal userId,
			@RequestParam(value = "userName",required=false) String userName,
			@RequestParam(value = "ip",required=false) String ip,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("searchKey", searchKey);
			paramMap.put("categoryId", categoryId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			if(StrKit.notBlank(categoryName)){
				paramMap.put("categoryName", categoryName);
			}
			if(StrKit.notBlank(isSearch)){
				paramMap.put("isSearch", isSearch);
			}
			if(userId!=null){
				paramMap.put("userId", userId);
			}
			if(StrKit.notBlank(userName)){
				paramMap.put("userName", userName);
			}
			if(StrKit.notBlank(ip)){
				paramMap.put("ip", ip);
			}
			paramMap.put("parkId", parkId);
			String backJson = showProductService.getCompanyList(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//产业二级菜单 
			List<?> childNodes= JSON.parseObject(jsonObject.getString("childNodes"),List.class);
			//产业一级菜单 
			List<?> rootNodes= JSON.parseObject(jsonObject.getString("rootNodes"),List.class);
			//关键字
			List<?> keys= JSON.parseObject(jsonObject.getString("keys"),List.class);
			model.addAttribute("keys", keys);
			model.addAttribute("childNodes", childNodes);
			model.addAttribute("rootNodes", rootNodes);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/supply/findEnterprise";
	}
	
	/**
	 * 异步加载企业列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/supply/json/findEnterprise", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonFindEnterprise(@RequestParam(value = "searchKey",defaultValue="") String searchKey,
			@RequestParam(value = "categoryId",defaultValue="") String categoryId,
			@RequestParam(value = "categoryName",required=false) String categoryName,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			@RequestParam(value = "isSearch",required=false) String isSearch,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",required=false) BigDecimal userId,
			@RequestParam(value = "userName",required=false) String userName,
			@RequestParam(value = "ip",required=false) String ip,
			Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("searchKey", searchKey);
			paramMap.put("categoryId", categoryId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			if(StrKit.notBlank(categoryName)){
				paramMap.put("categoryName", categoryName);
			}
			if(StrKit.notBlank(isSearch)){
				paramMap.put("isSearch", isSearch);
			}
			if(userId!=null){
				paramMap.put("userId", userId);
			}
			if(StrKit.notBlank(userName)){
				paramMap.put("userName", userName);
			}
			if(StrKit.notBlank(ip)){
				paramMap.put("ip", ip);
			}
			paramMap.put("parkId", parkId);
			String backJson = showProductService.getCompanyList(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//企业列表
			List<CompanyInfoBean> companyList= JSON.parseObject(jsonObject.getString("pageList"),List.class);
			if(companyList.size()!=0){
				resultBean.setValue(companyList);
				paramMap.put("pageNumber", pageNumber+1);
				String backJson1 = showProductService.getCompanyList(paramMap);
				JSONObject jsonObject1 = JSON.parseObject(backJson1);
				jsonObject1 = JSON.parseObject(jsonObject1.getString("value"));
				companyList= JSON.parseObject(jsonObject1.getString("pageList"),List.class);
				if(companyList.size()==0){
					resultBean.setCode(0);
				}else{
					resultBean.setCode(1);
				}
			}else{
				resultBean.setCode(2);
			}
		
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return   resultBean;
	}


	

	/**
	 * 我的供需
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/mySupplyDemand" )
	public String mySupplyDemand( Model model) {

		return   "/weixinPage/supply/mySupplyDemand";
	}

	/**
	 * 异步加载我的供需列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/supply/json/mySupplyDemand", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMySupplyDemand(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize
			) {
		ResultBean resultBean = new ResultBean();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("companyId", companyId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			paramMap.put("parkId", parkId);
			String backJson = showSupplyService.getSupplyDemandMyList(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			 //我发布的列表
			 //List<ShowSupplyDemandBean> myList = JSON.parseObject(jsonObject.getString("pageList"),List.class);
			 List<?> supplyList = JSONObject.parseObject(jsonObject.getString("pageList"), List.class);
			if(supplyList.size()!=0){
				resultBean.setValue(supplyList);
				JSONObject addressMap = JSONObject.parseObject(jsonObject.getString("addressMap"));
				resultBean.setJsonValue(addressMap);
				paramMap.put("pageNumber", pageNumber+1);
				backJson = showProductService.getProductMyList(paramMap);
				jsonObject = JSONObject.parseObject(backJson);
				//我发布的列表
				if(!jsonObject.getString("value").equals("[]")){
					jsonObject= JSONObject.parseObject(jsonObject.getString("value"));
					supplyList = JSONObject.parseObject(jsonObject.getString("pageList"),List.class);
					if(supplyList.size()!=0){
						resultBean.setCode(1);
					}else{
						resultBean.setCode(0);
					}
				}else{
					resultBean.setCode(0);
				}
			}else{
				resultBean.setCode(2);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return resultBean;
	}
	

	/**
	 * 企业详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/enterpriseDetails" )
	public String enterpriseDetails( 
			@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("companyId", companyId);
			paramMap.put("userName", userName);
			paramMap.put("parkId", parkId);
			String backJson = showProductService.getCompanyInfoView(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//企业图册列表
			List<?> imageList = JSON.parseObject(jsonObject.getString("imageList"), List.class);
			JSONObject info = JSON.parseObject(jsonObject.getString("companyInfo"),JSONObject.class);
			model.addAttribute("info", info);
			model.addAttribute("imageList", imageList);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/supply/enterpriseDetails";
	}
	/**
	 * 我的收藏
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/myCollection" )
	public String myCollection(
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			String backJson = showProductService.getMyCollect(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			JSONObject imageUrl = JSONObject.parseObject(jsonObject.getString("imageUrl"));
			JSONObject orderNum = JSONObject.parseObject(jsonObject.getString("orderNum"));
			JSONObject price = JSONObject.parseObject(jsonObject.getString("price"));
			JSONObject compName = JSONObject.parseObject(jsonObject.getString("compName"));
			JSONObject area = JSONObject.parseObject(jsonObject.getString("area"));
			JSONObject province = JSONObject.parseObject(jsonObject.getString("province"));
			JSONObject supplyDemand = JSONObject.parseObject(jsonObject.getString("supplyDemand"));
			model.addAttribute("supplyDemand", supplyDemand);
			model.addAttribute("area", area);
			model.addAttribute("province", province);
			model.addAttribute("compName", compName);
			model.addAttribute("imageUrl", imageUrl);
			model.addAttribute("orderNum", orderNum);
			model.addAttribute("price", price);
			model.addAttribute("userId", userId);
			model.addAttribute("pageSize", pageSize);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/supply/myCollection";
	}

	/**
	 * 异步加载收藏 列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/supply/json/myCollection", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMyCollection(@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			@RequestParam(value = "type",defaultValue="1") String type
			) {
		ResultBean resultBean = new ResultBean();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			paramMap.put("type", type);
			String backJson = showProductService.getMyCollect(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			//收藏夹列表
			jsonObject= JSONObject.parseObject(jsonObject.getString("value"));
			List<?> collectList = JSONObject.parseObject(jsonObject.getString("pageList"),List.class);
			if(collectList.size()!=0){
				resultBean.setValue(collectList);
				paramMap.put("pageNumber", pageNumber+1);
				backJson = showProductService.getMyCollect(paramMap);
				jsonObject = JSONObject.parseObject(backJson);
				//收藏夹列表
				jsonObject= JSONObject.parseObject(jsonObject.getString("value"));
				collectList = JSONObject.parseObject(jsonObject.getString("pageList"),List.class);
				if(collectList.size()==0){
					resultBean.setCode(0);
				}else{
					resultBean.setCode(1);
				}
			}else{
				resultBean.setCode(2);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return resultBean;
	}

	/**
	 * 企业供需
	 * pageNumber不能为空或者0
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/supply/enterpriseSupplyDemand" )
	public String enterpriseSupplyDemand(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			Model model) {
		try {

			//企业信息
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("companyId", companyId);
			paramMap.put("userName", userName);
			paramMap.put("parkId", parkId);
			String backJson = showProductService.getCompanyInfoView(paramMap);
			JSONObject jsonObject = JSON.parseObject(backJson);
			jsonObject = JSON.parseObject(jsonObject.getString("value"));
			//企业图册列表
			List<?> imageList = JSON.parseObject(jsonObject.getString("imageList"), List.class);
			JSONObject info = JSON.parseObject(jsonObject.getString("companyInfo"), JSONObject.class);
			model.addAttribute("info", info);
			model.addAttribute("imageList", imageList);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/supply/enterpriseSupplyDemand";
	}
	
	/**
	 * 异步加载企业供需列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/supply/json/enterpriseProduct", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonEnterpriseProduct(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize
			) {
		ResultBean resultBean = new ResultBean();
		try {
			//企业上架供求
			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("userId", userId);
			paramMap1.put("parkId", parkId);
			paramMap1.put("companyId", companyId);
			paramMap1.put("pageNumber", pageNumber);
			paramMap1.put("pageSize", pageSize);
			String backJson1 = showSupplyService.getSupplyDemandUpList(paramMap1);
			JSONObject jsonObject1 = JSON.parseObject(backJson1);
			//供求列表
			jsonObject1 = JSON.parseObject(jsonObject1.getString("value"));
			List<ShowSupplyDemandBean> supplyDemandList= JSON.parseObject(jsonObject1.getString("pageList"),List.class);
			if(supplyDemandList.size()!=0){
				resultBean.setValue(supplyDemandList);
				JSONObject collectMap =  JSONObject.parseObject(jsonObject1.getString("collectMap"));
				resultBean.setJsonValue(collectMap);
				paramMap1.put("pageNumber", pageNumber+1);
				String backJson = showProductService.getProductUpList(paramMap1);
				JSONObject jsonObject = JSON.parseObject(backJson);
				//产品列表
				jsonObject = JSON.parseObject(jsonObject.getString("value"));
				supplyDemandList= JSON.parseObject(jsonObject.getString("pageList"),List.class);
				if(supplyDemandList.size()==0){
					resultBean.setCode(0);
				}else{
					resultBean.setCode(1);
				}
			}else{
				resultBean.setCode(2);
			}
		
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return resultBean;
	}
	
	
}
