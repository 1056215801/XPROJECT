package com.chinatelecom.jx.zone.management.service.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageCustomBean;

public interface IEntrancePageCustomService {
	//新增
	public int insert(EntrancePageCustomBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(EntrancePageCustomBean record);
	//查询
	public EntrancePageCustomBean selectById(BigDecimal id);
	//列表
	public List<EntrancePageCustomBean> queryByCond(EntrancePageCustomBean record);
	//获取平台名称
	String getValueById( BigDecimal pId,  BigDecimal oId);

}
