
package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;

public interface ProjectDeclareInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ProjectDeclareInfoBean record);

    int insertSelective(ProjectDeclareInfoBean record);

    ProjectDeclareInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareInfoBean record);

    int updateByPrimaryKey(ProjectDeclareInfoBean record);

    // ProjectDeclareInfoBean selectWithForeignById(BigDecimal id);

    List<ProjectDeclareInfoBean> queryByCond(ProjectDeclareInfoBean record);

    List<ProjectDeclareInfoBean> queryFromMyApply(BigDecimal accountId);

    List<ProjectDeclareInfoBean> queryByCondOrderBy(ProjectDeclareInfoBean record);

    List<ProjectDeclareInfoBean> queryByCondNotPreview(ProjectDeclareInfoBean record);
    
    Integer countByCondNotPreview(ProjectDeclareInfoBean record);

    List<ProjectDeclareInfoBean> queryForCount(ProjectDeclareInfoBean record);

    // List<ProjectDeclareInfoBean> queryByCondWithForeign(ProjectDeclareInfoBean record);
    // 更新项目状态
    Integer updateTime();
}