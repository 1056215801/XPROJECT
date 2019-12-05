

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;

public interface ExpShareLabelMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ExpShareLabelBean record);

    int insertSelective(ExpShareLabelBean record);

    ExpShareLabelBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ExpShareLabelBean record);

    int updateByPrimaryKey(ExpShareLabelBean record);
    
    //ExpShareLabelBean selectWithForeignById(BigDecimal id);

   	List<ExpShareLabelBean> queryByCond(ExpShareLabelBean record);
   	
   	//List<ExpShareLabelBean> queryByCondWithForeign(ExpShareLabelBean record);
}