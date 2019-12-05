package com.chinatelecom.jx.zone.management.controller.investigationInfo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.browseLog.IBrowseLogMainService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputProinstService;
import com.chinatelecom.jx.zone.management.service.formInput.IFormInputService;
import com.chinatelecom.jx.zone.management.service.formTemplate.IFormTemplateService;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoExampleService;
import com.chinatelecom.jx.zone.management.service.investigationInfo.IInvestigationInfoMainService;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;
import com.chinatelecom.jx.zone.util.StatusUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
// @RequestMapping(value = "/investigationinfomain")
public class InvestigationInfoMainController extends BaseController {
	@Autowired
	private IInvestigationInfoMainService investigationInfoMainService;
	@Autowired
	private IFormTemplateService formTemplateService;
	@Autowired
	private IFormInputService formInputService;
	@Autowired
	private IInvestigationInfoExampleService investigationInfoExampleService;
	@Autowired
	private IFormInputProinstService formInputProinstService;
	@Autowired
	private IBrowseLogMainService browseLogMainService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private ISystemInfoBeanProxy systemInfoBeanProxy;
	private static final Logger logger = LoggerFactory
			.getLogger(InvestigationInfoMainController.class);

	/**
	 * 首页列表，展示所有可参与的调查列表
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/mainList")
	public String mainList(
			@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			Model model) {
		try {
			investigationInfoMain.setOrderByClause("create_time desc");
			investigationInfoMain.setStatusArray(new String[] { "-1", "1" });
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = investigationInfoMainService
					.queryAllList(investigationInfoMain);
			setPageInfo(page, model, "investigationInfoMain/mainList");
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "investigationInfoMain/mainList";
	}

	/**
	 * 我的列表，展示所有我发起的调查列表
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/myList")
	public String myList(
			@ModelAttribute("investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			@ModelAttribute("page") Page<InvestigationInfoMainBean> page,
			Model model) {
		try {
			investigationInfoMain.setAccountId(getCurrentAccountId());
			investigationInfoMain.setOrderByClause("create_time desc");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<InvestigationInfoMainBean>) investigationInfoMainService
					.queryByCond(investigationInfoMain);
			setPageInfo(page, model, "investigationInfoMain/myList");

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "investigationInfoMain/myList";
	}

	/**
	 * 新增调查
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/add")
	public String create(Model model) {
		try {
			InvestigationInfoMainBean investigationInfoMain = new InvestigationInfoMainBean();
			model.addAttribute("investigationInfoMain", investigationInfoMain);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "investigationInfoMain/edit";
	}

	/**
	 * 编辑调查
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/edit/{id}")
	public String create(@PathVariable(value = "id") BigDecimal id,
			Model model, ServletRequest request) {
		try {
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService
					.selectById(id);
			model.addAttribute("investigationInfoMain", investigationInfoMain);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "investigationInfoMain/edit";
	}

	/**
	 * 保存或编辑调查基础选项
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/save")
	public String save(
			@ModelAttribute(value = "investigationInfoMain") InvestigationInfoMainBean investigationInfoMain,
			RedirectAttributes redirectAttributes, Model model,
			ServletRequest request) {
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
				investigationInfoMain.setEndTime(sdf.parse(investigationInfoMain.getEnd()));
				int i = investigationInfoMainService.saveInvestigationInfo(investigationInfoMain);
				redirectAttributes.addFlashAttribute("message", i==1?"创建成功！":"创建失败！");
			} else {
				InvestigationInfoMainBean info = investigationInfoMainService
						.selectById(investigationInfoMain.getId());
				investigationInfoMain.setEndTime(sdf
						.parse(investigationInfoMain.getEnd()));
				MyBeanUtils.copyProperties(investigationInfoMain, info);
				int i = investigationInfoMainService.updateById(info);
				redirectAttributes.addFlashAttribute("message", i==1?"保存成功！":"保存失败！");
			}
			
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "创建失败！");
			logger.error("在线调查保存失败，详细原因："+e.getMessage(), e);
		}

		return "redirect:/investigationInfoMain/myList";

	}

	/**
	 * 发布调查异步保存
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/json/save", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonSave(@RequestParam(value = "id") BigDecimal id) {
		ResultBean resultBean = new ResultBean();
		int rst = 0;
		try {
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService
					.selectById(id);
			if (investigationInfoMain.getStatus() == 1) {
				resultBean.setCode(1);
				resultBean.setMsg("该调查已发布，请勿反复操作！");
				return resultBean;
			}
			investigationInfoMain.setStatus((short) 1);
			investigationInfoMain.setPublishTime(new Timestamp(new Date()
					.getTime()));
			rst = investigationInfoMainService
					.updateById(investigationInfoMain);

			if (rst == 1) {
				resultBean.setCode(1);
				resultBean.setMsg("发布成功");
			} else {
				resultBean.setCode(0);
				resultBean.setMsg("数据更新异常");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			resultBean.setCode(-1);
			resultBean.setMsg("系统异常");
		}

		return resultBean;
	}

	/**
	 * 查看详细
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/detail/{id}")
	public String detail(@PathVariable(value = "id") BigDecimal id,
			HttpServletRequest request, Model model) {
		BigDecimal exampleId = null;
		try {
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService
					.selectById(id);
			InvestigationInfoExampleBean investigationInfoExampleBean = new InvestigationInfoExampleBean();
			investigationInfoExampleBean.setInvestigationId(id);
			investigationInfoExampleBean.setAccountId(getCurrentAccountId());
			// 根据主表id，用户id判断该用户是否在实例表有对应的数据
			List<InvestigationInfoExampleBean> list = investigationInfoExampleService
					.queryByCond(investigationInfoExampleBean);
			if (list.size() == 0) {
				// 实例表插入一条数据
				Object[] obj = investigationInfoExampleService.insertExample(
						id, investigationInfoMain.getFormId(), getCurrentAccountId(),
						getCurrentAccountName(), seq, getIpAddr(request),new Date());
				exampleId = new BigDecimal(obj[2].toString());
			}

			// 插入一条浏览记录
			browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(), id,
					getCurrentAccountId(), "t_investigation_info_main");

			// BrowseLogMainBean logBean = new BrowseLogMainBean();
			// logBean.setRelatedId(id);
			// List<BrowseLogMainBean> logList =
			// browseLogMainService.queryByCond(logBean);
			// if(logList != null && logList.size() > 0){
			// logBean = logList.get(0);
			// if(StringUtil.checkNotNull(logBean.getLogCount())){
			// logBean.setLogCount(logBean.getLogCount().add(new
			// BigDecimal("1")));
			// }else{
			// logBean.setLogCount(new BigDecimal("1"));
			// }
			// browseLogMainService.updateById(logBean);
			// }else{
			// browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(),id,accountId,"t_investigation_info_main");
			// }

			// 获取录入项初始化实例
			FormInputProinstBean formInputProinstBean = new FormInputProinstBean();
			formInputProinstBean.setFormId(investigationInfoMain.getFormId());
			if (list.size() == 0) {
				formInputProinstBean.setRelationId(exampleId);
			} else {
				formInputProinstBean.setRelationId(list.get(0).getId());
			}
			formInputProinstBean.setAccountId(getCurrentAccountId());
			List<FormInputProinstBean> list2 = formInputProinstService
					.queryByCond(formInputProinstBean);
			List<FormInputProinstBean> list3 = new ArrayList<>();
			for (FormInputProinstBean info : list2) {
				if (StringUtil.checkNotNull(info.getOptions())) {
					info.setOptions(info.getOptions().replaceAll("_:", ","));
				}
				if (StringUtil.checkNotNull(info.getInputParams())) {
					info.setInputParams(info.getInputParams().replaceAll("_:",
							","));
				}
				list3.add(info);
			}
			model.addAttribute("list", list3);
			model.addAttribute("investigationInfoMain", investigationInfoMain);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return "investigationInfoMain/attend";
	}

	@RequestMapping(value = "/investigationInfoMain/createInfo")
	public String createInfo(@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request, Model model) {
		final BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
	
		List<AccountInfoBean> accountInfoList = accountInfoBeanProxy.selectAllGradeListByOrganizationIdAndRootIdAndSystemIdAndStatusArrayAndSearchKey
				(null, null, systemId, StatusUtils.open, null);	
		int index = (int) (Math.random() * accountInfoList.size());
		AccountInfoBean indexRandom = accountInfoList.get(index);
		AccountInfoBean indexFirst = accountInfoList.get(0);
		AccountInfoBean info = indexFirst;

		accountInfoList.set(0, indexRandom);
		accountInfoList.set(index, info);

		// 判断当前用户是否参与过
		InvestigationInfoExampleBean investigationInfoExampleBean = new InvestigationInfoExampleBean();
		investigationInfoExampleBean.setInvestigationId(id);
		investigationInfoExampleBean.setAccountId(indexRandom.getAccountId());
		List<InvestigationInfoExampleBean> list = investigationInfoExampleService
				.queryByCond(investigationInfoExampleBean);
		
		InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService
				.selectById(id);
		
		if (list.size() == 0) {
			// 实例表插入一条数据
			investigationInfoExampleService.insertExample(
					id,investigationInfoMain.getFormId(),indexRandom.getAccountId(), 
					indexRandom.getAccountName(),seq, getIpAddr(request),new Date());
		}


		FormInputProinstBean proinst = new FormInputProinstBean();
		proinst.setFormId(investigationInfoMain.getFormId());
		proinst.setOrderByClause("sort_grade asc");
		proinst.setAccountId(indexRandom.getAccountId());
		List<FormInputProinstBean> lstProinst = formInputProinstService
				.queryByCond(proinst);
		// 传到前台
		model.addAttribute("infoBean", investigationInfoMain);
		model.addAttribute("lstProinst", lstProinst);
		model.addAttribute("accountInfoList", accountInfoList);
		// 插入一条浏览记录
		browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(),id,getCurrentAccountId(),"t_investigation_info_main");

		return "investigationInfoMain/infoForm";
	}

	@RequestMapping(value = "/investigationInfoMain/saveInfo")
	public String saveInfo(@RequestParam(value = "formId") BigDecimal formId,
			@RequestParam(value = "id") BigDecimal id,
			@RequestParam(value = "accountId") BigDecimal accountId2,
			@RequestParam(value = "accountName") String accountName2,
			@RequestParam(value = "createTime") String createTime,
			HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// 判断当前用户是否参与过
		InvestigationInfoExampleBean investigationInfoExampleBean = new InvestigationInfoExampleBean();
		investigationInfoExampleBean.setInvestigationId(id);
		investigationInfoExampleBean.setAccountId(accountId2);
		List<InvestigationInfoExampleBean> list = investigationInfoExampleService
				.queryByCond(investigationInfoExampleBean);
		if (list.size() == 0) {
			try {
				// 实例表插入一条数据
				if(StringUtil.checkNotNull(createTime)){
					investigationInfoExampleService.insertExample(
							id,formId, accountId2,accountName2, seq, getIpAddr(request),sdf.parse(createTime));
				}else{
					investigationInfoExampleService.insertExample(
							id,formId, accountId2,accountName2, seq, getIpAddr(request),new Date());
				}
				// 插入一条浏览记录
				browseLogMainService.insertLog(seq.getNextSeqIdToBigDecimal(),id,accountId2,"t_investigation_info_main");

			} catch (ParseException e) {
				logger.error(e.getLocalizedMessage(), e);
			}
		}
		
		int i = formInputProinstService.saveInfo(request, formId ,accountId2);
		if (i > 0) {
			redirectAttributes.addFlashAttribute("message", "保存成功！");
		} else {
			redirectAttributes.addFlashAttribute("message", "保存失败！");
		}
		return "redirect:/investigationInfoMain/mainList";
	}

	/**
	 * 导出Excel
	 */
	@RequestMapping(value = "/investigationInfoMain/downloadInfoByExcel")
	public String downloadInfoByExcel(
			@RequestParam(value = "id") BigDecimal id,
			HttpServletRequest request, ModelMap modelMap,
			RedirectAttributes redirectAttributes) {
		boolean success = false;
		int errorCode = -1;
		String errorMsg = null;
		try {
			InvestigationInfoMainBean investigationInfoMain = investigationInfoMainService
					.selectById(id);
			modelMap.addAttribute("info", investigationInfoMain);
			// 获取要导出的数据
			// ..............
			List<FormInputProinstBean> inputProinstList = new ArrayList<FormInputProinstBean>();
			FormInputProinstBean b = new FormInputProinstBean();
			b.setAccountId(new BigDecimal("1"));
			b.setSortGrade("1");
			b.setInputTitle("周日去想去钓鱼岛钓鱼吗？");
			b.setInputType("radio");
			b.setOptions("想去_:不想去_:请个军舰载我去_:其他_:");
			b.setInputValue("请个军舰载我去");
			b.setCreateTime(new Date());
			FormInputProinstBean b2 = new FormInputProinstBean();
			b2.setAccountId(new BigDecimal("1"));
			b2.setSortGrade("2");
			b2.setInputType("radio");
			b2.setInputTitle("按你的体重，你属于?");
			b2.setInputValue("胖子");
			b2.setOptions("小胖墩_:大胖_:胖墩_:其他_:");
			b2.setCreateTime(new Date());
			FormInputProinstBean b3 = new FormInputProinstBean();
			b3.setAccountId(new BigDecimal("1"));
			b3.setSortGrade("3");
			b3.setInputType("radio");
			b3.setInputTitle("你的理想是什么?");
			b3.setInputValue("胖子");
			b3.setOptions("吃饭_:不吃饭_:吃菜_:其他_:");
			b3.setCreateTime(new Date());

			List<FormInputProinstBean> textInputList = new ArrayList<FormInputProinstBean>();
			FormInputProinstBean b4 = new FormInputProinstBean();
			b4.setAccountId(new BigDecimal("1"));
			b4.setSortGrade("4");
			b4.setInputTitle("请起草一个收购腾讯的计划？");
			b4.setInputType("text");
			b4.setInputValue("先定个小目标：今年先赚10个亿美元。");
			b4.setFiledName("tx");
			b4.setCreateTime(new Date());
			FormInputProinstBean b6 = new FormInputProinstBean();
			b6.setAccountId(new BigDecimal("2"));
			b6.setSortGrade("4");
			b6.setInputTitle("请起草一个收购腾讯的计划？");
			b6.setInputType("text");
			b6.setInputValue("抢....购...家里有钱。");
			b6.setFiledName("tx");
			b6.setCreateTime(new Date());

			FormInputProinstBean b5 = new FormInputProinstBean();
			b5.setAccountId(new BigDecimal("1"));
			b5.setSortGrade("5");
			b5.setInputType("text");
			b5.setInputTitle("如何变成马化云？");
			b5.setInputValue("1、先买匹马 2、买个火箭 3、用火箭把马发射到空中");
			b5.setCreateTime(new Date());
			b5.setFiledName("mhy");
			FormInputProinstBean b7 = new FormInputProinstBean();
			b7.setAccountId(new BigDecimal("2"));
			b7.setSortGrade("5");
			b7.setInputType("text");
			b7.setInputTitle("如何变成马化云？");
			b7.setInputValue("买匹马，烤了吃。");
			b7.setCreateTime(new Date());
			b7.setFiledName("mhy");

			List<FormInputBean> inputList = new ArrayList<FormInputBean>();
			FormInputBean input1 = new FormInputBean();
			input1.setFiledName("tx");
			input1.setInputTitle("请起草一个收购腾讯的计划？");
			input1.setSortGrade("4");
			input1.setInputType("text");

			FormInputBean input2 = new FormInputBean();
			input2.setFiledName("mhy");
			input2.setInputTitle("如何变成马化云？");
			input2.setSortGrade("5");
			input2.setInputType("text");

			inputList.add(input1);
			inputList.add(input2);

			inputProinstList.add(b);
			inputProinstList.add(b2);
			inputProinstList.add(b3);

			textInputList.add(b4);
			textInputList.add(b5);
			textInputList.add(b6);
			textInputList.add(b7);

			modelMap.addAttribute("inputProinstList", inputProinstList);
			modelMap.addAttribute("textInputList", textInputList);
			modelMap.addAttribute("inputList", inputList);
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
		return "investigationInfoMainLoadExcelView";
	}

	/**
	 * 删除操作
	 * 
	 */
	@RequestMapping(value = "/investigationInfoMain/delete/{id}")
	public String delete(
			// @RequestParam(value = "items") String[] items,
			@PathVariable(value = "id") BigDecimal id,
			RedirectAttributes redirectAttributes, ServletRequest request,
			Model model) {
		// int i = investigationInfoMainService.batchDelete(items);
		int i = investigationInfoMainService.deleteById(id);
		if (i > 0) {
			redirectAttributes.addFlashAttribute("message", "删除成功！");
		} else {
			redirectAttributes.addFlashAttribute("message", "删除失败！");
		}
		return "redirect:/investigationInfoMain/myList";
	}

	/**
	 * 数据统计
	 * 
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoMain/count/{id}")
	public String count(@PathVariable(value = "id") BigDecimal id, Model model) {
		try {
			// 主表信息
			InvestigationInfoMainBean investigationInfoMainBean = investigationInfoMainService
					.selectById(id);
			// 填写列表
			InvestigationInfoExampleBean investigationInfoExampleBean = new InvestigationInfoExampleBean();
			investigationInfoExampleBean.setInvestigationId(id);
			List<InvestigationInfoExampleBean> list1 = investigationInfoExampleService
					.queryByCond(investigationInfoExampleBean);

			// 浏览列表
			BrowseLogMainBean browseLogMainBean = new BrowseLogMainBean();
			browseLogMainBean.setRelatedId(id);
			List<BrowseLogMainBean> list2 = browseLogMainService
					.queryByCond(browseLogMainBean);

			// 调查项目
			FormInputBean formInputBean = new FormInputBean();
			formInputBean.setFormId(investigationInfoMainBean.getFormId());
			formInputBean.setOrderByClause("SORT_GRADE ASC");
			List<FormInputBean> formInputBeansList = formInputService
					.queryByCond(formInputBean);

			List<FormInputBean> list3 = new ArrayList<>();
			NumberFormat format = NumberFormat.getPercentInstance();// 获取格式化类实例

			for (FormInputBean info : formInputBeansList) {

				// 获取该字段所有数据量
				FormInputProinstBean formInputProinstBean1 = new FormInputProinstBean();
				formInputProinstBean1.setFiledName(info.getFiledName());
				List<FormInputProinstBean> inputProinstList1 = formInputProinstService
						.queryByCond(formInputProinstBean1);

				if (StringUtil.checkNotNull(info.getOptions())) {
					String[] option = info.getOptions().split("_:");
					String quantity = "";
					String percentage = "";
					// 查找勾选框每个选项的数据量
					for (int i = 0; i < option.length; i++) {
						if (!"其他".equals(option[i])) {
							FormInputProinstBean formInputProinstBean2 = new FormInputProinstBean();
							formInputProinstBean2.setInputValue(option[i]);
							formInputProinstBean2.setFiledName(info
									.getFiledName());
							List<FormInputProinstBean> inputProinstList2 = formInputProinstService
									.queryByCond(formInputProinstBean2);

							if (i < (option.length - 1)) {
								quantity += (inputProinstList2.size() + ",");
								percentage += (format
										.format((float) inputProinstList2
												.size()
												/ inputProinstList1.size()) + ",");
							} else {
								quantity += inputProinstList2.size();
								percentage += format
										.format((float) inputProinstList2
												.size()
												/ inputProinstList1.size());
							}
						} else {
							String[] quantitys = quantity.split(",");
							Integer count = 0;
							for (int j = 0; j < quantitys.length; j++) {
								count += Integer.valueOf(quantitys[j]);
							}
							if (i < (option.length - 1)) {
								quantity += ((inputProinstList1.size() - count) + ",");
								percentage += (format
										.format((float) (inputProinstList1
												.size() - count)
												/ inputProinstList1.size()) + ",");
							} else {
								quantity += (inputProinstList1.size() - count);
								percentage += format
										.format((float) (inputProinstList1
												.size() - count)
												/ inputProinstList1.size());
							}
						}
					}
					info.setQuantity(quantity);
					info.setPercentage(percentage);
					info.setOptions(info.getOptions().replaceAll("_:", ","));
					String[] str1 = info.getOptions().split(",");
					String[] str2 = info.getQuantity().split(",");
					String[] str3 = info.getPercentage().split(",");
					String[][] str4 = new String[str1.length][];
					for (int i = 0; i < str1.length; i++) {
						String[] str = new String[] { str1[i], str2[i], str3[i] };
						str4[i] = str;
					}
					info.setCount(str4);
				}
				list3.add(info);
			}

			format.setMinimumFractionDigits(2);// 设置小数位
			model.addAttribute("investigationInfoMainBean",
					investigationInfoMainBean);
			model.addAttribute("fill", list1.size());
			model.addAttribute("browse", list2.size());
			if (list2.size() == 0) {
				model.addAttribute("fillrate", 0);
			} else {
				model.addAttribute("fillrate",
						format.format((float) list1.size() / list2.size()));
			}
			model.addAttribute("formInputBeansList", list3);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return "investigationInfoMain/count";
	}

	/**
	 * 异步加载调查输入文本内容
	 * 
	 * @return
	 */
	@RequestMapping(value = "/investigationInfoMain/json/getContent", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getContent(
			@RequestParam(value = "filedName") String filedName,
			@RequestParam(value = "formId") BigDecimal formId) {
		ResultBean resultBean = new ResultBean();
		try {
			FormInputProinstBean formInputProinstBean = new FormInputProinstBean();
			formInputProinstBean.setFiledName(filedName);
			formInputProinstBean.setFormId(formId);
			List<FormInputProinstBean> inputProinstList = formInputProinstService
					.queryByFiledNameAndFormId(formInputProinstBean);
			resultBean.setValue(inputProinstList);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return resultBean;
	}

}