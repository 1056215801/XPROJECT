package com.chinatelecom.jx.zone.management.service.orgAudit;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.orgAudit.OrgAuditExampleBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.orgAudit.OrgAuditExampleMapper;
@Service
@Transactional
public class OrgAuditExampleServiceImpl implements IOrgAuditExampleService {

	@Autowired
	private OrgAuditExampleMapper orgauditexampleMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(OrgAuditExampleBean record) {
		return orgauditexampleMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return orgauditexampleMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				orgauditexampleMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(OrgAuditExampleBean record) {
		return orgauditexampleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public OrgAuditExampleBean selectById(BigDecimal id) {
		return orgauditexampleMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<OrgAuditExampleBean> queryByCond(OrgAuditExampleBean record) {
		return orgauditexampleMapper.queryByCond(record);
	}

	@Override
	public List<OrgAuditExampleBean> selectMyCreateExample(
			BigDecimal accountId, String orgName, String declareTitle,
			String exampleTitle) {
		// TODO Auto-generated method stub
		return orgauditexampleMapper.selectMyCreateExample(accountId, orgName, declareTitle, exampleTitle);
	}

	@Override
	public List<OrgAuditExampleBean> selectMyOrgCreateExample(
			BigDecimal parentId, String orgName, String declareTitle,
			String exampleTitle) {
		// TODO Auto-generated method stub
		return orgauditexampleMapper.selectMyOrgCreateExample(parentId, orgName, declareTitle, exampleTitle);
	}

	@Override
	public int deleteByDeclareId(BigDecimal id) {
		// TODO Auto-generated method stub
		return orgauditexampleMapper.deleteByDeclareId(id);
	}

	@Override
	public List<OrgAuditExampleBean> selectExampleAndDeclareOpen(
			OrgAuditExampleBean record) {
		// TODO Auto-generated method stub
		return orgauditexampleMapper.selectExampleAndDeclareOpen(record);
	}

	
	
}
