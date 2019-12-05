package com.chinatelecom.jx.zone.management.service.statisticsInve;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.github.pagehelper.Page;

public interface IStatisticsInveInfoService {
	//新增
	public int insert(StatisticsInveInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(StatisticsInveInfoBean record);
	//查询
	public StatisticsInveInfoBean selectById(BigDecimal id);
	//列表
	public List<StatisticsInveInfoBean> queryByCond(StatisticsInveInfoBean record);
	//分页列表
	public Page<StatisticsInveInfoBean> queryByCondForPage(StatisticsInveInfoBean record);
	//查询总的统计数量
	public StatisticsInveInfoBean queryTotalCountByCond(StatisticsInveInfoBean record);
}
