

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;

public interface ProjectDeclareUpgradeMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareUpgradeBean record);

    int insertSelective(ProjectDeclareUpgradeBean record);

    ProjectDeclareUpgradeBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareUpgradeBean record);

    int updateByPrimaryKey(ProjectDeclareUpgradeBean record);
    
    //ProjectDeclareUpgradeBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclareUpgradeBean> queryByCond(ProjectDeclareUpgradeBean record);
   	
   	//List<ProjectDeclareUpgradeBean> queryByCondWithForeign(ProjectDeclareUpgradeBean record);
}