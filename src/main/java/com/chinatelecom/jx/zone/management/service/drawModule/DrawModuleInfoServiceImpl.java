package com.chinatelecom.jx.zone.management.service.drawModule;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.drawModule.DrawModuleInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawModule.DrawModuleInfoMapper;
@Service
@Transactional
public class DrawModuleInfoServiceImpl implements IDrawModuleInfoService {

	@Autowired
	private DrawModuleInfoMapper drawmoduleinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(DrawModuleInfoBean record) {
		return drawmoduleinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return drawmoduleinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				drawmoduleinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(DrawModuleInfoBean record) {
		return drawmoduleinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public DrawModuleInfoBean selectById(BigDecimal id) {
		return drawmoduleinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<DrawModuleInfoBean> queryByCond(DrawModuleInfoBean record) {
		return drawmoduleinfoMapper.queryByCond(record);
	}

	
}
