package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageCustomBean;

public interface EntrancePageCustomMapper {
	int deleteByPrimaryKey(BigDecimal id);

	int insert(EntrancePageCustomBean record);

	int insertSelective(EntrancePageCustomBean record);

	EntrancePageCustomBean selectByPrimaryKey(BigDecimal id);

	int updateByPrimaryKeySelective(EntrancePageCustomBean record);

	int updateByPrimaryKey(EntrancePageCustomBean record);

	//EntrancePageCustomBean selectWithForeignById(BigDecimal id);
	List<EntrancePageCustomBean> queryByCond(EntrancePageCustomBean record);

	//List<EntrancePageCustomBean> queryByCondWithForeign(EntrancePageCustomBean record);
	String getValueById(@Param("pId") BigDecimal pId, @Param("oId") BigDecimal oId);
}