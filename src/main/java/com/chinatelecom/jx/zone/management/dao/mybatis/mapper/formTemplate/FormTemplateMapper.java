

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formTemplate;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;

public interface FormTemplateMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(FormTemplateBean record);

    int insertSelective(FormTemplateBean record);

    FormTemplateBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(FormTemplateBean record);

    int updateByPrimaryKey(FormTemplateBean record);
    
    //FormTemplateBean selectWithForeignById(BigDecimal id);

   	List<FormTemplateBean> queryByCond(FormTemplateBean record);
   	
   	//List<FormTemplateBean> queryByCondWithForeign(FormTemplateBean record);
}