package com.chinatelecom.jx.zone.management.controller.expShare;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



import com.jfinal.kit.StrKit;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;
import com.chinatelecom.jx.zone.management.service.expBrowse.IExpBrowseLogService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareInfoService;
import com.chinatelecom.jx.zone.management.service.expShare.IExpShareLabelService;

@Controller
public class ExpShareInfoController extends BaseController {
	@Autowired
	private IExpShareInfoService expShareInfoService;
	@Autowired
	private IExpShareLabelService expShareLabelService;
	@Autowired
	private IExpBrowseLogService expBrowseLogService;

	private static final Logger logger = LoggerFactory.getLogger(ExpShareInfoController.class);

	/**
	 * -----------------------------------------------------------------
	 *               
	 * -----------------------------------------------------------------
	

	@RequestMapping(value = "/auth/page/mobile/weixin/experienceSharing/weixin/main")
	public String list1(@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			//@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model) {
		return list(expShareInfo,page,model);
	}
   */
	
	/**
	 * 主页
	 * @param expShareInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/main")
	public String list(@ModelAttribute("expShareInfo") ExpShareInfoBean expShareInfo, 
			//@RequestParam(value = "searchKey", required = false) String searchKey,
			@ModelAttribute("page") Page<ExpShareInfoBean> page, Model model) {
		try {
			//标签列表
			List<ExpShareLabelBean> labelList = expShareLabelService.queryByCond(null);
			//热门园区动态
			expShareInfo.setOrderByClause("BROWSE_COUNT DESC");
			expShareInfo.setStatus((short) 1);
			PageHelper.startPage(1, 5);
			List<ExpShareInfoBean> infoList = expShareInfoService.queryByCond(expShareInfo);

			model.addAttribute("infoList", infoList);
			model.addAttribute("labelList", labelList);
			model.addAttribute("accountId", getCurrentAccountId());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}

		return "expShareInfo/list";
	}

	/**
	 * 新增 
	 * @param expId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/add")
	public String create(
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		try {
			//标签列表
			List<ExpShareLabelBean> labelList = expShareLabelService.queryByCond(null);
			model.addAttribute("labelList", labelList);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "expShareInfo/edit";
	} 
	/**
	 * 编辑
	 * @param expId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/edit")
	public String create(
			@RequestParam(value = "expId" ) BigDecimal expId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		try {
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
			model.addAttribute("expShareInfo", expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "expShareInfo/edit";
	}

	/**
	 * 保存操作
	 * @param expShareInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/save")
	public String save(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "isPreview",required=false) String isPreview,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		try {
			if(expShareInfo.getExpId()==null){
				expShareInfo.setExpId(seq.getNextSeqIdToBigDecimal());
				expShareInfo.setAccountId(getCurrentAccountId());
				expShareInfo.setAccountName(getCurrentAccountName());
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
					expShareInfoService.insert(expShareInfo);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					expShareInfo.setStatus((short) 3);
					expShareInfoService.insert(expShareInfo);
				}
			}else{//编辑
				if(StrKit.isBlank(isPreview)){
					expShareInfo.setStatus((short) 2);
					expShareInfo.setCreateTime(new Timestamp(new Date().getTime()));
					expShareInfoService.updateById(expShareInfo);
					String str = "提交成功！待审核";
					redirectAttributes.addFlashAttribute("message", str);
				}else{
					expShareInfoService.updateById(expShareInfo);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}

		return "redirect:/expShareInfo/main" ;

	}

	/**
	 * 查看详细
	 * @param expId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/view")
	public String view(
			@RequestParam(value = "expId") BigDecimal expId,
			@RequestParam(value = "pageNo",defaultValue = "1") int pageNo,
			HttpServletRequest request,Model model) {
		try {
			ExpShareInfoBean expShareInfo = expShareInfoService.selectById(expId);
		//	if(expShareInfo.getAccountId()!=getCurrentAccountId() || getCurrentAccountId()==null){
				//增加浏览量总数
				expShareInfo.setBrowseCount(expShareInfo.getBrowseCount()+1);
				expShareInfoService.updateById(expShareInfo);
				//增加浏览日志
				ExpBrowseLogBean expBrowseLog = new ExpBrowseLogBean();
				expBrowseLog.setLogId(seq.getNextSeqIdToBigDecimal());
				expBrowseLog.setExpId(expShareInfo.getExpId());
				if(getCurrentAccountId()==null){
					expBrowseLog.setType((short) 0);
				}else{
					expBrowseLog.setType((short) 1);
					expBrowseLog.setBrowseId(getCurrentAccountId());
					expBrowseLog.setBrowseName(getCurrentAccountName());
				}
				expBrowseLog.setBrowseIp(getIpAddr(request));
				expBrowseLog.setCreateTime(new Timestamp(new Date().getTime()));
				expBrowseLogService.insert(expBrowseLog);
		//	}
			model.addAttribute("expShareInfo",expShareInfo);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "expShareInfo/view";
	}

	/**
	 * -----------------------------------------------------------------
	 *                      通用异步方法
	 * -----------------------------------------------------------------
	 */

	/**
	 * 异步查看列表
	 */
	@RequestMapping(value = "/expShareInfo/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean list(
			@ModelAttribute(value = "expShareInfo") ExpShareInfoBean expShareInfo, 
			@RequestParam(value = "type") int type,//0:全部 1:我发布的
			Page<ExpShareInfoBean> page,
			Model model
			){
		ResultBean resultBean = new ResultBean();
		try {
			if(type==1){
				expShareInfo.setAccountId(getCurrentAccountId());
			}
			expShareInfo.setOrderByClause("IS_TOP DESC,CREATE_TIME DESC");
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ExpShareInfoBean>) expShareInfoService.queryByCond(expShareInfo);

			List<ExpShareInfoBean> list = new ArrayList<ExpShareInfoBean>(); 
			for(ExpShareInfoBean bean : page){
				list.add(bean);
			}
			if(page.getTotal()==0){
				resultBean.setCode(2);
				return resultBean;
			}

			if(page.getTotal()>(page.getPageNum()*page.getPageSize())){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
			}
			resultBean.setValue(list);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return resultBean;
	}

	/**
	 * 删除操作
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/expShareInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String delete(
			@RequestParam(value="ids") String ids,
			RedirectAttributes redirectAttributes,
			ServletRequest request,Model model) {
		String str = "";
		try {
			String[] idsStr = ids.split(",");
			for(int i = 0;i<idsStr.length;i++){
				expShareInfoService.deleteById(new BigDecimal(idsStr[i]));
			}
			str = "删除成功！";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			str = "删除失败！";
		}
		return str;
		
	}
	
	/**
	 * -------------------------------------------------------------------
	 *                            接口
	 * -------------------------------------------------------------------
	 */
	
	/**
	 * 审核
	 * @param inspectBean
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/json/expShareInfo/audit")
	public String inspectInsert(@RequestParam(value="ids") String ids,
			@RequestParam(value="audit") Short audit,
			ModelMap modelMap){
		try{
			String[] idsStr = ids.split(",");
			ExpShareInfoBean expShareInfo = new ExpShareInfoBean();
			expShareInfo.setStatus(audit);
			for(int i = 0;i<idsStr.length;i++){
				expShareInfo.setExpId(new BigDecimal(idsStr[i]));
				expShareInfoService.updateById(expShareInfo);
			}
			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "审核成功!");
		}catch(Exception e){
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "审核失败！");
		}
		return "jsonView";
		
	}

}