package com.chinatelecom.jx.zone.management.service.projectDeclare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclarePublicityBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclarePublicityMapper;
@Service
@Transactional
public class ProjectDeclarePublicityServiceImpl implements IProjectDeclarePublicityService {

	@Autowired
	private ProjectDeclarePublicityMapper projectdeclarepublicityMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclarePublicityBean record) {
		if(record.getDeclareId()!=null){
			return projectdeclarepublicityMapper.insertSelective(record);
		}else{
			return 0;
		}
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclarepublicityMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclarepublicityMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclarePublicityBean record) {
		return projectdeclarepublicityMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclarePublicityBean selectById(BigDecimal id) {
		return projectdeclarepublicityMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclarePublicityBean> queryByCond(ProjectDeclarePublicityBean record) {
		return projectdeclarepublicityMapper.queryByCond(record);
	}

	@Override
	public int deleteByDeclareId(BigDecimal id) {
		// TODO Auto-generated method stub
		return projectdeclarepublicityMapper.deleteByDeclareId(id);
	}

	@Override
	public List<ProjectDeclarePublicityBean> queryByIsOpen(
			ProjectDeclarePublicityBean record) {
		// TODO Auto-generated method stub
		return projectdeclarepublicityMapper.queryByIsOpen(record);
	}

	@Override
	public List<ProjectDeclarePublicityBean> selectWithForegin(ProjectDeclarePublicityBean record) {
		// TODO Auto-generated method stub
		return projectdeclarepublicityMapper.selectWithForegin(record);
	}

	
}
