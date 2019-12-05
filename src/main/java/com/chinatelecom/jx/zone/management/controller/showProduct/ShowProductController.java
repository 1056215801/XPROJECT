package com.chinatelecom.jx.zone.management.controller.showProduct;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.hcdy.util.StringUtil;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.showInfo.ShowProductInfoBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.service.showProduct.IshowProductService;
import com.chinatelecom.jx.zone.management.util.DateUtil;
import com.jfinal.kit.StrKit;

/**
 * 产品 展示微信端
 * @author Administrator
 *
 */
@Controller
public class ShowProductController extends BaseController  {

	@Autowired
	private IshowProductService showProductService;
	@Autowired
	private IPersonalCenterService personalCenterService;

	/**
	 * 首页 找产品
	 * pageNumber 不能为空或者0
	 * isSearch 搜索的时候传值，searchResult 搜索及搜索完成后翻页传值
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/main2" )
	public String main2(
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "isSearch", required = false) String isSearch,
			@RequestParam(value = "userId", defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("parkId", parkId);
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			paramMap.put("userId", userId);

			String backJson = showProductService.getProductSearch(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//关键字列表
			List<?> keys = JSON.parseObject(jsonObject.getString("keys"), List.class);
			//产品类别列表
			List<?> allRoot = JSON.parseObject(jsonObject.getString("allRoot"), List.class);
			List<?> childNode = JSON.parseObject(jsonObject.getString("childNode"), List.class);
			backJson = showProductService.getUnitList(null);
			jsonObject = JSONObject.parseObject(backJson);
			JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("value"));
			model.addAttribute("unitMap", unitMap);

			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("parkId", parkId);
			String backJson1 = showProductService.getCompanySearch(paramMap1);
			JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
			jsonObject1 = JSONObject.parseObject(jsonObject1.getString("value"));
			//最热企业列表
			List<?> popCompany = JSON.parseObject(jsonObject1.getString("list1"), List.class);

			model.addAttribute("keys", keys);
			model.addAttribute("allRoot", allRoot);
			model.addAttribute("childNode", childNode);
			model.addAttribute("popCompany", popCompany);
			model.addAttribute("isSearch", isSearch);
			model.addAttribute("parkId", parkId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		if(StrKit.notBlank(isSearch)){
			return   "/weixinPage/show/searchResult";
		}else{
			return   "/weixinPage/show/main2";
			//return new ModelAndView("forward:/WEB-INF/views/weixinPage/show/main.html") ;
		}
	}

	/**
	 * 首页 找产品
	 * pageNumber 不能为空或者0
	 * isSearch 搜索的时候传值，searchResult 搜索及搜索完成后翻页传值
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/auth/page/mobile/weixin/show/main" )
	public String main(
			@RequestParam(value = "isSearch", required = false) String isSearch,
			@RequestParam(value = "userId", defaultValue="1") BigDecimal userId,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			Model model) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			if(getCurrentParkId()!=null){
				paramMap.put("parkId", getCurrentParkId());
				model.addAttribute("parkId", getCurrentParkId());
				paramMap.put("userId", getCurrentAccountId());
			}
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			String backJson = showProductService.getProductSearch(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//关键字列表
			List<?> keys = JSON.parseObject(jsonObject.getString("keys"), List.class);
			//产品类别列表
			List<?> allRoot = JSON.parseObject(jsonObject.getString("allRoot"), List.class);
			List<?> childNode = JSON.parseObject(jsonObject.getString("childNode"), List.class);
			backJson = showProductService.getUnitList(null);
			jsonObject = JSONObject.parseObject(backJson);
			JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("value"));
			model.addAttribute("unitMap", unitMap);

			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			List<?> popCompany = new ArrayList<>();
			if(getCurrentParkId()!=null){
				paramMap1.put("parkId", getCurrentParkId());
				String backJson1 = showProductService.getCompanySearch(paramMap1);
				JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
				jsonObject1 = JSONObject.parseObject(jsonObject1.getString("value"));
				//最热企业列表
				popCompany = JSON.parseObject(jsonObject1.getString("list1"), List.class);
			}else{
				Map<String, Object> paramMap2 = new HashMap<String, Object>();
				paramMap2.put("limit", 12);
				String backJson2 = showProductService.getPopCompany(paramMap2);
				JSONObject jsonObject2 = JSONObject.parseObject(backJson2);
				jsonObject2 = JSONObject.parseObject(jsonObject2.getString("value"));
				//最热企业列表
				popCompany = JSON.parseObject(jsonObject2.getString("list"), List.class);
			}
			model.addAttribute("keys", keys);
			model.addAttribute("allRoot", allRoot);
			model.addAttribute("childNode", childNode);
			model.addAttribute("popCompany", popCompany);
			model.addAttribute("isSearch", isSearch);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		if(StrKit.notBlank(isSearch)){
			return   "/weixinPage/show/searchResult";
		}else{
			return   "/weixinPage/show/main";
		}
	}

	/**
	 * 异步加载找产品列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/show/json/main", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMain(@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "parentId", required = false) String parentId,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "popularity", required = false) String popularity,
			@RequestParam(value = "price", required = false) String price,
			@RequestParam(value = "minPrice", required = false) String minPrice,
			@RequestParam(value = "maxPrice", required = false) String maxPrice,
			@RequestParam(value = "startNum", required = false) String startNum,
			@RequestParam(value = "endNum", required = false) String endNum,
			@RequestParam(value = "provinceId", required = false) String provinceId,
			@RequestParam(value = "areaId", required = false) String areaId,
			@RequestParam(value = "isSearch", required = false) String isSearch,
			@RequestParam(value = "userId", required = false) BigDecimal userId,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "ip", required = false) String ip,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize
			){
		ResultBean resultBean = new ResultBean();
		try{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			if(StrKit.notBlank(searchText)){
				paramMap.put("searchText", searchText);
			}
			if(StrKit.notBlank(id) && !id.equals("")){
				paramMap.put("id", id);
			}
			if(StrKit.notBlank(parentId) && !parentId.equals("")){
				paramMap.put("parentId", parentId);
			}
			if(StrKit.notBlank(name)){
				paramMap.put("name", name);
			}
			if(StrKit.notBlank(popularity)){
				paramMap.put("popularity", popularity);
			}
			if(StrKit.notBlank(price)){
				paramMap.put("price", price);
			}
			if(StrKit.notBlank(minPrice)){
				paramMap.put("minPrice", minPrice);
			}
			if(StrKit.notBlank(maxPrice)){
				paramMap.put("maxPrice", maxPrice);
			}
			if(StrKit.notBlank(startNum)){
				paramMap.put("startNum", startNum);
			}
			if(StrKit.notBlank(endNum)){
				paramMap.put("endNum", endNum);
			}
			if(StrKit.notBlank(isSearch)){
				paramMap.put("isSearch", isSearch);
			}
			BigDecimal accountId = getCurrentAccountId();
			if(accountId!=null){
				paramMap.put("userId", accountId);
				paramMap.put("userName", getCurrentAccountName());
				paramMap.put("parkId", getCurrentParkId());
			}
			if(StrKit.notBlank(ip)){
				paramMap.put("ip", ip);
			}
			if(StrKit.notBlank(areaId)){
				paramMap.put("areaId", areaId);
			}
			if(StrKit.notBlank(provinceId)){
				paramMap.put("provinceId", provinceId);
			}
			paramMap.put("pageNumber", pageNumber);
			paramMap.put("pageSize", pageSize);
			
			String backJson = showProductService.getProductSearch(paramMap);
			
			if(StringUtil.checkNotNull(backJson)){

				JSONObject jsonObject = JSONObject.parseObject(backJson);
				jsonObject = JSONObject.parseObject(jsonObject.getString("value"));

				//产品列表

				if (jsonObject == null) {
					resultBean.setCode(2);
					return resultBean;
				}
				List<ShowProductInfoBean> productList = JSON.parseObject(jsonObject.getString("pageList"), List.class);
				JSONObject isCollectMap = JSON.parseObject(jsonObject.getString("collectMap"));
				resultBean.setJsonValue(isCollectMap);
				if(productList.size()!=0){
					resultBean.setValue(productList);
					paramMap.put("pageNumber", pageNumber+1);
					String backJson1 = showProductService.getProductSearch(paramMap);
					JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
					jsonObject1 = JSONObject.parseObject(jsonObject1.getString("value"));

					//下一页产品列表
					List<ShowProductInfoBean> productList1 = JSON.parseObject(jsonObject1.getString("pageList"), List.class);
					if(productList1.size()==0){
						resultBean.setCode(0);
					}else{
						resultBean.setCode(1);
					}
				}else{
					resultBean.setCode(2);
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

			resultBean.setCode(-1);
			resultBean.setMsg("后台访问超时，请重试！");
		}
		return resultBean;
	}


	/**
	 * 产品详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/productDetails" )
	public String productDetails( @RequestParam(value = "id",defaultValue="90020161014145549001001000000032") BigDecimal id,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			@RequestParam(value = "type",required=false) BigDecimal type,

			Model model,HttpServletRequest request) {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("parkId", parkId);
			paramMap.put("userId", userId);
			paramMap.put("userName", userName);
			String backJson = showProductService.getProductView(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//审核信息列表
			List<?> auditLog = JSON.parseObject(jsonObject.getString("auditLog"), List.class);
			//图册列表
			List<?> attList = JSON.parseObject(jsonObject.getString("attList"), List.class);
			//分类名称
			String categoryName= jsonObject.getString("categoryName");
			//产品信息
			JSONObject info = JSON.parseObject(jsonObject.getString("info"), JSONObject.class);
			//是否被收藏
			String isCollect = jsonObject.getString("isCollect");
			//联系电话，经营地址
			String tel =jsonObject.getString("tel");
			String address = jsonObject.getString("address");
			//所在地
			String provinceName = jsonObject.getString("provinceName");
			String areaName = jsonObject.getString("areaName");

			backJson = showProductService.getUnitList(null);
			jsonObject = JSONObject.parseObject(backJson);
			JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("value"));
			model.addAttribute("unitMap", unitMap);

			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("parkId", parkId);
			String backJson1 = showProductService.getCompanySearch(paramMap1);
			JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
			jsonObject1 = JSONObject.parseObject(jsonObject1.getString("value"));
			//企业推荐
			List<?> popCompany = JSON.parseObject(jsonObject1.getString("list1"), List.class);

			model.addAttribute("categoryName", categoryName);
			model.addAttribute("attList", attList);
			model.addAttribute("isCollect", isCollect);
			model.addAttribute("tel", tel);
			model.addAttribute("address", address);
			model.addAttribute("popCompany", popCompany);
			model.addAttribute("info", info);
			model.addAttribute("type", type);
			model.addAttribute("parkId", parkId);
			model.addAttribute("areaName", areaName);
			model.addAttribute("provinceName", provinceName);
			if(auditLog.size()!=0){
				model.addAttribute("auditLog", auditLog);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

		}
		return   "/weixinPage/show/productDetails";
	}



	/**
	 * 企业详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/enterpriseDetails" )
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
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//企业图册列表
			List<?> imageList = JSON.parseObject(jsonObject.getString("imageList"), List.class);
			JSONObject info = JSON.parseObject(jsonObject.getString("companyInfo"),JSONObject.class);
			model.addAttribute("info", info);
			model.addAttribute("imageList", imageList);
			model.addAttribute("parkId", parkId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

		}
		return   "/weixinPage/show/enterpriseDetails";
	}

	/**
	 * 企业产品
	 * pageNumber不能为空或者0
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/enterpriseProduct" )
	public String enterpriseProduct(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
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
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//企业图册列表
			List<?> imageList = JSON.parseObject(jsonObject.getString("imageList"), List.class);
			String campanyInfoString = jsonObject.getString("companyInfo");
			campanyInfoString = campanyInfoString.replaceAll("\\\\r\\\\n", "");
			JSONObject info = JSON.parseObject(campanyInfoString, JSONObject.class);

			backJson = showProductService.getUnitList(null);
			jsonObject = JSONObject.parseObject(backJson);
			JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("value"));
			model.addAttribute("unitMap", unitMap);
			model.addAttribute("info", info);
			model.addAttribute("imageList", imageList);
			model.addAttribute("parkId", parkId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/show/enterpriseProduct";
	}


	/**
	 * 异步加载企业产品列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/show/json/enterpriseProduct", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonEnterpriseProduct(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize
			) {
		ResultBean resultBean = new ResultBean();
		try {
			//企业上架产品信息
			Map<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("parkId", parkId);
			paramMap1.put("companyId", companyId);
			paramMap1.put("userId", userId);
			paramMap1.put("pageNumber", pageNumber);
			paramMap1.put("pageSize", pageSize);
			String backJson1 = showProductService.getProductUpList(paramMap1);
			JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
			//产品列表
			jsonObject1= JSONObject.parseObject(jsonObject1.getString("value"));
			List<?> productList= JSONObject.parseObject(jsonObject1.getString("pageList"),List.class);
			if(productList.size()!=0){
				resultBean.setValue(productList);
				JSONObject collectMap =  JSONObject.parseObject(jsonObject1.getString("collectMap"));
				resultBean.setJsonValue(collectMap);
				paramMap1.put("pageNumber", pageNumber+1);
				String backJson = showProductService.getProductUpList(paramMap1);
				JSONObject jsonObject = JSONObject.parseObject(backJson);
				//产品列表
				jsonObject= JSONObject.parseObject(jsonObject.getString("value"));
				productList= JSONObject.parseObject(jsonObject.getString("pageList"),List.class);
				if(productList.size()==0){
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
	 * 找企业
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/findEnterprise" )
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
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//产业二级菜单 
			List<?> childNodes= JSONObject.parseObject(jsonObject.getString("childNodes"),List.class);
			//产业一级菜单 
			List<?> rootNodes= JSONObject.parseObject(jsonObject.getString("rootNodes"),List.class);
			//关键字
			List<?> keys= JSONObject.parseObject(jsonObject.getString("keys"),List.class);
			model.addAttribute("keys", keys);
			model.addAttribute("childNodes", childNodes);
			model.addAttribute("rootNodes", rootNodes);
			model.addAttribute("parkId", parkId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return   "/weixinPage/show/findEnterprise";
	}

	/**
	 * 异步加载企业列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/show/json/findEnterprise", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonFindEnterprise(@RequestParam(value = "searchKey",defaultValue="") String searchKey,
			@RequestParam(value = "categoryId",defaultValue="") String categoryId,
			@RequestParam(value = "categoryName",required=false) String categoryName,
			@RequestParam(value = "pageNumber",defaultValue="1") int pageNumber,
			@RequestParam(value = "pageSize",defaultValue="10") String pageSize,
			@RequestParam(value = "isSearch",required=false) String isSearch,
			@RequestParam(value = "parkId",required=false) BigDecimal parkId,
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
			paramMap.put("parkId", 0);
			/*if(getCurrentParkId()!=null){
				paramMap.put("parkId", parkId);
			}else{
				paramMap.put("parkId", 0);
			}*/
			String backJson = showProductService.getCompanyList(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			jsonObject = JSONObject.parseObject(jsonObject.getString("value"));
			//企业列表
			List<CompanyInfoBean> companyList= JSONObject.parseObject(jsonObject.getString("pageList"),List.class);
			if(companyList.size()!=0){
				resultBean.setValue(companyList);
				paramMap.put("pageNumber", pageNumber+1);
				String backJson1 = showProductService.getCompanyList(paramMap);
				JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
				jsonObject1 = JSONObject.parseObject(jsonObject1.getString("value"));
				companyList= JSONObject.parseObject(jsonObject1.getString("pageList"),List.class);
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
	 * 我的收藏
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/myCollection" )
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
			JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("unit"));


			model.addAttribute("unitMap", unitMap);
			model.addAttribute("compName", compName);
			model.addAttribute("imageUrl", imageUrl);
			model.addAttribute("orderNum", orderNum);
			model.addAttribute("price", price);
			model.addAttribute("userId", userId);
			model.addAttribute("pageSize", pageSize);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);

		}
		return   "/weixinPage/show/myCollection";
	}

	/**
	 * 异步加载收藏 列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/show/json/myCollection", produces = MediaType.APPLICATION_JSON_VALUE)
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
	 * 我的产品 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/myProduct" )
	public String myProduct(Model model) {
		String backJson = showProductService.getUnitList(null);
		JSONObject jsonObject = JSONObject.parseObject(backJson);
		JSONObject unitMap = JSONObject.parseObject(jsonObject.getString("value"));
		model.addAttribute("unitMap", unitMap);

		return   "/weixinPage/show/myProduct";
	}


	/**
	 * 异步加载我的产品 列表
	 * code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */
	@RequestMapping(value = "/show/json/myProduct", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonMyProduct(@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
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
			String backJson = showProductService.getProductMyList(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			//我发布的列表
			List<ShowProductInfoBean> myList = JSONObject.parseObject(jsonObject.getString("value"),List.class);
			if(myList.size()!=0){
				resultBean.setValue(myList);
				paramMap.put("pageNumber", pageNumber+1);
				backJson = showProductService.getProductMyList(paramMap);
				jsonObject = JSONObject.parseObject(backJson);
				//我发布的列表
				myList = JSONObject.parseObject(jsonObject.getString("value"),List.class);
				if(myList.size()!=0){
					resultBean.setCode(1);
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
	 * 添加至收藏夹
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/json/addToCollection", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String addToCollection(
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			@RequestParam(value = "userName",defaultValue="测试企业1管理员") String userName,
			@RequestParam(value = "companyId",defaultValue="1") BigDecimal companyId,
			@RequestParam(value = "productId",defaultValue="90020161014145549001001000000032") BigDecimal productId,
			@RequestParam(value = "productName",defaultValue="收藏列表测试2") String productName,
			@RequestParam(value = "type",defaultValue="1") String type,
			Model model) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("parkId", parkId);
		paramMap.put("userId", userId);
		paramMap.put("userName", userName);
		paramMap.put("companyId", companyId);
		paramMap.put("productId", productId);
		paramMap.put("productName", productName);
		paramMap.put("type", type);
		String backJson = showProductService.getAddToCollect(paramMap);

		return backJson;
	}
	/**
	 * 从收藏夹删除
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/json/delFromCollection", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String delFromCollection(
			@RequestParam(value = "productId") BigDecimal productId,
			@RequestParam(value = "parkId",defaultValue="0") BigDecimal parkId,
			@RequestParam(value = "userId",defaultValue="1") BigDecimal userId,
			Model model) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("parkId", parkId);
		paramMap.put("productId", productId);
		paramMap.put("userId",userId);
		String backJson = showProductService.getDelFromCollect(paramMap);
		return backJson;
	}
	/**
	 * 附件下载
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/show/json/ajaxGetAtts", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean ajaxGetAtts(
			@RequestParam(value = "attIds") String attIds,
			Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("attIds", attIds);
			String backJson = showProductService.getAjaxGetAtts(paramMap);
			JSONObject jsonObject = JSONObject.parseObject(backJson);
			List<?> list= JSONObject.parseObject(jsonObject.getString("value"),List.class);
			if(list.size()==0){
				resultBean.setCode(2);
			}else{
				resultBean.setValue(list);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
		}
		return resultBean;
	}

	/**
	 * 地址
	 */
	@RequestMapping(value = "/show/getArea", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getArea(@RequestParam(value = "parentId")BigDecimal parentId){
		ResultBean resultBean = new ResultBean();
		try {
			resultBean = personalCenterService.selectAreaInfo(parentId);
		} catch (Exception ex) {
			logger.error("获取地址信息失败，详细原因："+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("地址获取失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

}
