

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.github.pagehelper.Page;

public interface ProjectActivityInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectActivityInfoBean record);

    int insertSelective(ProjectActivityInfoBean record);

    ProjectActivityInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectActivityInfoBean record);

    int updateByPrimaryKey(ProjectActivityInfoBean record);
    
    //ProjectActivityInfoBean selectWithForeignById(BigDecimal id);

   	List<ProjectActivityInfoBean> queryByCond(ProjectActivityInfoBean record);

	Page<ProjectActivityInfoBean> queryByEnterAccount(ProjectActivityInfoBean projectActivityInfo);

	int queryTotalSize(ProjectActivityInfoBean projectActivityInfoBean);
   	
   	//List<ProjectActivityInfoBean> queryByCondWithForeign(ProjectActivityInfoBean record);
}