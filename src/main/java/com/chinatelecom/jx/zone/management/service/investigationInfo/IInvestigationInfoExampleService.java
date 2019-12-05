package com.chinatelecom.jx.zone.management.service.investigationInfo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;

import com.github.pagehelper.Page;

public interface IInvestigationInfoExampleService {
	//新增
	public int insert(InvestigationInfoExampleBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(InvestigationInfoExampleBean record);
	//查询
	public InvestigationInfoExampleBean selectById(BigDecimal id);
	//列表
	public List<InvestigationInfoExampleBean> queryByCond(InvestigationInfoExampleBean record);
	//列表分页
	public Page<InvestigationInfoExampleBean> queryByCondForPage(InvestigationInfoExampleBean record);
	//插入实例
	public Object[] insertExample(BigDecimal id,BigDecimal formId,
			BigDecimal accountId, String accountName, SeqIdType seq,
			String ipAddr, Date createTime);
	//获取参数人数
	public List<InvestigationInfoExampleBean> queryJoinCount(InvestigationInfoExampleBean record);
}
