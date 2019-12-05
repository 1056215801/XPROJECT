package com.chinatelecom.jx.zone.management.service.expShare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.expShare.ExpShareCommentBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare.ExpShareCommentMapper;
@Service
@Transactional
public class ExpShareCommentServiceImpl implements IExpShareCommentService {

	@Autowired
	private ExpShareCommentMapper expsharecommentMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ExpShareCommentBean record) {
		return expsharecommentMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return expsharecommentMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				expsharecommentMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ExpShareCommentBean record) {
		return expsharecommentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ExpShareCommentBean selectById(BigDecimal id) {
		return expsharecommentMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ExpShareCommentBean> queryByCond(ExpShareCommentBean record) {
		return expsharecommentMapper.queryByCond(record);
	}

	
}
