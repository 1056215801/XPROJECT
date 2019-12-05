

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTable;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;

public interface DrawTableInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(DrawTableInfoBean record);

    int insertSelective(DrawTableInfoBean record);

    DrawTableInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(DrawTableInfoBean record);

    int updateByPrimaryKey(DrawTableInfoBean record);
    
    //DrawTableInfoBean selectWithForeignById(BigDecimal id);

   	List<DrawTableInfoBean> queryByCond(DrawTableInfoBean record);
   	
   	//List<DrawTableInfoBean> queryByCondWithForeign(DrawTableInfoBean record);
}