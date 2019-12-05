package com.chinatelecom.jx.zone.management.service.orgAudit;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.orgAudit.OrgAuditInfoMapper;
@Service
@Transactional
public class OrgAuditInfoServiceImpl implements IOrgAuditInfoService {

	@Autowired
	private OrgAuditInfoMapper orgauditinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(OrgAuditInfoBean record) {
		return orgauditinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return orgauditinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				orgauditinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(OrgAuditInfoBean record) {
		return orgauditinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public OrgAuditInfoBean selectById(BigDecimal id) {
		return orgauditinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<OrgAuditInfoBean> queryByCond(OrgAuditInfoBean record) {
		return orgauditinfoMapper.queryByCond(record);
	}

	@Override
	public List<OrgAuditInfoBean> queryByChildOrg(OrgAuditInfoBean record) {
		// TODO Auto-generated method stub
		return orgauditinfoMapper.queryByChildOrg(record);
	}

	
}
