package com.chinatelecom.jx.zone.management.service.projectActivity;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;

public interface IProjectActivityTagService {
	//新增
	public int insert(ProjectActivityTagBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public ResultBean updateById(ProjectActivityTagBean record);
	//查询
	public ProjectActivityTagBean selectById(BigDecimal id);
	//列表
	public List<ProjectActivityTagBean> queryByCond(ProjectActivityTagBean record);
	
	public ResultBean insertByValidate(ProjectActivityTagBean info, Integer type);
	
	public ResultBean deleteByValidate(BigDecimal id, String tagName, Integer kind);

}
