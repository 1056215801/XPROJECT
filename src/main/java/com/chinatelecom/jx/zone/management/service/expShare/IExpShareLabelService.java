package com.chinatelecom.jx.zone.management.service.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;

public interface IExpShareLabelService {
	//新增
	public int insert(ExpShareLabelBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ExpShareLabelBean record);
	//查询
	public ExpShareLabelBean selectById(BigDecimal id);
	//列表
	public List<ExpShareLabelBean> queryByCond(ExpShareLabelBean record);

}
