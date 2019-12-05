package com.chinatelecom.jx.zone.management.controller.investigationInfo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveExampleBean;
import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.browseLog.IBrowseLogMainService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputProinstService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.chinatelecom.jx.zone.management.service.formTemplate.IFormTemplateService;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoExampleService;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoMainService;
import com.chinatelecom.jx.zone.management.service.statisticsInput.IStatisticsInputService;
import com.chinatelecom.jx.zone.management.service.statisticsInve.IStatisticsInveExampleService;
import com.chinatelecom.jx.zone.management.service.statisticsInve.IStatisticsInveInfoService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class investigationInfoFrontController extends BaseController {

	@Autowired
	private IInvestigationInfoMainService investigationInfoMainService;
	@Autowired
	private IFormInputProinstService formInputProinstService;
	@Autowired
	private IFormInputService formInputService;
	@Autowired
	private IInvestigationInfoExampleService infoExampleService;
	@Autowired
	private IBrowseLogMainService browseLogMainService;
	// 以下为统计
	@Autowired
	private IStatisticsInputService statisticsInputService;
	@Autowired
	private IStatisticsInveInfoService statisticsInveInfoService;
	@Autowired
	private IStatisticsInveExampleService statisticsInveExampleService;
	@Autowired
	private IFormTemplateService formTemplateService;

	/**
	 * 
	 * =========================================================================================
	 * PC端页面跳转
	 * =========================================================================================
	 */

	/**
	 * 首页
	 */
	@RequestMapping(value = "investigation/main")
	public String main(
			@RequestParam(value="type" ,required=false)Integer type,
			Model model) {
		try {
			model.addAttribute("type",type);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "front/investigation/main";
	}

	// 进入调查详情
	@RequestMapping(value = "/investigation/createInfo/{id}")
	public String createInfo(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		//判断当前用户是否参与过
		InvestigationInfoExampleBean investigationInfoExampleBean = new InvestigationInfoExampleBean();
		investigationInfoExampleBean.setInvestigationId(id);
		investigationInfoExampleBean.setAccountId(getCurrentAccountId());
		List<InvestigationInfoExampleBean> list = infoExampleService.queryByCond(investigationInfoExampleBean);
		if(list.size()>0){
			//return "redirect:/investigation/detailResult/"+id;
		}else{
			InvestigationInfoMainBean investigationInfoMainBean = 
					investigationInfoMainService.selectById(id);
			//实例表插入一条数据
			Object[] obj = infoExampleService.insertExample(investigationInfoMainBean.getId()
					,investigationInfoMainBean.getFormId(),getCurrentAccountId()
					,getCurrentAccountName(),seq,getIpAddr(request),new Date());
		}
		
		//插入一条浏览记录
		browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(),id,getCurrentAccountId(),"t_investigation_info_main");
		
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
		FormInputProinstBean proinst = new FormInputProinstBean();
		proinst.setFormId(investigationInfoMain.getFormId());
		proinst.setOrderByClause("sort_grade asc");
		proinst.setAccountId(getCurrentAccountId());
		List<FormInputProinstBean> lstProinst = formInputProinstService.queryByCond(proinst);
		// 获取参与人员数
		InvestigationInfoExampleBean exampleBean = new InvestigationInfoExampleBean();
		exampleBean.setInvestigationId(id);
		exampleBean.setStatus((short) 1);
		List<InvestigationInfoExampleBean> exampleList = infoExampleService.queryJoinCount(exampleBean);
		if (exampleList != null && exampleList.size() > 0) {
			model.addAttribute("joinCount", exampleList.get(0).getExtend1());
		} else {
			model.addAttribute("joinCount", 0);
		}
		// 获取阅读数量
		BrowseLogMainBean browse = new BrowseLogMainBean();
		browse.setSource("t_investigation_info_main");
		browse.setRelatedId(id);
		int browseLogCount = browseLogMainService.getBrowseCount(browse);
		model.addAttribute("browseLogCount", browseLogCount);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("lstProinst", lstProinst);
		return "front/investigation/surveyDetails";
	}

	// 创建预览
	@RequestMapping(value = "/investigation/createPreview/{id}")
	public String createPreview(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
		FormInputProinstBean proinst = new FormInputProinstBean();
		proinst.setFormId(investigationInfoMain.getFormId());
		proinst.setOrderByClause("sort_grade asc");
		proinst.setAccountId(getCurrentAccountId());
		List<FormInputProinstBean> lstProinst = formInputProinstService.queryByCond(proinst);
		// 获取参与人员数
		InvestigationInfoExampleBean exampleBean = new InvestigationInfoExampleBean();
		exampleBean.setInvestigationId(id);
		exampleBean.setStatus((short) 1);
		List<InvestigationInfoExampleBean> exampleList = infoExampleService.queryJoinCount(exampleBean);
		if (exampleList != null && exampleList.size() > 0) {
			model.addAttribute("joinCount", exampleList.get(0).getExtend1());
		} else {
			model.addAttribute("joinCount", 0);
		}
		// 获取阅读数量
		BrowseLogMainBean browse = new BrowseLogMainBean();
		browse.setSource("t_investigation_info_main");
		browse.setRelatedId(id);
		int browseLogCount = browseLogMainService.getBrowseCount(browse);
		model.addAttribute("browseLogCount", browseLogCount);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("lstProinst", lstProinst);
		return "front/investigation/createPreview";
	}

	/**
	 * 保存调查填写信息
	 * 
	 * @param formId
	 * @param request
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/investigation/saveInfo")
	public String saveInfo(@RequestParam(value = "formId") BigDecimal formId, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		int i = formInputProinstService.saveInfo(request, formId, getCurrentAccountId());
		if (i > 0) {
			redirectAttributes.addFlashAttribute("message", "保存成功！");
		} else {
			redirectAttributes.addFlashAttribute("message", "保存失败！");
		}
		return "redirect:/investigation/main";
	}

	/**
	 * 新增调查
	 * 
	 */
	@RequestMapping(value = "/investigation/create")
	public String create(Model model) {
		try {
			InvestigationInfoMainBean investigationInfoMain = new InvestigationInfoMainBean();
			model.addAttribute("investigationInfoMain", investigationInfoMain);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "front/investigation/createSurvey";
	}

	/**
	 * 编辑调查
	 * 
	 */
	@RequestMapping(value = "/investigation/create/{id}")
	public String create(@PathVariable(value = "id") BigDecimal id, Model model, ServletRequest request) {
		try {
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
			model.addAttribute("investigationInfoMain", investigationInfoMain);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "front/investigation/edit";
	}

	/**
	 * 保存或编辑调查基础选项
	 * 
	 */
	@RequestMapping(value = "/investigation/save")
	public String save(@ModelAttribute(value = "investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			RedirectAttributes redirectAttributes, Model model, ServletRequest request) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if (investigationInfoMain.getId() == null) {
				BigDecimal formId = seq.getNextSeqIdToBigDecimal();
				BigDecimal id = seq.getNextSeqIdToBigDecimal();
				investigationInfoMain.setId(id);
				investigationInfoMain.setFormId(formId);
				investigationInfoMain.setAccountId(getCurrentAccountId());
				investigationInfoMain.setAccountName(getCurrentAccountName());
				investigationInfoMain.setQrCode(createQrcode("investigation/weixin/createInfoOfWx/"+id,null));
				investigationInfoMain.setInvestigationUrl(ProjectProps.getProp("url")+"investigationInfoMain/createInfo/"+id);
				
				investigationInfoMainService.saveInvestigationInfo(investigationInfoMain);
				redirectAttributes.addFlashAttribute("message", "创建成功！");
			} else {
				InvestigationInfoMainBean info = investigationInfoMainService.selectById(investigationInfoMain.getId());
				investigationInfoMain.setEndTime(sdf.parse(investigationInfoMain.getEnd()));
				MyBeanUtils.copyProperties(investigationInfoMain, info);
				investigationInfoMainService.updateById(info);
				redirectAttributes.addFlashAttribute("message", "保存成功！");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "创建失败！");
			logger.error("在线调查保存失败，详细原因："+e.getMessage(), e);
		}

		return "redirect:/investigation/main";

	}

	/**
	 * 删除操作
	 * 
	 */
	@RequestMapping(value = "/investigation/delete")
	public String delete(@RequestParam(value = "items") String[] items,
			// @PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes, ServletRequest request, Model model) {
		int i = investigationInfoMainService.batchDelete(items);
		// int i = investigationInfoMainService.deleteById(id);
		if (i > 0) {
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		} else {
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/investigation/main";
	}

	// 进入调查结果详情
	@RequestMapping(value = "/investigation/detailResult/{id}")
	public String detailResult(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			@RequestParam(value = "type", required = false) String type, // 值为all时，查看所有的结果，其他值时，关联当前用户的填写值
			HttpServletRequest request, Model model) {

		//插入一条浏览记录
		browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(),id,getCurrentAccountId(),"t_investigation_info_main");
		
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
		// //获取我录入的值
		// FormInputProinstBean proinst = new FormInputProinstBean();
		// proinst.setFormId(investigationInfoMain.getFormId());
		// proinst.setOrderByClause("sort_grade asc");
		// proinst.setAccountId(getCurrentAccountId());
		// List<FormInputProinstBean> lstProinst =
		// formInputProinstService.queryByCond(proinst);
		// 获取所有配置录入项实例
		StatisticsInputBean inputBean = new StatisticsInputBean();
		inputBean.setInvestigationId(investigationInfoMain.getId());
		inputBean.setAccountId(getCurrentAccountId());
		inputBean.setOrderByClause("a.sort_grade asc");
		List<StatisticsInputBean> inputList = statisticsInputService.queryByCondWithValue(inputBean);

		// 判断当前用户有没有参与
		String isJoin = "no";
		for (StatisticsInputBean b : inputList) {
			if (StringUtil.checkNotNull(b.getValue())) {
				isJoin = "yes";
				break;
			}
		}
		model.addAttribute("isJoin", isJoin);

		// 获取所有配置录入项实例并结果统计
		StatisticsInveExampleBean inveExamBean = new StatisticsInveExampleBean();
		inveExamBean.setInvestigationId(investigationInfoMain.getId());
		inveExamBean.setOrderByClause("sort_grade asc");
		List<StatisticsInveExampleBean> lstInveExam = statisticsInveExampleService.queryByCond(inveExamBean);
		// 封装录入项的统计结果
		Map<String, String> examResultMap = new HashMap<String, String>();
		for (StatisticsInveExampleBean exam : lstInveExam) {
			examResultMap.put(exam.getInputId() + exam.getOptions(),
					exam.getInputTrue() + "_" + exam.getInputProinstPrc());
		}
		// 获取参与人员数 获取阅读数量
		StatisticsInveInfoBean inveInfo = new StatisticsInveInfoBean();
		inveInfo.setInvestigationId(investigationInfoMain.getId());
		StatisticsInveInfoBean info = statisticsInveInfoService.queryTotalCountByCond(inveInfo);

		model.addAttribute("totalCount", info);
		model.addAttribute("examResultMap", examResultMap);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("lstInput", inputList);
		return "front/investigation/surveyResults";
	}

	// 进入统计报表页面
	@RequestMapping(value = "/investigation/statisticsDetailResult/{id}")
	public String statisticsDetailResult(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		return "front/investigation/statisticalReport";
	}
	
	@RequestMapping(value = "/investigation/statisticsDetailResult2/{id}")
	public String statisticsDetailResult2(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("type", 3);
		return "front/investigation/statisticalReport";
	}
	
	/**
	 * 导出Excel 数据下载
	 */
	@RequestMapping(value = "/investigation/downloadInfoByExcel")
	public String downloadInfoByExcel(@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request, ModelMap modelMap,RedirectAttributes redirectAttributes) {
		boolean success = false;
		int errorCode = -1;
		String errorMsg = null;
		try {
			//1、获取调查事项详情
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
			//获取要导出的数据
			///2、获取所有配置录入项实例并结果统计
			StatisticsInveExampleBean inveExamBean = new StatisticsInveExampleBean();
			inveExamBean.setInvestigationId(id);
			inveExamBean.setOrderByClause("sort_grade asc");
			List<StatisticsInveExampleBean> lstInveExam = statisticsInveExampleService.queryByCond(inveExamBean);
			// 封装录入项的统计结果
			Map<String, String> examResultMap = new HashMap<String, String>();
			for (StatisticsInveExampleBean exam : lstInveExam) {
				examResultMap.put(exam.getInputId() + exam.getOptions(),
						exam.getInputProinstNum() + "_" + exam.getInputProinstPrc());
			}

			//3、获取参与人员数 获取阅读数量
			StatisticsInveInfoBean inveInfo = new StatisticsInveInfoBean();
			inveInfo.setInvestigationId(id);
			StatisticsInveInfoBean totalInfo = statisticsInveInfoService.queryTotalCountByCond(inveInfo);

			//4、获取所有配置录入项实例
			StatisticsInputBean inputBean = new StatisticsInputBean();
			inputBean.setInvestigationId(id);
			inputBean.setAccountId(getCurrentAccountId());
			inputBean.setOrderByClause("a.sort_grade asc");
			List<StatisticsInputBean> inputList = statisticsInputService.queryByCondWithValue(inputBean);
			
			//5、获取文本框的输入值
			FormInputProinstBean inputProinst = new FormInputProinstBean();
			inputProinst.setFormId(investigationInfoMain.getFormId());
			inputProinst.setOrderByClause("a.sort_grade asc,a.id,a.create_time asc");
			List<FormInputProinstBean> inputProinstList = formInputProinstService.queryByCondWithPersonInfo(inputProinst);
			
			modelMap.addAttribute("info",investigationInfoMain);
			modelMap.addAttribute("inputList", inputList);
			modelMap.addAttribute("examResultMap", examResultMap);
			modelMap.addAttribute("totalInfo", totalInfo);
			modelMap.addAttribute("inputProinstList", inputProinstList);
			success = true;
			errorCode = 0;
			errorMsg = "下载导出调查信息成功！";
		} catch (Exception ex) {
			errorCode = 2;
			errorMsg = "下载导出调查信息失败，详细原因：" + ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
		}

		modelMap.addAttribute("success", success);
		modelMap.addAttribute("errorCode", errorCode);
		modelMap.addAttribute("errorMsg", errorMsg);
		return "InvestigationInfoForFrontLoadExcelView";
	}
		
	/**
	 * 
	 * =========================================================================================
	 * WeiXin端页面跳转
	 * =========================================================================================
	 */

	/**
	 * 首页
	 */
	@RequestMapping(value = "investigation/weixin/main")
	public String investigationMain(
			@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			@RequestParam(value = "type", defaultValue = "1") Integer type, Model model) {
		return "weixinPage/investigation/onlineSurvey";
	}

	@RequestMapping(value = "investigation/weixin/myList")
	public String myList(@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			@RequestParam(value = "type", defaultValue = "1") Integer type, Model model) {
		return "weixinPage/investigation/mySurvey";
	}

	// 进入调查详情
	@RequestMapping(value = "/investigation/weixin/createInfoOfWx/{id}")
	public String createInfoOfWx(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
//		FormInputProinstBean proinst = new FormInputProinstBean();
//		proinst.setFormId(investigationInfoMain.getFormId());
//		proinst.setOrderByClause("sort_grade asc");
//		proinst.setAccountId(accountId);
//		List<FormInputProinstBean> lstProinst = formInputProinstService.queryByCond(proinst);
		StatisticsInputBean inputBean = new StatisticsInputBean();
		inputBean.setInvestigationId(investigationInfoMain.getId());
		inputBean.setAccountId(getCurrentAccountId());
		inputBean.setOrderByClause("a.sort_grade asc");
		List<StatisticsInputBean> inputList = statisticsInputService.queryByCondWithValue(inputBean);

		// 判断当前用户有没有参与
		String isJoin = "no";
		for (StatisticsInputBean b : inputList) {
			if (StringUtil.checkNotNull(b.getValue())) {
				isJoin = "yes";
				break;
			}
		}
		model.addAttribute("isJoin", isJoin);
		// 获取参与人员数
		InvestigationInfoExampleBean exampleBean = new InvestigationInfoExampleBean();
		exampleBean.setInvestigationId(id);
		exampleBean.setStatus((short) 1);
		List<InvestigationInfoExampleBean> exampleList = infoExampleService.queryJoinCount(exampleBean);
		if (exampleList != null && exampleList.size() > 0) {
			model.addAttribute("joinCount", exampleList.get(0).getExtend1());
		} else {
			model.addAttribute("joinCount", 0);
		}
		// 获取阅读数量
		BrowseLogMainBean browse = new BrowseLogMainBean();
		browse.setSource("t_investigation_info_main");
		browse.setRelatedId(id);
		int browseLogCount = browseLogMainService.getBrowseCount(browse);
		model.addAttribute("browseLogCount", browseLogCount);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("inputList", inputList);
		return "weixinPage/investigation/surveyDetails";
	}

	/**
	 * 保存调查填写信息
	 * 
	 * @param formId
	 * @param request
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/investigation/weixin/saveInfoOfWx")
	public String saveInfoOfWx(@RequestParam(value = "formId") BigDecimal formId,
			@RequestParam(value = "id") BigDecimal id, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		int i = formInputProinstService.saveInfo(request, formId, getCurrentAccountId());
		if (i > 0) {
			redirectAttributes.addFlashAttribute("message", "保存成功！");
			return "redirect:/investigation/weixin/detailResultOfWx/" + id;
		} else {
			redirectAttributes.addFlashAttribute("message", "保存失败！");
		}
		return "redirect:/investigation/weixin/main";
	}

	/**
	 * 查看调查结果详情 并显示自己的填入内容
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/weixin/detailResultOfWx/{id}")
	public String detailResultOfWx(@PathVariable(value = "id") BigDecimal id, // 调查事项ID
			HttpServletRequest request, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
		StatisticsInputBean inputBean = new StatisticsInputBean();
		inputBean.setInvestigationId(investigationInfoMain.getId());
		inputBean.setAccountId(getCurrentAccountId());
		inputBean.setOrderByClause("a.sort_grade asc");
		List<StatisticsInputBean> inputList = statisticsInputService.queryByCondWithValue(inputBean);

		// 获取所有配置录入项实例并结果统计
		StatisticsInveExampleBean inveExamBean = new StatisticsInveExampleBean();
		inveExamBean.setInvestigationId(id);
		inveExamBean.setOrderByClause("sort_grade asc");
		List<StatisticsInveExampleBean> lstInveExam = statisticsInveExampleService.queryByCond(inveExamBean);
		// 封装录入项的统计结果
		Map<String, String> examResultMap = new HashMap<String, String>();
		for (StatisticsInveExampleBean exam : lstInveExam) {
			examResultMap.put(exam.getInputId() + exam.getOptions(),
					exam.getInputProinstNum() + "_" + exam.getInputProinstPrc());
		}
		// 获取参与人员数 获取阅读数量
		StatisticsInveInfoBean inveInfo = new StatisticsInveInfoBean();
		inveInfo.setInvestigationId(investigationInfoMain.getId());
		StatisticsInveInfoBean info = statisticsInveInfoService.queryTotalCountByCond(inveInfo);

		model.addAttribute("totalCount", info);
		model.addAttribute("examResultMap", examResultMap);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("lstInput", inputList);
		return "weixinPage/investigation/surveyResults";
	}

	/**
	 * 调查结果统计
	 * @param id
	 * @param page
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "investigation/weixin/report/{id}")
	public String report(@PathVariable(value = "id") BigDecimal id,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			@RequestParam(value = "type", defaultValue = "1") Integer type, Model model) {
		// 获取调查详情
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService.selectById(id);
		// 获取所有配置录入项实例
		StatisticsInputBean inputBean = new StatisticsInputBean();
		inputBean.setInvestigationId(investigationInfoMain.getId());
		inputBean.setAccountId(getCurrentAccountId());
		inputBean.setOrderByClause("a.sort_grade asc");
		List<StatisticsInputBean> inputList = statisticsInputService.queryByCondWithValue(inputBean);
		// 获取所有配置录入项实例并结果统计
		StatisticsInveExampleBean inveExamBean = new StatisticsInveExampleBean();
		inveExamBean.setInvestigationId(id);
		inveExamBean.setOrderByClause("sort_grade asc");
		List<StatisticsInveExampleBean> lstInveExam = statisticsInveExampleService.queryByCond(inveExamBean);
		// 封装录入项的统计结果
		Map<String, String> examResultMap = new HashMap<String, String>();
		for (StatisticsInveExampleBean exam : lstInveExam) {
			examResultMap.put(exam.getInputId() + exam.getOptions(),
					exam.getInputProinstNum() + "_" + exam.getInputProinstPrc());
		}
		// 获取参与人员数
		InvestigationInfoExampleBean exampleBean = new InvestigationInfoExampleBean();
		exampleBean.setInvestigationId(id);
		exampleBean.setStatus((short) 1);
		List<InvestigationInfoExampleBean> exampleList = infoExampleService.queryJoinCount(exampleBean);
		if (exampleList != null && exampleList.size() > 0) {
			model.addAttribute("joinCount", exampleList.get(0).getExtend1());
		} else {
			model.addAttribute("joinCount", 0);
		}
		// 获取阅读数量
		BrowseLogMainBean browse = new BrowseLogMainBean();
		browse.setSource("t_investigation_info_main");
		browse.setRelatedId(id);
		int browseLogCount = browseLogMainService.getBrowseCount(browse);
		model.addAttribute("browseLogCount", browseLogCount);
		// 获取参与人员数 获取阅读数量
		StatisticsInveInfoBean inveInfo = new StatisticsInveInfoBean();
		inveInfo.setInvestigationId(investigationInfoMain.getId());
		StatisticsInveInfoBean info = statisticsInveInfoService.queryTotalCountByCond(inveInfo);
		model.addAttribute("totalCount", info);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("examResultMap", examResultMap);
		model.addAttribute("lstInput", inputList);
		return "weixinPage/investigation/statisticalReport";
	}
	
	/**
	 * 统计问题详情
	 * @param investigationInfoMain
	 * @param page
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "investigation/weixin/questionDetails")
	public String questionDetails(
			@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			@RequestParam(value = "type", defaultValue = "1") Integer type, Model model) {
		return "weixinPage/investigation/questionDetails";
	}

	/**
	 * 
	 * =========================================================================================
	 * json异步数据
	 * =========================================================================================
	 */

	/**
	 * 异步加载调查列表 code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常 type代码 1：所有 2：我发布 3：我参与
	 */
	@RequestMapping(value = "/investigation/json/list", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean list(@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page, @RequestParam(value = "type") Integer type) {
		ResultBean resultBean = new ResultBean();
		try {
			
			if(page.getPageSize()==0){				
				page.setPageSize(6);
			}
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			if (type == 3) {
				investigationInfoMain.setOrderByClause("a.create_time desc");
				investigationInfoMain.setAccountId(getCurrentAccountId());
				page = investigationInfoMainService.queryEnterList(investigationInfoMain);
			} else {
				investigationInfoMain.setOrderByClause("publish_time desc");
				if (type == 2) {
					investigationInfoMain.setOrderByClause("create_time desc");
					investigationInfoMain.setAccountId(getCurrentAccountId());
				}
				page = investigationInfoMainService.queryAllList(investigationInfoMain);
			}

			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}

			resultBean.setValue(page.getResult());
			resultBean.setMsg(page.getTotal() + "");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}

	/**
	 * 异步删除操作
	 * 
	 */
	@RequestMapping(value = "/investigation/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean asynDelete(@RequestParam(value = "items") String items) {
		ResultBean resultBean = new ResultBean();
		try {
			String[] ids = items.split(",");
			int i = investigationInfoMainService.batchDelete(ids);
			if (i > 0) {
				resultBean.setCode(1);
				resultBean.setMsg("删除成功");
			} else {
				resultBean.setCode(0);
				resultBean.setMsg("删除失败");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}

	// 获取报表统计结果
	@RequestMapping(value = "/investigation/json/getStatisticsDetailResult", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getStatisticsDetailResult(@RequestParam(value = "id") BigDecimal id, // 调查事项ID
			@RequestParam(value = "pageSize",defaultValue="2") int pageSize,
			@ModelAttribute("page") Page<StatisticsInputBean> page, HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			// 获取调查详情
			// InvestigationInfoMainBean investigationInfoMain =
			// investigationInfoMainService.selectById(id);
			// String jsonStr = JSON.toJSONString(investigationInfoMain);
			// resultBean.setJsonValue(JSONObject.parseObject(jsonStr));

			// 获取所有配置录入项实例并结果统计
			StatisticsInveExampleBean inveExamBean = new StatisticsInveExampleBean();
			inveExamBean.setInvestigationId(id);
			inveExamBean.setOrderByClause("sort_grade asc");
			List<StatisticsInveExampleBean> lstInveExam = statisticsInveExampleService.queryByCond(inveExamBean);
			// 封装录入项的统计结果
			Map<String, String> examResultMap = new HashMap<String, String>();
			for (StatisticsInveExampleBean exam : lstInveExam) {
				examResultMap.put(exam.getInputId() + exam.getOptions(),
						exam.getInputProinstNum() + "_" + exam.getInputProinstPrc());
			}
			// 将值转换为json格式
			String jsonStr = JSON.toJSONString(examResultMap);
			if (!"[]".equals(jsonStr)) {
				resultBean.setJsonValue(JSONObject.parseObject(jsonStr));
			}

			// 获取参与人员数 获取阅读数量
			StatisticsInveInfoBean inveInfo = new StatisticsInveInfoBean();
			inveInfo.setInvestigationId(id);
			StatisticsInveInfoBean info = statisticsInveInfoService.queryTotalCountByCond(inveInfo);
			jsonStr = JSON.toJSONString(info);
			if (!"[]".equals(jsonStr)) {
				resultBean.setJsonValue1(JSONObject.parseObject(jsonStr));
			}

			// 获取所有配置录入项实例
			StatisticsInputBean inputBean = new StatisticsInputBean();
			inputBean.setInvestigationId(id);
			inputBean.setAccountId(getCurrentAccountId());
			inputBean.setOrderByClause("a.sort_grade asc");
			page.setPageSize(pageSize);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = statisticsInputService.queryByCondWithValueByPage(inputBean);

			//获取所有数据中最小时间和最大时间
			StatisticsInputBean  record = statisticsInputService
					.queryStartAndEndTime(inputBean);
			if(record!=null){				
				resultBean.setJsonValue2(JSONObject.parseObject(
						"{\"start\":\"" + sdf.format(sdf.parse(record.getStart())) 
						+ "\",\"end\":\"" + sdf.format(sdf.parse(record.getEnd())) + "\"}"));
			}
			
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}

			resultBean.setValue(page.getResult());
			resultBean.setMsg(page.getTotal() + "");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}

	/**
	 * 获取所有人的作答内容
	 * 
	 * @param id
	 * @param inputId
	 * @param page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/getQuestionItem", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getQuestionItem(@RequestParam(value = "id") BigDecimal id, // 调查事项ID
			@RequestParam(value = "inputId", required = false) BigDecimal inputId, // 题目ID
			@ModelAttribute("page") Page<FormInputProinstBean> page, HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			// //获取所有的文本作答问题
			// StatisticsInputBean inputBean = new StatisticsInputBean();
			// inputBean.setInvestigationId(id);
			// inputBean.setOrderByClause("a.sort_grade asc");
			// inputBean.setAccountId(getCurrentAccountId());
			// inputBean.setInputType("radio");//textarea
			// List<StatisticsInputBean> lstInput =
			// statisticsInputService.queryByCondWithValue(inputBean);
			InvestigationInfoMainBean investigationInfo = investigationInfoMainService.selectById(id);

			FormInputBean inputBean = new FormInputBean();
			inputBean.setFormId(investigationInfo.getFormId());
			inputBean.setInputType("textarea");
			inputBean.setOrderByClause("sort_grade asc");
			List<FormInputBean> lstInput = formInputService.queryByCond(inputBean);
			// 将值转换为json格式
			String jsonStr = JSON.toJSONString(lstInput);
			if (!"[]".equals(jsonStr)) {
				resultBean.setJsonArrayValue(JSONObject.parseArray(jsonStr));
			}

			if (lstInput != null && lstInput.size() > 0) {
				// 获取某项题目的作答详情
				if (!StringUtil.checkNotNull(inputId)) {
					inputId = lstInput.get(0).getId();
				}
				// 获取所有录入人员答案
				FormInputProinstBean inputProinstBean = new FormInputProinstBean();
				inputProinstBean.setFormId(investigationInfo.getFormId());
				inputProinstBean.setInputId(inputId);
				inputProinstBean.setOrderByClause("a.create_time desc,a.id desc");
				page.setPageSize(2);
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page = formInputProinstService.queryByCondWithPersonInfoForPage(inputProinstBean);
				
				//获取所有数据中最小时间和最大时间
				FormInputProinstBean  record = formInputProinstService
						.queryStartAndEndTime(inputProinstBean);
				resultBean.setJsonValue1(JSONObject.parseObject(
						"{\"start\":\"" + sdf.format(sdf.parse(record.getStart())) + "\",\"end\":\"" + sdf.format(sdf.parse(record.getEnd())) + "\"}"));
				
				resultBean.setValue(page.getResult());
				resultBean.setMsg(page.getTotal() + "");
				if (page.getTotal() == 0) {
					resultBean.setCode(2);
					resultBean.setMsg("暂无更多数据");
					return resultBean;
				}

				if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
					resultBean.setCode(1);
				} else {
					resultBean.setCode(0);
				}
			} else {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}

	/**
	 * 获取所有人的作答内容
	 * 
	 * @param id
	 * @param inputId
	 * @param page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/getQuestionItemForWx", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getQuestionItemForWx(@RequestParam(value = "id") BigDecimal id, // 调查事项ID
			@RequestParam(value = "inputId") BigDecimal inputId, // 题目ID
			@RequestParam(value = "pageSize",defaultValue="2") int pageSize,
			@ModelAttribute("page") Page<FormInputProinstBean> page, HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			InvestigationInfoMainBean investigationInfo = investigationInfoMainService.selectById(id);
			// 获取某项题目的作答详情
			// 获取所有录入人员答案
			FormInputProinstBean inputProinstBean = new FormInputProinstBean();
			inputProinstBean.setFormId(investigationInfo.getFormId());
			inputProinstBean.setInputId(inputId);
			inputProinstBean.setOrderByClause("create_time desc,id desc");
			page.setPageSize(pageSize);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = formInputProinstService.queryByCondForPage(inputProinstBean);

			resultBean.setValue(page.getResult());
			resultBean.setMsg(page.getTotal() + "");
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}

	@RequestMapping(value = "/investigation/json/getQuestionItemDetail", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getQuestionItemDetail(@RequestParam(value = "id") BigDecimal id, // 某人作答的ID
			@ModelAttribute("page") Page<StatisticsInputBean> page, HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		// 根据作答ID
		FormInputProinstBean inputProinstBean = formInputProinstService.selectById(id);// 作答详情
		return resultBean;
	}

	/**
	 * 获取数据 展示数据图
	 * 
	 * @param id
	 * @param page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/getInvestigationCountData", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getInvestigationCountData(@RequestParam(value = "id") BigDecimal id, // 事项ID
			HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			// 1、获取所有的统计值总和
			StatisticsInveInfoBean bean = new StatisticsInveInfoBean();
			bean.setInvestigationId(id);
			StatisticsInveInfoBean totalList = statisticsInveInfoService.queryTotalCountByCond(bean);
			
			// 将值转换为json格式
			String jsonStr = JSON.toJSONString(totalList);
			if (!"[]".equals(jsonStr)) {
				resultBean.setJsonValue(JSONObject.parseObject(jsonStr));
			}

			// 2、获取每天的数据
			bean.setOrderByClause("createday asc");
			List<StatisticsInveInfoBean> infoList = statisticsInveInfoService.queryByCond(bean);
			//封装数据为Echarts格式
			String seriesStr = "";//三个变量的数据要顺序对应 数据
			String dateStr = "";//三个变量的数据要顺序对应  日期
//			String legendStr = "'数据量','浏览量','PC端数据量','移动端数据量','填写率'";//三个变量的数据要顺序对应 数据标题
			String inputNum = "";//数据量
			String browseNum = "";//浏览量
			String inputNumPc = "";//PC端数据量
			String inputNumMobile = "";//移动端数据量
			String inputPercent = "";//填写率
			for(StatisticsInveInfoBean info : infoList){
				dateStr += ","+info.getCreateday()+"";
				inputNum += ","+info.getCountExampleSum();
				browseNum += ","+info.getCountBrowse();
				inputNumPc += ","+info.getCountExamplePc();
				inputNumMobile += ","+info.getCountExampleWx();
				inputPercent += "," + info.getExamplePrc();
			}
			if (StringUtil.checkNotNull(dateStr)) {
				dateStr = dateStr.substring(1);
				inputNum = inputNum.substring(1);
				browseNum = browseNum.substring(1);
				inputNumPc = inputNumPc.substring(1);
				inputNumMobile = inputNumMobile.substring(1);
				inputPercent = inputPercent.substring(1);
				seriesStr += "{\"dateStr\":\"" + dateStr + "\"";
				seriesStr += ",\"inputNum\":\"" + inputNum + "\"";
				seriesStr += ",\"browseNum\":\"" + browseNum + "\"";
				seriesStr += ",\"inputNumPc\":\"" + inputNumPc + "\"";
				seriesStr += ",\"inputNumMobile\":\"" + inputNumMobile + "\"";
				seriesStr += ",\"inputPercent\":\"" + inputPercent + "\"}";
				resultBean.setJsonValue(JSONObject.parseObject(seriesStr));
			}else{
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}
	
	/**
	 * 获取数据列表
	 * 
	 * @param id
	 * @param page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/getInvestigationDataList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getInvestigationDataList(@RequestParam(value = "id") BigDecimal id, // 事项ID
			@ModelAttribute("page") Page<StatisticsInveInfoBean> page, 
			@RequestParam(value = "start",required=false)String start,
			@RequestParam(value = "end",required=false)String end,
			HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//获取每天的数据列表
			StatisticsInveInfoBean bean = new StatisticsInveInfoBean();
			bean.setInvestigationId(id);
			if(StringUtil.checkNotNull(start)){
				bean.setStart(start);
			}
			if(StringUtil.checkNotNull(end)){
				bean.setEnd(end);
			}
			
			bean.setOrderByClause("createday asc");
			page.setPageSize(2);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = statisticsInveInfoService.queryByCondForPage(bean);
			
			if(!(StringUtil.checkNotNull(start)||StringUtil.checkNotNull(end))){
				long[] a = new long[(int)page.getResult().size()];
				for(int i=0;i<page.getResult().size();i++){
					a[i] = sdf.parse(page.getResult().get(i).getCreateday()).getTime();
				}
				String[] b = getMaxAndMinTime(a);
				resultBean.setJsonValue(JSONObject.parseObject(
						"{\"start\":\"" + b[0] + "\",\"end\":\"" + b[1] + "\"}"));
			}else{
				resultBean.setJsonValue(JSONObject.parseObject(
						"{\"start\":\"" + start + "\",\"end\":\"" + end + "\"}"));
			}
			
			resultBean.setValue(page.getResult());
			resultBean.setMsg(page.getTotal() + "");
			
			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}
	
	/**
	 * 获取参与填写人员数据
	 * 
	 * @param id
	 * @param page
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/getJoinPersonData", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getJoinPersonData(@RequestParam(value = "id") BigDecimal id, // 事项ID
			@ModelAttribute("page") Page<InvestigationInfoExampleBean> page, 
			@RequestParam(value = "start",required=false)String start,
			@RequestParam(value = "end",required=false)String end,
			HttpServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			InvestigationInfoExampleBean examBean = new InvestigationInfoExampleBean();
			examBean.setInvestigationId(id);
			if(StringUtil.checkNotNull(start)){
				examBean.setStart(start);
			}
			if(StringUtil.checkNotNull(end)){
				examBean.setEnd(end);
			}
			examBean.setOrderByClause("create_time asc");
			page.setPageSize(2);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = infoExampleService.queryByCondForPage(examBean);
			
			if(!(StringUtil.checkNotNull(start)||StringUtil.checkNotNull(end))){
				long[] a = new long[(int)page.getResult().size()];
				for(int i=0;i<page.getResult().size();i++){
					a[i] = page.getResult().get(i).getCreateTime().getTime();
				}
				String[] b = getMaxAndMinTime(a);
				resultBean.setJsonValue(JSONObject.parseObject(
						"{\"start\":\"" + b[0] + "\",\"end\":\"" + b[1] + "\"}"));
			}else{
				resultBean.setJsonValue(JSONObject.parseObject(
						"{\"start\":\"" + start + "\",\"end\":\"" + end + "\"}"));
			}
			
			
			resultBean.setValue(page.getResult());
			resultBean.setMsg(page.getTotal() + "");

			if (page.getTotal() == 0) {
				resultBean.setCode(2);
				resultBean.setMsg("暂无更多数据");
				return resultBean;
			}

			if (page.getTotal() > (page.getPageNum() * page.getPageSize())) {
				resultBean.setCode(1);
			} else {
				resultBean.setCode(0);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}
	
	
	/**
	 * 复制调查表
	 * @param formId
	 * @return
	 */
	@RequestMapping(value = "/investigation/json/copy", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean copy(
			@RequestParam(value = "formId") BigDecimal formId,
			@RequestParam(value = "id") BigDecimal id,
			@RequestParam(value ="name")String name) {
		ResultBean resultBean = new ResultBean();
		try {
			InvestigationInfoMainBean record = investigationInfoMainService
					.selectById(id);
			FormTemplateBean record2 = formTemplateService.selectById(formId);
			
			BigDecimal newFormId = seq.getNextSeqIdToBigDecimal();
			//实例一条formTemplate数据
			FormTemplateBean formTemplateBean = new FormTemplateBean();
			MyBeanUtils.copyProperties(record2,formTemplateBean);
			formTemplateBean.setId(newFormId);
			formTemplateBean.setFormName(name);
			formTemplateService.insert(formTemplateBean);
			
			//实例一条调查数据
			InvestigationInfoMainBean investigationInfoMainBean = 
					new InvestigationInfoMainBean();
			investigationInfoMainBean.setId(seq.getNextSeqIdToBigDecimal());
			investigationInfoMainBean.setFormId(newFormId);
			investigationInfoMainBean.setStatus((short)0);
			investigationInfoMainBean.setInvestigationName(name);
			investigationInfoMainBean.setCreateTime(new Timestamp(new Date().getTime()));
			MyBeanUtils.copyProperties(investigationInfoMainBean,record);
			investigationInfoMainService.insert(record);
			
			//调用存过复制数据
			Map<String,String> map = investigationInfoMainService.copy(formId,newFormId);
			resultBean.setJsonValue(JSONObject.parseObject(
					"{\"code\":\"" + map.get("p_result") + "\",\"msg\":\"" + map.get("p_resultdesc") + "\"}"));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}
		return resultBean;
	}
	
	
	/**
	 * 时间排序
	 */
	private String[] getMaxAndMinTime(long[] a){
		String[] result = new String[2];
		long temp= (long)0;  
	    for(int i=0;i<a.length;i++){  
	       for(int j=i+1;j<a.length;j++){  
		       if(a[i]>a[j]){  
		           temp=a[i];
		           a[i]=a[j];
		           a[j]=temp;
		       }
	       }
	    } 
	    try{
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	result[0] = sdf.format(a[0]);
	    	result[1] = sdf.format(a[a.length-1]) ;
	    }catch(Exception e){
	    	logger.error(e.getMessage(), e);
	    }
		return result;
	}
}
