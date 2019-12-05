

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareAuditlogBean;

public interface ProjectDeclareAuditlogMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareAuditlogBean record);

    int insertSelective(ProjectDeclareAuditlogBean record);

    ProjectDeclareAuditlogBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareAuditlogBean record);

    int updateByPrimaryKey(ProjectDeclareAuditlogBean record);
    
    //ProjectDeclareAuditlogBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclareAuditlogBean> queryByCond(ProjectDeclareAuditlogBean record);
     //删除
  	int deleteByApplyId(BigDecimal id);
   	//List<ProjectDeclareAuditlogBean> queryByCondWithForeign(ProjectDeclareAuditlogBean record);
}