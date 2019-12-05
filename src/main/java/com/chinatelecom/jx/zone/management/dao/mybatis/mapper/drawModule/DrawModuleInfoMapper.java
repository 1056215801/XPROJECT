

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawModule;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawModule.DrawModuleInfoBean;

public interface DrawModuleInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(DrawModuleInfoBean record);

    int insertSelective(DrawModuleInfoBean record);

    DrawModuleInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(DrawModuleInfoBean record);

    int updateByPrimaryKey(DrawModuleInfoBean record);
    
    //DrawModuleInfoBean selectWithForeignById(BigDecimal id);

   	List<DrawModuleInfoBean> queryByCond(DrawModuleInfoBean record);
   	
   	//List<DrawModuleInfoBean> queryByCondWithForeign(DrawModuleInfoBean record);
}