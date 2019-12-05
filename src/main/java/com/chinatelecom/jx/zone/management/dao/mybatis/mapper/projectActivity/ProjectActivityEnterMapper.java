

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;

public interface ProjectActivityEnterMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectActivityEnterBean record);

    int insertSelective(ProjectActivityEnterBean record);

    ProjectActivityEnterBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectActivityEnterBean record);

    int updateByPrimaryKey(ProjectActivityEnterBean record);
    
    //ProjectActivityEnterBean selectWithForeignById(BigDecimal id);

   	List<ProjectActivityEnterBean> queryByCond(ProjectActivityEnterBean record);

	List<ProjectActivityEnterBean> queryByActivityId(
			ProjectActivityEnterBean projectActivityEnterBean);
   	
   	//List<ProjectActivityEnterBean> queryByCondWithForeign(ProjectActivityEnterBean record);
}