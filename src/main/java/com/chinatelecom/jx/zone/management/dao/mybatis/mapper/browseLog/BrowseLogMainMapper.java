

package com.chinatelecom.jx.zone.management.dao.mybatis.mapper.browseLog;

import java.math.BigDecimal;
import java.util.List;

import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;

public interface BrowseLogMainMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(BrowseLogMainBean record);

    int insertSelective(BrowseLogMainBean record);

    BrowseLogMainBean selectByPrimaryKey(BigDecimal id);

    int updateByPrimaryKeySelective(BrowseLogMainBean record);

    int updateByPrimaryKey(BrowseLogMainBean record);
    
    //BrowseLogMainBean selectWithForeignById(BigDecimal id);

   	List<BrowseLogMainBean> queryByCond(BrowseLogMainBean record);
   	
   	int getBrowseCount(BrowseLogMainBean record);
   	
   	//List<BrowseLogMainBean> queryByCondWithForeign(BrowseLogMainBean record);
   	
   	int deleteByCond(BrowseLogMainBean record);
   	
   	
}