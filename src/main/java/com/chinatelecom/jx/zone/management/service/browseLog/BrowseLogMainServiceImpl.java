package com.chinatelecom.jx.zone.management.service.browseLog;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.browseLog.BrowseLogMainMapper;
@Service
@Transactional
public class BrowseLogMainServiceImpl implements IBrowseLogMainService {

	@Autowired
	private BrowseLogMainMapper browselogmainMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(BrowseLogMainBean record) {
		return browselogmainMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return browselogmainMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				browselogmainMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(BrowseLogMainBean record) {
		return browselogmainMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public BrowseLogMainBean selectById(BigDecimal id) {
		return browselogmainMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<BrowseLogMainBean> queryByCond(BrowseLogMainBean record) {
		return browselogmainMapper.queryByCond(record);
	}

	@Override
	public int insertLog(BigDecimal logId, BigDecimal relatedId,
			BigDecimal accountId, String source) {
		BrowseLogMainBean browseLogMainBean = new BrowseLogMainBean();
		browseLogMainBean.setId(logId);
		browseLogMainBean.setRelatedId(relatedId);
		browseLogMainBean.setSource(source);
		browseLogMainBean.setAccountId(accountId);
		browseLogMainBean.setRemark("");
		browseLogMainBean.setLogCount(new BigDecimal("1"));
		browseLogMainBean.setCreateTime(new Timestamp(new Date().getTime()));
		return browselogmainMapper.insert(browseLogMainBean);
	}

	@Override
	public int getBrowseCount(BrowseLogMainBean record){
		return browselogmainMapper.getBrowseCount(record);
	}
}
