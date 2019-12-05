

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigMenuBean;

public interface WeixinConfigMenuMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WeixinConfigMenuBean record);

    int insertSelective(WeixinConfigMenuBean record);

    WeixinConfigMenuBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WeixinConfigMenuBean record);

    int updateByPrimaryKey(WeixinConfigMenuBean record);
    
    //WeixinConfigMenuBean selectWithForeignById(BigDecimal id);

   	List<WeixinConfigMenuBean> queryByCond(WeixinConfigMenuBean record);
   	
   	//List<WeixinConfigMenuBean> queryByCondWithForeign(WeixinConfigMenuBean record);
   
	List<WeixinConfigMenuBean> queryByParentIds(List<BigDecimal> list);
	List<WeixinConfigMenuBean> queryByParentId( BigDecimal parentId);
}