package com.chinatelecom.jx.zone.management.service.drawTable;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTable.DrawTableInfoMapper;
@Service
@Transactional
public class DrawTableInfoServiceImpl implements IDrawTableInfoService {

	@Autowired
	private DrawTableInfoMapper drawtableinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(DrawTableInfoBean record) {
		return drawtableinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return drawtableinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				drawtableinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(DrawTableInfoBean record) {
		return drawtableinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public DrawTableInfoBean selectById(BigDecimal id) {
		return drawtableinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<DrawTableInfoBean> queryByCond(DrawTableInfoBean record) {
		return drawtableinfoMapper.queryByCond(record);
	}

	
}
