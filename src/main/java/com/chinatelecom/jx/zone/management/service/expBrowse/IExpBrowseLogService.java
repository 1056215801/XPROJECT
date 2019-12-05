package com.chinatelecom.jx.zone.management.service.expBrowse;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;

public interface IExpBrowseLogService {
	//新增
	public int insert(ExpBrowseLogBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ExpBrowseLogBean record);
	//查询
	public ExpBrowseLogBean selectById(BigDecimal id);
	//列表
	public List<ExpBrowseLogBean> queryByCond(ExpBrowseLogBean record);

}
