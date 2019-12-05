package com.chinatelecom.jx.zone.management.service.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.github.pagehelper.Page;

public interface IProjectActivityInfoService {
	//新增
	public int insert(ProjectActivityInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectActivityInfoBean record);
	//查询
	public ProjectActivityInfoBean selectById(BigDecimal id);
	//列表
	public List<ProjectActivityInfoBean> queryByCond(ProjectActivityInfoBean record);
	//查找参与列表
	public Page<ProjectActivityInfoBean> queryByEnterAccount(
			ProjectActivityInfoBean projectActivityInfo);
	//获取列表总数
	public int queryTotalSize(ProjectActivityInfoBean projectActivityInfoBean);

}
