package com.chinatelecom.jx.zone.management.service.drawTd;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInfoBean;
import  com.chinatelecom.jx.zone.management.bean.drawTd.DrawTdInputBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTd.DrawTdInputMapper;
@Service
@Transactional
public class DrawTdInputServiceImpl implements IDrawTdInputService {

	@Autowired
	private DrawTdInputMapper drawtdinputMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(DrawTdInputBean record) {
		return drawtdinputMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return drawtdinputMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int deleteByTableId(BigDecimal tableId) {
		DrawTdInputBean bean = new DrawTdInputBean();
		bean.setTableId(tableId);
		List<DrawTdInputBean> tdList = drawtdinputMapper.queryByCond(bean);
		for(DrawTdInputBean obj : tdList){
			drawtdinputMapper.deleteByPrimaryKey(obj.getId());
		}
		return 1;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				drawtdinputMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(DrawTdInputBean record) {
		return drawtdinputMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public DrawTdInputBean selectById(BigDecimal id) {
		return drawtdinputMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<DrawTdInputBean> queryByCond(DrawTdInputBean record) {
		return drawtdinputMapper.queryByCond(record);
	}

	
}
