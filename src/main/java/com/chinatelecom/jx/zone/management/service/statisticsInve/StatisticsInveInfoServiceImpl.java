package com.chinatelecom.jx.zone.management.service.statisticsInve;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInve.StatisticsInveInfoMapper;
import com.github.pagehelper.Page;
@Service
@Transactional
public class StatisticsInveInfoServiceImpl implements IStatisticsInveInfoService {

	@Autowired
	private StatisticsInveInfoMapper statisticsinveinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(StatisticsInveInfoBean record) {
		return statisticsinveinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return statisticsinveinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				statisticsinveinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(StatisticsInveInfoBean record) {
		return statisticsinveinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public StatisticsInveInfoBean selectById(BigDecimal id) {
		return statisticsinveinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<StatisticsInveInfoBean> queryByCond(StatisticsInveInfoBean record) {
		return statisticsinveinfoMapper.queryByCond(record);
	}
	
	@Override
	public Page<StatisticsInveInfoBean> queryByCondForPage(StatisticsInveInfoBean record){
		return statisticsinveinfoMapper.queryByCondForPage(record);
	}

	@Override
	public StatisticsInveInfoBean queryTotalCountByCond(StatisticsInveInfoBean record){
		return statisticsinveinfoMapper.queryTotalCountByCond(record);
	}
}
