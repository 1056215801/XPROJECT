package com.chinatelecom.jx.zone.management.service.orgAudit;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;

public interface IOrgAuditInfoService {
	//新增
	public int insert(OrgAuditInfoBean record);
	//删除
	public int deleteById(BigDecimal id);
	//批量删除
	public int batchDelete(String[] ids);
	//修改
	public int updateById(OrgAuditInfoBean record);
	//查询
	public OrgAuditInfoBean selectById(BigDecimal id);
	//列表
	public List<OrgAuditInfoBean> queryByCond(OrgAuditInfoBean record);
	//下级单位列表
	public List<OrgAuditInfoBean> queryByChildOrg(OrgAuditInfoBean record);

}
