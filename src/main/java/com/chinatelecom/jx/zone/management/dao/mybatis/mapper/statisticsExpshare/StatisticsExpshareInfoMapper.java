

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsExpshare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsExpshare.StatisticsExpshareInfoBean;

public interface StatisticsExpshareInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(StatisticsExpshareInfoBean record);

    int insertSelective(StatisticsExpshareInfoBean record);

    StatisticsExpshareInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(StatisticsExpshareInfoBean record);

    int updateByPrimaryKey(StatisticsExpshareInfoBean record);
    
    //StatisticsExpshareInfoBean selectWithForeignById(BigDecimal id);

   	List<StatisticsExpshareInfoBean> queryByCond(StatisticsExpshareInfoBean record);

	List<StatisticsExpshareInfoBean> queryStatisticsListByCity(StatisticsExpshareInfoBean info);
   	
	List<StatisticsExpshareInfoBean> queryStatisticsListByUnit(StatisticsExpshareInfoBean info);
	
	List<StatisticsExpshareInfoBean> queryStatisticsListByTotal(StatisticsExpshareInfoBean info);

	//List<StatisticsExpshareInfoBean> queryByCondWithForeign(StatisticsExpshareInfoBean record);
}