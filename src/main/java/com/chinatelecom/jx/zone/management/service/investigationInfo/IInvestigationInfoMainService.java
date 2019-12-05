package com.chinatelecom.jx.zone.management.service.investigationInfo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;

import com.github.pagehelper.Page;

public interface IInvestigationInfoMainService {
	//新增
	public int insert(InvestigationInfoMainBean record);
	//保存调查信息
	public int saveInvestigationInfo(InvestigationInfoMainBean investigationInfoMain);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(InvestigationInfoMainBean record);
	//查询
	public InvestigationInfoMainBean selectById(BigDecimal id);
	//列表
	public List<InvestigationInfoMainBean> queryByCond(InvestigationInfoMainBean record);
	//查找所有调查列表
	public Page<InvestigationInfoMainBean> queryAllList(
			InvestigationInfoMainBean investigationInfoMain);
	//查找我参与的列表
	public Page<InvestigationInfoMainBean> queryEnterList(
			InvestigationInfoMainBean investigationInfoMain);
	
	public int queryTotalSize(
			InvestigationInfoMainBean investigationInfoMainBean);
	
	public Map<String, String> copy(BigDecimal formId, BigDecimal newFormId);
	
}
