package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareNodeMapper;

@Service
@Transactional
public class ProjectDeclareNodeServiceImpl implements IProjectDeclareNodeService {

    @Autowired
    private ProjectDeclareNodeMapper projectdeclarenodeMapper;

    @Override
    @Transactional(readOnly = false)
    public int insert(ProjectDeclareNodeBean record) {
        return projectdeclarenodeMapper.insertSelective(record);
    }

    @Override
    @Transactional(readOnly = false)
    public int deleteById(BigDecimal id) {
        return projectdeclarenodeMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional(readOnly = false)
    public int batchDelete(String[] ids) {
        if (ids != null) {
            for (int i = 0; i < ids.length; i++) {
                projectdeclarenodeMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
            }
            return ids.length;
        } else {
            return 0;
        }
    }

    @Override
    @Transactional(readOnly = false)
    public int updateById(ProjectDeclareNodeBean record) {
        return projectdeclarenodeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public ProjectDeclareNodeBean selectById(BigDecimal id) {
        return projectdeclarenodeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ProjectDeclareNodeBean> queryByCond(ProjectDeclareNodeBean record) {
        return projectdeclarenodeMapper.queryByCond(record);
    }

    @Override
    public int deleteByDecalreId(BigDecimal id) {
        // TODO Auto-generated method stub
        return projectdeclarenodeMapper.deleteByDeclareId(id);
    }

    @Override
    public List<ProjectDeclareNodeBean> selectAll() {
        return projectdeclarenodeMapper.selectAll();
    }

    @Override
    public Integer updateTime() {
        return projectdeclarenodeMapper.updateTime();
    }

    @Override
    public Integer updateTimeDay() {
        return projectdeclarenodeMapper.updateTimeDay();
    }

}
