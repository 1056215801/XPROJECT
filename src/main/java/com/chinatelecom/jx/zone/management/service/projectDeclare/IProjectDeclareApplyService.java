package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;

public interface IProjectDeclareApplyService {
	//新增
	public int insert(ProjectDeclareApplyBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclareApplyBean record);
	//查询
	public ProjectDeclareApplyBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclareApplyBean> queryByCond(ProjectDeclareApplyBean record);
	//删除
	public int deleteByDeclareId(BigDecimal id);
	//已审核申报企业列表
	public List<ProjectDeclareApplyBean> selectAuditedList(BigDecimal declareId,BigDecimal auditOrgId,String companyName);
	
	public List<ProjectDeclareApplyBean> selectReportedList(BigDecimal declareId,BigDecimal auditOrgId,String companyName);
	
	//普通修改
    public int baseUpdateById(ProjectDeclareApplyBean record);
    
    public List<ProjectDeclareApplyBean> selectApplyWithForegin(ProjectDeclareApplyBean record);
}
