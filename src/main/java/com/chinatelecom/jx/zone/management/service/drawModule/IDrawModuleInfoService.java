package com.chinatelecom.jx.zone.management.service.drawModule;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.drawModule.DrawModuleInfoBean;

public interface IDrawModuleInfoService {
	//新增
	public int insert(DrawModuleInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(DrawModuleInfoBean record);
	//查询
	public DrawModuleInfoBean selectById(BigDecimal id);
	//列表
	public List<DrawModuleInfoBean> queryByCond(DrawModuleInfoBean record);

}
