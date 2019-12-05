package com.chinatelecom.jx.zone.management.service.statisticsExpshare;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.statisticsExpshare.StatisticsExpshareInfoBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsExpshare.StatisticsExpshareInfoMapper;

@Service
@Transactional
public class StatisticsExpshareInfoServiceImpl implements IStatisticsExpshareInfoService {

	@Autowired
	private StatisticsExpshareInfoMapper statisticsexpshareinfoMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(StatisticsExpshareInfoBean record) {
		return statisticsexpshareinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return statisticsexpshareinfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				statisticsexpshareinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(StatisticsExpshareInfoBean record) {
		return statisticsexpshareinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public StatisticsExpshareInfoBean selectById(BigDecimal id) {
		return statisticsexpshareinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<StatisticsExpshareInfoBean> queryByCond(StatisticsExpshareInfoBean record) {
		return statisticsexpshareinfoMapper.queryByCond(record);
	}

	@Override
	public List<StatisticsExpshareInfoBean> queryStatisticsListByCity(
			StatisticsExpshareInfoBean info) {
		return statisticsexpshareinfoMapper.queryStatisticsListByCity(info);
	}

	@Override
	public List<StatisticsExpshareInfoBean> queryStatisticsListByUnit(
			StatisticsExpshareInfoBean info) {
		return statisticsexpshareinfoMapper.queryStatisticsListByUnit(info);
	}

	@Override
	public List<StatisticsExpshareInfoBean> queryStatisticsListByTotal(
			StatisticsExpshareInfoBean info) {
		return statisticsexpshareinfoMapper.queryStatisticsListByTotal(info);
	}
	
}
