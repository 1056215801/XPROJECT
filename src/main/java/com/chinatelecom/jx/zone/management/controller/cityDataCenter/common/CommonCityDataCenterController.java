package com.chinatelecom.jx.zone.management.controller.cityDataCenter.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageCustomBean;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageParameterBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.cityDataCenter.common.ICommonCityDataCenterService;
import com.chinatelecom.jx.zone.management.service.entranceParam.IEntrancePageCustomService;
import com.chinatelecom.jx.zone.management.service.entranceParam.IEntrancePageParameterService;

@Controller
public class CommonCityDataCenterController extends BaseController {
	@Autowired
	private ICommonCityDataCenterService commonCityDataCenterService;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private IEntrancePageCustomService entrancePageCustomService;

	@Autowired
	private IEntrancePageParameterService entrancePageParameterService;

	private static final Logger logger = LoggerFactory.getLogger(CommonCityDataCenterController.class);

	/**
	 * 首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/index/{page}")
	public String index(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) BigDecimal year, @RequestParam(value = "month", required = false) BigDecimal month,
		@RequestParam(value = "orgId", required = false) BigDecimal orgId, @RequestParam(value = "areaId", required = false) BigDecimal areaId,
		@RequestParam(value = "entranceId", required = false) BigDecimal entranceId, @RequestParam(value = "areaName", required = false) String areaName,
		@RequestParam(value = "provinceId", defaultValue = "360000") BigDecimal provinceId, @RequestParam(value = "pId", defaultValue = "130000") BigDecimal pId,
		@RequestParam(value = "industryId", defaultValue = "130100") BigDecimal industryId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("orgId", orgId);
			model.addAttribute("areaId", areaId);
			model.addAttribute("areaName", areaName);
			model.addAttribute("entranceId", orgId);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360900");
			}
			String sql = "select * from X_OFFICE.t_ld_log where pid = ? ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { industryId });
			if (!list.isEmpty()) {
				StringBuilder ids = new StringBuilder();
				StringBuilder names = new StringBuilder();
				for (Map<String, Object> record : list) {
					ids.append(record.get("id").toString()).append(",");
					names.append(record.get("name").toString()).append(",");
				}
				model.addAttribute("ids", ids.toString());
				model.addAttribute("names", names.toString());
			}
			model.addAttribute("pId", pId);
			model.addAttribute("industryId", industryId);
			/* 获取有数据年份列表，季度列表 */
			int pageType = 0;
			if (page == 6 || page == 7) {
				pageType = 2;
			} else if (page == 4 || page == 5) {
				pageType = 3;
			} else {
				pageType = 1;
			}
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, pageType);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, pageType);
			if (year != null && month != null) {
				searchInfo.put("year", year);
				searchInfo.put("month", month);
			} else {
				/*
				 * if (page == 4 || page == 5) { searchInfo.put("year", 2017);
				 * searchInfo.put("month", 12); }
				 */
			}
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			/* 江西上栗经济开发区 */
			if (new BigDecimal("360900").equals(orgId)) {
				switch (page) {
				case 1:
					return "front/cityDataCenter/yc/ycIndex1";
				case 2:
					return "front/cityDataCenter/yc/ycIndex2";
				case 3:
					return "front/cityDataCenter/yc/ycIndex3";
				case 4:
					return "front/cityDataCenter/yc/ycIndex4";
				case 5:
					return "front/cityDataCenter/yc/ycIndex5";
				case 6:
					return "front/cityDataCenter/yc/ycIndex6";
				case 7:
					return "front/cityDataCenter/yc/ycIndex7";
				case 8:
					return "front/cityDataCenter/yc/ycIndex8";
				case 9:
					return "front/cityDataCenter/yc/ycIndex9";
				default:
					return "redirect:/error/404";
				}
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "redirect:/error/404";
	}

	/**
	 * 锂电首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/ldIndex/{page}")
	public String ldIndex(@PathVariable(value = "page") int page, @RequestParam(value = "pId", defaultValue = "130000") BigDecimal pId,
		@RequestParam(value = "industryId", defaultValue = "130100") BigDecimal industryId, HttpServletRequest request, Model model) {
		try {
			String sql = "select * from X_OFFICE.t_ld_log where pid = ? ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { industryId });
			if (!list.isEmpty()) {
				StringBuilder ids = new StringBuilder();
				StringBuilder names = new StringBuilder();
				for (Map<String, Object> record : list) {
					ids.append(record.get("id").toString()).append(",");
					names.append(record.get("name").toString()).append(",");
				}
				model.addAttribute("ids", ids.toString());
				model.addAttribute("names", names.toString());
			}
			model.addAttribute("pId", pId);
			model.addAttribute("industryId", industryId);
			switch (page) {
			case 1:
				return "front/ldDataCenter/ldIndex1";
			case 2:
				return "front/cityDataCenter/ld/ldIndex2";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】ldIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 宜春行业大数据首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/industry/main")
	public String industryMain(@RequestParam(value = "type", required = false) Integer type, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("type", type);
			return "front/cityDataCenter/industry/main";
		} catch (Exception e) {
			logger.error("【宜春行业大数据首页】industryMain方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	@RequestMapping(value = "/front/cityDataCenter/indexIframe/{page}")
	public String indexIframe(@PathVariable(value = "page") int page, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "areaId", required = false) BigDecimal areaId, @RequestParam(value = "areaName", required = false) String areaName,
		@RequestParam(value = "provinceId", defaultValue = "360000") BigDecimal provinceId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("orgId", orgId);
			model.addAttribute("areaId", areaId);
			model.addAttribute("areaName", areaName);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360900");
			}
			/* 获取有数据年份列表，季度列表 */
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, page == 6 || page == 7 ? 2 : 1);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, page == 6 || page == 7 ? 2 : 1);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			/* 江西上栗经济开发区 */
			if (new BigDecimal("360900").equals(orgId)) {
				switch (page) {
				case 1:
					return "front/cityDataCenter/ycIframe/ycIndex1";
				case 2:
					return "front/cityDataCenter/ycIframe/ycIndex2";
				case 3:
					return "front/cityDataCenter/ycIframe/ycIndex3";
				case 4:
					return "front/cityDataCenter/ycIframe/ycIndex4";
				case 5:
					return "front/cityDataCenter/ycIframe/ycIndex5";
				case 6:
					return "front/cityDataCenter/ycIframe/ycIndex6";
				case 7:
					return "front/cityDataCenter/ycIframe/ycIndex7";
				default:
					return "redirect:/error/404";
				}
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "redirect:/error/404";
	}

	/**
	 * 获取搜索条件
	 * 
	 * @param page
	 * @param orgId
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/cityDataCenter/index")
	public String index(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "orgId", required = false) BigDecimal orgId, HttpServletResponse response,
		ModelMap modelMap) {
		try {
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
			if (page == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数page未设置！");
			}
			if (orgId == null) {
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数orgId未设置！");
			}
			/* 获取有数据年份列表，季度列表 */
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, page == 6 || page == 7 ? 2 : 1);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, page == 6 || page == 7 ? 2 : 1);
			modelMap.addAttribute("searchList", searchList);
			modelMap.addAttribute("searchInfo", searchInfo);
		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "数据获取异常！");
		}
		return "jsonView";
	}

	/**
	 * 锂电数据
	 */
	@RequestMapping(value = "/front/cityDataCenter/jsonData")
	public String getJSON(@RequestParam(value = "orgId", required = false) BigDecimal orgId, HttpServletResponse response, ModelMap modelMap) {
		try {
			String sql = "select * from X_OFFICE.t_ld_log where kind= 3 order by id asc, pid asc ";
			List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
			List<JSONObject> infoList = new ArrayList<>();
			if (!list.isEmpty()) {
				for (Map<String, Object> record : list) {
					JSONObject jo = new JSONObject();
					jo.put("id", record.get("id").toString());
					jo.put("name", record.get("name").toString());
					jo.put("pId", record.get("pId").toString());
					jo.put("kind", record.get("kind").toString());
					infoList.add(jo);
				}
			}
			modelMap.addAttribute("list", infoList);
		} catch (Exception e) {
			logger.error("【市级数据中心】parkPercentOrder方法发生异常，详细原因：" + e.getMessage(), e);
		}
		return "jsonView";
	}

	/**
	 * 宜春数据中心新版首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/ycIndex/{page}")
	public String ycIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "spanIndex", required = false) BigDecimal spanIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId, HttpServletRequest request,
		Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("parkId", parkId);
			model.addAttribute("parkName", parkName);
			model.addAttribute("page", page);
			model.addAttribute("spanIndex", spanIndex);
			model.addAttribute("entranceId", orgId);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360900");
			}
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			/* 获取有数据年份列表，季度列表 */
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, 2);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, 2);
			if (year != null && month != null) {
				searchInfo.put("year", year);
				searchInfo.put("month", month);
			} else {
				/*
				 * if (page == 4 || page == 5) { searchInfo.put("year", 2017);
				 * searchInfo.put("month", 12); }
				 */
			}
			String wsPath = showLoginService.getWebSocketPath();
			model.addAttribute("wsPath", wsPath);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			switch (page) {
			case 0:
				return "front/cityDataCenter/ycNew/index";
			case 1:
				return "front/cityDataCenter/ycNew/economic"; //return "front/cityDataCenter/ycNew/index";
			case 2:
				return "front/cityDataCenter/ycNew/mainEconomicIndex";
			case 3:
				return "front/cityDataCenter/ycNew/commercialPower";
			case 4:
				return "front/cityDataCenter/ycNew/ycAreaMap";
			case 5:
				return "front/cityDataCenter/ycNew/ycParkMap";
			case 6:
				return "front/cityDataCenter/ycNew/logistics";
			case 7:
				return "front/cityDataCenter/ycNew/eightLeadingIndustry";
			case 8:
				return "front/cityDataCenter/ycNew/tenMajor";
			case 9:
				return "front/cityDataCenter/ycNew/companyStatistic";
			case 10:
				return "front/cityDataCenter/ycNew/helping";
			case 11:
				return "front/cityDataCenter/ycNew/leaderIndex";
			case 12:
				return "front/cityDataCenter/ycNew/industrialInvest";
			case 13:
				return "front/cityDataCenter/ycNew/economic";
			case 14:
				return "front/cityDataCenter/ycNew/electric";
			case 15:
				return "front/cityDataCenter/ycNew/industrialInvestSecond";
			case 16:
				return "front/cityDataCenter/ycNew/enterpriseService";
			case 17:
				return "front/cityDataCenter/ycNew/companyManage";
			case 18:
				return "front/cityDataCenter/ycNew/enterpriseRecruit";
			case 19:
				return "front/cityDataCenter/ycNew/enterpriseInnovationInformationFirst";
			case 20:
				return "front/cityDataCenter/ycNew/enterpriseInnovationInformationSecond";
			case 21:
				return "front/cityDataCenter/ycNew/enterpriseInnovationInformationThird";
			case 22:
				return "front/cityDataCenter/ycNew/enterpriseInnovationInformationFourth";
			case 23:
				return "front/cityDataCenter/ycNew/dome";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 宜春数据中心新版首页 //第四版
	 */
	@RequestMapping(value = "/front/cityDataCenter/ycFourth/{page}")
	public String ycNewIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "spanIndex", required = false) BigDecimal spanIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId, HttpServletRequest request,
		Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("parkId", parkId);
			model.addAttribute("parkName", parkName);
			model.addAttribute("page", page);
			model.addAttribute("spanIndex", spanIndex);
			model.addAttribute("entranceId", orgId);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360900");
			}
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", getCurrentAccountName());
				model.addAttribute("accountId", getCurrentAccount().getAccountId());
				model.addAttribute("rootId", getRootId());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", getGovernmentKind());
				model.addAttribute("cityId", getCurrentAreaIds()[1]);
				model.addAttribute("orgType", getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			/* 获取有数据年份列表，季度列表 */
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, 2);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, 2);
			if (year != null && month != null) {
				searchInfo.put("year", year);
				searchInfo.put("month", month);
			} else {
				/*
				 * if (page == 4 || page == 5) { searchInfo.put("year", 2017);
				 * searchInfo.put("month", 12); }
				 */
			}
			String wsPath = showLoginService.getWebSocketPath();
			model.addAttribute("wsPath", wsPath);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			switch (page) {
			case 0:
				return "front/cityDataCenter/ycFourth/index";
			case 1:
				return "front/cityDataCenter/ycFourth/economic"; //return "front/cityDataCenter/ycNew/index";
			case 2:
				return "front/cityDataCenter/ycFourth/mainEconomicIndex";
			case 3:
				return "front/cityDataCenter/ycFourth/commercialPower";
			case 4:
				return "front/cityDataCenter/ycFourth/ycAreaMap";
			case 5:
				return "front/cityDataCenter/ycFourth/ycParkMap";
			case 6:
				return "front/cityDataCenter/ycFourth/logistics";
			case 7:
				return "front/cityDataCenter/ycFourth/eightLeadingIndustry";
			case 8:
				return "front/cityDataCenter/ycFourth/tenMajor";
			case 9:
				return "front/cityDataCenter/ycFourth/companyStatistic";
			case 10:
				return "front/cityDataCenter/ycFourth/helping";
			case 11:
				return "front/cityDataCenter/ycFourth/leaderIndex";
			case 12:
				return "front/cityDataCenter/ycFourth/industrialInvest";
			case 13:
				return "front/cityDataCenter/ycFourth/economic";
			case 14:
				return "front/cityDataCenter/ycFourth/electric";
			case 15:
				return "front/cityDataCenter/ycFourth/industrialInvestSecond";
			case 16:
				return "front/cityDataCenter/ycFourth/enterpriseService";
			case 17:
				return "front/cityDataCenter/ycFourth/companyManage";
			case 18:
				return "front/cityDataCenter/ycFourth/enterpriseRecruit";
			case 19:
				return "front/cityDataCenter/ycFourth/enterpriseInnovationInformationFirst";
			case 20:
				return "front/cityDataCenter/ycFourth/enterpriseInnovationInformationSecond";
			case 21:
				return "front/cityDataCenter/ycFourth/enterpriseInnovationInformationThird";
			case 22:
				return "front/cityDataCenter/ycFourth/enterpriseInnovationInformationFourth";
			case 23:
				return "front/cityDataCenter/ycFourth/productPrice";
			case 24:
				return "front/cityDataCenter/ycFourth/industryMonitoring-electric";
			case 25:
				return "front/cityDataCenter/ycFourth/industryMonitoring-video";
			case 26:
				return "front/cityDataCenter/ycFourth/ruleAboveEnterprise";
			case 27:
				return "front/cityDataCenter/ycFourth/keynoteTaxFund";
			case 28:
				return "front/cityDataCenter/ycFourth/demo";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】index方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 宜春锂电数据中心新版首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/ycLdIndex/{page}")
	public String ycLdIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "spanIndex", required = false) BigDecimal spanIndex, @RequestParam(value = "type", required = false) Integer type,
		@RequestParam(value = "id", required = false) BigDecimal id, @RequestParam(value = "typeId", required = false) BigDecimal typeId,
		@RequestParam(value = "typeName", required = false) String typeName, @RequestParam(value = "mtype", required = false) String mtype, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("entranceId", 3609009);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("parkId", parkId);
			model.addAttribute("parkName", parkName);
			model.addAttribute("page", page);
			model.addAttribute("type", type);
			model.addAttribute("typeId", typeId);
			model.addAttribute("typeName", typeName);
			model.addAttribute("id", id);
			model.addAttribute("spanIndex", spanIndex);
			model.addAttribute("mtype", mtype);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360900");
			}
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			String wsPath = showLoginService.getWebSocketPath();
			model.addAttribute("wsPath", wsPath);
			switch (page) {
			case 1:
				return "front/cityDataCenter/ld/index";
			case 2:
				return "front/cityDataCenter/ld/liReserves";
			case 3:
				return "front/cityDataCenter/ld/productPrice";
			case 4:
				return "front/cityDataCenter/ld/ldIndex4";
			case 5:
				return "front/cityDataCenter/ld/ldIndex5";
			case 6:
				return "front/cityDataCenter/ld/ldIndex6";
			case 7:
				return "front/cityDataCenter/ld/companyMap";
			case 8:
				return "front/cityDataCenter/ld/industryChain";
			case 10:
				return "front/cityDataCenter/ld/newEnergyVehicle";
			case 11:
				return "front/cityDataCenter/ld/newEnergyVehicle";
			case 12:
				return "front/cityDataCenter/ld/liElecInstallMachine";
			case 13:
				return "front/cityDataCenter/ld/newEnergyVehicle";
			case 14:
				return "front/cityDataCenter/ld/importAndOutport";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【市级数据中心】ycLdIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 江西省数据中心新版首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/gxwIndex/{page}")
	public String gxwIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "spanIndex", required = false) BigDecimal spanIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId, HttpServletRequest request,
		Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("parkId", parkId);
			model.addAttribute("parkName", parkName);
			model.addAttribute("page", page);
			model.addAttribute("spanIndex", spanIndex);
			if (new BigDecimal("3609009").equals(orgId)) {
				orgId = new BigDecimal("360000");
			}
			if (entranceId == null) {
				entranceId = new BigDecimal("3600009");
			}
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("orgType", this.getOrganizationType());
				model.addAttribute("currentParkId", this.getCurrentParkId());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			/* 获取有数据年份列表，季度列表 */
			JSONObject searchList = commonCityDataCenterService.selectSearchList(orgId, 2);
			/* 获取最近录入数据年份和季度 */
			JSONObject searchInfo = commonCityDataCenterService.selectDefaultSearchInfo(orgId, 2);
			if (year != null && month != null) {
				searchInfo.put("year", year);
				searchInfo.put("month", month);
			} else {
				/*
				 * if (page == 4 || page == 5) { searchInfo.put("year", 2017);
				 * searchInfo.put("month", 12); }
				 */
			}
			String wsPath = showLoginService.getWebSocketPath();
			model.addAttribute("wsPath", wsPath);
			model.addAttribute("searchList", searchList);
			model.addAttribute("searchInfo", searchInfo);
			switch (page) {
			case 0:
				return "front/cityDataCenter/gxw/index";
			case 1:
				return "front/cityDataCenter/gxw/economic"; //return "front/cityDataCenter/ycNew/index";
			case 2:
				return "front/cityDataCenter/gxw/mainEconomicIndex";
			case 3:
				return "front/cityDataCenter/gxw/commercialPower";
			case 4:
				return "front/cityDataCenter/gxw/ycAreaMap";
			case 5:
				return "front/cityDataCenter/gxw/ycParkMap";
			case 6:
				return "front/cityDataCenter/gxw/logistics";
			case 7:
				return "front/cityDataCenter/gxw/parkPortrait";
			case 8:
				return "front/cityDataCenter/gxw/tenMajor";
			case 9:
				return "front/cityDataCenter/gxw/companyStatistic";
			case 10:
				return "front/cityDataCenter/gxw/helping";
			case 11:
				return "front/cityDataCenter/gxw/leaderIndex";
			case 12:
				return "front/cityDataCenter/gxw/industrialInvest";
			case 13:
				return "front/cityDataCenter/gxw/economic";
			case 14:
				return "front/cityDataCenter/gxw/electric";
			case 15:
				return "front/cityDataCenter/gxw/industrialInvestSecond";
			case 16:
				return "front/cityDataCenter/gxw/enterpriseService";
			case 17:
				return "front/cityDataCenter/gxw/companyManage";
			case 18:
				return "front/cityDataCenter/gxw/enterpriseRecruit";
			case 19:
				return "front/cityDataCenter/gxw/industryInnovate";
			case 20:
				return "front/cityDataCenter/gxw/greenDevelopmentFirst";
			case 21:
				return "front/cityDataCenter/gxw/greenDevelopmentSecond";
			case 22:
				return "front/cityDataCenter/gxw/companyPortrait";
			case 23:
				return "front/cityDataCenter/gxw/industrialInvestIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 井冈山大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/jgsIndex/{page}")
	public String jgsIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1242);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/jgs/index";
			case 2:
				return "front/cityDataCenter/jgs/companyPortrait";
			case 3:
				return "front/cityDataCenter/jgs/operationManagement";
			case 4:
				return "front/cityDataCenter/jgs/industrialInvestIndex";
			case 5:
				return "front/cityDataCenter/jgs/productionMonitoring";
			case 6:
				return "front/cityDataCenter/jgs/Infrastructure";
			case 7:
				return "front/cityDataCenter/jgs/emergencyCommand";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 昌丰市（嘉兴）大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/jiaxIndex/{page}")
	public String jiaxIndex(@PathVariable(value = "page") int page, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 52817559);
			switch (page) {
			case 1:
				return "front/cityDataCenter/jiax/index";
			case 2:
				return "front/cityDataCenter/jiax/index2";
			case 3:
				return "front/cityDataCenter/jiax/index3";
			case 4:
				return "front/cityDataCenter/jiax/index4";
			case 5:
				return "front/cityDataCenter/jiax/leaderIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 昌丰融合大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/cfIndex/{page}")
	public String cfIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1251);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/cf/index";
			case 2:
				return "front/cityDataCenter/cf/companyPortrait";
			case 3:
				return "front/cityDataCenter/cf/operationManagement";
			case 4:
				return "front/cityDataCenter/cf/industrialInvestIndex";
			case 5:
				return "front/cityDataCenter/cf/productionMonitoring";
			case 6:
				return "front/cityDataCenter/cf/Infrastructure";
			case 7:
				return "front/cityDataCenter/cf/emergencyCommand";
			case 8:
				return "front/cityDataCenter/cf/leaderIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 黎川大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/lcIndex/{page}")
	public String lcIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1251);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/lc/index";
			case 2:
				return "front/cityDataCenter/lc/companyPortrait";
			case 3:
				return "front/cityDataCenter/lc/operationManagement";
			case 4:
				return "front/cityDataCenter/lc/industrialInvestIndex";
			case 5:
				return "front/cityDataCenter/lc/productionMonitoring";
			case 6:
				return "front/cityDataCenter/lc/Infrastructure";
			case 7:
				return "front/cityDataCenter/lc/emergencyCommand";
			case 8:
				return "front/cityDataCenter/lc/leaderIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 泰和大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/thIndex/{page}")
	public String thIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1251);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/th/index";
			case 2:
				return "front/cityDataCenter/th/companyPortrait";
			case 3:
				return "front/cityDataCenter/th/operationManagement";
			case 4:
				return "front/cityDataCenter/th/industrialInvestIndex";
			case 5:
				return "front/cityDataCenter/th/productionMonitoring";
			case 6:
				return "front/cityDataCenter/th/Infrastructure";
			case 7:
				return "front/cityDataCenter/th/emergencyCommand";
			case 8:
				return "front/cityDataCenter/th/leaderIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 袁州医药大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/yzyyIndex/{page}")
	public String yzyyIndex(@PathVariable(value = "page") int page, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("rootKind", getRootKind());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 32914188);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			switch (page) {
			case 1:
				return "front/cityDataCenter/yzyy/index";
			case 2:
				return "front/cityDataCenter/yzyy/economic1";
			case 3:
				return "front/cityDataCenter/yzyy/economic2";
			case 4:
				return "front/cityDataCenter/yzyy/economic3";
			case 5:
				return "front/cityDataCenter/yzyy/leaderIndex";
			case 6:
				return "front/cityDataCenter/yzyy/economic4";
			case 7:
				return "front/cityDataCenter/yzyy/industrialInvest";
			case 8:
				boolean flag = commonCityDataCenterService.isSyncDataCompany(companyId);
				if(flag) {					
					return "front/cityDataCenter/yzyy/companyPortraitRevision";
				}else {					
					return "front/cityDataCenter/yzyy/companyPortrait";
				}
			case 9:
				return "front/cityDataCenter/yzyy/operationalIndex";
			case 10:
				return "front/cityDataCenter/yzyy/innovationIndex";
			case 11:
				return "front/cityDataCenter/yzyy/riskIndex";
			case 12:
				return "front/cityDataCenter/yzyy/investmentAnalysis";
			case 13:
				return "front/cityDataCenter/yzyy/diagnosticAdvice";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 南昌国家高新技术产业开发区首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/gxIndex/{page}")
	public String gxIndex(@PathVariable(value = "page") int page, @RequestParam(value = "year", required = false) Integer year, @RequestParam(value = "quarter", required = false) Integer quarter,
		@RequestParam(value = "month", required = false) Integer month, @RequestParam(value = "orgId", required = false) BigDecimal orgId,
		@RequestParam(value = "parkId", required = false) BigDecimal parkId, @RequestParam(value = "parkName", required = false) String parkName,
		@RequestParam(value = "tabIndex", required = false) BigDecimal tabIndex, @RequestParam(value = "entranceId", required = false) BigDecimal entranceId,
		@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("year", year);
			model.addAttribute("quarter", quarter);
			model.addAttribute("month", month);
			model.addAttribute("orgId", orgId);
			model.addAttribute("page", page);
			model.addAttribute("entranceId", entranceId);
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("accountName", this.getCurrentAccountName());
				model.addAttribute("orgId", orgId);
				model.addAttribute("governmentKind", this.getGovernmentKind());
				model.addAttribute("cityId", this.getCurrentAreaIds()[1]);
				model.addAttribute("parkId", this.getCurrentParkId());
				model.addAttribute("orgType", this.getOrganizationType());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1058);
			model.addAttribute("companyId", companyId);
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			model.addAttribute("tabIndex", tabIndex);
			switch (page) {
			case 1:
				return "front/cityDataCenter/gx/index";
			case 2:
				return "front/cityDataCenter/gx/companyPortrait";
			case 3:
				return "front/cityDataCenter/gx/operationManage";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 吉安大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/jianIndex/{page}")
	public String jianIndex(@PathVariable(value = "page") int page,
			@RequestParam(value = "companyId", required = false) BigDecimal companyId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("companyId", companyId);
			model.addAttribute("entranceId", 52817559);
			switch (page) {
			case 1:
				return "front/cityDataCenter/jian/index";
			case 2:
				return "front/cityDataCenter/jian/index2";
			case 3:
				return "front/cityDataCenter/jian/index3";
			case 4:
				return "front/cityDataCenter/jian/index4";
			case 5:
				return "front/cityDataCenter/jian/index5";
			case 6:
				return "front/cityDataCenter/jian/index6";
			case 8:
				boolean flag = commonCityDataCenterService.isSyncDataCompany(companyId);
				if(flag) {					
					return "front/cityDataCenter/jian/companyPortraitRevision";
				}else {					
					return "front/cityDataCenter/jian/companyPortrait";
				}
			case 9:
				return "front/cityDataCenter/jian/operationalIndex";
			case 10:
				return "front/cityDataCenter/jian/innovationIndex";
			case 11:
				return "front/cityDataCenter/jian/riskIndex";
			case 12:
				return "front/cityDataCenter/jian/investmentAnalysis";
			case 13:
				return "front/cityDataCenter/jian/diagnosticAdvice";
			case 14:
				return "front/cityDataCenter/jian/enterpriseDistribution";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}

	/**
	 * 吉安大数据中心项目推进页面
	 */
	@RequestMapping(value = "/front/cityDataCenter/projectPromotion/{page}")
	public String jianPromotion(@PathVariable(value = "page") int page, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 52817559);
			switch (page) {
			case 1:
				return "front/cityDataCenter/projectPromotion/promotion1";
			case 2:
				return "front/cityDataCenter/projectPromotion/promotion2";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【吉安项目推进】跳转方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
	
	/**
	 * 通用可配置引导页
	 */
	@RequestMapping(value = "/front/cityDataCenter/commonIndex/{entranceId}")
	public String commonIndex(@PathVariable(value = "entranceId") BigDecimal entranceId, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", entranceId);
			EntrancePageCustomBean record = new EntrancePageCustomBean();
			record.setOrganizationId(entranceId);
			record.setSystemId(BigDecimal.valueOf(60));
			List<EntrancePageCustomBean> list = entrancePageCustomService.queryByCond(record);
			String style = "1";
			for (EntrancePageCustomBean p : list) {
				model.addAttribute("WEBSITE_" + p.getParameterCode(), p.getParameterValue());
				if ("ParkIndexStyle".equals(p.getParameterCode())) {
					style = p.getParameterValue();
				}
			}
//			if(BigDecimal.valueOf(1220).equals(entranceId)){
//				return "front/cityDataCenter/commonIndex/qnIndex";
//			}
			switch (style) {
			case "2":
				return "front/cityDataCenter/commonIndex/style2";
			case "3":
				return "front/cityDataCenter/commonIndex/style3";
			default:
				return "front/cityDataCenter/commonIndex/style1";
			}
		} catch (Exception e) {
			logger.error("跳转通用引导页方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
	
	/**
	 * 通用大数据页面
	 */
	@RequestMapping(value = "/front/commonDataCenter/{page}/{entranceId}")
	public String commonDataCenter(@PathVariable(value = "entranceId") BigDecimal entranceId,@PathVariable(value = "page") String page, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", entranceId);
			return "front/cityDataCenter/commonIndex/"+page;
		} catch (Exception e) {
			logger.error("跳转通用大数据页方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
	/**
	 * 鹰潭大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/ytIndex/{page}")
	public String ytIndex(@PathVariable(value = "page") int page, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 52817559);
			switch (page) {
			case 1:
				return "front/cityDataCenter/yt/index";
			case 2:
				return "front/cityDataCenter/yt/index1";
			case 3:
				return "front/cityDataCenter/yt/index2";
			case 4:
				return "front/cityDataCenter/yt/index3";
			case 5:
				return "front/cityDataCenter/yt/index4";
			case 6:
				return "front/cityDataCenter/yt/index5";
			case 7:
				return "front/cityDataCenter/yt/index6";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】gxwIndex方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
	/**
	 * 全南大数据中心首页
	 */
	@RequestMapping(value = "/front/cityDataCenter/qnIndex/{page}")
	public String qnIndex(@PathVariable(value = "page") int page, HttpServletRequest request, Model model) {
		try {
			model.addAttribute("OfficeUrl", showLoginService.getUrlPath());
			if (isLogin()) {
				model.addAttribute("isLogin", 1);
				model.addAttribute("userCode", this.getMd5AccountCode());
				model.addAttribute("accountName", this.getCurrentAccountName());
			} else {
				model.addAttribute("isLogin", 0);
				model.addAttribute("accountName", "");
			}
			model.addAttribute("entranceId", 1220);
			switch (page) {
			case 1:
				return "front/cityDataCenter/qn/leaderIndex";
			default:
				return "redirect:/error/404";
			}
		} catch (Exception e) {
			logger.error("【发改委级数据中心】方法发生异常，详细原因：" + e.getMessage(), e);
			return "redirect:/error/404";
		}
	}
}
