package com.chinatelecom.jx.zone.management.service.formInput;


import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formInput.FormInputProinstMapper;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.github.pagehelper.Page;
@Service
@Transactional
public class FormInputProinstServiceImpl implements IFormInputProinstService {

	@Autowired
	private FormInputProinstMapper forminputproinstMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(FormInputProinstBean record) {
		return forminputproinstMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return forminputproinstMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				forminputproinstMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(FormInputProinstBean record) {
		return forminputproinstMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int saveInfo(HttpServletRequest request,BigDecimal formId,BigDecimal accountId){
		FormInputProinstBean proinst = new FormInputProinstBean();
		proinst.setFormId(formId);
		proinst.setOrderByClause("sort_grade asc");
		proinst.setAccountId(accountId);
		List<FormInputProinstBean> lstProinst = forminputproinstMapper.queryByCond(proinst);
		
		String value = "";
		String v_other = "";//存放其他值
		String[] values = null;
		//根据实例数据获取前台录入值
		for(FormInputProinstBean bean : lstProinst){
			value = "";
			v_other = "";
			values = null;
			if("checkbox".equals(bean.getInputType()) || "selectmore".equals(bean.getInputType())){
				values = request.getParameterValues(bean.getFiledName());
				for(String str : values){
					value += str + "_:";
					if("其他".equals(str)){
						v_other = request.getParameter(bean.getFiledName()+"_other");
					}
				}
				if(StringUtil.checkNotNull(values)){
					bean.setStatusFlag((short)1);
				}
			}else if("radio".equals(bean.getInputType())){
				value = request.getParameter(bean.getFiledName());
				if("其他".equals(value)){
					v_other = request.getParameter(bean.getFiledName()+"_other");
				}
				if(StringUtil.checkNotNull(value)){
					bean.setStatusFlag((short)1);
				}
			}else{
				value = request.getParameter(bean.getFiledName());
				if(StringUtil.checkNotNull(value)){
					bean.setStatusFlag((short)1);
				}
			}
			
			bean.setInputValue(value);
			bean.setOtherInputValue(v_other);
			
			forminputproinstMapper.updateByPrimaryKeySelective(bean);
		}
		return 1;
	}

	@Override
	public FormInputProinstBean selectById(BigDecimal id) {
		return forminputproinstMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<FormInputProinstBean> queryByCond(FormInputProinstBean record) {
		return forminputproinstMapper.queryByCond(record);
	}
	
	@Override
	public List<FormInputProinstBean> queryByCondWithPersonInfo(FormInputProinstBean record) {
		return forminputproinstMapper.queryByCondWithPersonInfo(record);
	}
	
	@Override
	public Page<FormInputProinstBean> queryByCondWithPersonInfoForPage(FormInputProinstBean record) {
		return forminputproinstMapper.queryByCondWithPersonInfoForPage(record);
	}
	
	@Override
	public Page<FormInputProinstBean> queryByCondForPage(FormInputProinstBean record){
		return forminputproinstMapper.queryByCondForPage(record);
	}

	@Override
	public List<FormInputProinstBean> queryByFiledNameAndFormId(
			FormInputProinstBean formInputProinstBean) {
		return forminputproinstMapper.queryByFiledNameAndFormId(formInputProinstBean);
	}

	@Override
	public FormInputProinstBean queryStartAndEndTime(
			FormInputProinstBean inputProinstBean) {
		return forminputproinstMapper.queryStartAndEndTime(inputProinstBean);
	}

	
}
