package com.chinatelecom.jx.zone.management.service.projectDeclare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareLogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareLogMapper;
@Service
@Transactional
public class ProjectDeclareLogServiceImpl implements IProjectDeclareLogService {

	@Autowired
	private ProjectDeclareLogMapper projectdeclarelogMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclareLogBean record) {
		return projectdeclarelogMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclarelogMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclarelogMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclareLogBean record) {
		return projectdeclarelogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclareLogBean selectById(BigDecimal id) {
		return projectdeclarelogMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclareLogBean> queryByCond(ProjectDeclareLogBean record) {
		return projectdeclarelogMapper.queryByCond(record);
	}

	@Override
	public int deleteByApplyId(BigDecimal id) {
		// TODO Auto-generated method stub
		return projectdeclarelogMapper.deleteByApplyId(id);
	}


	
}
