package com.chinatelecom.jx.zone.management.service.showLogin;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.bean.SeqIdType;

@Service
@Transactional(rollbackFor = Exception.class)
public class ShowLoginServiceImpl implements IShowLoginService {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Value("${XProductionRoleId}")
	private String XProductionRoleId;
	@Autowired(required = true)
	@Qualifier("primaryKeySeq")
	protected SeqIdType primaryKeySeq;
	@Value("${UrlPath}")
	private String UrlPath;
	@Value("${JxGovCaClientId}")
	private String jxGovCaClientId;
	@Value("${accessAllowUrl}")
	private String accessAllowUrl;
	@Value("${webSocketPath}")
	private String webSocketPath;
	@Override
	public boolean isComplete(BigDecimal accountId) {
		boolean flag = true;

		// 判断该账户是否有关联企业信息
		String sql = "select a.key_id, a.organization_id " + "from t_account_organization a "
				+ "inner join t_company_info b " + "on a.organization_id = b.company_id " + "where a.account_id = ? "
				+ "order by a.create_time asc";

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { accountId });

		if (!list.isEmpty()) {
			// 判读是否赋予产品展销角色
			String sql2 = "select count(1) total from t_account_organization_role where account_id = ? and role_id = ?";

			List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2,
					new Object[] { accountId, XProductionRoleId });

			if (Integer.parseInt(list2.get(0).get("TOTAL").toString())==0) { //赋予角色
				//查看是否设置默认企业
				String sql3 = "select * from t_account_organization_prefer where account_id = ? and root_kind = 3";
				List<Map<String, Object>> list3 = jdbcTemplate.queryForList(sql3, new Object[] { accountId });
				
				Object keyId = null;
				Object organizatioId = null;
				if(!list3.isEmpty()){
					keyId = list3.get(0).get("KEY_ID");
					organizatioId = list3.get(0).get("ORGANIZATION_ID");
				}else{
					keyId = list.get(0).get("KEY_ID");
					organizatioId = list.get(0).get("ORGANIZATION_ID");
				}
				
				
				String sql4 = "insert into t_account_organization_role (key_id, foreign_id, account_id, organization_id, root_id, role_id, create_time) values (?,?,?,?,?,?,?)";
				int rst = jdbcTemplate.update(sql4,
						new Object[] { primaryKeySeq.getNextSeqIdToBigDecimal(), keyId, accountId, 
								organizatioId, organizatioId, XProductionRoleId, new Timestamp(System.currentTimeMillis()) });

				if (rst <= 0) { //保存失败数据回滚
					throw new RuntimeException("账号分配产品展销角色失败，数据回滚！");
				}
			}

		} else {
			flag = false;
		}

		return flag;
	}
	@Override
	public String getUrlPath() {
		return UrlPath;
	}
	@Override
	public String getJxGovCaClientId() {
		return jxGovCaClientId;
	}
	@Override
	public String getAccessAllowUrl() {
		return accessAllowUrl;
	}
	@Override
	public String getWebSocketPath() {
		return webSocketPath;
	}
}
