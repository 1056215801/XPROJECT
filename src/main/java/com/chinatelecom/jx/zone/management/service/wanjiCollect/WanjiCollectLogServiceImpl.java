package com.chinatelecom.jx.zone.management.service.wanjiCollect;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.wanjiCollect.WanjiCollectLogMapper;
@Service
@Transactional
public class WanjiCollectLogServiceImpl implements IWanjiCollectLogService {

	@Autowired
	private WanjiCollectLogMapper wanjicollectlogMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WanjiCollectLogBean record) {
		return wanjicollectlogMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return wanjicollectlogMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				wanjicollectlogMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WanjiCollectLogBean record) {
		return wanjicollectlogMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WanjiCollectLogBean selectById(BigDecimal id) {
		return wanjicollectlogMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WanjiCollectLogBean> queryByCond(WanjiCollectLogBean record) {
		return wanjicollectlogMapper.queryByCond(record);
	}

	
}
