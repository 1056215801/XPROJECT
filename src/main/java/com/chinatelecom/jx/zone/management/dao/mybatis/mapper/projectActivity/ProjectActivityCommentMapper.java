

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.github.pagehelper.Page;

public interface ProjectActivityCommentMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectActivityCommentBean record);

    int insertSelective(ProjectActivityCommentBean record);

    ProjectActivityCommentBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectActivityCommentBean record);

    int updateByPrimaryKey(ProjectActivityCommentBean record);
    
    //ProjectActivityCommentBean selectWithForeignById(BigDecimal id);

   	List<ProjectActivityCommentBean> queryByCond(ProjectActivityCommentBean record);

	Page<ProjectActivityCommentBean> queryByCommentAccount(
			ProjectActivityCommentBean projectActivityCommentBean);
   	
   	//List<ProjectActivityCommentBean> queryByCondWithForeign(ProjectActivityCommentBean record);
	
	int deleteByCond(ProjectActivityCommentBean record);
}