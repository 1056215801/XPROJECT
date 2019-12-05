

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expBrowse;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;

public interface ExpBrowseLogMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ExpBrowseLogBean record);

    int insertSelective(ExpBrowseLogBean record);

    ExpBrowseLogBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ExpBrowseLogBean record);

    int updateByPrimaryKey(ExpBrowseLogBean record);
    
    //ExpBrowseLogBean selectWithForeignById(BigDecimal id);

   	List<ExpBrowseLogBean> queryByCond(ExpBrowseLogBean record);
   	
   	//List<ExpBrowseLogBean> queryByCondWithForeign(ExpBrowseLogBean record);
}