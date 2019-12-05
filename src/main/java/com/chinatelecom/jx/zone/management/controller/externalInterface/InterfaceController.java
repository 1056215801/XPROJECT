package com.chinatelecom.jx.zone.management.controller.externalInterface;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.externalInterface.IInterfaceService;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Controller
public class InterfaceController extends BaseController{
	@Autowired
	private IInterfaceService interfaceService;
	
	@RequestMapping(value="/json/interface/queryCompanyValueListByTJ")
	public String QueryCompanyValueListByTJ(
			@RequestParam(value="type") String type,
			@RequestParam(value="query") String query,
			@RequestParam(value="year") String year,
			@RequestParam(value="month") String month,ModelMap modelMap){
		ResultBean resultBean = new ResultBean();
		try{
			String numberExp = "^[1-4]{1}$";
			String yearExp = "^[0-9]{4}$";
			String monthExp = "^[0-1][0-9]$";
			
			if(type==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数type未设置");
				return "jsonView";
			}else{
				if(!type.matches(numberExp)){
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 1);
					modelMap.addAttribute("errorMsg", "参数type格式不正确");
					return "jsonView";
				}
			}
			
			if(query==null){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数query未设置");
				return "jsonView";
			}else{
				if(!query.matches(numberExp)){
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 1);
					modelMap.addAttribute("errorMsg", "参数query格式不正确");
					return "jsonView";
				}
			}
			
			if(!StringUtil.checkNotNull(year)){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数year未设置");
				return "jsonView";
			}else{
				if(!year.matches(yearExp)){
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 2);
					modelMap.addAttribute("errorMsg", "参数year格式不正确");
					return "jsonView";
				}
			}
			
			if(!StringUtil.checkNotNull(month)){
				modelMap.addAttribute("success", false);
				modelMap.addAttribute("errorCode", 1);
				modelMap.addAttribute("errorMsg", "参数month未设置");
				return "jsonView";
			}else{
				if(!month.matches(monthExp)){
					modelMap.addAttribute("success", false);
					modelMap.addAttribute("errorCode", 2);
					modelMap.addAttribute("errorMsg", "参数month格式不正确");
					return "jsonView";
				}
			}
			
			resultBean = interfaceService
					.queryCompanyValueListByTJ(Integer.parseInt(type), Integer.parseInt(query), year, month);
			
			if(resultBean.getCode()==0){
				modelMap.addAttribute("success", true);
				modelMap.addAttribute("errorCode", 0);
				modelMap.addAttribute("errorMsg", "获取列表成功！");
				modelMap.addAttribute("value", resultBean.getJsonValue());
			}
			
		}catch(Exception ex){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
			logger.error("详细信息："+ex.getMessage(), ex);;
		}
		return "jsonView";
	}
}
