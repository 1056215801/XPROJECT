

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareCommentBean;

public interface ExpShareCommentMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(ExpShareCommentBean record);

    int insertSelective(ExpShareCommentBean record);

    ExpShareCommentBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(ExpShareCommentBean record);

    int updateByPrimaryKey(ExpShareCommentBean record);
    
    //ExpShareCommentBean selectWithForeignById(BigDecimal id);

   	List<ExpShareCommentBean> queryByCond(ExpShareCommentBean record);
   	
   	//List<ExpShareCommentBean> queryByCondWithForeign(ExpShareCommentBean record);
}