package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.companyDetail;

import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CompanyDetailMapper {

	Map<String, Object> selectFirstDataByCompanyId(BigDecimal companyId);

	List<Map<String, Object>> selectSecondDataByCompanyId(
			@Param("tableName")String tableName, 
			@Param("companyId")BigDecimal companyId, 
			@Param("orderByClause")String orderByClause);

	/*****************************************************
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * ***************************************************
	 */
	

	int dimensionCountByCompany(@Param("tableList") List<String> tableList, @Param("companyId") BigDecimal companyId);

	List<Map<String,Object>> dimensionDetailByCompany(@Param("fieldList") List<String> fieldList,
                                                      @Param("companyId") BigDecimal companyId,
                                                      @Param("tableName") String tableName);

    Map<String,Object> getDetailById(@Param("fieldList") List<String> fieldList,
                                     @Param("id") String id,
                                     @Param("tableName") String tableName);

    List<Map<String,Object>> dimensionDetailByCompanyAndPerson(@Param("fieldList") List<String> fieldList,
                                                               @Param("companyId") BigDecimal companyId,
                                                               @Param("tableName") String tableName,
                                                               @Param("person") String person);

    Map<String,Object> getReportInfoByCompany(@Param("companyId") BigDecimal companyId);

    String findCompanyNameById(@Param("companyId") BigDecimal companyId);

    List<String> allCompanyId();


}
