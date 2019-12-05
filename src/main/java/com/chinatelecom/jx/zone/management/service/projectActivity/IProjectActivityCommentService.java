package com.chinatelecom.jx.zone.management.service.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.github.pagehelper.Page;

public interface IProjectActivityCommentService {
	//新增
	public int insert(ProjectActivityCommentBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ProjectActivityCommentBean record);
	//查询
	public ProjectActivityCommentBean selectById(BigDecimal id);
	//列表
	public List<ProjectActivityCommentBean> queryByCond(ProjectActivityCommentBean record);
	public Page<ProjectActivityCommentBean> queryByCommentAccount(
			ProjectActivityCommentBean projectActivityCommentBean);

}
