

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formInput;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.github.pagehelper.Page;

public interface FormInputProinstMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(FormInputProinstBean record);

    int insertSelective(FormInputProinstBean record);

    FormInputProinstBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(FormInputProinstBean record);

    int updateByPrimaryKey(FormInputProinstBean record);
    
    //FormInputProinstBean selectWithForeignById(BigDecimal id);

   	List<FormInputProinstBean> queryByCond(FormInputProinstBean record);
   	
   	List<FormInputProinstBean> queryByCondWithPersonInfo(FormInputProinstBean record);
   	
   	Page<FormInputProinstBean> queryByCondWithPersonInfoForPage(FormInputProinstBean record);
   	
   	Page<FormInputProinstBean> queryByCondForPage(FormInputProinstBean record);

	List<FormInputProinstBean> queryByFiledNameAndFormId(
			FormInputProinstBean formInputProinstBean);

	FormInputProinstBean queryStartAndEndTime(
			FormInputProinstBean inputProinstBean);
   	
   	//List<FormInputProinstBean> queryByCondWithForeign(FormInputProinstBean record);
}