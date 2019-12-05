package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;

public interface IProjectDeclareOrgService {
	//新增
	public int insert(ProjectDeclareOrgBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclareOrgBean record);
	//查询
	public ProjectDeclareOrgBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclareOrgBean> queryByCond(ProjectDeclareOrgBean record);

}
