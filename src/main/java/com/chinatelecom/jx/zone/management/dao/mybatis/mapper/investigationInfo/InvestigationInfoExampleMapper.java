

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import com.github.pagehelper.Page;

public interface InvestigationInfoExampleMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(InvestigationInfoExampleBean record);

    int insertSelective(InvestigationInfoExampleBean record);

    InvestigationInfoExampleBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(InvestigationInfoExampleBean record);

    int updateByPrimaryKey(InvestigationInfoExampleBean record);
    
    //InvestigationInfoExampleBean selectWithForeignById(BigDecimal id);

   	List<InvestigationInfoExampleBean> queryByCond(InvestigationInfoExampleBean record);
   	
   	Page<InvestigationInfoExampleBean> queryByCondForPage(InvestigationInfoExampleBean record);
   	//获取参与人数
   	List<InvestigationInfoExampleBean> queryJoinCount(InvestigationInfoExampleBean record);
   	
   	//List<InvestigationInfoExampleBean> queryByCondWithForeign(InvestigationInfoExampleBean record);
}