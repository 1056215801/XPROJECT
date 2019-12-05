package com.chinatelecom.jx.zone.management.service.projectActivity;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityInfoMapper;
import com.github.pagehelper.Page;
@Service
@Transactional
public class ProjectActivityInfoServiceImpl implements IProjectActivityInfoService {

	@Autowired
	private ProjectActivityInfoMapper projectactivityinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectActivityInfoBean record) {
		return projectactivityinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectactivityinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectactivityinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectActivityInfoBean record) {
		return projectactivityinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectActivityInfoBean selectById(BigDecimal id) {
		return projectactivityinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectActivityInfoBean> queryByCond(ProjectActivityInfoBean record) {
		return projectactivityinfoMapper.queryByCond(record);
	}

	@Override
	public Page<ProjectActivityInfoBean> queryByEnterAccount(
			ProjectActivityInfoBean projectActivityInfo) {
		return projectactivityinfoMapper.queryByEnterAccount(projectActivityInfo);
	}

	@Override
	public int queryTotalSize(ProjectActivityInfoBean projectActivityInfoBean) {
		return projectactivityinfoMapper.queryTotalSize(projectActivityInfoBean);
	}

	
}
