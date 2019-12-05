package com.chinatelecom.jx.zone.management.service.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareCommentBean;

public interface IExpShareCommentService {
	//新增
	public int insert(ExpShareCommentBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(ExpShareCommentBean record);
	//查询
	public ExpShareCommentBean selectById(BigDecimal id);
	//列表
	public List<ExpShareCommentBean> queryByCond(ExpShareCommentBean record);

}
