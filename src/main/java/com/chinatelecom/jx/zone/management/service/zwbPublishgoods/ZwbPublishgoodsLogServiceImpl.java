package com.chinatelecom.jx.zone.management.service.zwbPublishgoods;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.zwbPublishgoods.ZwbPublishgoodsLogMapper;
@Service
@Transactional
public class ZwbPublishgoodsLogServiceImpl implements IZwbPublishgoodsLogService {

	@Autowired
	private ZwbPublishgoodsLogMapper zwbpublishgoodslogMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ZwbPublishgoodsLogBean record) {
		return zwbpublishgoodslogMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return zwbpublishgoodslogMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				zwbpublishgoodslogMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ZwbPublishgoodsLogBean record) {
		return zwbpublishgoodslogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ZwbPublishgoodsLogBean selectById(BigDecimal id) {
		return zwbpublishgoodslogMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ZwbPublishgoodsLogBean> queryByCond(ZwbPublishgoodsLogBean record) {
		return zwbpublishgoodslogMapper.queryByCond(record);
	}

	
}
