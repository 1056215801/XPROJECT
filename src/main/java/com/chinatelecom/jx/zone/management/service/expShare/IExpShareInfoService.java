package com.chinatelecom.jx.zone.management.service.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;

public interface IExpShareInfoService {
	//新增
	public int insert(ExpShareInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ExpShareInfoBean record);
	//查询
	public ExpShareInfoBean selectById(BigDecimal id);
	//列表
	public List<ExpShareInfoBean> queryByCond(ExpShareInfoBean record);
	
	public List<ExpShareInfoBean> queryAuditedList(ExpShareInfoBean record);
	
	public List<ExpShareInfoBean> queryOrderList(
			ExpShareInfoBean expShareInfoBean);
	
	public String getPlatformName(BigDecimal organizationId);
	
	int syncExpInfoData(BigDecimal expId);

}
