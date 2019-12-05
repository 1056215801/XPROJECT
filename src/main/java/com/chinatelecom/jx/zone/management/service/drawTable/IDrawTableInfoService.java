package com.chinatelecom.jx.zone.management.service.drawTable;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;

public interface IDrawTableInfoService {
	//新增
	public int insert(DrawTableInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(DrawTableInfoBean record);
	//查询
	public DrawTableInfoBean selectById(BigDecimal id);
	//列表
	public List<DrawTableInfoBean> queryByCond(DrawTableInfoBean record);

}
