

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectSuggest;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectSuggest.ProjectSuggestInfoBean;

public interface ProjectSuggestInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectSuggestInfoBean record);

    int insertSelective(ProjectSuggestInfoBean record);

    ProjectSuggestInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectSuggestInfoBean record);

    int updateByPrimaryKey(ProjectSuggestInfoBean record);
    
    //ProjectSuggestInfoBean selectWithForeignById(BigDecimal id);

   	List<ProjectSuggestInfoBean> queryByCond(ProjectSuggestInfoBean record);
   	
   	List<ProjectSuggestInfoBean> queryByCondNoStatus(ProjectSuggestInfoBean record);
   	
   	List<ProjectSuggestInfoBean> queryByCondWithForeign(ProjectSuggestInfoBean record);
}