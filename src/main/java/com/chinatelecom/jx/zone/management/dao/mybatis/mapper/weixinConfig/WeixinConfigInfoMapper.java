

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;

public interface WeixinConfigInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WeixinConfigInfoBean record);

    int insertSelective(WeixinConfigInfoBean record);

    WeixinConfigInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WeixinConfigInfoBean record);

    int updateByPrimaryKey(WeixinConfigInfoBean record);
    
    WeixinConfigInfoBean selectByOpenId(String id);

   	List<WeixinConfigInfoBean> queryByCond(WeixinConfigInfoBean record);
   	
   	//List<WeixinConfigInfoBean> queryByCondWithForeign(WeixinConfigInfoBean record);
}