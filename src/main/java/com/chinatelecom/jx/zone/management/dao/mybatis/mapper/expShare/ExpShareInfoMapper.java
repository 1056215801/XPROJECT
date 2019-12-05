

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;

public interface ExpShareInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ExpShareInfoBean record);

    int insertSelective(ExpShareInfoBean record);

    ExpShareInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ExpShareInfoBean record);

    int updateByPrimaryKey(ExpShareInfoBean record);
    
    //ExpShareInfoBean selectWithForeignById(BigDecimal id);

   	List<ExpShareInfoBean> queryByCond(ExpShareInfoBean record);
   	
   	List<ExpShareInfoBean> queryAuditedList(ExpShareInfoBean record);

	List<ExpShareInfoBean> queryOrderList(ExpShareInfoBean expShareInfoBean);
   	
   	//List<ExpShareInfoBean> queryByCondWithForeign(ExpShareInfoBean record);
   	
 
}