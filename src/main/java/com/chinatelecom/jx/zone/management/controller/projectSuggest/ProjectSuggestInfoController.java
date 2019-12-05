package com.chinatelecom.jx.zone.management.controller.projectSuggest;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.service.IAccountBindBeanService;
import com.chinatelecom.jx.zone.account.image.bean.AccountImageBean;
import com.chinatelecom.jx.zone.account.image.service.IAccountImageBeanService;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.attachment.client.bean.AttachmentClientBean;
import com.chinatelecom.jx.zone.attachment.client.bean.InvokeAttachmentsRst;
import com.chinatelecom.jx.zone.attachment.client.helper.AttachmentClientHelper;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectSuggest.ProjectSuggestInfoBean;
import com.chinatelecom.jx.zone.management.service.projectSuggest.IProjectSuggestInfoService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.util.StringUtils;
import com.chinatelecom.jx.zone.management.util.ZipDownloadUtil;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;

@Controller
public class ProjectSuggestInfoController extends BaseController {
	@Autowired
	private IProjectSuggestInfoService projectSuggestInfoService;
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IAccountImageBeanService accountImageBeanService;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;
	@Autowired
	private AttachmentClientHelper attachmentClientHelper;

	@Autowired(required = true)@Qualifier("primaryKeySeq")  
	private SeqIdType primaryKeySeq;
	
	@Value("${rh.java.io.tmpdir}")
	private String tmpdir;

	private static final Logger logger = LoggerFactory.getLogger(ProjectSuggestInfoController.class);

	/**
	 * 运维平台：意见反馈列表
	 * 
	 * @param projectSuggestInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/list")
	public String list(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {
			if (StringUtil.checkNotNull(searchText)) {
				projectSuggestInfoBean.setSuggestTitle(searchText);
			}
			projectSuggestInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectSuggestInfoBean>) projectSuggestInfoService.queryByCondWithForeign(projectSuggestInfoBean);
			setPageInfo(page, model, "projectSuggestInfo/list");
			model.addAttribute("currentAccount",getCurrentAccountId());
			model.addAttribute("searchText", searchText); //用于建议主题搜索
			model.addAttribute("projectSuggestInfoBean",projectSuggestInfoBean);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "projectSuggestInfo/list";
	}


	/**
	 * 运维平台：我的未审核列表
	 * 
	 * @param projectSuggestInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/myNoList")
	public String myNoList(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {
			if (StringUtil.checkNotNull(searchText)) {
				projectSuggestInfoBean.setSuggestTitle(searchText);
			}
			projectSuggestInfoBean.setStatus((short) 2);  //审核中
			projectSuggestInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectSuggestInfoBean>) projectSuggestInfoService.queryByCond(projectSuggestInfoBean);
			setPageInfo(page, model, "projectSuggestInfo/myNoList");
			model.addAttribute("currentAccount",getCurrentAccountId());
			model.addAttribute("searchText", searchText); //用于建议主题搜索
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "projectSuggestInfo/myNoList";
	}


	/**
	 * 运维平台：我的审核列表
	 * 
	 * @param projectSuggestInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/myYesList")
	public String myYesList(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {
			if (StringUtil.checkNotNull(searchText)) {
				projectSuggestInfoBean.setSuggestTitle(searchText);
			}
			projectSuggestInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectSuggestInfoBean>) projectSuggestInfoService.queryByCondNoStatus(projectSuggestInfoBean);
			setPageInfo(page, model, "projectSuggestInfo/myYesList");
			model.addAttribute("currentAccount",getCurrentAccountId());
			model.addAttribute("searchText", searchText); //用于建议主题搜索
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "projectSuggestInfo/myYesList";
	}



	/**
	 * 平台端：意见反馈列表
	 * 
	 * @param projectSuggestInfo
	 * @param page
	 * @param model
	 * @param request
	 * @return
	 *//*
	@RequestMapping(value = "/front/projectSuggest/main")
	public String pingtailist(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {
			if (StringUtil.checkNotNull(searchText)) {
				projectSuggestInfoBean.setSuggestTitle(searchText);
			}
			projectSuggestInfoBean.setStatus((short) 1);
			projectSuggestInfoBean.setOrderByClause("CREATE_TIME DESC");
			page.setPageSize(10);
			PageHelper.startPage(page.getPageNum(), page.getPageSize());
			page = (Page<ProjectSuggestInfoBean>) projectSuggestInfoService.queryByCond(projectSuggestInfoBean);
			setPageInfo(page, model, "projectSuggestInfo/list");
			model.addAttribute("currentAccount",getCurrentAccountId());
			model.addAttribute("searchText", searchText);//用于建议主题搜索
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "front/projectSuggest/main";
	}*/

	/**
	 * 平台端：意见反馈首页
	 * 
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggest/main")
	public String xinzeng(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,			
			Model model) {
		ProjectSuggestInfoBean projectSuggestInfoBean = new ProjectSuggestInfoBean();
		model.addAttribute("projectSuggestInfoBean", projectSuggestInfoBean);
		model.addAttribute("pageNo", pageNo);
		return "front/projectSuggest/suggest";
	}


	/**
	 * 编辑
	 * 
	 * @param suggestId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/edit/{id}")
	public String create(@RequestParam(value = "suggestId") BigDecimal suggestId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, ServletRequest request) {
		ProjectSuggestInfoBean projectSuggestInfo = projectSuggestInfoService.selectById(suggestId);
		model.addAttribute("projectSuggestInfo", projectSuggestInfo);
		model.addAttribute("pageNo", pageNo);
		return "projectSuggestInfo/edit";
	}


	/**
	 * 运维页面：回复 内容
	 * 
	 * @param suggestId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/suggestReply")
	public String suggestReply(@RequestParam(value = "suggestId") BigDecimal suggestId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		ProjectSuggestInfoBean projectSuggestInfoBean = projectSuggestInfoService.selectById(suggestId);
		model.addAttribute("projectSuggestInfoBean", projectSuggestInfoBean);
		model.addAttribute("pageNo", pageNo);
		return "projectSuggestInfo/suggestReply";
	}


	/**
	 * 运维页面：保存  回复内容
	 * 
	 * @param suggestId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/saveReply")
	public String saveReply(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, RedirectAttributes redirectAttributes,
			Model model, HttpServletRequest request) {	
		try {
			projectSuggestInfoBean.setAuditTime(new Timestamp(new Date().getTime())); // 审核时间
			projectSuggestInfoBean.setManagerId(this.getCurrentAccountId());  //审核人ID
			projectSuggestInfoBean.setManaagerName(this.getCurrentAccountName()); //审核人名称
			projectSuggestInfoService.updateById(projectSuggestInfoBean);
			String str = "发布成功！";
			redirectAttributes.addFlashAttribute("message", str);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "redirect:/projectSuggestInfo/list";
	}



	/**
	 * 平台端：保存操作
	 * 
	 * @param projectSuggestInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/save")
	public String save(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, RedirectAttributes redirectAttributes,
			Model model, HttpServletRequest request) {
		String requestIp = ServletHelper.getIpAddress(request);
		java.util.Date createTime = new java.util.Date(System.currentTimeMillis());
		BigDecimal accountId = BigDecimal.valueOf(-1); //默认为游客
		String accountName = "游客";
		String accountImage = "";//游客默认图片地址为：空

		boolean login = accountIdSessionHelper.isAccountAlreadyLogin(); //已经登陆的用户
		if (login) {
			accountId = accountIdSessionHelper.getAccountIdBySessionAttribute(request);	
			accountName = accountInfoBeanProxy.selectByPrimaryKey(accountId).getAccountName();			
			AccountImageBean accountImageBean = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId, (short) 10);
			if (accountImageBean != null) {
				accountImage = accountImageBean.getImageUrl();
			}
			String accountTel = projectSuggestInfoBean.getAccountTel(); //联系方式
			if (StringUtils.isEmpty(accountTel)) {
				List<AccountBindBean> list1 = accountBindBeanService.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, BigDecimal.valueOf(-1), null);
				if (!list1.isEmpty()) {
					accountTel = list1.get(0).getOpenId();
					projectSuggestInfoBean.setAccountTel(accountTel);
				}
			}
		}
		projectSuggestInfoBean.setAccountId(accountId);
		projectSuggestInfoBean.setAccountName(accountName);
		projectSuggestInfoBean.setAccountImage(accountImage);

		if (projectSuggestInfoBean.getSuggestId() == null) {
			projectSuggestInfoBean.setSuggestId(primaryKeySeq.getNextSeqIdToBigDecimal());
			projectSuggestInfoBean.setAccountIp(requestIp);//用户IP
			projectSuggestInfoBean.setCreateTime(createTime);
			projectSuggestInfoService.insert(projectSuggestInfoBean);
			String str = "创建成功！";
			redirectAttributes.addFlashAttribute("message", str);
		} else {// 编辑 ----回复内容，进行发送
			/*projectSuggestInfo.setCreateTime(new Timestamp(new Date().getTime()));*/// 创建时间
			projectSuggestInfoBean.setAuditTime(new Timestamp(new Date().getTime()));// 审核时间
			projectSuggestInfoService.updateById(projectSuggestInfoBean);
			String str = "保存成功！";
			redirectAttributes.addFlashAttribute("message", str);
		}
		//model.addAttribute("pageNo", pageNo);
		redirectAttributes.addFlashAttribute("pageNo", pageNo);
		return "redirect:/front/projectSuggest/main";

	}



	/**
	 * 附件批量下载
	 * @param projectSuggestInfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/batchDownload")
	public String batchDownload(
			@RequestParam(value="ids") String ids,
			RedirectAttributes redirectAttributes,Model model,
			HttpServletResponse response,ServletRequest request) {
		try {
			String[] idsStr = ids.split(",");
			ProjectSuggestInfoBean infoBean = new ProjectSuggestInfoBean();
			String atIdList = "";
			String[] suggestTitleStr = new String[idsStr.length];
			Map<String,String> idCompNameMap = new HashMap<String,String>();
			for(int i = 0;i<idsStr.length;i++){
				int nextI = i+1;
				if(StringUtil.checkNotNull(idsStr) && !(i>idsStr.length)  &&  StringUtil.checkNotNull(idsStr[i])){
					infoBean = projectSuggestInfoService.selectById(new BigDecimal(idsStr[i]));
					atIdList += infoBean.getAttachmentId();
					suggestTitleStr[i] = infoBean.getSuggestTitle();
					String[] atIdStr = infoBean.getAttachmentId().split(",");
					for(int j=0;j<atIdStr.length;j++){
						idCompNameMap.put(atIdStr[j], infoBean.getSuggestTitle()+nextI+j);
					}
				}
			}
			InvokeAttachmentsRst rst=attachmentClientHelper.selectListByAttachmentIdList(atIdList);
			if(rst!=null){
				List<AttachmentClientBean>  attList=rst.getAttachments() ;
				//创建数量等于列表中附件数量的File数组
				File[] file = new File[attList.size()];
				//创建存放附件名称的map，用于重命名附件
				Map<String,String> fileNameMap = new HashMap<String,String>();

				for(int i=0;i<attList.size();i++){
					AttachmentClientBean bean=attList.get(i) ;
					if(bean.getAttachmentUrl()!=""&& bean.getAttachmentUrl()!=null){
						URL url=new URL(bean.getAttachmentUrl());
						//将附件传入File数组中，采用的是附件的本地路径
						File f = new File(tmpdir + File.separator+ bean.getRemoteName());  
						FileUtils.copyURLToFile(url, f);
						file[i]=f;
						String name = file[i].getName();
						String[] fileName = name.split("\\.");

						//将修改的命名传入附件名称的map
						fileNameMap.put(file[i].getName(),idCompNameMap.get(bean.getAttachmentId())+"."+fileName[fileName.length-1]);
					}
				}
				//打印文件是否存在
				for(int i=0;i<attList.size();i++){
					logger.info("-----file["+i+"]为-------"+file[i].exists());
				}
				//创建zip文件名及路径
				String time = new SimpleDateFormat("yyyyMMddHHmmssSSS") .format(new Date());
				String strZipName =  "批量下载"+time+".zip";
				File strZipPath = new File(tmpdir,strZipName);
				//生成zip文件
				ZipDownloadUtil util=new ZipDownloadUtil() ;
				util.zipUpload(file,strZipPath,fileNameMap);
				logger.info("生成打包Zip文件成功，" + strZipPath);
				//下载
				util.zipDownload(strZipName,strZipPath,response);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return null;
	}


	/**
	 * 运维页面：回复
	 * 
	 * @param projectSuggestInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/reply")
	public String reply(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfo,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, RedirectAttributes redirectAttributes,
			Model model, HttpServletRequest request) {

		projectSuggestInfo.setAuditTime(new Timestamp(new Date().getTime()));// 审核时间
		projectSuggestInfoService.updateById(projectSuggestInfo);
		String str = "回复成功！";
		redirectAttributes.addFlashAttribute("message", str);

		model.addAttribute("pageNo", pageNo);
		return "redirect:/projectSuggest/main";

	}


	/**
	 * 运维页面：查看详细
	 * 
	 * @param suggestId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/suggestView")
	public String suggestView(@RequestParam(value = "suggestId") BigDecimal suggestId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, 
			Model model, ServletRequest request) {
		ProjectSuggestInfoBean projectSuggestInfoBean = projectSuggestInfoService.selectById(suggestId);
		model.addAttribute("projectSuggestInfo", projectSuggestInfoBean);
		model.addAttribute("pageNo", pageNo);
		return "projectSuggestInfo/suggestView";
	}


	/**
	 * 删除操作
	 * 
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/delete")
	public String delete(
			@RequestParam(value = "id") String id,
			RedirectAttributes redirectAttributes, 
			Model model) {
		try {	
			String[] ids = id.split(",");

			int i = projectSuggestInfoService.batchDelete(ids);

			if (i > 0 ) {
				redirectAttributes.addFlashAttribute("message", "删除成功！");
			}else {
				redirectAttributes.addFlashAttribute("message", "删除失败！");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "redirect:/projectSuggestInfo/list";
	}



	/**
	 * 一键不通过
	 * 
	 * @param items
	 * @param redirectAttributes
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/butongguo")
	public String butongguo(
			@RequestParam(value = "id") String id,
			RedirectAttributes redirectAttributes, 
			Model model) {
		try {	
			String[] ids = id.split(",");
			for (int j = 0; j < ids.length; j++) {
				ProjectSuggestInfoBean record =	projectSuggestInfoService.selectById(new BigDecimal(ids[j].toString()));	
				record.setStatus((short) 0);
				projectSuggestInfoService.updateById(record);
			}	
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "redirect:/projectSuggestInfo/myNoList";
	}


	/**
	 * 导出Excel
	 * @param projectSuggestInfo
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/downloadInfoByExcel")
	public String downloadInfoByExcel(
			@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfo,
			HttpServletRequest request, ModelMap modelMap) {
		try {
			/*projectSuggestInfo.setAccountId(getCurrentAccountId());*/ //导出当前用户的数据
			List<ProjectSuggestInfoBean> projectSuggestList = projectSuggestInfoService.queryByCondWithForeign(projectSuggestInfo);
			modelMap.addAttribute("projectSuggestList", projectSuggestList);
			return "ProjectSuggestInfoLoadExcelView";
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return "";
	}



	/*
	 * ==================================================json数据================= ===========================================
	 *
	 */



	/**
	 * json查看
	 * 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/json/view/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProjectSuggestInfoBean jsonSave(@RequestParam(value = "suggestId") BigDecimal suggestId,
			HttpServletRequest request) {
		ProjectSuggestInfoBean projectSuggestInfo = projectSuggestInfoService.selectById(suggestId);
		return projectSuggestInfo;
	}

	/**
	 * -----------------------------------------------------------------------------
	 *                               异步方法
	 * -----------------------------------------------------------------------------
	 */


	/**
	 *  首页数据   异步加载意见反馈列表
	 *   
	 *  code代码 1：有下一页数据 0：无下一页数据 2：无数据 -1：程序抛出异常
	 */ 
	@RequestMapping(value = "/projectSuggestInfo/json/list" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean list(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfo,
			@RequestParam(value = "type") Integer type,  // 0 :已采纳意见 1：我的意见
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page, 
			HttpServletRequest request) {
		ResultBean resultBean = new ResultBean();
		try {
			if(type == 0){
				projectSuggestInfo.setStatus((short) 1);
				projectSuggestInfo.setOrderByClause("CREATE_TIME DESC"); //用创建时间排序
				PageHelper.startPage(page.getPageNum(), page.getPageSize());
				page=(Page<ProjectSuggestInfoBean>)projectSuggestInfoService.queryByCond(projectSuggestInfo);
			}else if(type==1){
				if(getCurrentAccountId()==null){
					resultBean.setCode(-1);
					resultBean.setMsg("浜诧紝璇峰厛鐧诲綍");
					return resultBean;
				}else{
					projectSuggestInfo.setAccountId(getCurrentAccountId());
					projectSuggestInfo.setOrderByClause("CREATE_TIME DESC");//用创建时间排序
					PageHelper.startPage(page.getPageNum(), page.getPageSize());
					page=(Page<ProjectSuggestInfoBean>)projectSuggestInfoService.queryByCond(projectSuggestInfo);

					projectSuggestInfo.setStatus((short) 1);
					List<ProjectSuggestInfoBean> list = projectSuggestInfoService.queryByCond(projectSuggestInfo);
					resultBean.setJsonValue(JSONObject.parseObject("{\"totalCount\":\"" + list.size() + "\"}"));
				}
			}


			List<JSONObject> list = new ArrayList<>();
			if(page.getTotal()>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:ss");
				for (ProjectSuggestInfoBean bean : page) {
					JSONObject jo = new JSONObject();
					jo.put("suggestTitle", bean.getSuggestTitle());
					jo.put("suggestContent", bean.getSuggestContent());
					jo.put("attachmentId", bean.getAttachmentId());
					jo.put("accountName", bean.getAccountName().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2"));
					jo.put("accountImage", bean.getAccountImage());
					jo.put("createTime", sdf.format(bean.getCreateTime()));
					jo.put("rewardContent", bean.getRewardContent());
					jo.put("status", bean.getStatus());
					jo.put("suggestId", bean.getSuggestId());
					list.add(jo);
				}
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
			resultBean.setMsg(String.valueOf(page.getTotal()));
			resultBean.setValue(list);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("获取失败！");
		}
		return resultBean;
	}


	/**
	 * 异步保存操作--避免拦截用baocun命名
	 * 
	 * @param projectSuggestInfo
	 * @param pageNo
	 * @param redirectAttributes
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/json/baocun" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean baocun(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfo,
			HttpServletRequest request) {
		int rst = 1 ;
		ResultBean resultBean = new ResultBean();
		String xReq = request.getHeader("x-requested-with");
		if (! "XMLHttpRequest".equalsIgnoreCase(xReq)) {
			resultBean.setCode(-2);
			resultBean.setMsg("非法请求");
			return resultBean;
		}else{
			// 是ajax异步请求
			String token=request.getHeader("token");
			String sessionId=request.getSession().getId();
			if(!sessionId.equals(token)){
				resultBean.setCode(-2);
				resultBean.setMsg("非法请求");
				return resultBean;
			}
		}
		try {
			String requestIp = ServletHelper.getIpAddress(request);
			java.util.Date createTime = new java.util.Date(System.currentTimeMillis());
			BigDecimal accountId = BigDecimal.valueOf(-1);  //默认为游客
			String accountName = "游客";
			String accountImage = "-1";//游客默认图片地址为：空
			boolean login = accountIdSessionHelper.isAccountAlreadyLogin();//已经登陆的用户
			
			if (login) {
				accountId = accountIdSessionHelper.getAccountIdBySessionAttribute(request);	
				accountName = accountInfoBeanProxy.selectByPrimaryKey(accountId).getAccountName();			
				AccountImageBean accountImageBean = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId, (short) 10);
				if (accountImageBean != null) {
					accountImage = accountImageBean.getImageUrl();
				}
				String accountTel = projectSuggestInfo.getAccountTel();//联系方式
				if (StringUtils.isEmpty(accountTel)) {
					List<AccountBindBean> list1 = accountBindBeanService.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, BigDecimal.valueOf(-1), accountTel);
					if (!list1.isEmpty()) {
						accountTel = list1.get(0).getOpenId();
						projectSuggestInfo.setAccountTel(accountTel);
					}
				}
			}
			projectSuggestInfo.setAccountId(accountId);
			projectSuggestInfo.setAccountName(accountName);
			projectSuggestInfo.setAccountImage(accountImage);
			projectSuggestInfo.setStatus((short) 2);
			projectSuggestInfo.setSuggestId(primaryKeySeq.getNextSeqIdToBigDecimal());
			projectSuggestInfo.setAccountIp(requestIp);
			projectSuggestInfo.setCreateTime(createTime);
			projectSuggestInfo.setSuggestTitle( HtmlUtils.htmlEscape(projectSuggestInfo.getSuggestTitle()) );
			projectSuggestInfo.setSuggestContent( HtmlUtils.htmlEscape(projectSuggestInfo.getSuggestContent()) );
			rst = projectSuggestInfoService.insert(projectSuggestInfo);
			if(rst==1){
				resultBean.setCode(1);
				if(getCurrentAccountId()==null){
					resultBean.setMsg("0");
				}else{
					resultBean.setMsg("1");
				}
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("发布失败");
			}	
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("发布失败");
		}
		return resultBean;
	}


	/**
	 * 运维页面：异步 保存  回复内容
	 * 
	 * @param suggestId
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 *//*
	@RequestMapping(value = "/projectSuggestInfo/json/baocunReply" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean baocunReply(@ModelAttribute(value = "projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		int rst = 1 ;
		ResultBean resultBean = new ResultBean();
		try {
			projectSuggestInfoBean.setAuditTime(new Timestamp(new Date().getTime())); // 审核时间
			projectSuggestInfoBean.setManagerId(this.getCurrentAccountId()); //审核人ID
			projectSuggestInfoBean.setManaagerName(this.getCurrentAccountName()); //审核人名称
			rst = projectSuggestInfoService.updateById(projectSuggestInfoBean);
			if(rst==1){
				resultBean.setCode(1);
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("发布失败");
			}	
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("发布失败");
		}
		return resultBean;
	}*/


	/**
	 * 运维页面：异步 详情
	 * @param suggestId
	 * @param pageNo
	 * @param request
	 * @param model
	 * @return
	 *//*
	@RequestMapping(value = "/projectSuggestInfo/json/view", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonView(@RequestParam(value = "suggestId") BigDecimal suggestId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, ServletRequest request, Model model) {
		ResultBean resultBean = new ResultBean();
		try {
			ProjectSuggestInfoBean projectSuggestInfo = projectSuggestInfoService.selectById(suggestId);
			resultBean.setCode(1);
			resultBean.setMsg(projectSuggestInfo.getSuggestTitle()+","+projectSuggestInfo.getAccountName()+","+projectSuggestInfo.getSuggestContent());
		} catch (Exception e) {
			logger.error("查看详情失败，" + e.getMessage(),e);
			resultBean.setCode(-1);
			resultBean.setMsg("查看详情失败！");
		}
		return resultBean;
	}
	  */

	/**
	 * 运维页面：异步  审批操作
	 * 
	 * @param ids
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/audit", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String audit(@RequestParam(value = "ids") String ids,
			@RequestParam(value = "type") Short type){
		String str = "";
		try {
			String[] idsStr = ids.split(",");
			for (int i = 0; i < idsStr.length; i++) {
				ProjectSuggestInfoBean projectSuggestInfoBean = projectSuggestInfoService.selectById(new BigDecimal(idsStr[i]));
				projectSuggestInfoBean.setStatus(type);
				projectSuggestInfoService.updateById(projectSuggestInfoBean);
			}
			str = "审核成功！";
		} catch (Exception e) {
			
		}
		return str;
	}


	/**
	 * json删除
	 * 
	 * @param itemId
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/projectSuggestInfo/json/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String jsonDelete(@RequestParam(value = "ids") String[] items, HttpServletRequest request) {
		String msg = null;
		int i = projectSuggestInfoService.batchDelete(items);
		if (i > 0) {
			msg = "删除成功！";
		} else {
			msg = "删除成功！";
		}
		return msg;
	}

	/**
	 * -----------------------------------------------------------------
	 *                      微信端同步方法
	 * -----------------------------------------------------------------
	 */

	/**
	 * 微信：意见反馈
	 */
	@RequestMapping(value = "/projectSuggestInfo/weixin/feedback")
	public String feedback(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "/weixinPage/suggest/feedback";
	}

	/**
	 * 微信：已采纳意见
	 */
	@RequestMapping(value = "/projectSuggestInfo/weixin/hasAdopt")
	public String hasAdopt(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";	
		}
		return "/weixinPage/suggest/hasAdopt";
	}

	/**
	 * 微信：我的意见
	 */
	@RequestMapping(value = "/projectSuggestInfo/weixin/myOpinion")
	public String myOpinion(@ModelAttribute("projectSuggestInfo") ProjectSuggestInfoBean projectSuggestInfoBean,
			@ModelAttribute("page") Page<ProjectSuggestInfoBean> page,
			@RequestParam(value = "searchText", required = false) String searchText,
			Model model, ServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "redirect:/error/404";
		}
		return "/weixinPage/suggest/myOpinion";
	}

}