package com.chinatelecom.jx.zone.management.service.weixinConfig;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig.WeixinConfigInfoMapper;
@Service
@Transactional
public class WeixinConfigInfoServiceImpl implements IWeixinConfigInfoService {

	@Autowired
	private WeixinConfigInfoMapper weixinconfiginfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WeixinConfigInfoBean record) {
		return weixinconfiginfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return weixinconfiginfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				weixinconfiginfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WeixinConfigInfoBean record) {
		return weixinconfiginfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WeixinConfigInfoBean selectById(BigDecimal id) {
		return weixinconfiginfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WeixinConfigInfoBean> queryByCond(WeixinConfigInfoBean record) {
		return weixinconfiginfoMapper.queryByCond(record);
	}

	@Override
	public WeixinConfigInfoBean selectByOpenId(String id) {
		return weixinconfiginfoMapper.selectByOpenId(id);
	}
}
