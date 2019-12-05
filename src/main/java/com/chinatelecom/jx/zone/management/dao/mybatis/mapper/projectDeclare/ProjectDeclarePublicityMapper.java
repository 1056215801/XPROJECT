

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;

public interface ProjectDeclarePublicityMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclarePublicityBean record);

    int insertSelective(ProjectDeclarePublicityBean record);

    ProjectDeclarePublicityBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclarePublicityBean record);

    int updateByPrimaryKey(ProjectDeclarePublicityBean record);
    
    //ProjectDeclarePublicityBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclarePublicityBean> queryByCond(ProjectDeclarePublicityBean record);
    int deleteByDeclareId(BigDecimal id);
    
    List<ProjectDeclarePublicityBean> queryByIsOpen(ProjectDeclarePublicityBean record);
    List<ProjectDeclarePublicityBean> selectWithForegin(ProjectDeclarePublicityBean record);
   	//List<ProjectDeclarePublicityBean> queryByCondWithForeign(ProjectDeclarePublicityBean record);
}