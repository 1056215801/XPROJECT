package com.chinatelecom.jx.zone.management.service.formInput;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletRequest;

import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;

public interface IFormInputService {
	//新增
	public int insert(FormInputBean record);
	
	public int saveInputItems(FormInputBean formInput,BigDecimal templateId,String tagNames,ServletRequest request,SeqIdType seq);
	//保存为模板
	public int saveInputItemsNew(FormInputBean formInput,BigDecimal templateId,String tagNames,ServletRequest request,SeqIdType seq);
	//保存表单的拖动控件
	public int saveInputForForm(FormInputBean formInput,BigDecimal tableId,String tagNames,ServletRequest request,SeqIdType seq);
	//删除
	public int deleteById(BigDecimal id);
	//根据模板ID删除
	public int deleteByTemplateId(BigDecimal templateId);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(FormInputBean record);
	//查询
	public FormInputBean selectById(BigDecimal id);
	//列表
	public List<FormInputBean> queryByCond(FormInputBean record);
	

}
