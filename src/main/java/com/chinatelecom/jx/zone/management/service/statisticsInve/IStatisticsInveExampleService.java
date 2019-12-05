package com.chinatelecom.jx.zone.management.service.statisticsInve;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveExampleBean;

public interface IStatisticsInveExampleService {
	//新增
	public int insert(StatisticsInveExampleBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(StatisticsInveExampleBean record);
	//查询
	public StatisticsInveExampleBean selectById(BigDecimal id);
	//列表
	public List<StatisticsInveExampleBean> queryByCond(StatisticsInveExampleBean record);

}
