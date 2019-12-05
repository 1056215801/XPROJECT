package com.chinatelecom.jx.zone.management.service.investigationInfo;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoExampleBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo.InvestigationInfoExampleMapper;

import com.github.pagehelper.Page;
@Service
@Transactional
public class InvestigationInfoExampleServiceImpl implements IInvestigationInfoExampleService {

	@Autowired
	private InvestigationInfoExampleMapper investigationinfoexampleMapper;
	@Autowired
	private org.mybatis.spring.SqlSessionFactoryBean sqlSessionFactory; 
	
	@Override
	@Transactional(readOnly = false)
	public int insert(InvestigationInfoExampleBean record) {
		return investigationinfoexampleMapper.insertSelective(record);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return investigationinfoexampleMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				investigationinfoexampleMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(InvestigationInfoExampleBean record) {
		return investigationinfoexampleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public InvestigationInfoExampleBean selectById(BigDecimal id) {
		return investigationinfoexampleMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<InvestigationInfoExampleBean> queryByCond(InvestigationInfoExampleBean record) {
		return investigationinfoexampleMapper.queryByCond(record);
	}
	
	@Override
	public Page<InvestigationInfoExampleBean> queryByCondForPage(InvestigationInfoExampleBean record){
		return investigationinfoexampleMapper.queryByCondForPage(record);
	}
	
	@Override
	public List<InvestigationInfoExampleBean> queryJoinCount(InvestigationInfoExampleBean record){
		return investigationinfoexampleMapper.queryJoinCount(record);
	}

	@Override
	public Object[] insertExample(BigDecimal id,BigDecimal formId,
			BigDecimal accountId, String accountName, SeqIdType seq, String ipAddr,Date createTime) {
		String result = null;
		String resultdesc = null;
		SqlSession session = null;
		BigDecimal exampleId = null;
		try { 
			InvestigationInfoExampleBean investigationInfoExampleBean = 
					new InvestigationInfoExampleBean();
			exampleId = seq.getNextSeqIdToBigDecimal();
			investigationInfoExampleBean.setId(exampleId);
			investigationInfoExampleBean.setInvestigationId(id);
			investigationInfoExampleBean.setAccountId(accountId);
			investigationInfoExampleBean.setAccountName(accountName);
			investigationInfoExampleBean.setIpAddress(ipAddr);
			investigationInfoExampleBean.setSource((short)1);
			investigationInfoExampleBean.setStatus((short)1);
			investigationInfoExampleBean.setRemark("");
			investigationInfoExampleBean.setCreateTime(new Timestamp(createTime.getTime()));
			investigationinfoexampleMapper.insert(investigationInfoExampleBean);
			
			//调用存过
			session = sqlSessionFactory.getObject().openSession(); 
		    Map<String, String> map = new HashMap<String, String>();
			map.put("p_form_id", formId.toString());
			map.put("p_relation_id", exampleId.toString());
			map.put("p_create_operator_id", accountId.toString());
			session.selectOne("com.chinatelecom.jx.zone.management.dao.mybatis.mapper.investigationInfo.InvestigationInfoExampleMapper.modelInsertInputProinst", map); 
			result = map.get("p_result");
			resultdesc = map.get("p_resultdesc");
			
        } catch (Exception e) {   
        	throw new RuntimeException(e.getMessage()); 
        } finally {   
            session.close();   
        }   
		Object[] obj = new Object[]{result,resultdesc,exampleId};
		
		return obj;
		
	}

	
}
