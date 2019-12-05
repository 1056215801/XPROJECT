package com.chinatelecom.jx.zone.management.service.zwbPublishgoods;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;

public interface IZwbPublishgoodsLogService {
	//新增
	public int insert(ZwbPublishgoodsLogBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ZwbPublishgoodsLogBean record);
	//查询
	public ZwbPublishgoodsLogBean selectById(BigDecimal id);
	//列表
	public List<ZwbPublishgoodsLogBean> queryByCond(ZwbPublishgoodsLogBean record);

}
