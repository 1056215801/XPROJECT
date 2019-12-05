package com.chinatelecom.jx.zone.management.service.statisticsInput;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.statisticsInput.StatisticsInputMapper;
import com.github.pagehelper.Page;
@Service
@Transactional
public class StatisticsInputServiceImpl implements IStatisticsInputService {

	@Autowired
	private StatisticsInputMapper statisticsinputMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(StatisticsInputBean record) {
		return statisticsinputMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return statisticsinputMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				statisticsinputMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(StatisticsInputBean record) {
		return statisticsinputMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public StatisticsInputBean selectById(BigDecimal id) {
		return statisticsinputMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<StatisticsInputBean> queryByCond(StatisticsInputBean record) {
		return statisticsinputMapper.queryByCond(record);
	}

	@Override
	public List<StatisticsInputBean> queryByCondWithValue(StatisticsInputBean record) {
		return statisticsinputMapper.queryByCondWithValue(record);
	}
	
	@Override
	public Page<StatisticsInputBean> queryByCondWithValueByPage(StatisticsInputBean record){
		return statisticsinputMapper.queryByCondWithValueByPage(record);
	}

	@Override
	public StatisticsInputBean queryStartAndEndTime(
			StatisticsInputBean inputBean) {
		return statisticsinputMapper.queryStartAndEndTime(inputBean);
	}
}
