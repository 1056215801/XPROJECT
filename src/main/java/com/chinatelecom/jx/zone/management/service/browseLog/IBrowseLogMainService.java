package com.chinatelecom.jx.zone.management.service.browseLog;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;

public interface IBrowseLogMainService {
	//新增
	public int insert(BrowseLogMainBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(BrowseLogMainBean record);
	//查询
	public BrowseLogMainBean selectById(BigDecimal id);
	//列表
	public List<BrowseLogMainBean> queryByCond(BrowseLogMainBean record);
	
	public int getBrowseCount(BrowseLogMainBean record);
	
	public int insertLog(BigDecimal logId, BigDecimal relatedId,
			BigDecimal accountId, String source);

}
