package com.chinatelecom.jx.zone.management.service.statisticsInve;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveExampleBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInve.StatisticsInveExampleMapper;
@Service
@Transactional
public class StatisticsInveExampleServiceImpl implements IStatisticsInveExampleService {

	@Autowired
	private StatisticsInveExampleMapper statisticsinveexampleMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(StatisticsInveExampleBean record) {
		return statisticsinveexampleMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return statisticsinveexampleMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				statisticsinveexampleMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(StatisticsInveExampleBean record) {
		return statisticsinveexampleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public StatisticsInveExampleBean selectById(BigDecimal id) {
		return statisticsinveexampleMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<StatisticsInveExampleBean> queryByCond(StatisticsInveExampleBean record) {
		return statisticsinveexampleMapper.queryByCond(record);
	}

	
}
