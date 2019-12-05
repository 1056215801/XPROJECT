package com.chinatelecom.jx.zone.management.service.formTemplate;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;

public interface IFormTemplateService {
	//新增
	public int insert(FormTemplateBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(FormTemplateBean record);
	//查询
	public FormTemplateBean selectById(BigDecimal id);
	//列表
	public List<FormTemplateBean> queryByCond(FormTemplateBean record);

}
