package com.chinatelecom.jx.zone.management.service.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;

public interface IProjectActivityEnterService {
	//新增
	public int insert(ProjectActivityEnterBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectActivityEnterBean record);
	//查询
	public ProjectActivityEnterBean selectById(BigDecimal id);
	//列表
	public List<ProjectActivityEnterBean> queryByCond(ProjectActivityEnterBean record);
	public List<ProjectActivityEnterBean> queryByActivityId(
			ProjectActivityEnterBean projectActivityEnterBean);

}
