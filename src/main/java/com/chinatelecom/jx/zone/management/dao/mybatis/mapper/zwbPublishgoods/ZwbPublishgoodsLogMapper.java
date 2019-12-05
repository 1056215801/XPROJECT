

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.zwbPublishgoods;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;

public interface ZwbPublishgoodsLogMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ZwbPublishgoodsLogBean record);

    int insertSelective(ZwbPublishgoodsLogBean record);

    ZwbPublishgoodsLogBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ZwbPublishgoodsLogBean record);

    int updateByPrimaryKey(ZwbPublishgoodsLogBean record);
    
    //ZwbPublishgoodsLogBean selectWithForeignById(BigDecimal id);

   	List<ZwbPublishgoodsLogBean> queryByCond(ZwbPublishgoodsLogBean record);
   	
   	//List<ZwbPublishgoodsLogBean> queryByCondWithForeign(ZwbPublishgoodsLogBean record);
}