package com.chinatelecom.jx.zone.management.service.projectSuggest;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectSuggest.ProjectSuggestInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectSuggest.ProjectSuggestInfoMapper;
@Service
@Transactional
public class ProjectSuggestInfoServiceImpl implements IProjectSuggestInfoService {

	@Autowired
	private ProjectSuggestInfoMapper projectsuggestinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectSuggestInfoBean record) {
		return projectsuggestinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectsuggestinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectsuggestinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectSuggestInfoBean record) {
		return projectsuggestinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectSuggestInfoBean selectById(BigDecimal id) {
		return projectsuggestinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectSuggestInfoBean> queryByCond(ProjectSuggestInfoBean record) {
		return projectsuggestinfoMapper.queryByCond(record);
	}
	
	@Override
	public List<ProjectSuggestInfoBean> queryByCondNoStatus(ProjectSuggestInfoBean record) {
		return projectsuggestinfoMapper.queryByCondNoStatus(record);
	}

	@Override
	public List<ProjectSuggestInfoBean> queryByCondWithForeign(ProjectSuggestInfoBean record) {
		
		return projectsuggestinfoMapper.queryByCondWithForeign(record);
	}

	
}
