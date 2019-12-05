package com.chinatelecom.jx.zone.management.service.weixinConfigReply;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  com.chinatelecom.jx.zone.management.bean.weixinConfigReply.WeixinConfigReplyBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.weixinConfigReply.WeixinConfigReplyMapper;
import com.jfinal.weixin.sdk.msg.out.News;
@Service
@Transactional
public class WeixinConfigReplyServiceImpl implements IWeixinConfigReplyService {

	@Autowired
	private WeixinConfigReplyMapper weixinconfigreplyMapper;
	 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(WeixinConfigReplyBean record) {
		return weixinconfigreplyMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return weixinconfigreplyMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				weixinconfigreplyMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(WeixinConfigReplyBean record) {
		return weixinconfigreplyMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public WeixinConfigReplyBean selectById(BigDecimal id) {
		return weixinconfigreplyMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<WeixinConfigReplyBean> queryByCond(WeixinConfigReplyBean record) {
		return weixinconfigreplyMapper.queryByCond(record);
	}

	@Override
	public ArrayList<News> createMsg() {
		WeixinConfigReplyBean record=new WeixinConfigReplyBean();
		ArrayList<News> returnList=new ArrayList<News>();
		Short s=new Short("1");
		record.setStatus(s);
		record.setShowSubscribe(s);
		record.setOrderByClause("SHOW_SUBSCRIBE_ORDER");
		List<WeixinConfigReplyBean> list=	weixinconfigreplyMapper.queryByCond(record);
		for(WeixinConfigReplyBean b:list){
			if(b.getType().equals("newsMsg")){
				News article = new News();
				article.setTitle(b.getTitle());
				article.setDescription(b.getReplyWord());
	 			article.setUrl(b.getJumpUrl());
	 			article.setPicUrl(b.getPicUrl());
	 			returnList.add(article);
			}
		}
		return returnList;
	}

	
}
