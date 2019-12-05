package com.chinatelecom.jx.zone.management.service.formTemplate;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formTemplate.FormTemplateMapper;
import com.chinatelecom.jx.zone.management.util.StringUtil;
@Service
@Transactional
public class FormTemplateServiceImpl implements IFormTemplateService {

	@Autowired
	private FormTemplateMapper formtemplateMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(FormTemplateBean record) {
		if(!StringUtil.checkNotNull(record.getFormLayout())){
			record.setFormLayout("h");//默认横排
		}
		return formtemplateMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return formtemplateMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				formtemplateMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(FormTemplateBean record) {
		return formtemplateMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public FormTemplateBean selectById(BigDecimal id) {
		return formtemplateMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<FormTemplateBean> queryByCond(FormTemplateBean record) {
		return formtemplateMapper.queryByCond(record);
	}

	
}
