
package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;

public interface ProjectDeclareNodeMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int deleteByDeclareId(BigDecimal id);

    int insert(ProjectDeclareNodeBean record);

    int insertSelective(ProjectDeclareNodeBean record);

    ProjectDeclareNodeBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ProjectDeclareNodeBean record);

    int updateByPrimaryKey(ProjectDeclareNodeBean record);

    // ProjectDeclareNodeBean selectWithForeignById(BigDecimal id);

    List<ProjectDeclareNodeBean> queryByCond(ProjectDeclareNodeBean record);

    // List<ProjectDeclareNodeBean> queryByCondWithForeign(ProjectDeclareNodeBean record);

    // 查询所有记录
    List<ProjectDeclareNodeBean> selectAll();

    // 更新剩余时间
    Integer updateTime();

    Integer updateTimeDay();

}