package com.chinatelecom.jx.zone.spring.security;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.chinatelecom.jx.zone.account.auth.bean.AccountAuthBean;
import com.chinatelecom.jx.zone.account.auth.proxy.IAccountAuthBeanProxy;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.organization.module.dao.IAccountOrganizationModuleDao;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;

@Component("zoneUserDetailsService")
public class ZoneUserDetailsServiceImpl implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(ZoneUserDetailsServiceImpl.class);
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IAccountAuthBeanProxy accountAuthBeanProxy;
	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;


	@Autowired
	private IAccountOrganizationModuleDao accountOrganizationModuleDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		logger.trace("username：" + username);
		AccountInfoBean accountInfo = accountInfoBeanProxy.selectLiveByUserCode(username);
		if (accountInfo == null) {
			throw new UsernameNotFoundException(
					new StringBuilder(32).append("用户名").append(username).append("信息不存在！").toString());
		}
		boolean enabled = false, accountNonExpired = false, credentialsNonExpired = false, accountNonLocked = false;
		if (accountInfo.getStatus() == -1) {
			accountNonExpired = false;
		} else {
			accountNonExpired = true;
			if (accountInfo.getStatus() == 0) {
				accountNonLocked = false;
			} else {
				accountNonLocked = true;
				if (accountInfo.getDeadlineTime() != null && accountInfo.getDeadlineTime().before(new java.util.Date())) {
					accountNonExpired = false;
				} else {
					enabled = true;
					credentialsNonExpired = true;
				}
			}
		}
		AccountAuthBean accountAuth = accountAuthBeanProxy.selectByPrimaryKey(accountInfo.getAccountId());
		if (accountAuth == null) {
			throw new UsernameNotFoundException(
					new StringBuilder(32).append("用户名").append(username).append("鉴权信息不存在！").toString());
		}
		String password = accountAuth.getAccountPasswd();

		BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		
		BigDecimal rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
		BigDecimal organizationId = null; //角色不限制到部门
		//BigDecimal organizationId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
		

		List<String> moduleUniqueList = accountOrganizationModuleDao
				.queryModuleUniqueListByAccountIdAndOrganizationIdAndRootIdAndSystemId(accountInfo.getAccountId(),
						organizationId, rootId,systemId);
		if (moduleUniqueList.isEmpty()) {
			logger.warn(new StringBuilder(32).append("鉴权审计发现没有操作权限，username：").append(username).append("，accountId：").append(accountInfo.getAccountId())
					.append("，organizationId：").append(organizationId).append("，rootId：").append(rootId).append("，systemId：").append(systemId).append("。").toString());
			//throw new UsernameNotFoundException(
			//		new StringBuilder(32).append("用户没有操作权限！").toString());
		}

		Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>(10);
		for (String moduleUnique : moduleUniqueList) {
			authorities.add(new SimpleGrantedAuthority(moduleUnique));
		}
		User user = new User(username, password, enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		return user;
	}

}
