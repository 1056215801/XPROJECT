package com.chinatelecom.jx.zone.management.service.orgAudit;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditExampleBean;

public interface IOrgAuditExampleService {
	//新增
	public int insert(OrgAuditExampleBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(OrgAuditExampleBean record);
	//查询
	public OrgAuditExampleBean selectById(BigDecimal id);
	//列表
	public List<OrgAuditExampleBean> queryByCond(OrgAuditExampleBean record);
	//我发的项目的所有指标
	List<OrgAuditExampleBean> selectMyCreateExample(BigDecimal accountId,String orgName,
			String declareTitle,String exampleTitle);
	//单位分配的指标
	List<OrgAuditExampleBean> selectMyOrgCreateExample(@Param(value="parentId")BigDecimal parentId,@Param(value="orgName")String orgName,
			@Param(value="declareTitle")String declareTitle,@Param(value="exampleTitle")String exampleTitle);
	//根据项目删除
	public int deleteByDeclareId(BigDecimal id);
	public List<OrgAuditExampleBean> selectExampleAndDeclareOpen(OrgAuditExampleBean record);
}
