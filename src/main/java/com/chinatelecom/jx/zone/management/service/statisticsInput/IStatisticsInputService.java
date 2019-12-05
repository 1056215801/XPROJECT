package com.chinatelecom.jx.zone.management.service.statisticsInput;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.github.pagehelper.Page;

public interface IStatisticsInputService {
	//新增
	public int insert(StatisticsInputBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(StatisticsInputBean record);
	//查询
	public StatisticsInputBean selectById(BigDecimal id);
	//列表
	public List<StatisticsInputBean> queryByCond(StatisticsInputBean record);
	//关联当前用户的填值
	public List<StatisticsInputBean> queryByCondWithValue(StatisticsInputBean record);
	
	//关联当前用户的填值 分页
	public Page<StatisticsInputBean> queryByCondWithValueByPage(StatisticsInputBean record);
	
	public StatisticsInputBean queryStartAndEndTime(
			StatisticsInputBean inputBean);

}
