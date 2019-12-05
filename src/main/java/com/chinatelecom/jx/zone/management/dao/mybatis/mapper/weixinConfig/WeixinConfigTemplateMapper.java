

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigTemplateBean;

public interface WeixinConfigTemplateMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WeixinConfigTemplateBean record);

    int insertSelective(WeixinConfigTemplateBean record);

    WeixinConfigTemplateBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WeixinConfigTemplateBean record);

    int updateByPrimaryKey(WeixinConfigTemplateBean record);
    
    //WeixinConfigTemplateBean selectWithForeignById(BigDecimal id);

   	List<WeixinConfigTemplateBean> queryByCond(WeixinConfigTemplateBean record);
   	
   	//List<WeixinConfigTemplateBean> queryByCondWithForeign(WeixinConfigTemplateBean record);
}