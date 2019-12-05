

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formInput;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;

public interface FormInputMapper {
    int deleteByPrimaryKey(BigDecimal id);
    
    int deleteByTemplateId(BigDecimal templateId);

    int insert(FormInputBean record);

    int insertSelective(FormInputBean record);

    FormInputBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(FormInputBean record);

    int updateByPrimaryKey(FormInputBean record);
    
    //FormInputBean selectWithForeignById(BigDecimal id);

   	List<FormInputBean> queryByCond(FormInputBean record);
   	
   	//List<FormInputBean> queryByCondWithForeign(FormInputBean record);
}