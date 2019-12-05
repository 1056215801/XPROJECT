package com.chinatelecom.jx.zone.management.service.projectActivity;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityCommentMapper;
import com.github.pagehelper.Page;
@Service
@Transactional
public class ProjectActivityCommentServiceImpl implements IProjectActivityCommentService {

	@Autowired
	private ProjectActivityCommentMapper projectactivitycommentMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectActivityCommentBean record) {
		return projectactivitycommentMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectactivitycommentMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectactivitycommentMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectActivityCommentBean record) {
		return projectactivitycommentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectActivityCommentBean selectById(BigDecimal id) {
		return projectactivitycommentMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectActivityCommentBean> queryByCond(ProjectActivityCommentBean record) {
		return projectactivitycommentMapper.queryByCond(record);
	}

	@Override
	public Page<ProjectActivityCommentBean> queryByCommentAccount(
			ProjectActivityCommentBean projectActivityCommentBean) {
		return projectactivitycommentMapper.queryByCommentAccount(projectActivityCommentBean);
	}

	
}
