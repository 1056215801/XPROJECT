package com.chinatelecom.jx.zone.management.service.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageParameterBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.entranceParam.EntrancePageParameterMapper;

@Service
@Transactional
public class EntrancePageParameterServiceImpl implements IEntrancePageParameterService {
	@Autowired
	private EntrancePageParameterMapper entrancepageparameterMapper;

	@Override
	@Transactional(readOnly = false)
	public int insert(EntrancePageParameterBean record) {
		return entrancepageparameterMapper.insertSelective(record);
	}

	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return entrancepageparameterMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				entrancepageparameterMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		} else {
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(EntrancePageParameterBean record) {
		return entrancepageparameterMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public EntrancePageParameterBean selectById(BigDecimal id) {
		return entrancepageparameterMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<EntrancePageParameterBean> queryByCond(EntrancePageParameterBean record) {
		return entrancepageparameterMapper.queryByCond(record);
	}
}
