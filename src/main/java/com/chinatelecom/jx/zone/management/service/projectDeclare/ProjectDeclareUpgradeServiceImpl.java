package com.chinatelecom.jx.zone.management.service.projectDeclare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareUpgradeBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareUpgradeMapper;
@Service
@Transactional
public class ProjectDeclareUpgradeServiceImpl implements IProjectDeclareUpgradeService {

	@Autowired
	private ProjectDeclareUpgradeMapper projectdeclareupgradeMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclareUpgradeBean record) {
		return projectdeclareupgradeMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclareupgradeMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclareupgradeMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclareUpgradeBean record) {
		return projectdeclareupgradeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclareUpgradeBean selectById(BigDecimal id) {
		return projectdeclareupgradeMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclareUpgradeBean> queryByCond(ProjectDeclareUpgradeBean record) {
		return projectdeclareupgradeMapper.queryByCond(record);
	}

	
}
