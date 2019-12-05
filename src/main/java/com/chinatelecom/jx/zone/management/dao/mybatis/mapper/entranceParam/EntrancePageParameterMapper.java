package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageParameterBean;

public interface EntrancePageParameterMapper {
	int deleteByPrimaryKey(BigDecimal id);

	int insert(EntrancePageParameterBean record);

	int insertSelective(EntrancePageParameterBean record);

	EntrancePageParameterBean selectByPrimaryKey(BigDecimal id);

	int updateByPrimaryKeySelective(EntrancePageParameterBean record);

	int updateByPrimaryKey(EntrancePageParameterBean record);

	//EntrancePageParameterBean selectWithForeignById(BigDecimal id);
	List<EntrancePageParameterBean> queryByCond(EntrancePageParameterBean record);
	//List<EntrancePageParameterBean> queryByCondWithForeign(EntrancePageParameterBean record);
}