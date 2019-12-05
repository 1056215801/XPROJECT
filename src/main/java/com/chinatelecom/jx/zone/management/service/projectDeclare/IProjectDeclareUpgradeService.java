package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;

public interface IProjectDeclareUpgradeService {
	//新增
	public int insert(ProjectDeclareUpgradeBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclareUpgradeBean record);
	//查询
	public ProjectDeclareUpgradeBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclareUpgradeBean> queryByCond(ProjectDeclareUpgradeBean record);

}
