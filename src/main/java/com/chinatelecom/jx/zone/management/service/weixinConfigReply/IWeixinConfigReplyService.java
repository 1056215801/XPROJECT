package com.chinatelecom.jx.zone.management.service.weixinConfigReply;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfigReply.WeixinConfigReplyBean;
import com.jfinal.weixin.sdk.msg.out.News;

public interface IWeixinConfigReplyService {
	//新增
	public int insert(WeixinConfigReplyBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WeixinConfigReplyBean record);
	//查询
	public WeixinConfigReplyBean selectById(BigDecimal id);
	//列表
	public List<WeixinConfigReplyBean> queryByCond(WeixinConfigReplyBean record);
	
	//创建微信消息
	public ArrayList<News> createMsg();

}
