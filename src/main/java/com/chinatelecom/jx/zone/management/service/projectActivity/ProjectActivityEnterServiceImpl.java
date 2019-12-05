package com.chinatelecom.jx.zone.management.service.projectActivity;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityEnterBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityEnterMapper;
@Service
@Transactional
public class ProjectActivityEnterServiceImpl implements IProjectActivityEnterService {

	@Autowired
	private ProjectActivityEnterMapper projectactivityenterMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectActivityEnterBean record) {
		return projectactivityenterMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectactivityenterMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectactivityenterMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectActivityEnterBean record) {
		return projectactivityenterMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectActivityEnterBean selectById(BigDecimal id) {
		return projectactivityenterMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectActivityEnterBean> queryByCond(ProjectActivityEnterBean record) {
		return projectactivityenterMapper.queryByCond(record);
	}

	@Override
	public List<ProjectActivityEnterBean> queryByActivityId(
			ProjectActivityEnterBean projectActivityEnterBean) {
		return projectactivityenterMapper.queryByActivityId(projectActivityEnterBean);
	}

	
}
