

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;

public interface ProjectActivityTagMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectActivityTagBean record);

    int insertSelective(ProjectActivityTagBean record);

    ProjectActivityTagBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectActivityTagBean record);

    int updateByPrimaryKey(ProjectActivityTagBean record);
    
    //ProjectActivityTagBean selectWithForeignById(BigDecimal id);

   	List<ProjectActivityTagBean> queryByCond(ProjectActivityTagBean record);
   	
   	//List<ProjectActivityTagBean> queryByCondWithForeign(ProjectActivityTagBean record);
}