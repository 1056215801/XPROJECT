

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.github.pagehelper.Page;

public interface InvestigationInfoMainMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(InvestigationInfoMainBean record);

    int insertSelective(InvestigationInfoMainBean record);

    InvestigationInfoMainBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(InvestigationInfoMainBean record);

    int updateByPrimaryKey(InvestigationInfoMainBean record);
    
    //InvestigationInfoMainBean selectWithForeignById(BigDecimal id);

   	List<InvestigationInfoMainBean> queryByCond(InvestigationInfoMainBean record);

	Page<InvestigationInfoMainBean> queryAllList(
			InvestigationInfoMainBean investigationInfoMain);

	Page<InvestigationInfoMainBean> queryEnterList(
			InvestigationInfoMainBean investigationInfoMain);

	int queryTotalSize(InvestigationInfoMainBean investigationInfoMainBean);

   	//List<InvestigationInfoMainBean> queryByCondWithForeign(InvestigationInfoMainBean record);
}