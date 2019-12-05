package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;

public interface IProjectDeclareNodeService {
    // 新增
    public int insert(ProjectDeclareNodeBean record);

    // 删除
    public int deleteById(BigDecimal id);

    // 批量删除
    public int batchDelete(String[] ids);

    // 修改
    public int updateById(ProjectDeclareNodeBean record);

    // 查询
    public ProjectDeclareNodeBean selectById(BigDecimal id);

    // 列表
    public List<ProjectDeclareNodeBean> queryByCond(ProjectDeclareNodeBean record);

    // 删除
    public int deleteByDecalreId(BigDecimal id);

    // 查询所有记录
    List<ProjectDeclareNodeBean> selectAll();

    // 更新剩余时间按
    Integer updateTime();

    // 更新剩余时间按
    Integer updateTimeDay();
}
