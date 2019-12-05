

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinReceivedMsg;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg.WeixinReceivedMsgBean;

public interface WeixinReceivedMsgMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(WeixinReceivedMsgBean record);

    int insertSelective(WeixinReceivedMsgBean record);

    WeixinReceivedMsgBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(WeixinReceivedMsgBean record);

    int updateByPrimaryKey(WeixinReceivedMsgBean record);
    
    //WeixinReceivedMsgBean selectWithForeignById(BigDecimal id);

   	List<WeixinReceivedMsgBean> queryByCond(WeixinReceivedMsgBean record);
   	
   	//List<WeixinReceivedMsgBean> queryByCondWithForeign(WeixinReceivedMsgBean record);
}