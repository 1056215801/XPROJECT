

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInve;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveExampleBean;

public interface StatisticsInveExampleMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(StatisticsInveExampleBean record);

    int insertSelective(StatisticsInveExampleBean record);

    StatisticsInveExampleBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(StatisticsInveExampleBean record);

    int updateByPrimaryKey(StatisticsInveExampleBean record);
    
    //StatisticsInveExampleBean selectWithForeignById(BigDecimal id);

   	List<StatisticsInveExampleBean> queryByCond(StatisticsInveExampleBean record);
   	
   	//List<StatisticsInveExampleBean> queryByCondWithForeign(StatisticsInveExampleBean record);
}