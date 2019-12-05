package com.chinatelecom.jx.zone.management.service.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageParameterBean;

public interface IEntrancePageParameterService {
	//新增
	public int insert(EntrancePageParameterBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(EntrancePageParameterBean record);
	//查询
	public EntrancePageParameterBean selectById(BigDecimal id);
	//列表
	public List<EntrancePageParameterBean> queryByCond(EntrancePageParameterBean record);

}
