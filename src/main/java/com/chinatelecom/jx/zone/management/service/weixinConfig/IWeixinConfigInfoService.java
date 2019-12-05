package com.chinatelecom.jx.zone.management.service.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;

public interface IWeixinConfigInfoService {
	//新增
	public int insert(WeixinConfigInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WeixinConfigInfoBean record);
	//查询
	public WeixinConfigInfoBean selectById(BigDecimal id);
	//列表
	public List<WeixinConfigInfoBean> queryByCond(WeixinConfigInfoBean record);
	//查询
	public WeixinConfigInfoBean selectByOpenId(String openid);
}
