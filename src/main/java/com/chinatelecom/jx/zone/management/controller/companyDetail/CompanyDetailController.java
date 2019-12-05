package com.chinatelecom.jx.zone.management.controller.companyDetail;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.companyInfo.BaseDimension;
import com.chinatelecom.jx.zone.management.controller.companyInfo.CompanyInfoController;
import com.chinatelecom.jx.zone.management.service.companyDetail.ICompanyDetailService;

@Controller
public class CompanyDetailController {

	@Autowired
	private ICompanyDetailService companyDetailService;
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyInfoController.class);
	
	/**
	 * 企业税务信用、进出口信用等信息统计和查询
	 * @param companyId 
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/companyDetail/first")
	public String first(
			@RequestParam(value = "companyId", required = false) BigDecimal companyId, 
			HttpServletResponse response, ModelMap modelMap) {
		
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		boolean success = true;
		int errorCode = 0;
		String errorMsg = "获取数据成功";
		try {
			if(companyId == null) {
				success = false;
				errorCode = 1;
				errorMsg = "参数companyId未设置！";
			}else {
				Map<String, Object> data = companyDetailService.selectFirstDataByCompanyId(companyId); 
				modelMap.addAttribute("data", data);
			}
			
		}catch (Exception e) {
			logger.error("【企业画像】first方法出现异常：" + e);
			success = false;
			errorCode = 1;
			errorMsg = "系统异常：" + e.getLocalizedMessage();
		}
		
		modelMap.addAttribute("success", success);
		modelMap.addAttribute("errorCode", errorCode);
		modelMap.addAttribute("errorMsg", errorMsg);
		
		return "jsonView";
	}
	
	
	/**
	 * 企业税务信用、进出口信用等信息详细情况
	 * @param companyId 
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/companyDetail/second")
	public String second(
			@RequestParam(value = "companyId", required = false) BigDecimal companyId, 
			@RequestParam(value = "kind", required = false) String kind, 
			HttpServletResponse response, ModelMap modelMap) {
		
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		boolean success = true;
		int errorCode = 0;
		String errorMsg = "获取数据成功";
		try {
			if(companyId == null) {
				success = false;
				errorCode = 1;
				errorMsg = "参数companyId未设置！";
			}else {
				if("行政许可".equals(kind)) {
					kind = "行政许可工商,行政许可信用中国";
				}else if("法律诉讼".equals(kind)) {
					kind = "法律诉讼被执行人信息,法律诉失信被执行人,法律诉讼裁判文书,法律诉讼法院公告,法律诉讼开庭公告,法律诉讼司法拍卖,法律诉讼司法协助";
				}
				
			    String[] kinds = kind.split(",");
			    JSONObject jo = new JSONObject();
				for(int i=0;i<kinds.length;i++) {
					List<JSONObject> data = companyDetailService.selectSecondDataByCompanyIdAndKind(companyId,kinds[i]); 
					jo.put(kinds[i], data);
				}
				
				modelMap.addAttribute("data", jo);
			}
			
		}catch (Exception e) {
			logger.error("【企业画像】second方法出现异常：" + e);
			success = false;
			errorCode = 1;
			errorMsg = "系统异常：" + e.getLocalizedMessage();
		}
		
		modelMap.addAttribute("success", success);
		modelMap.addAttribute("errorCode", errorCode);
		modelMap.addAttribute("errorMsg", errorMsg);
		
		return "jsonView";
	}
	
	
	
	
	
	/****************************************************
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * ***************************************************
	 */

    /**
     * 知识产权->统计
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/equityCount/{companyId}")
    public String equityCount(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.equityDimensionCountByCompany(companyId));
        } catch (Exception e){
            logger.error("知识产权->统计:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }


    /**
     * 企业风险->统计
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/riskCount/{companyId}")
    public String riskCount(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.riskDimensionCountByCompany(companyId));
        } catch (Exception e){
            logger.error("企业风险->统计:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业风险->详情
     * @param companyId 企业Id
     * @param type 企业风险->维度
     * @see BaseDimension#viewName
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/riskDetail/{companyId}/{type}")
    public String riskDetail(ModelMap model,@PathVariable("companyId") BigDecimal companyId,@PathVariable("type") String type) {
        try {
            model.addAttribute("Success",true);
            JSONObject result = companyDetailService.detailByCompanyAndDimension(companyId,type);
            if (Objects.requireNonNull(BaseDimension.findByViewName(type)).getReduce()){
                JSONArray data = result.getJSONArray(type);
                result.remove(type);
                if (data.size() < 1) data.add(new JSONObject());
                for (String key:result.keySet()){
                    if (result.getJSONArray(key).size()>0){
                        data.getJSONObject(0).putAll(result.getJSONArray(key).getJSONObject(0));
                    }
                }
                if (data.getJSONObject(0).keySet().size() == 0) data.remove(0);
                model.addAttribute("Data",new JSONObject().fluentPut(type,data));
                model.addAttribute("Total",data.size());
            } else {
                model.addAttribute("Data",result);
                Integer total = 0;
                for (String key : result.keySet()) total += result.getJSONArray(key).size();
                model.addAttribute("Total",total);
            }

        } catch (Exception e){
            logger.error("企业风险->详情:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 知识产权->详情
     * @param companyId 企业Id
     * @param type 知识产权->维度
     * @see BaseDimension#viewName
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/equityDetail/{companyId}/{type}")
    public String equityDetail(ModelMap model,@PathVariable("companyId") BigDecimal companyId,@PathVariable("type") String type) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.detailByCompanyAndDimension(companyId,type));
        } catch (Exception e){
            logger.error("知识产权->详情:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业工商信息详情
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/gsBaseDetail/{companyId}")
    public String riskDetail(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.gsBaseDetailByCompany(companyId));
        } catch (Exception e){
            logger.error("企业工商信息详情:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业报告预览
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/reportPreview/{companyId}")
    public String reportPreview(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.reportReviewInfoByCompany(companyId));
        } catch (Exception e){
            logger.error("企业报告预览:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业关联图谱
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/association/{companyId}")
    public String association(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            JSONArray data = companyDetailService.associationMap(companyId);
            model.addAttribute("Success",true);
            model.addAttribute("Data",data);
            model.addAttribute("Size",data.size());
            model.addAttribute("Name",companyDetailService.getCompanyName(companyId));
        } catch (Exception e){
            logger.error("企业关联图谱:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业年度报告
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/annualReport/{companyId}")
    public String annualReport(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            JSONObject data = companyDetailService.detailByCompanyAndDimension(companyId,BaseDimension.REPORT.getViewName());

            String reportYearFieldDesc = BaseDimension.getFieldDescByFieldAndTable("YEAR","X_DATA.Z_INFO_REPORT_RESULT");
            String assetsDataFieldDesc = BaseDimension.getFieldDescByFieldAndTable("YEAR","X_DATA.Z_INFO_REPORT_ASSETS_DATA");
            String fundingFieldDesc = BaseDimension.getFieldDescByFieldAndTable("YEAR","X_DATA.Z_INFO_REPORT_PARTNER");

            String reportYearDesc = BaseDimension.getTableDescByTableName("X_DATA.Z_INFO_REPORT_RESULT");
            String assetsDataDesc = BaseDimension.getTableDescByTableName("X_DATA.Z_INFO_REPORT_ASSETS_DATA");
            String fundingDesc = BaseDimension.getTableDescByTableName("X_DATA.Z_INFO_REPORT_PARTNER");

            List<Map> reportYear = convertJSONArrayToList(data.getJSONArray(reportYearDesc),Map.class);
            List<Map> assetsData = convertJSONArrayToList(data.getJSONArray(assetsDataDesc),Map.class);
            List<Map> funding = convertJSONArrayToList(data.getJSONArray(fundingDesc),Map.class);
            Pattern p = Pattern.compile("[0-9]*");

            reportYear.sort(Comparator.comparingInt((Map o) -> {
                Matcher matcher = p.matcher(o.get(reportYearFieldDesc).toString());
                return Integer.parseInt(matcher.find()? matcher.group(0) : "1970");
            }).reversed());
            assetsData.sort(Comparator.comparingInt((Map o) -> {
                Matcher matcher = p.matcher(o.get(assetsDataFieldDesc).toString());
                return Integer.parseInt(matcher.find()? matcher.group(0) : "1970");
            }).reversed());
            Map<String,List<Map>> fundingData = funding.stream().collect(Collectors.groupingBy(map -> map.get(fundingFieldDesc).toString()));

            List<String> fundingKeySet = new ArrayList<>(fundingData.keySet());
            fundingKeySet.sort(Comparator.comparingInt((String key) -> {
                Matcher matcher = p.matcher(key);
                return Integer.parseInt(matcher.find()? matcher.group(0) : "1970");
            }).reversed());
            LinkedHashMap<String,List<Map>> sortFundingData = new LinkedHashMap<>();
            fundingKeySet.forEach(key -> sortFundingData.put(key,fundingData.get(key)));

            JSONArray fundingArray = new JSONArray(new ArrayList<>());
            fundingArray.addAll(sortFundingData.values());

            model.addAttribute(reportYearDesc,reportYear);
            model.addAttribute(assetsDataDesc,assetsData);
            model.addAttribute(fundingDesc,fundingArray);
        } catch (Exception e){
            logger.error("企业年度报告:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    private  <T> List<T> convertJSONArrayToList(JSONArray jsonArray,Class<T> clz){
        if (CollectionUtils.isEmpty(jsonArray)){
            return new ArrayList<>();
        }
        List<T> result = new ArrayList<>(jsonArray.size());
        jsonArray.forEach(element->{
            T t = JSONObject.toJavaObject((JSONObject)element, clz);
            result.add(t);
        });
        return result;
    }

    /**
     * 风险指数->各类风险事件发生年份趋势 | 创新指数->按年份统计数量
     * @param type  :RISK/EQUITY
     * @see BaseDimension#dimension
     * @see BaseDimension#viewName
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/byYear/{companyId}/{type}/{viewName}")
    public String riskCountByYear(ModelMap model,
                                  @PathVariable("companyId") BigDecimal companyId,
                                  @PathVariable("type") String type,
                                  @PathVariable("viewName") String viewName) {
        try {
            JSONObject result = companyDetailService.countByYear(companyId,type,viewName);
            List<String> yearData = new ArrayList<>();
            List<Integer> valueData = new ArrayList<>();
            int year = Calendar.getInstance().get(Calendar.YEAR);
            for (int i = 0;i < 7;i ++){
                int yearItem = year--;
                yearData.add(String.valueOf(yearItem));
                valueData.add(result.get(String.valueOf(yearItem)) == null ? 0 : result.getInteger(String.valueOf(yearItem)));
            }

            model.addAttribute("X_DATA",yearData);
            model.addAttribute("Y_DATA",valueData);
            model.addAttribute("Success",true);
        } catch (Exception e){
            logger.error(type + "->年份统计:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 风险指数->风险信息清单
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/riskList/{companyId}")
    public String riskList(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Data",companyDetailService.riskList(companyId));
            model.addAttribute("Success",true);
        } catch (Exception e){
            logger.error("风险指数->各类风险事件发生年份趋势:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /**
     * 企业风险->总数/各类型数
     * @param companyId 企业Id
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/riskTotal/{companyId}")
    public String riskTotal(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            Map<String,Integer> data = companyDetailService.riskTotal(companyId);
            model.addAttribute("Success",true);
            model.addAttribute("Data",data);
            model.addAttribute("Total", data.values().stream().reduce(0,(total,next) -> total+next));
        } catch (Exception e){
            logger.error("企业风险->总数/各类型数:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 风险指数->风险信息清单->记录详情
     * */
    @CrossOrigin(value = "*")
    @PostMapping(value = "/interface/json/companyDetail/riskDetail/query")
    public String query(ModelMap model,@RequestBody JSONArray queryList) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.getDetailById(queryList));
        } catch (Exception e){
            logger.error("风险指数->风险信息清单:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 创新指数->知识产权
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/equityTotal/{companyId}")
    public String equityTotal(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.innovation(companyId));
        } catch (Exception e){
            logger.error("创新指数->知识产权:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 创新指数->各类知识产权数量
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/equityCount/byType/{companyId}")
    public String equityCountByType(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            JSONObject competitiveMap = companyDetailService.equityDimensionCountByCompany(companyId).getJSONObject("competitiveMap");
            List<String> yearData = new ArrayList<>();
            List<Integer> valueData = new ArrayList<>();
            for (String key : competitiveMap.keySet()){
                yearData.add(key);
                valueData.add(competitiveMap.getInteger(key));
            }
            model.addAttribute("X_DATA",yearData);
            model.addAttribute("Y_DATA",valueData);
            model.addAttribute("Success",true);
        } catch (Exception e){
            logger.error("创新指数->知识产权:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 投资分析->企业图谱
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/invest/{companyId}")
    public String invest(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.invest(companyId));
        } catch (Exception e){
            logger.error("投资分析->企业图谱:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

    /*
     * 投资分析->统计
     * */
    @CrossOrigin(value = "*")
    @GetMapping(value = "/interface/json/companyDetail/invest/count/{companyId}")
    public String investCount(ModelMap model,@PathVariable("companyId") BigDecimal companyId) {
        try {
            model.addAttribute("Success",true);
            model.addAttribute("Data",companyDetailService.investCount(companyId));
        } catch (Exception e){
            logger.error("投资分析->统计:"+e.getLocalizedMessage(),e);
            model.addAttribute("Success",false);
            model.addAttribute("Data",e.getLocalizedMessage());
        }
        return "jsonView";
    }

	
}
