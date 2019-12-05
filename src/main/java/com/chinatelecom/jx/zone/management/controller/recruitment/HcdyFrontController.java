package com.chinatelecom.jx.zone.management.controller.recruitment;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.hcdy.organization.log.bean.HcdyOrganizationLogBean;
import com.chinatelecom.jx.zone.hcdy.organization.log.service.IHcdyOrganizationLogService;
import com.chinatelecom.jx.zone.hcdy.positionmanage.log.bean.HcdyRecruitmentLogBean;
import com.chinatelecom.jx.zone.hcdy.positionmanage.log.service.IHcdyRecruitmentLogService;
import com.chinatelecom.jx.zone.hcdy.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.service.recruitment.IRecruitmentHcdyService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.park.info.bean.ParkInfoBean;
import com.chinatelecom.jx.zone.park.info.proxy.IParkInfoBeanProxy;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;


@Controller
public class HcdyFrontController extends BaseController{

	@Autowired
	private IRecruitmentHcdyService recruitmentHcdyService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IParkInfoBeanProxy parkInfoBeanProxy;
	@Autowired
	private IHcdyRecruitmentLogService hcdyRecruitmentLogService;
	@Autowired
	private IHcdyOrganizationLogService hcdyOrganizationLogService;
	@Autowired
	private IPersonalCenterService personalCenterService;
	
	@RequestMapping(value="/front/recruitment/hcdy/main")
	public String main(@RequestParam(value = "pageType", defaultValue = "0")Integer pageType, Model model){
		try{
			//TODO 上月招聘需求情况
			
			
			//成功招聘企业
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("page_index", 1);
			paramMap.put("page_size", 3);
			List<?> companyList = recruitmentHcdyService.getCompanyList(paramMap);
			
			model.addAttribute("companyList", companyList);
			model.addAttribute("pageType", pageType);
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error("怀才首页加载数据发生异常"+ex.getMessage(),ex);
		}
		
		return "/front/recruitment/hcdy/main";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/front/recruitment/hcdy/edit")
	public String edit(@RequestParam(value = "id")BigDecimal id,Model model){
		HcdyRecruitmentLogBean info = hcdyRecruitmentLogService.selectById(id);
		info.setType((short)2);
		model.addAttribute("info", info);
		return "/front/recruitment/hcdy/publish";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/front/recruitment/hcdy/publish")
	public String publish(Model model){
		HcdyRecruitmentLogBean info = new HcdyRecruitmentLogBean();
		info.setType((short)1);
		
		OrganizationInfoBean rootInfoBean = organizationInfoBeanProxy
				.selectByPrimaryKey(organizationIdSessionHelper.getRootIdBySessionAttribute());
		
		HcdyOrganizationLogBean hcdyOrganizationLogBean = 
				hcdyOrganizationLogService.selectById(rootInfoBean.getOrganizationId());
		
		boolean isReg = true;
		if(hcdyOrganizationLogBean==null){ //没有注册
			isReg = false;
		}
		
		boolean isUpper = true;
		if(isReg){
			//发布是否达到上限
			HcdyRecruitmentLogBean hcdyRecruitmentLogBean = new HcdyRecruitmentLogBean();
			hcdyRecruitmentLogBean.setPositionStatus((short)1);
			hcdyRecruitmentLogBean.setAccount(hcdyOrganizationLogBean.getAccount());
			List<HcdyRecruitmentLogBean> list = hcdyRecruitmentLogService
					.queryByCond(hcdyRecruitmentLogBean);
			
			if(list.size()>=25){
				isUpper = false;
			}
		}	
		
		model.addAttribute("isReg", isReg);
		model.addAttribute("isUpper", isUpper);
		model.addAttribute("info", info);
		return "/front/recruitment/hcdy/publish";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/front/recruitment/hcdy/companyEdit")
	public String companyEdit(Model model){
		boolean isVis = personalCenterService.isVisitor();
		
		OrganizationInfoBean rootInfoBean = null;
		HcdyOrganizationLogBean hcdyOrganizationLogBean = null;
		if(isVis){
			//游客用户
			CompanyInfoBean companyInfoBean = personalCenterService
					.selectDefaultCompanyForVisitor(getCurrentAccountId());
			if(companyInfoBean!=null){
				rootInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(companyInfoBean.getCompanyId());;
			}
			
		}else{
			//非游客
			rootInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(organizationIdSessionHelper.getRootIdBySessionAttribute());
			
			hcdyOrganizationLogBean = 
					hcdyOrganizationLogService.selectById(rootInfoBean.getOrganizationId());
		}
		
		model.addAttribute("hcdyOrganizationLogBean", hcdyOrganizationLogBean);
		model.addAttribute("rootInfoBean", rootInfoBean);
		return "/front/recruitment/hcdy/companyEdit";
	}
	
	
	@RequestMapping(value="/front/recruitment/hcdy/detail")
	public String detail(@RequestParam(value = "id")BigDecimal id,Model model){
		HcdyRecruitmentLogBean info = hcdyRecruitmentLogService.selectById(id);
		
		//企业信息
		HcdyOrganizationLogBean hcdyOrganizationLogBean = 
				hcdyOrganizationLogService.selectById(organizationIdSessionHelper.getRootIdBySessionAttribute());
	
		//匹配简历列表
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("account", hcdyOrganizationLogBean.getAccount());
		paramMap.put("positionID", info.getPositionId());
		List<?> ajInfoList = recruitmentHcdyService.getAjInfolist(paramMap);
		
		//企业其他发布列表
		HcdyRecruitmentLogBean hcdyRecruitmentLogBean = new HcdyRecruitmentLogBean();
		hcdyRecruitmentLogBean.setRootId(organizationIdSessionHelper.getRootIdBySessionAttribute());
		List<HcdyRecruitmentLogBean> positionList = hcdyRecruitmentLogService.queryByCond(hcdyRecruitmentLogBean);
		
		
		model.addAttribute("info", info);
		model.addAttribute("hcdyOrganizationLogBean", hcdyOrganizationLogBean);
		model.addAttribute("ajInfoList", ajInfoList);
		model.addAttribute("positionList", positionList);
		return "/front/recruitment/hcdy/detail";
	}
	
	
	
	/**************************************************************************
	 * 							json 数据
	 **************************************************************************
	 */
	
	@RequestMapping(value="/json/recruitment/hcdy/jsonSave", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonSave(
			@ModelAttribute("info")HcdyRecruitmentLogBean info, 
			@RequestParam(value="operationType", defaultValue="1")Integer operationType, 
			RedirectAttributes redirectAttributes, Model model){
		ResultBean resultBean = new ResultBean();
		try{
			
			//是否登录
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录！");
				return resultBean;
			}
			
			//获取account值
			String account = hcdyOrganizationLogService
					.selectById(organizationIdSessionHelper.getRootIdBySessionAttribute()).getAccount();
			if(operationType==1){
				//发布是否达到上限
				HcdyRecruitmentLogBean hcdyRecruitmentLogBean = new HcdyRecruitmentLogBean();
				hcdyRecruitmentLogBean.setPositionStatus((short)1);
				hcdyRecruitmentLogBean.setAccount(account);
				List<HcdyRecruitmentLogBean> list = hcdyRecruitmentLogService
						.queryByCond(hcdyRecruitmentLogBean);
				if(list.size()>=25){
					resultBean.setCode(1);
					resultBean.setMsg("亲，您发布数达到上限，请先下线个别职位！");
					return resultBean;
				}
			}
			
			AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());
			OrganizationInfoBean organizationInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(organizationIdSessionHelper.getOrganizationIdBySessionAttribute());
			OrganizationInfoBean rootInfoBean = organizationInfoBeanProxy
					.selectByPrimaryKey(organizationIdSessionHelper.getRootIdBySessionAttribute());
			ParkInfoBean parkInfoBean = parkInfoBeanProxy.selectByPrimaryKey(getCurrentParkId());
			
			
			info.setAccountId(getCurrentAccountId());
			info.setAccountName(getCurrentAccountName());
			info.setAccountNick(accountInfoBean.getAccountNick());
			info.setOrganizationId(organizationInfoBean.getOrganizationId());
			info.setOrganizationName(organizationInfoBean.getOrganizationName());
			info.setRootId(rootInfoBean.getOrganizationId());
			info.setRootName(rootInfoBean.getOrganizationName());
			if(parkInfoBean!=null){
				info.setParkId(parkInfoBean.getParkId());
				info.setParkName(parkInfoBean.getParkName());
				info.setAreaId(parkInfoBean.getAreaId());
				info.setAreaName(parkInfoBean.getAreaName());
			}
			info.setAccount(account);
			
			int rst = 0;
			if(operationType==1){
				info.setPositionStatus((short)1);
				rst = recruitmentHcdyService.publish(info);
			}else if(operationType==2){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				if(info.getPositionId()==null){
					int result = 0;
					if(info.getId()==null){
						info.setId(seq.getNextSeqIdToBigDecimal());
						info.setPositionStatus((short)2);
						if(StringUtil.checkNotNull(info.getDeadLineStr())){
							info.setDeadLine(sdf.parse(info.getDeadLineStr()));
						}
						
						info.setCreateTime(new Timestamp(System.currentTimeMillis()));
						result = hcdyRecruitmentLogService.insert(info);
					}else{
						HcdyRecruitmentLogBean record = hcdyRecruitmentLogService
								.selectById(info.getId());
						MyBeanUtils.copyProperties(info, record);
						result = hcdyRecruitmentLogService.updateById(record);
					}
					
					if(result==1){
						rst = 0;
					}else{
						rst = 1;
					}
				}
			}else{ //下线
				HcdyRecruitmentLogBean record = hcdyRecruitmentLogService.selectById(info.getId());
				record.setPositionStatus((short)0);
				record.setAccount(account);
				record.setType((short)3);
				rst = recruitmentHcdyService.publish(record);
			}
			
			if(rst==0){
				resultBean.setCode(0);
				if(operationType==1){
					resultBean.setMsg("发布成功！");
				}else if(operationType==2){
					resultBean.setMsg("保存成功！");
				}else{
					resultBean.setMsg("下线成功！");
				}
			}else if(rst==1||rst==2){
				resultBean.setCode(1);
				if(operationType==1){
					resultBean.setMsg("发布失败！");
				}else if(operationType==2){
					resultBean.setMsg("保存失败！");
				}else{
					resultBean.setMsg("下线失败！");
				}
			}else{
				resultBean.setCode(1);
				if(operationType==1){
					resultBean.setMsg("亲，您发布数达到上限，请先下线个别职位！");
				}
			}
			
		}catch(Exception ex){
			logger.error("怀才发布岗位发生异常"+ex.getMessage(),ex);
		}
		return resultBean;
	}
	
	
	@RequestMapping(value="/json/recruitment/hcdy/logList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonLogList(@ModelAttribute("hcdyRecruitmentLogBean")HcdyRecruitmentLogBean hcdyRecruitmentLogBean){
		List<HcdyRecruitmentLogBean> list = new ArrayList<>();
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录！");
				return resultBean;
			}
			hcdyRecruitmentLogBean.setAccountId(getCurrentAccountId());
			hcdyRecruitmentLogBean.setRootId(organizationIdSessionHelper.getRootIdBySessionAttribute());
			hcdyRecruitmentLogBean.setOrderByClause("create_time desc");
			list = hcdyRecruitmentLogService.queryByCond(hcdyRecruitmentLogBean);
			resultBean.setCode(0);
			resultBean.setMsg("获取发布列表成功！");
			resultBean.setValue(list);
		}catch(Exception ex){
			logger.error("获取怀才发布岗位信息列表失败，详细原因："+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("获取发布列表失败，系统异常！");
		}
		return resultBean;
	}
	
	@RequestMapping(value="/json/recruitment/hcdy/delete", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonDelete(@RequestParam(value="id")BigDecimal id){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录！");
				return resultBean;
			}
			
			int rst = hcdyRecruitmentLogService.deleteById(id);
			if(rst==1){
				resultBean.setCode(0);
				resultBean.setMsg("删除成功！");
			}else{
				resultBean.setCode(1);
				resultBean.setMsg("删除失败！");
			}
		}catch(Exception ex){
			logger.error("删除怀才发布岗位草稿信息失败，详细原因："+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("删除失败，系统异常！");
		}
		return resultBean;
	}
	
	
	@RequestMapping(value="/json/recruitment/hcdy/hcdyLogin", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public InvokeInfoBean<?> hcdyLogin(){
		InvokeInfoBean<?> invokeInfoBean = new InvokeInfoBean<JSONObject>();
		try{
			if(getCurrentAccountId()==null){
				invokeInfoBean.setErrorCode(-2);
				invokeInfoBean.setErrorMsg("亲，您还没有登录！");
				return invokeInfoBean;
			}
			Map<String, Object> paramMap = new HashMap<String, Object>();
			HcdyOrganizationLogBean info = hcdyOrganizationLogService
					.selectById(organizationIdSessionHelper.getRootIdBySessionAttribute());
			if(info==null){
				invokeInfoBean.setErrorCode(-2);
				invokeInfoBean.setErrorMsg("企业未注册！");
				return invokeInfoBean;
			}
			paramMap.put("account", info.getAccount());
			paramMap.put("pwd", info.getPwd());
			invokeInfoBean = recruitmentHcdyService.hcdyLogin(paramMap);
			
		}catch(Exception ex){
			logger.error("怀才单点登录失败，详细原因："+ex.getMessage(), ex);
			invokeInfoBean.setErrorCode(-1);
			invokeInfoBean.setErrorMsg("怀才单点登录失败，系统异常！");
		}
		return invokeInfoBean;
	}
}
