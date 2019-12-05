package com.chinatelecom.jx.zone.management.service.projectDeclare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareAuditlogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareAuditlogMapper;
@Service
@Transactional
public class ProjectDeclareAuditlogServiceImpl implements IProjectDeclareAuditlogService {

	@Autowired
	private ProjectDeclareAuditlogMapper projectdeclareauditlogMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclareAuditlogBean record) {
		return projectdeclareauditlogMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclareauditlogMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclareauditlogMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclareAuditlogBean record) {
		return projectdeclareauditlogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclareAuditlogBean selectById(BigDecimal id) {
		return projectdeclareauditlogMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclareAuditlogBean> queryByCond(ProjectDeclareAuditlogBean record) {
		return projectdeclareauditlogMapper.queryByCond(record);
	}

	@Override
	public int deleteByApplyId(BigDecimal id) {
		// TODO Auto-generated method stub
		return projectdeclareauditlogMapper.deleteByApplyId(id);
	}

	
}
