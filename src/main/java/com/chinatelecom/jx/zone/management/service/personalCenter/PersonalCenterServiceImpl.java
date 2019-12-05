package com.chinatelecom.jx.zone.management.service.personalCenter;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.area.info.bean.AreaInfoBean;
import com.chinatelecom.jx.zone.area.info.bean.AreaInfoBeanExample;
import com.chinatelecom.jx.zone.area.info.bean.AreaInfoBeanExample.Criteria;
import com.chinatelecom.jx.zone.area.info.service.IAreaInfoBeanService;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.company.info.proxy.ICompanyInfoBeanProxy;
import com.chinatelecom.jx.zone.company.info.service.ICompanyInfoBeanService;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanProxy;

/**
 * 
 * @author MR_WU
 *
 */
@Service
@Transactional(rollbackFor=Exception.class)
public class PersonalCenterServiceImpl implements IPersonalCenterService{
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ISystemInfoBeanProxy systemInfoBeanProxy;
	@Autowired
	private ICompanyInfoBeanService companyInfoBeanService;
	@Autowired
	private IAreaInfoBeanService areaInfoBeanService;
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;	
	@Autowired
	private ICompanyInfoBeanProxy companyInfoBeanProxy;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	
	@Value("${XProductionRoleId}")
	private String xProductionRoleId;
	@Autowired(required = true)
	@Qualifier("primaryKeySeq")
	protected SeqIdType primaryKeySeq;
	
	@Override
	public boolean isVisitor() {
		
		String sql = "select b.organization_kind from t_account_organization a left join t_organization_INfo b on a.organization_id = b.organization_id where account_id = ?";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, accountIdSessionHelper.getAccountIdBySessionAttribute());
		
		boolean flag = false;
		for(Map<String, Object> record : list){
			if(record.get("ORGANIZATION_KIND")!=null){
				if(Integer.parseInt(record.get("ORGANIZATION_KIND").toString())==7){
					flag = true;
					break;
				}
			}
		}
		return flag;
	}
	/**
	 * 园区设置
	 */
	@Override
	public List<?> selectParkListForVisitor(BigDecimal parentId, BigDecimal areaId) {
		
		StringBuilder sql = new StringBuilder()
				.append("select t.area_id,t.area_name,e.organization_id,e.organization_name,e.root_id,e.park_name ")
				.append("from (select area_id, area_name from t_area_info start with area_id = 360000 ")
				.append("connect by prior area_id = parent_id and area_kind = 3) t left join ( ")
				.append("select c.organization_id,c.organization_name,c.root_id,c.park_name,nvl(d.area_id,d.province_id)area_id ")
				.append("from (select a.organization_id,a.organization_name,a.root_id,b.organization_name park_name ")
				.append("from t_organization_info a, t_organization_info b where a.root_id = b.organization_id ");

		List<?> organizationList = new ArrayList<>();
		Object[] object = null;
		
		if(parentId != null){
			sql.append("and a.organization_kind = 7 and b.organization_kind = 2 and b.parent_id = ?) c ")
			.append("left join t_park_info d on c.root_id = d.park_id) e on t.area_id = e.area_id ");
			if(areaId != null){
				object = new Object[2];
			}else{
				object = new Object[1];
			}
			object[0] = parentId;
		}else{
			sql.append("and a.organization_kind = 7 and b.organization_kind = 2 ) c ")
			.append("left join t_park_info d on c.root_id = d.park_id) e on t.area_id = e.area_id ");
		}
		
		if(areaId != null){
			sql.append("where t.area_id = ? order by t.area_id");
			if(parentId != null){		
				object[1] = areaId;
			}else{
				object = new Object[1];
				object[0] = areaId;
			}
		}
		
		organizationList = jdbcTemplate.queryForList(sql.toString(), object);
		return organizationList;
	}

	@Override
	public int updateAccountOrganizationInfoForVisitor(
			Map<String, BigDecimal> paramMap) {
		List<?> list = new ArrayList<>();
		int rst = 0;
		BigDecimal syetemId = systemInfoBeanProxy.selectByThisSystemCode().getSystemId();
		String sql1 = "select key_id from t_account_organization_prefer where account_id = ? and root_kind = 2 and system_id = ? ";
		
		list = jdbcTemplate.queryForList(sql1, new Object[]{paramMap.get("accountId"), syetemId});
		
		StringBuilder sql2 = new StringBuilder();
		
		if(list.size()==0){
			sql2.append("insert into t_account_organization_prefer (key_id, account_id, system_id, organization_id, root_id, root_kind, create_time) values (?,?,?,?,?,?,?)");
			rst = jdbcTemplate.update(sql2.toString(), new Object[]{paramMap.get("id"),paramMap.get("accountId"),syetemId,
				paramMap.get("newOrganizationId"),paramMap.get("newRootId"),2,new Timestamp(System.currentTimeMillis())});
		}else{
			sql2.append("update t_account_organization_prefer set organization_id = ?, root_id = ? where account_id = ? and organization_id = ? and root_id = ? ");
			rst = jdbcTemplate.update(sql2.toString(), new Object[]{paramMap.get("newOrganizationId"),paramMap.get("newRootId"),
				paramMap.get("accountId"), paramMap.get("organizationId"), paramMap.get("rootId")});
		}
		
		if(rst==1){
			organizationIdSessionHelper.setOrganizationIdBySessionAttribute(paramMap.get("newOrganizationId"));
			organizationIdSessionHelper.setRootIdBySessionAttribute(paramMap.get("newRootId"));
		}
		return rst;
	}

	@Override
	public List<?> selectCommonParkListForVisitor(BigDecimal accountId) {
		String sql = new StringBuilder().append("select a.organization_id,a.root_id,b.organization_name park_name ")
				.append("from t_account_organization a left join t_organization_info b ")
				.append("on a.root_id = b.organization_id where a.account_id = ? and b.organization_kind = 2").toString();
		return jdbcTemplate.queryForList(sql, new Object[]{accountId});
	}

	@Override
	public ResultBean deleteCommonParkForVisitor(BigDecimal accountId,
			BigDecimal organizationId) {
		String sql1 = "delete from t_account_organization where account_id = ? and organization_id = ? ";
		int rst = jdbcTemplate.update(sql1, new Object[]{accountId, organizationId});
		
		String sql2 = "delete from t_account_organization_role where account_id = ? and organization_id = ? ";
		rst = jdbcTemplate.update(sql2, new Object[]{accountId, organizationId});
		
		ResultBean resultBean = new ResultBean();
		resultBean.setCode(rst==1?1:0);
		resultBean.setMsg(rst==1?"删除常用园区成功！":"删除常用园区失败！");
		
		return resultBean;
	}

	@Override
	public int insertCommonPark(BigDecimal id, BigDecimal accountId,
			BigDecimal organizationId, BigDecimal rootId) {
		StringBuilder sql1 = new StringBuilder().append("insert into t_account_organization ")
				.append("(key_id, account_id, organization_id, root_id, sort_grade, create_time)")
				.append("values (?,?,?,?,?,?)");
		int rst = jdbcTemplate.update(sql1.toString(), 
				new Object[]{id,accountId,organizationId,rootId,1,new Timestamp(System.currentTimeMillis())});
		
		String sql = "select key_id from t_account_organization where account_id = ? and organization_id = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{accountId,organizationId});
		String  keyId = "";
		if(!list.isEmpty()){
			keyId = list.get(0).get("KEY_ID").toString();
		}
			
		StringBuilder sql2 = new StringBuilder().append("insert into t_account_organization_role ")
				.append("(key_id, foreign_id, account_id, organization_id,root_id,role_id, create_time )")
				.append("values (?,?,?,?,?,?,?)");
		rst = jdbcTemplate.update(sql2.toString(),
				new Object[]{id,keyId,accountId,organizationId,rootId,11,new Timestamp(System.currentTimeMillis())});
		return rst;
	}

	@Override
	public List<?> selectAllAreaListByParentIdAndAreaKind(BigDecimal parentId,
			short kind) {
		String sql = "select area_id, area_name from t_area_info where parent_id = ? and area_kind = ? order by area_id asc";
		return jdbcTemplate.queryForList(sql, new Object[]{parentId , kind});
	}
	
	
	@Override
	public CompanyInfoBean selectDefaultCompanyForVisitor(BigDecimal accountId) {
//		boolean flag = isVisitor();
		CompanyInfoBean companyInfoBean = new CompanyInfoBean();
//		if(flag){
			StringBuilder sql1 = new StringBuilder().append("select a.company_id, a.company_name from t_company_info a ")
					.append("join t_account_organization_prefer b on a.company_id = b.organization_id ")
					.append("where b.account_id = ? and (select organization_Kind from t_organization_info where organization_id = b.organization_id) = 3");
			
			List<Map<String, Object>> companyInfoBeanList = jdbcTemplate.queryForList(sql1.toString(),new Object[]{accountId});
			
			if(companyInfoBeanList.size() != 0){
				companyInfoBean.setCompanyId(new BigDecimal(companyInfoBeanList.get(0).get("COMPANY_ID").toString()));
				companyInfoBean.setCompanyName(companyInfoBeanList.get(0).get("COMPANY_NAME").toString());
			}else{
				companyInfoBean = null;
			}
			
//		}else{
//			StringBuilder sql2 = new StringBuilder().append("select a.root_id as organization_id, b.organization_name ")
//					.append("from t_account_organization a left join t_organization_info b ")
//					.append("on a.root_id = b.organization_id where a.account_id = ? and b.organization_kind = 3");
//			List<Map<String, Object>> organizationInfoBeanList = jdbcTemplate.queryForList(sql2.toString(),new Object[]{accountId});
//			
//			if(organizationInfoBeanList.size() != 0){
//				companyInfoBean.setCompanyId(new BigDecimal(organizationInfoBeanList.get(0).get("ORGANIZATION_ID").toString()));
//				companyInfoBean.setCompanyName(organizationInfoBeanList.get(0).get("ORGANIZATION_NAME").toString());
//			}else{
//				companyInfoBean = null;
//			}
//		}
		
		return companyInfoBean;
	}
	@Override
	public List<?> selectCommonComanyListForVisitor(BigDecimal accountId) {
		StringBuilder sql = new StringBuilder().append("select a.organization_id, b.organization_name from t_account_organization a ")
				.append("left join t_organization_info b on a.organization_id = b.organization_id ")
				.append("where a.account_id = ? and b.organization_kind = 3");
		return jdbcTemplate.queryForList(sql.toString(), new Object[]{accountId});
	}
	@Override
	public ResultBean saveCompanyInfoForVisitor(BigDecimal parentId, CompanyInfoBean companyInfoBean) {
		ResultBean resultBean = new ResultBean();
		companyInfoBean.setCompanyNick(companyInfoBean.getCompanyName());
		companyInfoBean.setStatus((short)1);
		companyInfoBean.setCreateKind((short)1);
		companyInfoBean.setSortGrade((long) 100);
		companyInfoBean.setViewKind1((short)0);
		companyInfoBean.setViewKind2((short)0);
		companyInfoBean.setViewKind3((short)0);
		companyInfoBean.setViewKind4((short)0);
		companyInfoBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
		
		BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		companyInfoBean.setSystemId(systemId);
		
		//获取地市下企业列表id
		String sql1 = "select organization_id from t_organization_info where parent_id = ? and organization_kind = 6";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql1, new Object[]{parentId});
		if(!list.isEmpty()){
			parentId = new BigDecimal(list.get(0).get("ORGANIZATION_ID").toString());
		}else{
			resultBean.setCode(-1);
			resultBean.setMsg("该地区无挂靠企业列表！");
			return resultBean;
		}
		
		InvokeInfoBean<?> rst1 = companyInfoBeanService.validateInsertSelective(parentId, companyInfoBean);
		
		if (rst1.isSuccess()) {
			StringBuilder sql = new StringBuilder().append("insert into t_account_organization ")
				.append("(key_id, account_id, organization_id, root_id, sort_grade, create_time)")
				.append("values (?,?,?,?,?,?)");
			int rst = jdbcTemplate.update(sql.toString(), 
				new Object[]{primaryKeySeq.getNextSeqIdToBigDecimal(), companyInfoBean.getCreaterId(),companyInfoBean.getCompanyId()
						,companyInfoBean.getCompanyId(),2,new Timestamp(System.currentTimeMillis())});

			//判断该账户是否开通产品展销平台
			hasProductRole(companyInfoBean.getCreaterId());
			
			if(rst==1){
				resultBean.setCode(1);
				resultBean.setMsg("企业创建成功！");
			}else{
				resultBean.setCode(-1);
				resultBean.setMsg(rst1.getErrorMsg());
			}
		} else {
			resultBean.setCode(-1);
			resultBean.setMsg("企业创建失败！");
		}
		
		return resultBean;
	}
	@Override
	public ResultBean saveDefaultCompanyInfoForVisitor(BigDecimal accountId,
			BigDecimal companyId) {
		ResultBean resultBean = new ResultBean();
		
		CompanyInfoBean companyInfoBean = companyInfoBeanProxy.selectByPrimaryKey(companyId);
		if(companyInfoBean==null){
			resultBean.setCode(0);
			resultBean.setMsg("企业信息不存在！");
			return resultBean;
		}
		
		BigDecimal systemId = companyInfoBean.getSystemId();
		
		//清除其他默认企业及游客列表
		StringBuilder sql1 = new StringBuilder()
					.append("delete from t_account_organization_prefer ")
					.append("where account_id = ? ");
		int rst = jdbcTemplate.update(sql1.toString(),new Object[]{accountId});
		
		StringBuilder sql2 = new StringBuilder().append("insert into t_account_organization_prefer ")
				.append("(key_id, account_id, system_id, organization_id, root_id, root_kind, create_time)")
				.append("values (?,?,?,?,?,?,?)");
		rst = jdbcTemplate.update(sql2.toString(), new Object[]{
				primaryKeySeq.getNextSeqIdToBigDecimal(), accountId, systemId, 
				companyId, companyId, 3, new Timestamp(System.currentTimeMillis())});
		
		resultBean.setCode(rst==1?1:0);
		resultBean.setMsg(rst==1?"设置默认企业成功，重新登录账号生效！":"设置默认企业失败！");
		
		return resultBean;
	}
	
	@Override
	public ResultBean deleteCommonCompanyForVisitor(BigDecimal accountId,
			BigDecimal companyId) {
		ResultBean resultBean = new ResultBean();
		BigDecimal systemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
		CompanyInfoBean companyInfoBean = companyInfoBeanProxy.selectByPrimaryKey(companyId);
		
		
		/*StringBuilder sql1 = new StringBuilder().append("select key_id from t_account_organization_prefer ")
				.append("where account_id = ? and organization_id = ? and system_id = ?");
		List<?> list = jdbcTemplate.queryForList(sql1.toString(), new Object[]{accountId, companyId, systemId});
		
		if(list.size()>0){
			resultBean.setCode(0);
			resultBean.setMsg("不能删除默认企业！");
			return resultBean;
		}*/
		
		if(companyInfoBean==null){
			resultBean.setCode(0);
			resultBean.setMsg("请输入合法id！");
			return resultBean;
		}
		
		StringBuilder sql0 = new StringBuilder()
				.append("select count(1) total from t_account_organization where ")
				.append("account_id = ? and organization_id = ?");
		List<Map<String, Object>> list0 = jdbcTemplate.queryForList(sql0.toString(), new Object[]{accountId, companyId});
		if(list0.isEmpty()||Integer.parseInt(list0.get(0).get("total").toString())==0){
			resultBean.setCode(0);
			resultBean.setMsg("非法请求！");
			return resultBean;
		}
		
		//如果是默认企业则删除t_account_organization_prefer表中信息
		StringBuilder sql1 = new StringBuilder().append("delete from t_account_organization_prefer ")
				.append("where account_id = ? and organization_id = ? and system_id = ? and root_kind = 3");
		int rst = jdbcTemplate.update(sql1.toString(), new Object[]{accountId, companyId, systemId});
		
		StringBuilder sql2 = new StringBuilder()
					.append("delete from t_account_organization where ")
					.append("account_id = ? and organization_id = ?");
		rst = jdbcTemplate.update(sql2.toString(), new Object[]{accountId, companyId});
		
		
		if(accountId.equals(companyInfoBean.getCreaterId())&&Integer.parseInt(companyInfoBean.getSystemId().toString())==12){
			StringBuilder sql3 = new StringBuilder()
					.append("delete from t_company_info where ")
					.append("company_id = ? and creater_id = ? and create_kind = 1");
		
			rst = jdbcTemplate.update(sql3.toString(), new Object[]{companyId, accountId});
			
			StringBuilder sql4 = new StringBuilder().append("delete from t_organization_info where ").append("organization_id = ?");
			rst = jdbcTemplate.update(sql4.toString(), new Object[]{companyId});
		}
		
		
		resultBean.setCode(rst==1?1:0);
		resultBean.setMsg(rst==1?"删除企业成功！":"删除企业失败！");
		
		//如果对应企业全部删除，则删除产品展销角色
		String sql5 = "select count(1) total from t_account_organization a "
				+ "inner join t_company_info b on a.organization_id = b.company_id where a.account_id = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql5, new Object[] { accountId });
		if (Integer.parseInt(list.get(0).get("TOTAL").toString())==0) { 
			String sql6 = "delete from t_account_organization_role where account_id = ? and role_id = ?";
			jdbcTemplate.update(sql6, new Object[] { accountId, xProductionRoleId });
		}

		return resultBean;
	}
	@Override
	public ResultBean selectAreaInfo(BigDecimal parentId) {
		AreaInfoBeanExample example = new AreaInfoBeanExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		criteria.andAreaKindBetween((short)1, (short)4);
		example.setOrderByClause("area_id asc");  
		List<AreaInfoBean> list = areaInfoBeanService.selectByExample(example);
		ResultBean resultBean = new ResultBean();
		if(list.size()==0){
			resultBean.setCode(0);
		}else{
			resultBean.setCode(1);
			resultBean.setValue(list);
		}
		return resultBean;
	}
	@Override
	public List<?> parkList() {
		String sql = "select park_id, park_name from t_park_info where park_kind != -1";
		return jdbcTemplate.queryForList(sql);
	}
	
	
	/**
	 * 新版企业编辑相关方法
	 */
	
	@Override
	public List<JSONObject> selectCompanyListByAccountId(BigDecimal accountId) {
		
		String sql = "select t.* from t_company_info t where t.company_id in "
				+"(select a.organization_id from t_account_organization a "
				+"left join t_organization_info b on a.organization_id = b.organization_id "
				+"where a.account_id = ? and b.organization_kind = 3) order by create_time desc";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{accountId});
		
		List<JSONObject> newList = new ArrayList<>();
		if(!list.isEmpty()){
			for(Map<String, Object> record : list){
				JSONObject jo = new JSONObject();
				jo.put("companyName", record.get("COMPANY_NAME"));
				jo.put("socialCreditNo", record.get("SOCIAL_CREDIT_NO"));
				jo.put("operationMain", record.get("OPERATION_MAIN"));
				jo.put("provinceName", record.get("PROVINCE_NAME"));
				jo.put("areaName", record.get("AREA_NAME"));
				jo.put("spaceName", record.get("SPACE_NAME"));
				jo.put("systemId", record.get("SYSTEM_ID"));
				jo.put("companyId", record.get("COMPANY_ID"));
				jo.put("createrId", record.get("CREATER_ID"));
				newList.add(jo);
			}
		}
		
		return newList;
	}
	@Override
	public ResultBean updateCompanyInfo(BigDecimal parentId, CompanyInfoBean companyInfoBean) {
		CompanyInfoBean companyInfo = companyInfoBeanService.selectByPrimaryKey(companyInfoBean.getCompanyId());
		
		ResultBean resultBean = new ResultBean();
		//获取地市下企业列表id
		String sql1 = "select organization_id from t_organization_info where parent_id = ? and organization_kind = 6";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql1, new Object[]{parentId});
		if(!list.isEmpty()){
			parentId = new BigDecimal(list.get(0).get("ORGANIZATION_ID").toString());
		}else{
			resultBean.setCode(-1);
			resultBean.setMsg("该地区无挂靠企业列表！");
			return resultBean;
		}
		
		if(companyInfo==null){
			resultBean.setCode(-1);
			resultBean.setMsg("企业信息不存在！");
		}else{
			MyBeanUtils.copyProperties(companyInfoBean, companyInfo);
			InvokeInfoBean<Integer> rst = companyInfoBeanService.validateUpdateByPrimaryKeySelective(parentId, companyInfo);
			resultBean.setCode(rst.getValue()>0?1:0);
			resultBean.setMsg(rst.getValue()>0?"更新成功！":"更新失败！");
		}
		
		return resultBean;
	}
	
	@Override
	public ResultBean connectCompanyInfo(BigDecimal accountId, BigDecimal companyId) {
		ResultBean resultBean = new ResultBean();
		
		/**
		 * 判断该账号是否与该企业关联
		 */
		String sql1 = "select * from t_account_organization where account_id = ? and organization_id = ? ";
		List<?> list = jdbcTemplate.queryForList(sql1, new Object[]{accountId, companyId});
		if(!list.isEmpty()){
			resultBean.setCode(0);
			resultBean.setMsg("账号已关联该企业！");
			return resultBean;
		}
		
		
		StringBuilder sql2 = new StringBuilder().append("insert into t_account_organization ")
				.append("(key_id, account_id, organization_id, root_id, sort_grade, create_time)")
				.append("values (?,?,?,?,?,?)");
		int rst = jdbcTemplate.update(sql2.toString(), 
				new Object[]{primaryKeySeq.getNextSeqIdToBigDecimal(),accountId,companyId,companyId,2,new Timestamp(System.currentTimeMillis())});
		
		
		resultBean.setCode(rst);
		resultBean.setMsg(rst>0?"关联成功！":"关联失败！");
		//判断该账户是否开通产品展销平台
		hasProductRole(accountId);
		return resultBean;
	}
	
	/**
	 * 是否有产品展销角色，没有则赋予
	 */
	private void hasProductRole(BigDecimal accountId){
		// 判断该账户是否有关联企业信息
		String sql = "select a.key_id, a.organization_id " + "from t_account_organization a "
				+ "inner join t_company_info b " + "on a.organization_id = b.company_id " + "where a.account_id = ? "
				+ "order by a.create_time asc";

		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { accountId });

		if (!list.isEmpty()) {
			// 判读是否赋予产品展销角色
			String sql2 = "select count(1) total from t_account_organization_role where account_id = ? and role_id = ?";

			List<Map<String, Object>> list2 = jdbcTemplate.queryForList(sql2,
					new Object[] { accountId, xProductionRoleId });

			//赋予角色
			if (Integer.parseInt(list2.get(0).get("TOTAL").toString())==0) { 
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
								organizatioId, organizatioId, xProductionRoleId, new Timestamp(System.currentTimeMillis()) });

				//保存失败数据回滚
				if (rst <= 0) { 
					throw new RuntimeException("账号分配产品展销角色失败，数据回滚！");
				}
			}

		} 
	}
	
}
