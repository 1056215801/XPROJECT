

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInput;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.github.pagehelper.Page;

public interface StatisticsInputMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(StatisticsInputBean record);

    int insertSelective(StatisticsInputBean record);

    StatisticsInputBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(StatisticsInputBean record);

    int updateByPrimaryKey(StatisticsInputBean record);
    
    //StatisticsInputBean selectWithForeignById(BigDecimal id);

   	List<StatisticsInputBean> queryByCond(StatisticsInputBean record);
   	
   	List<StatisticsInputBean> queryByCondWithValue(StatisticsInputBean record);
   	
   	Page<StatisticsInputBean> queryByCondWithValueByPage(StatisticsInputBean record);

	StatisticsInputBean queryStartAndEndTime(StatisticsInputBean inputBean);
   	
   	//List<StatisticsInputBean> queryByCondWithForeign(StatisticsInputBean record);
}