package com.chinatelecom.jx.zone.management.service.projectDeclarePoster;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectDeclarePoster.ProjectDeclarePosterBean;

public interface IProjectDeclarePosterService {
	//新增
	public int insert(ProjectDeclarePosterBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectDeclarePosterBean record);
	//查询
	public ProjectDeclarePosterBean selectById(BigDecimal id);
	//列表
	public List<ProjectDeclarePosterBean> queryByCond(ProjectDeclarePosterBean record);

}
