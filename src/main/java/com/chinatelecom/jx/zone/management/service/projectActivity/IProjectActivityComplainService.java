package com.chinatelecom.jx.zone.management.service.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityComplainBean;

public interface IProjectActivityComplainService {
	//新增
	public int insert(ProjectActivityComplainBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectActivityComplainBean record);
	//查询
	public ProjectActivityComplainBean selectById(BigDecimal id);
	//列表
	public List<ProjectActivityComplainBean> queryByCond(ProjectActivityComplainBean record);
	
	public List<ProjectActivityComplainBean> queryByCondRewrite(
			ProjectActivityComplainBean projectActivityComplainBean);

}
