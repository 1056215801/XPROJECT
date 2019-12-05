package com.chinatelecom.jx.zone.management.service.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigMenuBean;

public interface IWeixinConfigMenuService {
	//新增
	public int insert(WeixinConfigMenuBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WeixinConfigMenuBean record);
	//查询
	public WeixinConfigMenuBean selectById(BigDecimal id);
	//列表
	public List<WeixinConfigMenuBean> queryByCond(WeixinConfigMenuBean record);
	
	public List<WeixinConfigMenuBean> queryByParentId(BigDecimal record) ;
	 
	public List<WeixinConfigMenuBean> queryByParentIds(List<BigDecimal> record) ;
}
