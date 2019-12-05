package com.chinatelecom.jx.zone.management.controller.companyInfo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;

@Controller
public class CompanyInfoController extends BaseController {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private IShowLoginService showLoginService;

	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;

	private static final Logger logger = LoggerFactory.getLogger(CompanyInfoController.class);

	/**
	 * 企业列表frame
	 * 
	 * @param modelMap
	 * @returnw
	 */
	@RequestMapping(value = "/front/page/companyInfo/frame")
	public String companyInfoFrame(@RequestParam(value = "parkId", required = false) BigDecimal parkId,@RequestParam(value = "index", defaultValue = "2") Integer index,
		@RequestParam(value = "treeType", required = false) String treeType, ModelMap modelMap) {
		if (treeType == null) {
			treeType = "comp";
			try {
				if (isLogin()) {
					Short orgType = getOrganizationType();
					if (parkId == null) {
						parkId = getCurrentParkId();
					}
					if (orgType != null && orgType == 2) {
						treeType = "park";
					} else if (orgType != null && orgType == 1) {
						BigDecimal[] areaIds = getCurrentAreaIds();
						if (areaIds[2] != null && !BigDecimal.valueOf(-1).equals(areaIds[2])) {
							treeType = "gov_s";
						} else if (areaIds[1] != null && !BigDecimal.valueOf(-1).equals(areaIds[1])) {
							treeType = "gov_a";
						} else {
							treeType = "gov_p";
						}
					} else {
						modelMap.addAttribute("treeType", "comp");
					}
				} else {
					modelMap.addAttribute("message", "请登录");
				}
			} catch (Exception e) {
			}
		}
		modelMap.addAttribute("treeType", treeType);
		modelMap.addAttribute("parkId", parkId);
		modelMap.addAttribute("index", index);
		return "companyInfo/companyInfoFrame";
	}

	/**
	 * 企业列表list
	 * 
	 * @param pageNum
	 * @param orgId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/front/page/companyInfo/companyList")
	public String companyInfoList(@RequestParam(value = "treeType") String treeType, 
		@RequestParam(value = "index", defaultValue = "2") Integer index,@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
		@RequestParam(value = "orgId", required = true) BigDecimal orgId, @RequestParam(value = "orgName", required = false) String orgName, @RequestParam(value = "parkId", required = false) BigDecimal parkId, ModelMap modelMap) {
		String url = "companyInfo/provinceCompanyList";
		try {
			modelMap.addAttribute("officeUrl", showLoginService.getUrlPath());
			String parkName;
			if (isLogin()) {
				parkId = getCurrentParkId();
				parkName = getCurrentParkName();
				modelMap.addAttribute("parkName", parkName);
			}
			modelMap.addAttribute("parkId", parkId);
			String requestUrl = showLoginService.getUrlPath() + "XOffice/interface/json/companyInfo/projectCompanyList";
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("orgId", orgId);
			if(parkId!=null){
				paramMap.put("parkId", parkId);
				if(BigDecimal.valueOf(1245).equals(parkId)){
					paramMap.put("onlyNew", "1");
				}
			}
			paramMap.put("treeType", treeType);
			String rst = HttpToolkit.POSTMethod(requestUrl, paramMap);
			JSONObject data = JSONObject.parseObject(rst);
			modelMap.addAttribute("data", data);
			modelMap.addAttribute("level", "gov_p".equals(treeType) ? "2" : "gov_a".equals(treeType) ? "3" : "");
			
			//查询袁州医药50家企业id
			String sql = "select distinct company_primary_id value from x_data.z_s_result ";
			List<String> compIds = new ArrayList<>();
			List<Map<String, Object>> jdbcList = jdbcTemplate.queryForList(sql, new Object[] {});
			if(jdbcList!=null && jdbcList.size()>0){
				for (Map<String, Object> map : jdbcList) {
					Object value = map.get("VALUE");
					if(value!=null){
						compIds.add(value.toString());
					}
				}
			}
			modelMap.addAttribute("compIds",JSONArray.toJSONString(compIds));
		} catch (Exception ex) {
			logger.error("查询企业列表失败", ex);
		}
		modelMap.addAttribute("treeType", treeType);
		modelMap.addAttribute("orgId", orgId);
		modelMap.addAttribute("orgName", orgName);
		modelMap.addAttribute("pageNum", pageNum);
		modelMap.addAttribute("index", index);
		return url;
	}

	/**
	 * 园区树
	 */
	@RequestMapping(value = "/front/page/companyInfo/parkTree")
	public String parkTree(@RequestParam(value = "checkType", required = false) String checkType, @RequestParam(value = "treeType") String treeType, @RequestParam(value = "parkId") BigDecimal parkId,
		Model model) {
		try {
			List<JSONObject> list = new ArrayList<>();
			List<Map<String, Object>> jdbcList = new ArrayList<>();
			String sql = null;
			BigDecimal areaId = null;
			if ("park".equals(treeType)) { //园区
				if (parkId != null) {
					List<OrganizationInfoBean> parkOrgList =
						organizationInfoBeanProxy.selectAllGradeListByParentIdAndRootIdAndStatusArrayAndOrganizationKindArrayAndSystemIdArrayAndOrganizationNameSearchKey(parkId, null,
							new Short[] { 1, 2, 3 }, new Short[] { 6 }, null, null);
					if (parkOrgList == null) {
						parkOrgList = new ArrayList<OrganizationInfoBean>();
					}
					parkOrgList.add(organizationInfoBeanProxy.selectByPrimaryKey(parkId));
					List<JSONObject> jsonList = new ArrayList<JSONObject>();
					if (parkOrgList.size() != 0) {
						for (int i = 0; i < parkOrgList.size(); i++) {
							OrganizationInfoBean obj = parkOrgList.get(i);
							if (obj != null) {
								JSONObject jsonObj = (JSONObject) JSONObject.toJSON(obj);
								jsonObj.put("id", obj.getOrganizationId().toString());
								jsonObj.put("name", obj.getOrganizationName());
								jsonObj.put("pId", obj.getParentId().toString());
								jsonObj.put("sort", obj.getSortGrade());
								jsonObj.put("parentId", obj.getParentId().toString());
								jsonObj.put("organizationKind", obj.getOrganizationKind().toString());
								jsonList.add(jsonObj);
							}
						}
					}
					model.addAttribute("treeData", JSONArray.toJSONString(jsonList));
				}
			} else {
				if ("gov_p".equals(treeType)) { //省级
					areaId = new BigDecimal("360000");
					sql = "select * from t_organization_info where (parent_id = 360000 or organization_id = 360000) and organization_kind in (0,5,6) and status != -1 order by sort_grade asc ";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] {});
				} else if ("gov_a".equals(treeType)) { //市级
					OrganizationInfoBean orgBean = getAreaBean();
					BigDecimal orgId = orgBean.getOrganizationId();
					sql =
						"select organization_id from t_organization_info start with organization_id = ? connect by prior parent_id = organization_id and organization_kind = 0 and status != -1 order by sort_grade desc ";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] { orgId });
					if (!jdbcList.isEmpty()) {
						areaId = new BigDecimal(jdbcList.get(0).get("ORGANIZATION_ID").toString());
					} else {
						areaId = new BigDecimal(360000);
					}
					sql = null;
					jdbcList.clear();
					sql = "select * from t_organization_info where (parent_id = ? or organization_id = ?) and organization_kind in (0,5,6)  and status != -1 order by sort_grade asc ";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] { areaId, areaId });
				}
				if (!jdbcList.isEmpty()) {
					for (Map<String, Object> info : jdbcList) {
						JSONObject jo = new JSONObject();
						jo.put("isParent", "true");
						String orgName = info.get("ORGANIZATION_NAME").toString();
						boolean flag = "企业列表".equals(orgName);
						if (flag) {
							orgName = "园外企业";
							jo.put("isParent", "false");
						}
						jo.put("id", info.get("ORGANIZATION_ID").toString());
						jo.put("name", orgName);
						jo.put("pId", info.get("PARENT_ID").toString());
						jo.put("kind", "org");
						list.add(jo);
					}
				}
				//园区
				sql = null;
				jdbcList.clear();
				if ("gov_p".equals(treeType)) {
					sql = "select * from t_park_info where status = 1 and view_kind2 = 1 ";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] {});
				} else if ("gov_a".equals(treeType)) {
					sql = "select * from t_park_info where status = 1 and view_kind3 = 1 and area_id = ?";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] { areaId });
				} else if ("park".equals(treeType)) {
					jdbcList.clear();
				}
				if (!jdbcList.isEmpty()) {
					for (Map<String, Object> info : jdbcList) {
						JSONObject jo = new JSONObject();
						jo.put("id", info.get("PARK_ID").toString());
						jo.put("name", info.get("PARK_NAME"));
						if ("gov_p".equals(treeType)) { //省级
							jo.put("pId", info.get("AREA_ID"));
						} else if ("gov_a".equals(treeType)) {
							jo.put("pId", info.get("SPACE_ID"));
						}
						jo.put("kind", "park");
						jo.put("isParent", "false");
						list.add(jo);
					}
					//园区
					sql = null;
					jdbcList.clear();
					sql =
						"select * from t_organization_info where parent_id in (select organization_id from t_organization_info where parent_id = ? and organization_kind = 0) and organization_kind = 6 and status != -1";
					jdbcList = jdbcTemplate.queryForList(sql, new Object[] { areaId });
					if (!jdbcList.isEmpty()) {
						for (Map<String, Object> info : jdbcList) {
							JSONObject jo = new JSONObject();
							String orgName = info.get("ORGANIZATION_NAME").toString();
							boolean flag = "企业列表".equals(orgName);
							if (flag) {
								orgName = "园外企业";
							}
							jo.put("id", info.get("ORGANIZATION_ID").toString());
							jo.put("name", orgName);
							jo.put("pId", info.get("PARENT_ID").toString());
							jo.put("kind", "org");
							jo.put("isParent", "false");
							list.add(jo);
						}
					}
				}
				model.addAttribute("treeData", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("【园区选择树异常，详细原因】" + e.getMessage(), e);
		}
		return "companyInfo/parkTree";
	}
}