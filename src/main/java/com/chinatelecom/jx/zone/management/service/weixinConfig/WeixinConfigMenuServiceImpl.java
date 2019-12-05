package com.chinatelecom.jx.zone.management.service.weixinConfig;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigMenuBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig.WeixinConfigMenuMapper;
@Service
@Transactional
public class WeixinConfigMenuServiceImpl implements IWeixinConfigMenuService {

	@Autowired
	private WeixinConfigMenuMapper weixinconfigmenuMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WeixinConfigMenuBean record) {
		return weixinconfigmenuMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return weixinconfigmenuMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				weixinconfigmenuMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WeixinConfigMenuBean record) {
		return weixinconfigmenuMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WeixinConfigMenuBean selectById(BigDecimal id) {
		return weixinconfigmenuMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WeixinConfigMenuBean> queryByCond(WeixinConfigMenuBean record) {
		return weixinconfigmenuMapper.queryByCond(record);
	}
	@Override
	public List<WeixinConfigMenuBean> queryByParentId(BigDecimal record) {
		return weixinconfigmenuMapper.queryByParentId(record);
	}
	@Override
	public List<WeixinConfigMenuBean> queryByParentIds(List<BigDecimal> record) {
		return weixinconfigmenuMapper.queryByParentIds(record);
	}
}
