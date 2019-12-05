package com.chinatelecom.jx.zone.management.service.projectActivity;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityComplainBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityComplainMapper;

@Service
@Transactional
public class ProjectActivityComplainServiceImpl implements IProjectActivityComplainService {

	@Autowired
	private ProjectActivityComplainMapper projectactivitycomplainMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectActivityComplainBean record) {
		return projectactivitycomplainMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectactivitycomplainMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectactivitycomplainMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectActivityComplainBean record) {
		return projectactivitycomplainMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectActivityComplainBean selectById(BigDecimal id) {
		return projectactivitycomplainMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectActivityComplainBean> queryByCond(ProjectActivityComplainBean record) {
		return projectactivitycomplainMapper.queryByCond(record);
	}

	@Override
	public List<ProjectActivityComplainBean> queryByCondRewrite(
			ProjectActivityComplainBean projectActivityComplainBean) {
		return projectactivitycomplainMapper.queryByCondRewrite(projectActivityComplainBean);
	}

	
}
