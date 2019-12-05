package com.chinatelecom.jx.zone.management.service.formInput;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.github.pagehelper.Page;

public interface IFormInputProinstService {
	//新增
	public int insert(FormInputProinstBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(FormInputProinstBean record);
	
	public int saveInfo(HttpServletRequest request,BigDecimal formId, BigDecimal accountId);
	//查询
	public FormInputProinstBean selectById(BigDecimal id);
	//列表
	public List<FormInputProinstBean> queryByCond(FormInputProinstBean record);
	//关联人员ip姓名等信息
	public List<FormInputProinstBean> queryByCondWithPersonInfo(FormInputProinstBean record);
	//关联人员ip姓名等信息 分页
	public Page<FormInputProinstBean> queryByCondWithPersonInfoForPage(FormInputProinstBean record);
	
	public Page<FormInputProinstBean> queryByCondForPage(FormInputProinstBean record);
	
	public List<FormInputProinstBean> queryByFiledNameAndFormId(
			FormInputProinstBean formInputProinstBean);
	public FormInputProinstBean queryStartAndEndTime(
			FormInputProinstBean inputProinstBean);

}
