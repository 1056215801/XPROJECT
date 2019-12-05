package com.chinatelecom.jx.zone.management.service.projectDeclare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareOrgMapper;
@Service
@Transactional
public class ProjectDeclareOrgServiceImpl implements IProjectDeclareOrgService {

	@Autowired
	private ProjectDeclareOrgMapper projectdeclareorgMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclareOrgBean record) {
		return projectdeclareorgMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclareorgMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclareorgMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclareOrgBean record) {
		return projectdeclareorgMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclareOrgBean selectById(BigDecimal id) {
		return projectdeclareorgMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclareOrgBean> queryByCond(ProjectDeclareOrgBean record) {
		return projectdeclareorgMapper.queryByCond(record);
	}

	
}
