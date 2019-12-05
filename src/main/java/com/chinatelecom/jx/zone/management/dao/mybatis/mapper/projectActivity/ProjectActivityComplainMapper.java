

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityComplainBean;

public interface ProjectActivityComplainMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectActivityComplainBean record);

    int insertSelective(ProjectActivityComplainBean record);

    ProjectActivityComplainBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectActivityComplainBean record);

    int updateByPrimaryKey(ProjectActivityComplainBean record);
    
    //ProjectActivityComplainBean selectWithForeignById(BigDecimal id);

   	List<ProjectActivityComplainBean> queryByCond(ProjectActivityComplainBean record);

	List<ProjectActivityComplainBean> queryByCondRewrite(
			ProjectActivityComplainBean projectActivityComplainBean);
   	
   	//List<ProjectActivityComplainBean> queryByCondWithForeign(ProjectActivityComplainBean record);
}