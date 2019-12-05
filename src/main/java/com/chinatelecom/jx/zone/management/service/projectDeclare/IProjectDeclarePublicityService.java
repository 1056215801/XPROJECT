package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;

public interface IProjectDeclarePublicityService {
	//新增
	public int insert(ProjectDeclarePublicityBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclarePublicityBean record);
	//查询
	public ProjectDeclarePublicityBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclarePublicityBean> queryByCond(ProjectDeclarePublicityBean record);
	//删除
	public int deleteByDeclareId(BigDecimal id);
	//查询公开已经向自己公开的项目的公示
	public List<ProjectDeclarePublicityBean> queryByIsOpen(ProjectDeclarePublicityBean record);
	//公示管理
	 List<ProjectDeclarePublicityBean> selectWithForegin(ProjectDeclarePublicityBean record);
}
