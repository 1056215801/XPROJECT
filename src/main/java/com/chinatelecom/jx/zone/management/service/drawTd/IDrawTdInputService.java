package com.chinatelecom.jx.zone.management.service.drawTd;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;

public interface IDrawTdInputService {
	//新增
	public int insert(DrawTdInputBean record);
	//删除
	public int deleteById(BigDecimal id);
	//根据表格ID删除
	public int deleteByTableId(BigDecimal tableId);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(DrawTdInputBean record);
	//查询
	public DrawTdInputBean selectById(BigDecimal id);
	//列表
	public List<DrawTdInputBean> queryByCond(DrawTdInputBean record);

}
