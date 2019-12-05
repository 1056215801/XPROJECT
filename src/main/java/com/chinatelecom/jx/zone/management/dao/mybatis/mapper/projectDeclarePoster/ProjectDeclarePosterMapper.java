

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclarePoster;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclarePoster.ProjectDeclarePosterBean;

public interface ProjectDeclarePosterMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclarePosterBean record);

    int insertSelective(ProjectDeclarePosterBean record);

    ProjectDeclarePosterBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclarePosterBean record);

    int updateByPrimaryKey(ProjectDeclarePosterBean record);
    
    //ProjectDeclarePosterBean selectWithForeignById(BigDecimal id);

   	List<ProjectDeclarePosterBean> queryByCond(ProjectDeclarePosterBean record);
   	
   	//List<ProjectDeclarePosterBean> queryByCondWithForeign(ProjectDeclarePosterBean record);
}