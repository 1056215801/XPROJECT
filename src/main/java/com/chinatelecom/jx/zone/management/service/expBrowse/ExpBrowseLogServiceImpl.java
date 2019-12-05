package com.chinatelecom.jx.zone.management.service.expBrowse;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.expBrowse.ExpBrowseLogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expBrowse.ExpBrowseLogMapper;
@Service
@Transactional
public class ExpBrowseLogServiceImpl implements IExpBrowseLogService {

	@Autowired
	private ExpBrowseLogMapper expbrowselogMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ExpBrowseLogBean record) {
		return expbrowselogMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return expbrowselogMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				expbrowselogMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ExpBrowseLogBean record) {
		return expbrowselogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ExpBrowseLogBean selectById(BigDecimal id) {
		return expbrowselogMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ExpBrowseLogBean> queryByCond(ExpBrowseLogBean record) {
		return expbrowselogMapper.queryByCond(record);
	}

	
}
