package com.chinatelecom.jx.zone.management.service.weixinConfig;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigTemplateBean;

public interface IWeixinConfigTemplateService {
	//新增
	public int insert(WeixinConfigTemplateBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WeixinConfigTemplateBean record);
	//查询
	public WeixinConfigTemplateBean selectById(BigDecimal id);
	//列表
	public List<WeixinConfigTemplateBean> queryByCond(WeixinConfigTemplateBean record);

}
