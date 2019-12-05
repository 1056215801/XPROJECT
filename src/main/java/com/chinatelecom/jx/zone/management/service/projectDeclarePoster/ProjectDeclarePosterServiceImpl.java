package com.chinatelecom.jx.zone.management.service.projectDeclarePoster;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectDeclarePoster.ProjectDeclarePosterBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclarePoster.ProjectDeclarePosterMapper;
@Service
@Transactional
public class ProjectDeclarePosterServiceImpl implements IProjectDeclarePosterService {

	@Autowired
	private ProjectDeclarePosterMapper projectdeclareposterMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclarePosterBean record) {
		return projectdeclareposterMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclareposterMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectdeclareposterMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclarePosterBean record) {
		return projectdeclareposterMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclarePosterBean selectById(BigDecimal id) {
		return projectdeclareposterMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectDeclarePosterBean> queryByCond(ProjectDeclarePosterBean record) {
		return projectdeclareposterMapper.queryByCond(record);
	}

	
}
