package com.chinatelecom.jx.zone.management.bean;

import java.util.List;

import com.alibaba.fastjson.JSON;


public class BaseBean   {
	protected String idStr; // 字符串型主键
	
	protected String orderByClause; // 排序
    
	protected String seearchStartTime; //搜索开始时间
    
	protected String seearchEndTime; //搜索结束时间

	protected List  children ;   //子集
	
	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public String getSeearchStartTime() {
		return seearchStartTime;
	}

	public void setSeearchStartTime(String seearchStartTime) {
		this.seearchStartTime = seearchStartTime;
	}

	public String getSeearchEndTime() {
		return seearchEndTime;
	}

	public void setSeearchEndTime(String seearchEndTime) {
		this.seearchEndTime = seearchEndTime;
	}
    //获取ID的字符串
	public String getIdStr() {
		return idStr;
	}

	public List getChildren() {
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}
	
	// 转成Json 字符串
	protected String toJsonString() {
        return  JSON.toJSONString(this) ;
    }
}
