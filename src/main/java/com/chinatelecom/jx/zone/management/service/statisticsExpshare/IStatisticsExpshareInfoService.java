package com.chinatelecom.jx.zone.management.service.statisticsExpshare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsExpshare.StatisticsExpshareInfoBean;

public interface IStatisticsExpshareInfoService {
	//新增
	public int insert(StatisticsExpshareInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(StatisticsExpshareInfoBean record);
	//查询
	public StatisticsExpshareInfoBean selectById(BigDecimal id);
	//列表
	public List<StatisticsExpshareInfoBean> queryByCond(StatisticsExpshareInfoBean record);
	
	public List<StatisticsExpshareInfoBean> queryStatisticsListByCity(
			StatisticsExpshareInfoBean info);
	
	public List<StatisticsExpshareInfoBean> queryStatisticsListByUnit(
			StatisticsExpshareInfoBean info);
	
	public List<StatisticsExpshareInfoBean> queryStatisticsListByTotal(
			StatisticsExpshareInfoBean info);
	
}
