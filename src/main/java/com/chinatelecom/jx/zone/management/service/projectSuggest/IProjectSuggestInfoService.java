package com.chinatelecom.jx.zone.management.service.projectSuggest;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectSuggest.ProjectSuggestInfoBean;

public interface IProjectSuggestInfoService {
	//新增
	public int insert(ProjectSuggestInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectSuggestInfoBean record);
	//查询
	public ProjectSuggestInfoBean selectById(BigDecimal id);
	//列表
	public List<ProjectSuggestInfoBean> queryByCond(ProjectSuggestInfoBean record);
	//状态不为2的 列表
	public List<ProjectSuggestInfoBean> queryByCondNoStatus(ProjectSuggestInfoBean record);
	//按起止时间、状态的 列表
	public List<ProjectSuggestInfoBean> queryByCondWithForeign(ProjectSuggestInfoBean record);

}
