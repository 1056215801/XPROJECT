

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfigReply;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfigReply.WeixinConfigReplyBean;

public interface WeixinConfigReplyMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WeixinConfigReplyBean record);

    int insertSelective(WeixinConfigReplyBean record);

    WeixinConfigReplyBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WeixinConfigReplyBean record);

    int updateByPrimaryKey(WeixinConfigReplyBean record);
    
    //WeixinConfigReplyBean selectWithForeignById(BigDecimal id);

   	List<WeixinConfigReplyBean> queryByCond(WeixinConfigReplyBean record);
   	
   	//List<WeixinConfigReplyBean> queryByCondWithForeign(WeixinConfigReplyBean record);
}