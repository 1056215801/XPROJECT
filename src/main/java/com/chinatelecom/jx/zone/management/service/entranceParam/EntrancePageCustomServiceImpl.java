package com.chinatelecom.jx.zone.management.service.entranceParam;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.chinatelecom.jx.zone.management.bean.entranceParam.EntrancePageCustomBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.entranceParam.EntrancePageCustomMapper;

@Service
@Transactional
public class EntrancePageCustomServiceImpl implements IEntrancePageCustomService {
	@Autowired
	private EntrancePageCustomMapper entrancepagecustomMapper;

	@Override
	@Transactional(readOnly = false)
	public int insert(EntrancePageCustomBean record) {
		return entrancepagecustomMapper.insertSelective(record);
	}

	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return entrancepagecustomMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				entrancepagecustomMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		} else {
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(EntrancePageCustomBean record) {
		return entrancepagecustomMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public EntrancePageCustomBean selectById(BigDecimal id) {
		return entrancepagecustomMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<EntrancePageCustomBean> queryByCond(EntrancePageCustomBean record) {
		return entrancepagecustomMapper.queryByCond(record);
	}

	@Override
	public String getValueById(BigDecimal pId, BigDecimal oId) {
		return entrancepagecustomMapper.getValueById(pId, oId);
	}
}
