package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.wanjiCollect;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;


public interface WanjiCollectLogMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WanjiCollectLogBean record);

    int insertSelective(WanjiCollectLogBean record);

    WanjiCollectLogBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WanjiCollectLogBean record);

    int updateByPrimaryKey(WanjiCollectLogBean record);
    
    //WanjiCollectLogBean selectWithForeignById(BigDecimal id);

   	List<WanjiCollectLogBean> queryByCond(WanjiCollectLogBean record);
   	
   	//List<WanjiCollectLogBean> queryByCondWithForeign(WanjiCollectLogBean record);
}