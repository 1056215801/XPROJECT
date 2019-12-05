package com.chinatelecom.jx.zone.management.service.weixinReceivedMsg;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg.WeixinReceivedMsgBean;

public interface IWeixinReceivedMsgService {
	//新增
	public int insert(WeixinReceivedMsgBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WeixinReceivedMsgBean record);
	//查询
	public WeixinReceivedMsgBean selectById(BigDecimal id);
	//列表
	public List<WeixinReceivedMsgBean> queryByCond(WeixinReceivedMsgBean record);

}
