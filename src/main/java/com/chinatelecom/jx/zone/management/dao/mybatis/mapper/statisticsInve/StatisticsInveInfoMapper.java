

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInve;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.github.pagehelper.Page;

public interface StatisticsInveInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(StatisticsInveInfoBean record);

    int insertSelective(StatisticsInveInfoBean record);

    StatisticsInveInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(StatisticsInveInfoBean record);

    int updateByPrimaryKey(StatisticsInveInfoBean record);
    
    //StatisticsInveInfoBean selectWithForeignById(BigDecimal id);

   	List<StatisticsInveInfoBean> queryByCond(StatisticsInveInfoBean record);
   	
   	StatisticsInveInfoBean queryTotalCountByCond(StatisticsInveInfoBean record);
   	
   	Page<StatisticsInveInfoBean> queryByCondForPage(StatisticsInveInfoBean record);
   	
   	//List<StatisticsInveInfoBean> queryByCondWithForeign(StatisticsInveInfoBean record);
}