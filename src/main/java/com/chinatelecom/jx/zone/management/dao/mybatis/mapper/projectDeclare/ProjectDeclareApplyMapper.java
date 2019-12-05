

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;

public interface ProjectDeclareApplyMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareApplyBean record);

    int insertSelective(ProjectDeclareApplyBean record);

    ProjectDeclareApplyBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareApplyBean record);

    int updateByPrimaryKey(ProjectDeclareApplyBean record);
    
    //ProjectDeclareApplyBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclareApplyBean> queryByCond(ProjectDeclareApplyBean record);
   	
   /*	List<ProjectDeclareApplyBean> selectApplyByMyPro(@Param(value="parentId")BigDecimal parentId,@Param(value="companyName")String companyName,@Param(value="orderByClause")String orderByClause);*/
   	
   	int deleteByDeclareId(BigDecimal id);
   	
    List<ProjectDeclareApplyBean> selectAuditedList(@Param(value="declareId")BigDecimal declareId,@Param(value="auditOrgId")BigDecimal auditOrgId,@Param(value="companyName")String companyName);
    
    List<ProjectDeclareApplyBean> selectReportedList(@Param(value="declareId")BigDecimal declareId,@Param(value="auditOrgId")BigDecimal auditOrgId,@Param(value="companyName")String companyName);
    List<ProjectDeclareApplyBean> selectApplyWithForegin(ProjectDeclareApplyBean record);
   	//List<ProjectDeclareApplyBean> queryByCondWithForeign(ProjectDeclareApplyBean record);
}