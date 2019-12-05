

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.orgAudit;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditExampleBean;

public interface OrgAuditExampleMapper {
	int deleteByPrimaryKey(BigDecimal id);

	int insert(OrgAuditExampleBean record);

	int insertSelective(OrgAuditExampleBean record);

	OrgAuditExampleBean selectByPrimaryKey(BigDecimal id);

	int updateByPrimaryKeySelective(OrgAuditExampleBean record);

	int updateByPrimaryKey(OrgAuditExampleBean record);

	//OrgAuditExampleBean selectWithForeignById(BigDecimal id);

	List<OrgAuditExampleBean> queryByCond(OrgAuditExampleBean record);
	List<OrgAuditExampleBean> selectExampleAndDeclareOpen(OrgAuditExampleBean record);

	//我发的项目的所有指标
	List<OrgAuditExampleBean> selectMyCreateExample(@Param(value="accountId")BigDecimal accountId,@Param(value="orgName")String orgName,
			@Param(value="declareTitle")String declareTitle,@Param(value="exampleTitle")String exampleTitle);
	//单位分配的指标
	List<OrgAuditExampleBean> selectMyOrgCreateExample(@Param(value="parentId")BigDecimal parentId,@Param(value="orgName")String orgName,
			@Param(value="declareTitle")String declareTitle,@Param(value="exampleTitle")String exampleTitle);

	int deleteByDeclareId(BigDecimal id);
	//List<OrgAuditExampleBean> queryByCondWithForeign(OrgAuditExampleBean record);
}