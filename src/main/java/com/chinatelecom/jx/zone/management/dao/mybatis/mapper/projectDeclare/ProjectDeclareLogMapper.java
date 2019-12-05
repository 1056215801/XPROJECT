

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareLogBean;

public interface ProjectDeclareLogMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareLogBean record);

    int insertSelective(ProjectDeclareLogBean record);

    ProjectDeclareLogBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareLogBean record);

    int updateByPrimaryKey(ProjectDeclareLogBean record);
    
    //ProjectDeclareLogBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclareLogBean> queryByCond(ProjectDeclareLogBean record);
   	
	//删除
	int deleteByApplyId(BigDecimal id);
   	//List<ProjectDeclareLogBean> queryByCondWithForeign(ProjectDeclareLogBean record);
}