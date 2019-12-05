package com.chinatelecom.jx.zone.management.service.login;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.auth.bean.AccountAuthBean;
import com.chinatelecom.jx.zone.account.auth.proxy.IAccountAuthBeanProxy;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.organization.bean.AccountOrganizationBean;
import com.chinatelecom.jx.zone.account.organization.role.bean.AccountOrganizationRoleBean;
import com.chinatelecom.jx.zone.account.organization.role.service.IAccountOrganizationRoleBeanService;
import com.chinatelecom.jx.zone.account.organization.service.IAccountOrganizationBeanService;
import com.chinatelecom.jx.zone.account.system.bean.AccountSystemBean;
import com.chinatelecom.jx.zone.account.system.service.IAccountSystemBeanService;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.area.info.bean.AreaInfoBean;
import com.chinatelecom.jx.zone.area.info.proxy.IAreaInfoBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.config.info.proxy.IConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.entrance.config.info.bean.EntranceConfigInfoBean;
import com.chinatelecom.jx.zone.entrance.config.info.proxy.IEntranceConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.exception.ServiceException;

import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.organization.info.service.IOrganizationInfoBeanService;
import com.chinatelecom.jx.zone.role.info.bean.RoleInfoBean;
import com.chinatelecom.jx.zone.role.info.service.IRoleInfoBeanService;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;
import com.chinatelecom.jx.zone.util.StatusUtils;

//com.chinatelecom.jx.zone.management.service.register.AccountRegisterServiceImpl
/**
 *  微信用户关联，系统自助注册账户的的业务封装实现
 * @author ZuoGuangDe
 *
 */
@Service("weixinRegisterAccountService")
@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
public class WeixinRegisterAccountServiceImpl implements IWeixinRegisterAccountService{
	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;


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

	@Autowired
	private IAccountOrganizationBeanService accountOrganizationBeanService;
	@Autowired(required = true)@Qualifier("primaryKeySeq")  
	private SeqIdType primaryKeySeq;
	
	@Autowired
	private com.chinatelecom.jx.util.CryptUtils cryptUtils;
	

	@Autowired
	private IRoleInfoBeanService roleInfoBeanService;

	@Autowired
	private  IAccountOrganizationRoleBeanService accountOrganizationRoleBeanService;

	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private IEntranceConfigInfoBeanProxy entranceConfigInfoBeanProxy;
	private static final Logger logger = LoggerFactory.getLogger(WeixinRegisterAccountServiceImpl.class);

	@PostConstruct
	protected void initialize() {


		logger.info("WeixinAccountSelfRegisterHelper初始化成功！");
	}

	@Override
	public void registerAccount(String mobilePhone,String accountName,String accountPasswd,BigDecimal areaId,String openId) {
		
		final BigDecimal systemId = this.systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		
		final EntranceConfigInfoBean entranceConfigInfoBean = entranceConfigInfoBeanProxy.selectByPrimaryKey(BigDecimal.valueOf(0));
		final String webAppId = entranceConfigInfoBean.getWeixinWebAppId();
		final String opnAppId = entranceConfigInfoBean.getWeixinOpnAppId();
		
		//1：检测微信用户信息是否存在!
		List<AccountWeixinBean> list1 = accountWeixinBeanProxy.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName(null, openId, null, null,null);
		if (list1.isEmpty()) {
			ServiceException ex =  new ServiceException("微信用户信息不存在！");
			StringBuilder builder = new StringBuilder(128);
			builder.append("微信用户信息不存在，").append("，openId：").append(openId)
					 .append("，appId1：").append(webAppId).append("，appId2：").append(opnAppId).append("！");
			logger.error(builder.toString(),ex);
			throw ex;
		}
		final AccountWeixinBean accountWeixin = list1.get(0);

		//2：检查账号是否注册
		AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(mobilePhone);
		if (accountInfo != null) {
			throw new ServiceException( mobilePhone + "已注册，请绑定！");
		}
		
		//3：找准新增账户直属的游客群组
		OrganizationInfoBean organizationInfo = null;
		{
			if (areaId == null) { //用户注册时，没有选择区域，则通过微信接口获取区域相关信息。			
				//查省份记录
				List<AreaInfoBean> areaInfoBeanList = areaInfoBeanProxy.selectFirstGradeListByParentIdAndAreaKindAndStatusArrayAndSearchKey(null, (short)2, StatusUtils.open, accountWeixin.getProvince());
				if (areaInfoBeanList == null) {
					areaId = BigDecimal.ZERO;
				} else {
					areaId = areaInfoBeanList.get(0).getAreaId();
					areaInfoBeanList = areaInfoBeanProxy.selectFirstGradeListByParentIdAndAreaKindAndStatusArrayAndSearchKey(areaId, (short)3, StatusUtils.open, accountWeixin.getCity());
					if (!areaInfoBeanList.isEmpty()) {
						areaId = areaInfoBeanList.get(0).getAreaId();
					}
				}			
			}
			
			//找到直属群组
			List<OrganizationInfoBean> organizationInfoBeanList = organizationInfoBeanService.selectFirstGradeListByOrganizationOrParentIdAndOrganizationNameAndRootIdAndSystemIdArray
			(areaId, "游客列表", null, null);
			if (organizationInfoBeanList.isEmpty()) {
				ServiceException se = new ServiceException("区域信息缺失！");
				logger.error("区域下挂游客列表分组不存在，organizationId：" + areaId + "！",se);
				throw se;
			}
			organizationInfo = organizationInfoBeanList.get(0);					
		}		
		
		//4：新增账户基本信息
		{
			accountInfo  = new AccountInfoBean();
			java.util.Date createTime = new java.util.Date();
			accountInfo.setAccountId(accountIdSeq.getNextSeqIdToBigDecimal(createTime));
			accountInfo.setAccountCode(mobilePhone);
			accountInfo.setAccountName(accountName);
			accountInfo.setOfficePhone(mobilePhone);
			accountInfo.setStatus((short)1);
			accountInfo.setLoginTime(createTime);
			//accountInfo.setDeadlineTime(new java.text.SimpleDateFormat("yyyy-MM-DD").parse("2048-12-31"));
			accountInfo.setCreateKind((short)1);
			accountInfo.setSystemId(systemId);
			accountInfo.setSortGrade(organizationInfo.getSortGrade());		
			accountInfo.setCreateTime(createTime);
			InvokeInfoBean<?> rst = accountInfoBeanProxy.validateInsert(accountInfo);
			if (!rst.isSuccess()) {
				ServiceException se = new  ServiceException(rst.getErrorMsg());
				StringBuilder builder = new StringBuilder("新增账户基本信息失败，accountInfo：").append(JSON.toJSONString(accountInfo))
						.append("，").append(rst.getErrorMsg());
				logger.error(builder.toString(),se);
				throw new ServiceException(se);
			}			
		}
		
		//5：更新微信绑定到新建账户
		{
            accountWeixin.setAccountId(accountInfo.getAccountId());
			accountWeixin.setRemark("微信自助注册！");
			InvokeInfoBean<?> rst = accountWeixinBeanProxy.validateInsertSelective(accountWeixin);
			if (!rst.isSuccess()) {
				ServiceException se = new  ServiceException(rst.getErrorMsg());
				StringBuilder builder = new StringBuilder("更新账户绑定微信信息失败，accountBind：").append(JSON.toJSONString(accountWeixin))
						.append("，").append(rst.getErrorMsg());
				logger.error(builder.toString(),se);
				throw se;
			}
			
		}

		
		//6：新增账户鉴权信息
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
		
		//7：新增系统授权查看账户
		{
			AccountSystemBean accountSystem = new AccountSystemBean();
			BeanUtils.copyProperties(accountInfo, accountSystem);
			accountSystem.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
			accountSystemBeanService.insert(accountSystem);
		}
		
		//8：新增用户关联部门
		{
			AccountOrganizationBean accountOrganization = new AccountOrganizationBean();
			accountOrganization.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
			accountOrganization.setAccountId(accountInfo.getAccountId());
			accountOrganization.setOrganizationId(organizationInfo.getOrganizationId());
			accountOrganization.setRootId(organizationInfo.getRootId());
			accountOrganization.setSortGrade((long) 1);
			accountOrganization.setCreateTime(accountInfo.getCreateTime());
			accountOrganizationBeanService.validateInsertOrMergeWithRoleIdArrayAndDutyIdArraySelective
			(accountOrganization,false,true,null,null,false);
			
		}
		
		//9：新增用户关联部门岗位
		//TODO 需完善相关业务的代码开发
		
		//10：新增用户关联部门角色		
		RoleInfoBean roleInfo = roleInfoBeanService.selectByRoleCode("GeneralUser"); //自助申请人
		if (roleInfo == null) {
			ServiceException se = new ServiceException("关联角色信息缺失！");
			logger.error("关联角色信息缺失，roleCode：GeneralUser！",se);
			throw se;
		}
		AccountOrganizationRoleBean accountOrganizationRole = new AccountOrganizationRoleBean();
		accountOrganizationRole.setKeyId(primaryKeySeq.getNextSeqIdToBigDecimal(accountInfo.getCreateTime()));
		accountOrganizationRole.setAccountId(accountInfo.getAccountId());
		accountOrganizationRole.setOrganizationId(organizationInfo.getOrganizationId());
		accountOrganizationRole.setRoleId(roleInfo.getRoleId());
		
		accountOrganizationRole.setCreateTime(accountInfo.getCreateTime());
		accountOrganizationRoleBeanService.insert(accountOrganizationRole);

	}
}
