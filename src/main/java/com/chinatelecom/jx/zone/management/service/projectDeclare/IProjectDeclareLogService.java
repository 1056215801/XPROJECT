package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareLogBean;

public interface IProjectDeclareLogService {
	//新增
	public int insert(ProjectDeclareLogBean record);
	//删除
	public int deleteById(BigDecimal id);
	//删除
	public int deleteByApplyId(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclareLogBean record);
	//查询
	public ProjectDeclareLogBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclareLogBean> queryByCond(ProjectDeclareLogBean record);

}
