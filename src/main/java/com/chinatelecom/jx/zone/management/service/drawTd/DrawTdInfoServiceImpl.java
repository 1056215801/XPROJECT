package com.chinatelecom.jx.zone.management.service.drawTd;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTd.DrawTdInfoMapper;
@Service
@Transactional
public class DrawTdInfoServiceImpl implements IDrawTdInfoService {

	@Autowired
	private DrawTdInfoMapper drawtdinfoMapper;
	
	@Override
	@Transactional(readOnly = false)
	public int insert(DrawTdInfoBean record) {
		return drawtdinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return drawtdinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int deleteByTableId(BigDecimal tableId) {
		DrawTdInfoBean td = new DrawTdInfoBean();
		td.setTableId(tableId);
		List<DrawTdInfoBean> tdList = drawtdinfoMapper.queryByCond(td);
		for(DrawTdInfoBean bean : tdList){
			drawtdinfoMapper.deleteByPrimaryKey(bean.getId());
		}
		return 1;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				drawtdinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(DrawTdInfoBean record) {
		return drawtdinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public DrawTdInfoBean selectById(BigDecimal id) {
		return drawtdinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<DrawTdInfoBean> queryByCond(DrawTdInfoBean record) {
		return drawtdinfoMapper.queryByCond(record);
	}

	
}
