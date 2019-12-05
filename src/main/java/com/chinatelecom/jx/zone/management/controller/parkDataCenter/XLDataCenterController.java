package com.chinatelecom.jx.zone.management.controller.parkDataCenter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinatelecom.jx.zone.management.controller.BaseController;

@Controller
public class XLDataCenterController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(XLDataCenterController.class);
	
	@RequestMapping(value="/front/dataCenter/valueAdded")
	public String valueAddedStatistics(){
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error(ex.getMessage(), ex);
		}
		return "/front/dataCenter/valueAddedStatistics";
	}
	
	@RequestMapping(value="/front/dataCenter/growthRate")
	public String growthRateStatistics(){
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error(ex.getMessage(), ex);
		}
		return "/front/dataCenter/growthRateStatistics";
	}
}
