package com.chinatelecom.jx.zone.management.service.wanjiCollect;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;

public interface IWanjiCollectLogService {
	//新增
	public int insert(WanjiCollectLogBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(WanjiCollectLogBean record);
	//查询
	public WanjiCollectLogBean selectById(BigDecimal id);
	//列表
	public List<WanjiCollectLogBean> queryByCond(WanjiCollectLogBean record);

}
