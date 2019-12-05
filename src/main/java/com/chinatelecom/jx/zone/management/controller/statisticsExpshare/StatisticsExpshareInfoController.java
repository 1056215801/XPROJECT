
package com.chinatelecom.jx.zone.management.controller.statisticsExpshare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.statisticsExpshare.StatisticsExpshareInfoBean;
import com.chinatelecom.jx.zone.management.service.statisticsExpshare.IStatisticsExpshareInfoService;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Controller
//@RequestMapping(value = "/statisticsexpshareinfo")
public class StatisticsExpshareInfoController extends BaseController {
	@Autowired
	private IStatisticsExpshareInfoService statisticsExpshareInfoService;
	 
	private static final Logger logger = LoggerFactory
			.getLogger(StatisticsExpshareInfoController.class);
 
	/**
	 * 列表
	 * @param statisticsExpshareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/list")
	public String list(@ModelAttribute("statisticsExpshareInfo") StatisticsExpshareInfoBean statisticsExpshareInfo, 
			@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<StatisticsExpshareInfoBean> page, Model model) {
		
		page.setPageSize(10);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page=(Page<StatisticsExpshareInfoBean>)statisticsExpshareInfoService.queryByCond(null);
		setPageInfo(page, model, "statisticsExpshareInfo/list");
		model.addAttribute("searchKey", searchKey);
		return "statisticsExpshareInfo/list";
	}
	
	/**
	 * 新增 
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		 StatisticsExpshareInfoBean  statisticsExpshareInfo = new StatisticsExpshareInfoBean();
			/* 初始化
			statisticsExpshareInfo.setId(value);//id
			statisticsExpshareInfo.setAreaId(value);//地市Id
			statisticsExpshareInfo.setAreaName(value);//地市名称
			statisticsExpshareInfo.setParkId(value);//园区Id
			statisticsExpshareInfo.setParkName(value);//园区名称
			statisticsExpshareInfo.setSpaceId(value);//县区Id
			statisticsExpshareInfo.setSpaceName(value);//县区名称
			statisticsExpshareInfo.setSumCount(value);//分享经验总数
			statisticsExpshareInfo.setTrueCount(value);//有效经验总数
			statisticsExpshareInfo.setBrowseCount(value);//浏览量
			statisticsExpshareInfo.setCommentCount(value);//评论量
			statisticsExpshareInfo.setCreateday(value);//发布日期
			statisticsExpshareInfo.setUpdatetime(value);//更新时间
			*/
		 
	  model.addAttribute("statisticsExpshareInfo", statisticsExpshareInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsExpshareInfo/edit";
	} 
	/**
	 * 编辑
	 * @param id
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/edit/{id}")
	public String create(
			@PathVariable(value = "id" ) BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		   StatisticsExpshareInfoBean statisticsExpshareInfo = statisticsExpshareInfoService.selectById(id);
		 
	  model.addAttribute("statisticsExpshareInfo", statisticsExpshareInfo);
	  model.addAttribute("pageNo", pageNo);
	  return "statisticsExpshareInfo/edit";
	}
	
	/**
	 * 保存操作
	 * @param statisticsExpshareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/save")
	public String save(
			@ModelAttribute(value = "statisticsExpshareInfo") StatisticsExpshareInfoBean statisticsExpshareInfo, 
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		
		if(statisticsExpshareInfo.getId()==null){
			/*  
			statisticsExpshareInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//id
			statisticsExpshareInfo.setAreaId(value);//地市Id
			statisticsExpshareInfo.setAreaName(value);//地市名称
			statisticsExpshareInfo.setParkId(value);//园区Id
			statisticsExpshareInfo.setParkName(value);//园区名称
			statisticsExpshareInfo.setSpaceId(value);//县区Id
			statisticsExpshareInfo.setSpaceName(value);//县区名称
			statisticsExpshareInfo.setSumCount(value);//分享经验总数
			statisticsExpshareInfo.setTrueCount(value);//有效经验总数
			statisticsExpshareInfo.setBrowseCount(value);//浏览量
			statisticsExpshareInfo.setCommentCount(value);//评论量
			statisticsExpshareInfo.setCreateday(new Timestamp(new Date().getTime()));//发布日期
			statisticsExpshareInfo.setUpdatetime(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsExpshareInfoService.insert(statisticsExpshareInfo);
			
			String str = "创建成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
		}else{//编辑
			statisticsExpshareInfo.setCreateday(new Timestamp(new Date().getTime()));//发布日期
			statisticsExpshareInfo.setUpdatetime(new Timestamp(new Date().getTime()));//更新时间
			statisticsExpshareInfoService.updateById(statisticsExpshareInfo);
			String str = "保存成功！";
			 
			redirectAttributes.addFlashAttribute("message", str);
			}
		model.addAttribute("pageNo", pageNo);
		return "redirect:/statisticsExpshareInfo/list" ;
		
	}
	
	/**
	 * 查看详细
	 * @param id
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/view/{id}")
	public String view(
			@PathVariable(value = "id") BigDecimal id,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			ServletRequest request,Model model) {
		 
		StatisticsExpshareInfoBean statisticsExpshareInfo = statisticsExpshareInfoService.selectById(id);
		model.addAttribute("statisticsExpshareInfo",statisticsExpshareInfo);
		model.addAttribute("pageNo", pageNo);
		return "statisticsExpshareInfo/view";
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/delete/{id}")
	public String delete(
			//@RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		//int i = statisticsExpshareInfoService.batchDelete(items);
		int i=  statisticsExpshareInfoService.deleteById(id);
		if(i > 0){
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		}else{
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/statisticsExpshareInfo/list";
	}
	
	/*==================================================json数据============================================================*/	
	/**
	 * json保存 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo//json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonSave(
			@ModelAttribute(value = "statisticsExpshareInfo") StatisticsExpshareInfoBean statisticsExpshareInfo, 
			HttpServletRequest request ) {
		String str =null;
		if(statisticsExpshareInfo.getId()==null){
			/*
			statisticsExpshareInfo.setId(seqIdProxy.getPublicationInfoIdSeq().getNextSeqIdToBigDecimal());//id
			statisticsExpshareInfo.setAreaId(value);//地市Id
			statisticsExpshareInfo.setAreaName(value);//地市名称
			statisticsExpshareInfo.setParkId(value);//园区Id
			statisticsExpshareInfo.setParkName(value);//园区名称
			statisticsExpshareInfo.setSpaceId(value);//县区Id
			statisticsExpshareInfo.setSpaceName(value);//县区名称
			statisticsExpshareInfo.setSumCount(value);//分享经验总数
			statisticsExpshareInfo.setTrueCount(value);//有效经验总数
			statisticsExpshareInfo.setBrowseCount(value);//浏览量
			statisticsExpshareInfo.setCommentCount(value);//评论量
			statisticsExpshareInfo.setCreateday(new Timestamp(new Date().getTime()));//发布日期
			statisticsExpshareInfo.setUpdatetime(new Timestamp(new Date().getTime()));//更新时间
			*/
			statisticsExpshareInfoService.insert(statisticsExpshareInfo);
			
			  str = "创建成功！";
		}else{//编辑
			statisticsExpshareInfo.setCreateday(new Timestamp(new Date().getTime()));//发布日期
			statisticsExpshareInfo.setUpdatetime(new Timestamp(new Date().getTime()));//更新时间
			statisticsExpshareInfoService.updateById(statisticsExpshareInfo);
			  str = "保存成功！";
			}
	 return str ;
	}
	/**
	 * json删除 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(
			@RequestParam(value = "items") String[] items,
			HttpServletRequest request ) {
	    String msg=null ;
		int i = statisticsExpshareInfoService.batchDelete(items);
		if(i > 0){
			msg="删除成功！" ;
		}else{
			msg="删除失败！" ;
		}
	  return msg ;
	} 
	/**
	 * json查看
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/statisticsExpshareInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public StatisticsExpshareInfoBean jsonSave(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request ) {
		    StatisticsExpshareInfoBean statisticsExpshareInfo = statisticsExpshareInfoService.selectById(id);
	  return  statisticsExpshareInfo ;
	} 
	
	/**
	 * -----------------------------------------------------------------
	 *                     接口
	 * -----------------------------------------------------------------
	 */
	
	@RequestMapping(value = "/json/statistics/byCity")
	public String getExpShartListByCity(
			@RequestParam(value="startTime",required = false) String startTime,
			@RequestParam(value="endTime",required = false) String endTime,
			@RequestParam(value="provinceId",required = false) BigDecimal provinceId,
			ModelMap modelMap){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			StatisticsExpshareInfoBean info = new StatisticsExpshareInfoBean();
			
			if(StringUtil.checkNotNull(startTime)){				
				info.setStartTime(new Timestamp(sdf.parse(startTime+" 00:00:00").getTime()));
			}
			if(StringUtil.checkNotNull(endTime)){				
				info.setEndTime(new Timestamp(sdf.parse(endTime+" 23:59:59").getTime()));
			}
			info.setProvinceId(provinceId);
			List<StatisticsExpshareInfoBean> list= statisticsExpshareInfoService.queryStatisticsListByCity(info);
			
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
			
		}catch(Exception e){
			logger.error("园区动态按市统计列表获取失败，详细原因"+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/json/statistics/byUnit")
	public String getExpShartListByUnit(
			@RequestParam(value="startTime",required = false) String startTime,
			@RequestParam(value="endTime",required = false) String endTime,
			@RequestParam(value="provinceId",required = false) BigDecimal provinceId,
			ModelMap modelMap){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			StatisticsExpshareInfoBean info = new StatisticsExpshareInfoBean();
			
			if(StringUtil.checkNotNull(startTime)){				
				info.setStartTime(new Timestamp(sdf.parse(startTime+" 00:00:00").getTime()));
			}
			if(StringUtil.checkNotNull(endTime)){				
				info.setEndTime(new Timestamp(sdf.parse(endTime+" 23:59:59").getTime()));
			}
			info.setProvinceId(provinceId);
			List<StatisticsExpshareInfoBean> list= statisticsExpshareInfoService.queryStatisticsListByUnit(info);
			
			modelMap.addAttribute("value", list);
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
			
		}catch(Exception e){
			logger.error("园区动态按单位统计列表获取失败，详细原因"+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";
	}
	
	
	@RequestMapping(value = "/json/statistics/byTotal")
	public String getExpShartListByTotal(
			@RequestParam(value="startTime",required = false) String startTime,
			@RequestParam(value="endTime",required = false) String endTime,
			@RequestParam(value="resultType") String resultType,
			@RequestParam(value="provinceId",required = false) BigDecimal provinceId,
			Page<StatisticsExpshareInfoBean> page, ModelMap modelMap){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
			StatisticsExpshareInfoBean info = new StatisticsExpshareInfoBean();
			
			if(StringUtil.checkNotNull(startTime)){				
				info.setStartTime(new Timestamp(sdf.parse(startTime+" 00:00:00").getTime()));
			}
			if(StringUtil.checkNotNull(endTime)){				
				info.setEndTime(new Timestamp(sdf.parse(endTime+" 23:59:59").getTime()));
			}
			info.setProvinceId(provinceId);
			if("1".equals(resultType)){
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = (Page<StatisticsExpshareInfoBean>)statisticsExpshareInfoService.queryStatisticsListByTotal(info);;

				modelMap.addAttribute("pages", page.getPages());
				modelMap.addAttribute("total", page.getTotal());
				modelMap.addAttribute("value", page.getResult());
			}else{
				List<StatisticsExpshareInfoBean> list = statisticsExpshareInfoService.queryStatisticsListByTotal(info);
				modelMap.addAttribute("value", list);
			}
			
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "获取列表成功!");
			
		}catch(Exception e){
			logger.error("园区动态按总体统计列表获取失败，详细原因"+e.getMessage(),e);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "获取列表失败！");
		}
		return "jsonView";
	}
}