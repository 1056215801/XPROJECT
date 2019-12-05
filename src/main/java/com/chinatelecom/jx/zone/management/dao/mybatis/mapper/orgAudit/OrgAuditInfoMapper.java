

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.orgAudit;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;

public interface OrgAuditInfoMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(OrgAuditInfoBean record);

    int insertSelective(OrgAuditInfoBean record);

    OrgAuditInfoBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(OrgAuditInfoBean record);

    int updateByPrimaryKey(OrgAuditInfoBean record);
    
    //OrgAuditInfoBean selectWithForeignById(BigDecimal id);

   	List<OrgAuditInfoBean> queryByCond(OrgAuditInfoBean record);
    List<OrgAuditInfoBean> queryByChildOrg(OrgAuditInfoBean record);
   	//List<OrgAuditInfoBean> queryByCondWithForeign(OrgAuditInfoBean record);
}