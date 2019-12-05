package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareApplyMapper;

@Service
@Transactional
public class ProjectDeclareApplyServiceImpl implements IProjectDeclareApplyService {
	@Autowired
	private ProjectDeclareApplyMapper projectdeclareapplyMapper;

	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectDeclareApplyBean record) {
		return projectdeclareapplyMapper.insertSelective(record);
	}

	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectdeclareapplyMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if (ids != null) {
			for (int i = 0; i < ids.length; i++) {
				projectdeclareapplyMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		} else {
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(ProjectDeclareApplyBean record) {
		return projectdeclareapplyMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public ProjectDeclareApplyBean selectById(BigDecimal id) {
		return projectdeclareapplyMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<ProjectDeclareApplyBean> queryByCond(ProjectDeclareApplyBean record) {
		List<ProjectDeclareApplyBean> list = projectdeclareapplyMapper.queryByCond(record);
		return list;
	}

	@Override
	public int deleteByDeclareId(BigDecimal id) {
		return projectdeclareapplyMapper.deleteByDeclareId(id);
	}

	@Override
	public List<ProjectDeclareApplyBean> selectAuditedList(BigDecimal declareId, BigDecimal auditOrgId, String companyName) {
		return projectdeclareapplyMapper.selectAuditedList(declareId, auditOrgId, companyName);
	}

	@Override
	public int baseUpdateById(ProjectDeclareApplyBean record) {
		return projectdeclareapplyMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<ProjectDeclareApplyBean> selectReportedList(BigDecimal declareId, BigDecimal auditOrgId, String companyName) {
		return projectdeclareapplyMapper.selectReportedList(declareId, auditOrgId, companyName);
	}

	@Override
	@Transactional(readOnly = false)
	public List<ProjectDeclareApplyBean> selectApplyWithForegin(ProjectDeclareApplyBean record) {
		return projectdeclareapplyMapper.selectApplyWithForegin(record);
	}
}
