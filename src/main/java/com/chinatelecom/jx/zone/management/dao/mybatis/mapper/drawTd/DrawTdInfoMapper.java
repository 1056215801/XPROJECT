

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTd;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInfoBean;

public interface DrawTdInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(DrawTdInfoBean record);

    int insertSelective(DrawTdInfoBean record);

    DrawTdInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(DrawTdInfoBean record);

    int updateByPrimaryKey(DrawTdInfoBean record);
    
    //DrawTdInfoBean selectWithForeignById(BigDecimal id);

   	List<DrawTdInfoBean> queryByCond(DrawTdInfoBean record);
   	
   	//List<DrawTdInfoBean> queryByCondWithForeign(DrawTdInfoBean record);
}