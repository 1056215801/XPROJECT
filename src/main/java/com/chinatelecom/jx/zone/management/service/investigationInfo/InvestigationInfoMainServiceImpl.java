package com.chinatelecom.jx.zone.management.service.investigationInfo;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import  com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formTemplate.FormTemplateMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo.InvestigationInfoExampleMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo.InvestigationInfoMainMapper;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.github.pagehelper.Page;
@Service
@Transactional
public class InvestigationInfoMainServiceImpl implements IInvestigationInfoMainService {

	@Autowired
	private InvestigationInfoMainMapper investigationinfomainMapper;
	@Autowired
	private FormTemplateMapper formTemplateMapper;	 
	@Autowired
	private InvestigationInfoExampleMapper investigationInfoExampleMapper;
	@Autowired
	private org.mybatis.spring.SqlSessionFactoryBean sqlSessionFactory; 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(InvestigationInfoMainBean record) {
		return investigationinfomainMapper.insertSelective(record);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int saveInvestigationInfo(InvestigationInfoMainBean investigationInfoMain){
		int result = 1;
		//保存模板操作
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		FormTemplateBean formTemplateBean = new FormTemplateBean();
		formTemplateBean.setId(investigationInfoMain.getFormId());
		formTemplateBean.setFormName(investigationInfoMain.getInvestigationName());
		formTemplateBean.setRelationType((short)2);
		formTemplateBean.setStatusFlag((short)1);
		formTemplateBean.setCreateTime(new Timestamp(new Date().getTime()));
		formTemplateBean.setUpdateTime(new Timestamp(new Date().getTime()));
		formTemplateBean.setCreateOperatorId(investigationInfoMain.getAccountId());//创建人
		formTemplateMapper.insertSelective(formTemplateBean);
		//保存调查业务操作
		investigationInfoMain.setCreateTime(new Timestamp(new Date().getTime()));
		investigationInfoMain.setStatus((short)0);

		investigationinfomainMapper.insertSelective(investigationInfoMain);
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return investigationinfomainMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				investigationinfomainMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(InvestigationInfoMainBean record) {
		//同步更新formTemplate表数据
		FormTemplateBean info = formTemplateMapper.selectByPrimaryKey(record.getFormId());
		FormTemplateBean formTemplateBean = new FormTemplateBean();
		formTemplateBean.setId(record.getFormId());
		formTemplateBean.setFormName(record.getInvestigationName());
		MyBeanUtils.copyProperties(formTemplateBean, info);
		
		formTemplateMapper.updateByPrimaryKey(info);
		return investigationinfomainMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public InvestigationInfoMainBean selectById(BigDecimal id) {
		return investigationinfomainMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<InvestigationInfoMainBean> queryByCond(InvestigationInfoMainBean record) {
		return investigationinfomainMapper.queryByCond(record);
	}

	@Override
	public Page<InvestigationInfoMainBean> queryAllList(
			InvestigationInfoMainBean investigationInfoMain) {
		Page<InvestigationInfoMainBean> list = investigationinfomainMapper.queryAllList(investigationInfoMain);
		
		if(list.getResult().size() > 0){
			//获取参与数量
			InvestigationInfoExampleBean exampBean = new InvestigationInfoExampleBean();
			exampBean.setStatus((short)1);
			List<InvestigationInfoExampleBean> exampList = investigationInfoExampleMapper.queryJoinCount(exampBean);
			Map<String,Integer> joinCountMap = new HashMap<String,Integer>();
			//封装成map
			for(InvestigationInfoExampleBean bean : exampList){
				joinCountMap.put(bean.getInvestigationId().toString(), Integer.valueOf(bean.getExtend1()));
			}
			
			//统计调查表填写数量
			for(InvestigationInfoMainBean record : list.getResult()){
				record.setTotalCount(joinCountMap.get(record.getId().toString())==null?0:joinCountMap.get(record.getId().toString()));
			}
		}
		return list;
	}

	@Override
	public Page<InvestigationInfoMainBean> queryEnterList(
			InvestigationInfoMainBean investigationInfoMain) {
		Page<InvestigationInfoMainBean> list = investigationinfomainMapper.queryEnterList(investigationInfoMain);
		
		if(list.getResult().size() > 0){
			//获取参与数量
			InvestigationInfoExampleBean exampBean = new InvestigationInfoExampleBean();
			exampBean.setStatus((short)1);
			List<InvestigationInfoExampleBean> exampList = investigationInfoExampleMapper.queryJoinCount(exampBean);
			Map<String,Integer> joinCountMap = new HashMap<String,Integer>();
			//封装成map
			for(InvestigationInfoExampleBean bean : exampList){
				joinCountMap.put(bean.getInvestigationId().toString(), Integer.valueOf(bean.getExtend1()));
			}
			
			//统计调查表填写数量
			for(InvestigationInfoMainBean record : list.getResult()){
				record.setTotalCount(joinCountMap.get(record.getId().toString())==null?0:joinCountMap.get(record.getId().toString()));
			}
		}
		return list;
	}

	@Override
	public int queryTotalSize(
			InvestigationInfoMainBean investigationInfoMainBean) {
		return investigationinfomainMapper.queryTotalSize(investigationInfoMainBean);
	}

	@Override
	public Map<String, String> copy(BigDecimal formId, BigDecimal newFormId) {
		SqlSession session = null;
		Map<String, String> map = new HashMap<String, String>();
		try { 
			//调用存过
			session = sqlSessionFactory.getObject().openSession(); 
			map.put("p_pre_formid", formId.toString());
			map.put("p_new_formid", newFormId.toString());
			session.selectOne("com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo.InvestigationInfoMainMapper.modelCopyMainInfo", map); 

        } catch (Exception e) {   
        	throw new RuntimeException(e.getMessage()); 
        } finally {   
            session.close();   
        }   
		return map;
	}
	
}
