

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTd;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;

public interface DrawTdInputMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(DrawTdInputBean record);

    int insertSelective(DrawTdInputBean record);

    DrawTdInputBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(DrawTdInputBean record);

    int updateByPrimaryKey(DrawTdInputBean record);
    
    //DrawTdInputBean selectWithForeignById(BigDecimal id);

   	List<DrawTdInputBean> queryByCond(DrawTdInputBean record);
   	
   	//List<DrawTdInputBean> queryByCondWithForeign(DrawTdInputBean record);
}