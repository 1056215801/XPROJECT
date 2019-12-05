package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;

public interface IProjectDeclareInfoService {
    // 新增
    public int insert(ProjectDeclareInfoBean record, List<ProjectDeclareNodeBean> list,
        List<ProjectDeclareOrgBean> orgList);

    // 删除
    public int deleteById(BigDecimal id);

    // 批量删除
    public int batchDelete(String[] ids);

    // 修改
    public int updateById(ProjectDeclareInfoBean record, List<ProjectDeclareNodeBean> list);

    // 修改
    public int updateById(ProjectDeclareInfoBean record);

    // 查询
    public ProjectDeclareInfoBean selectById(BigDecimal id);

    // 列表
    public List<ProjectDeclareInfoBean> queryByCond(ProjectDeclareInfoBean record);

    // 我的申报项目列表
    public List<ProjectDeclareInfoBean> queryFromMyApply(BigDecimal accountId);

    // 根据截至日期排序查询
    public List<ProjectDeclareInfoBean> queryByCondOrderBy(ProjectDeclareInfoBean record);

    // 查询列表（不包括预览的）
    public List<ProjectDeclareInfoBean> queryByCondNotPreview(ProjectDeclareInfoBean record);
    // 查询数量（不包括预览的）
    public Integer countByCondNotPreview(ProjectDeclareInfoBean record);

    // 统计上报企业的查询
    public List<ProjectDeclareInfoBean> queryForCount(ProjectDeclareInfoBean record);

    // 更新状态
    Integer updateTime();
}
