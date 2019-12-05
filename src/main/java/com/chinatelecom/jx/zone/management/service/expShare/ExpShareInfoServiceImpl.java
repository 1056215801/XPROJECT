package com.chinatelecom.jx.zone.management.service.expShare;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.browseLog.BrowseLogMainBean;
import  com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityCommentBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.browseLog.BrowseLogMainMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare.ExpShareInfoMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityCommentMapper;

@Service
@Transactional
public class ExpShareInfoServiceImpl implements IExpShareInfoService {

	@Autowired
	private ExpShareInfoMapper expshareinfoMapper;
	@Autowired
	private BrowseLogMainMapper browseLogMainMapper;
	@Autowired
	private ProjectActivityCommentMapper projectActivityCommentMapper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private org.mybatis.spring.SqlSessionFactoryBean sqlSessionFactory;
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ExpShareInfoBean record) {
		return expshareinfoMapper.insertSelective(record);
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		int rst = 0;
		//删除浏览数据
		BrowseLogMainBean browseLogMainBean = new BrowseLogMainBean();
		browseLogMainBean.setRelatedId(id);
		browseLogMainBean.setSource("t_exp_share_info");
		rst = browseLogMainMapper.deleteByCond(browseLogMainBean);
		//删除评论
		ProjectActivityCommentBean projectActivityCommentBean = new ProjectActivityCommentBean();
		projectActivityCommentBean.setActivityId(id);
		projectActivityCommentBean.setKind(202);
		rst = projectActivityCommentMapper.deleteByCond(projectActivityCommentBean);
		//删除分享实体数据
		rst = expshareinfoMapper.deleteByPrimaryKey(id);
		return rst;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				expshareinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ExpShareInfoBean record) {
		return expshareinfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ExpShareInfoBean selectById(BigDecimal id) {
		return expshareinfoMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ExpShareInfoBean> queryByCond(ExpShareInfoBean record) {
		return expshareinfoMapper.queryByCond(record);
	}

	@Override
	public List<ExpShareInfoBean> queryAuditedList(ExpShareInfoBean record) {
		return expshareinfoMapper.queryAuditedList(record);
	}

	@Override
	public List<ExpShareInfoBean> queryOrderList(
			ExpShareInfoBean expShareInfoBean) {
		return expshareinfoMapper.queryOrderList(expShareInfoBean);
	}

	@Override
	public String getPlatformName(BigDecimal organizationId) {
		String sql = "select parameter_value from t_entrance_page_custom where parameter_id =11 and organization_id = ?";
		
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new  Object[]{organizationId});
		String platformName = null;
		if(!list.isEmpty()){
			platformName = list.get(0).get("parameter_value").toString();
		}else{
			platformName = "工业园信息平台";
		}
		return platformName;
	}

	@Override
	public int syncExpInfoData(BigDecimal expId) {
		int rst = 0;
		SqlSession session = null;
		Map<String, String> map = new HashMap<String, String>();
		try {
			session = sqlSessionFactory.getObject().openSession();
			map.put("p_exp_id", expId.toString());
			session.selectOne("com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare.ExpShareInfoMapper.syncExpInfoData", map);

			rst = Integer.parseInt(map.get("p_result"));
			if (rst != 1) {
				throw new RuntimeException(map.get("p_resultdesc"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			session.close();
		}
		return rst;
	}

	
}
