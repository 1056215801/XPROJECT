package com.chinatelecom.jx.zone.management.service.expShare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.expShare.ExpShareLabelBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare.ExpShareLabelMapper;
@Service
@Transactional
public class ExpShareLabelServiceImpl implements IExpShareLabelService {

	@Autowired
	private ExpShareLabelMapper expsharelabelMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ExpShareLabelBean record) {
		return expsharelabelMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return expsharelabelMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				expsharelabelMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ExpShareLabelBean record) {
		return expsharelabelMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ExpShareLabelBean selectById(BigDecimal id) {
		return expsharelabelMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ExpShareLabelBean> queryByCond(ExpShareLabelBean record) {
		return expsharelabelMapper.queryByCond(record);
	}

	
}
