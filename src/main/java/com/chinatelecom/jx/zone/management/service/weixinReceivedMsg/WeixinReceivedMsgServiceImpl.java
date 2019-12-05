package com.chinatelecom.jx.zone.management.service.weixinReceivedMsg;


import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg.WeixinReceivedMsgBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinReceivedMsg.WeixinReceivedMsgMapper;
@Service
@Transactional
public class WeixinReceivedMsgServiceImpl implements IWeixinReceivedMsgService {

	@Autowired
	private WeixinReceivedMsgMapper weixinreceivedmsgMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WeixinReceivedMsgBean record) {
		return weixinreceivedmsgMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return weixinreceivedmsgMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				weixinreceivedmsgMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WeixinReceivedMsgBean record) {
		return weixinreceivedmsgMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WeixinReceivedMsgBean selectById(BigDecimal id) {
		return weixinreceivedmsgMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WeixinReceivedMsgBean> queryByCond(WeixinReceivedMsgBean record) {
		return weixinreceivedmsgMapper.queryByCond(record);
	}

	
}
