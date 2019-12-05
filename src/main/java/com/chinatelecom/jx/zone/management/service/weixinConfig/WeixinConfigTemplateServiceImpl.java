package com.chinatelecom.jx.zone.management.service.weixinConfig;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigTemplateBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfig.WeixinConfigTemplateMapper;
@Service
@Transactional
public class WeixinConfigTemplateServiceImpl implements IWeixinConfigTemplateService {

	@Autowired
	private WeixinConfigTemplateMapper weixinconfigtemplateMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WeixinConfigTemplateBean record) {
		return weixinconfigtemplateMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return weixinconfigtemplateMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				weixinconfigtemplateMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WeixinConfigTemplateBean record) {
		return weixinconfigtemplateMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WeixinConfigTemplateBean selectById(BigDecimal id) {
		return weixinconfigtemplateMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WeixinConfigTemplateBean> queryByCond(WeixinConfigTemplateBean record) {
		return weixinconfigtemplateMapper.queryByCond(record);
	}

	
}
