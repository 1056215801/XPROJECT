

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;

public interface ProjectDeclareOrgMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareOrgBean record);

    int insertSelective(ProjectDeclareOrgBean record);

    ProjectDeclareOrgBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareOrgBean record);

    int updateByPrimaryKey(ProjectDeclareOrgBean record);
    
    //ProjectDeclareOrgBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclareOrgBean> queryByCond(ProjectDeclareOrgBean record);
   	
   	//List<ProjectDeclareOrgBean> queryByCondWithForeign(ProjectDeclareOrgBean record);
}