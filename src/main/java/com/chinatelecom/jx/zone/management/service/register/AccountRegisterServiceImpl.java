package com.chinatelecom.jx.zone.management.service.register;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.chinatelecom.jx.zone.account.auth.bean.AccountAuthBean;
import com.chinatelecom.jx.zone.account.auth.proxy.IAccountAuthBeanProxy;
import com.chinatelecom.jx.zone.account.bind.proxy.IAccountBindBeanProxy;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.organization.bean.AccountOrganizationBean;
import com.chinatelecom.jx.zone.account.organization.role.bean.AccountOrganizationRoleBean;
import com.chinatelecom.jx.zone.account.organization.role.service.IAccountOrganizationRoleBeanService;
import com.chinatelecom.jx.zone.account.organization.service.IAccountOrganizationBeanService;
import com.chinatelecom.jx.zone.account.system.bean.AccountSystemBean;
import com.chinatelecom.jx.zone.account.system.service.IAccountSystemBeanService;

import com.chinatelecom.jx.zone.area.info.proxy.IAreaInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.config.info.proxy.IConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.exception.ServiceException;
import com.chinatelecom.jx.zone.management.service.login.IWeixinBindAccountService;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.organization.info.service.IOrganizationInfoBeanService;
import com.chinatelecom.jx.zone.role.info.bean.RoleInfoBean;
import com.chinatelecom.jx.zone.role.info.service.IRoleInfoBeanService;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;
import com.chinatelecom.jx.zone.util.StatusUtils;

//com.chinatelecom.jx.zone.management.service.login.WeixinRegisterAccountServiceImpl
/**
 * 账户注册
 * @author ZuoGuangDe
 *
 */
@Service("accountRegisterService")
@Transactional
public class AccountRegisterServiceImpl implements IAccountRegisterService{
	@Autowired
	private IAccountBindBeanProxy accountBindBeanProxy;


	@Autowired
	private ISystemInfoBeanProxy systemInfoBeanProxy;
	@Autowired
	private IAreaInfoBeanProxy areaInfoBeanProxy;

	
	@Resource(name = "accountIdSeq")
	private SeqIdType accountIdSeq;
	
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	
	@Autowired
	private IAccountAuthBeanProxy accountAuthBeanProxy;
	
	@Autowired
	private IAccountSystemBeanService accountSystemBeanService;
	
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private IOrganizationInfoBeanService organizationInfoBeanService;
	
	@Autowired(required = true)@Qualifier("primaryKeySeq")  
	private SeqIdType primaryKeySeq;
	

	@Autowired
	private IAccountOrganizationBeanService accountOrganizationBeanService;
	@Autowired
	private IWeixinBindAccountService weixinBindAccountService;
	
	@Resource(name = "bindIdSeq")
	private SeqIdType bindIdSeq;
	
	@Autowired
	private com.chinatelecom.jx.util.CryptUtils cryptUtils;
	
	@Autowired
	private IRoleInfoBeanService roleInfoBeanService;

	@Autowired
	private  IAccountOrganizationRoleBeanService accountOrganizationRoleBeanService;

	
	private static final Logger logger = LoggerFactory.getLogger(IAccountRegisterService.class);
	
	@Override
	public InvokeInfoBean<BigDecimal[]> registerAccount(String userName,String mobilePhone, String accountPasswd, String openId,BigDecimal areaId) {

		InvokeInfoBean<BigDecimal[]> rst = new InvokeInfoBean<BigDecimal[]>();
		rst.setValue(new BigDecimal[2]);
		
		final BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		
		//1：找准新增账户直属的游客群组
		OrganizationInfoBean organizationInfo = null;
		{
			if (areaId == null) {
				areaId = BigDecimal.ZERO;
			}
			//找到直属群组
			List<OrganizationInfoBean> organizationInfoBeanList = organizationInfoBeanService.selectFirstGradeListByOrganizationOrParentIdAndOrganizationNameAndRootIdAndSystemIdArray
			(areaId, "游客列表", null, null);
			if (organizationInfoBeanList.isEmpty()) {
				ServiceException se = new ServiceException("区域信息缺失！");
				logger.error("区域下挂游客列表分组不存在，organizationId：" + areaId + "！",se);
				rst.setErrorCode(2);
				rst.setErrorMsg("区域信息缺失！");
				return rst;
			}
			organizationInfo = organizationInfoBeanList.get(0);					
			rst.getValue()[1] = organizationInfo.getOrganizationId();
		}		
		
		AccountInfoBean accountInfo = null;
		//2：新增账户基本信息
		{
			accountInfo  = new AccountInfoBean();
			java.util.Date createTime = new java.util.Date();
			accountInfo.setAccountId(accountIdSeq.getNextSeqIdToBigDecimal(createTime));
			
			rst.getValue()[0] = accountInfo.getAccountId();
			
			accountInfo.setAccountCode(mobilePhone);
			accountInfo.setAccountName(userName);
			accountInfo.setAccountNick(userName);
			accountInfo.setContactPhone(mobilePhone);
			accountInfo.setStatus((short)1);
			accountInfo.setLoginTime(createTime);
			accountInfo.setCreateKind((short)1);
			accountInfo.setCreaterId(accountInfo.getAccountId());
			accountInfo.setCreaterName(accountInfo.getAccountName());
			accountInfo.setSystemId(systemId);			
			accountInfo.setSortGrade(organizationInfo.getSortGrade());		
			accountInfo.setCreateTime(createTime);
			
			InvokeInfoBean<?> rst1 = accountInfoBeanProxy.validateInsert(accountInfo);
			if (!rst1.isSuccess()) {
				ServiceException se = new  ServiceException(rst.getErrorMsg());
				StringBuilder builder = new StringBuilder("新增账户基本信息失败，accountInfo：").append(JSON.toJSONString(accountInfo))
						.append("，").append(rst.getErrorMsg());
				logger.error(builder.toString(),se);
				rst.setErrorCode(rst1.getErrorCode());
				rst.setErrorMsg(rst1.getErrorMsg());
			}			
		}
		
		
		
		//3：新增账户鉴权信息
		{
			AccountAuthBean accountAuth = new AccountAuthBean();
			BeanUtils.copyProperties(accountInfo, accountAuth);
			String md5AccountPasswd = cryptUtils.md5(accountPasswd).toUpperCase();
			accountAuth.setAccountPasswd(md5AccountPasswd);
			accountAuth.setPasswdTime(accountInfo.getCreateTime());
			accountAuth.setPasswdStatus((short)1);
			accountAuth.setIdentificationKind((short)1);
			
			InvokeInfoBean<Integer> rst1 = accountAuthBeanProxy.validateInsert(accountAuth);
			if (!rst1.isSuccess()) {
				StringBuilder builder = new StringBuilder("新增账户鉴权信息失败，accountAuth：").append(JSON.toJSONString(accountAuth))
						.append("，").append(rst1.getErrorMsg());
				logger.error(builder.toString());
				throw new ServiceException(rst1.getErrorMsg());
			}
		}
		
		//4：新增系统授权查看账户
		{
			AccountSystemBean accountSystem = new AccountSystemBean();
			BeanUtils.copyProperties(accountInfo, accountSystem);
			accountSystem.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
			accountSystemBeanService.insert(accountSystem);
		}
		
		//5：新增用户关联部门		
			AccountOrganizationBean accountOrganization = new AccountOrganizationBean();
			accountOrganization.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
			accountOrganization.setAccountId(accountInfo.getAccountId());
			accountOrganization.setOrganizationId(organizationInfo.getOrganizationId());
			accountOrganization.setRootId(organizationInfo.getRootId());
			accountOrganization.setSortGrade((long) 1);
			accountOrganization.setCreateTime(accountInfo.getCreateTime());
			accountOrganizationBeanService.validateInsertOrMergeWithRoleIdArrayAndDutyIdArraySelective(accountOrganization,false,true,null,null,false);
			
		
		//6：新增用户关联部门角色		
		RoleInfoBean roleInfo = roleInfoBeanService.selectByRoleCode("GeneralUser"); //Web用户
		if (roleInfo == null) {
			ServiceException se = new ServiceException("关联角色信息缺失！");
			logger.error("关联角色信息缺失，RoleCode：GeneralUser！",se);
			throw se;
		}
		AccountOrganizationRoleBean accountOrganizationRole = new AccountOrganizationRoleBean();
		accountOrganizationRole.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
		accountOrganizationRole.setForeignId(accountOrganization.getKeyId());
		accountOrganizationRole.setAccountId(accountInfo.getAccountId());
		accountOrganizationRole.setOrganizationId(organizationInfo.getOrganizationId());
		accountOrganizationRole.setRootId(organizationInfo.getRootId());
		accountOrganizationRole.setRoleId(roleInfo.getRoleId());		
		accountOrganizationRole.setCreateTime(accountInfo.getCreateTime());
		accountOrganizationRoleBeanService.insert(accountOrganizationRole);
		
		if (!StringUtils.isEmpty(openId)) {
			InvokeInfoBean<?> rst1 = weixinBindAccountService.bindAccount(accountInfo.getAccountId(), openId);
			if (!rst1.isSuccess()) {
				ServiceException se = new ServiceException("绑定微信失败！");
				logger.error("绑定微信失败，openId" + openId,se);
				throw se;
			}
		}
		
		rst.setSuccess(true);
		rst.setErrorCode(0);
		rst.setErrorMsg("账户注册成功！");
		return rst;

	}
	
	@Override
	public  InvokeInfoBean<BigDecimal[]>  validateRegisterAccount(String userName,String mobilePhone, String accountPasswd, String openId,BigDecimal areaId) {
		 InvokeInfoBean<BigDecimal[]>  rst = new  InvokeInfoBean<BigDecimal[]> ();
		//检测手机号码是否已经绑定
		boolean exists = accountBindBeanProxy.selectBySystemIdAndOpenId(BigDecimal.valueOf(-1), mobilePhone) != null;
		if (exists) {
			String errorMsg = mobilePhone + "已经关联！";
			ServiceException se = new ServiceException(errorMsg);
			logger.error(errorMsg,se);
			rst.setErrorCode(21);
			rst.setErrorMsg(errorMsg);
			return rst;
		}
		//检测手机号码账号是否存在
		AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByAccountCode(mobilePhone);
		if (accountInfo != null) {
			String errorMsg = mobilePhone + "已经注册！";
			ServiceException se = new ServiceException(errorMsg);
			logger.error(errorMsg,se);
			rst.setErrorCode(21);
			rst.setErrorMsg(errorMsg);
			return rst;
		}

		return registerAccount(userName,mobilePhone, accountPasswd, openId,areaId);	
	}

}
