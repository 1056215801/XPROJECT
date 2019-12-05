package com.chinatelecom.jx.zone.management.service.projectDeclare;

import java.math.BigDecimal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareApplyBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareNodeBean;
import com.chinatelecom.jx.zone.management.bean.projectDeclare.ProjectDeclareOrgBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareInfoMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareNodeMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectDeclare.ProjectDeclareOrgMapper;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProjectDeclareInfoServiceImpl implements IProjectDeclareInfoService {

    @Autowired
    private ProjectDeclareInfoMapper projectdeclareinfoMapper;
    @Autowired
    private ProjectDeclareNodeMapper projectDeclareNodeMapper;
    @Autowired
    private IProjectDeclareNodeService projectDeclareNodeService;
    @Autowired
    private ProjectDeclareOrgMapper projectDeclareOrgMapper;

    @Override
    @Transactional(readOnly = false)
    public int insert(ProjectDeclareInfoBean record, List<ProjectDeclareNodeBean> list,
        List<ProjectDeclareOrgBean> orgList) {

        int result = 0;
        if (list != null && list.size() != 0) {
            for (int i = 0; i < list.size(); i++) {
                list.get(i).setDeclareId(record.getDeclareId());
                result = projectDeclareNodeMapper.insertSelective(list.get(i));
                if (result == 0) {
                    return 0;
                }
            }
        }
        if (orgList != null && orgList.size() != 0) {
            for (int i = 0; i < orgList.size(); i++) {
                result = projectDeclareOrgMapper.insertSelective(orgList.get(i));
                if (result == 0) {
                    return 0;
                }
            }
        }
        result = projectdeclareinfoMapper.insertSelective(record);
        return result;

    }

    @Override
    @Transactional(readOnly = false)
    public int deleteById(BigDecimal id) {
        return projectdeclareinfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional(readOnly = false)
    public int batchDelete(String[] ids) {
        if (ids != null) {
            for (int i = 0; i < ids.length; i++) {
                projectdeclareinfoMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
            }
            return ids.length;
        } else {
            return 0;
        }
    }

    @Override
    @Transactional(readOnly = false)
    public int updateById(ProjectDeclareInfoBean record, List<ProjectDeclareNodeBean> list) {
        try {
            projectdeclareinfoMapper.updateByPrimaryKeySelective(record);
            if (list.size() != 0) {
                projectDeclareNodeMapper.deleteByDeclareId(record.getDeclareId());
                for (int i = 0; i < list.size(); i++) {
                    projectDeclareNodeMapper.insertSelective(list.get(i));
                }
            }
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    @Transactional(readOnly = false)
    public int updateById(ProjectDeclareInfoBean record) {
        return projectdeclareinfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    @Transactional(readOnly = true)
    public ProjectDeclareInfoBean selectById(BigDecimal id) {
        ProjectDeclareInfoBean bean = projectdeclareinfoMapper.selectByPrimaryKey(id);
        if (bean != null) {
            ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
            projectDeclareNodeBean.setDeclareId(bean.getDeclareId());
            projectDeclareNodeBean.setOrderByClause("END_TIME ASC");
            List<ProjectDeclareNodeBean> nodeList = projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
            if (nodeList.size() != 0) {
                bean.setEndDate(nodeList.get(0).getRemainDay()+"");
            }
        }
        return bean;
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectDeclareInfoBean> queryByCond(ProjectDeclareInfoBean record) {
        return projectdeclareinfoMapper.queryByCond(record);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectDeclareInfoBean> queryFromMyApply(BigDecimal accountId) {
    	if(accountId==null){
    		accountId = BigDecimal.valueOf(-1);
    	}
        return  projectdeclareinfoMapper.queryFromMyApply(accountId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectDeclareInfoBean> queryByCondOrderBy(ProjectDeclareInfoBean record) {
        return projectdeclareinfoMapper.queryByCondOrderBy(record);
    }

    @Override
    @Transactional(readOnly = true)
    public List<ProjectDeclareInfoBean> queryByCondNotPreview(ProjectDeclareInfoBean record) {
        return projectdeclareinfoMapper.queryByCondNotPreview(record);
    }
    
    @Override
	public Integer countByCondNotPreview(ProjectDeclareInfoBean record) {
		return projectdeclareinfoMapper.countByCondNotPreview(record);
	}

    @Override
    @Transactional(readOnly = true)
    public List<ProjectDeclareInfoBean> queryForCount(ProjectDeclareInfoBean record) {
        return projectdeclareinfoMapper.queryForCount(record);
    }

    @Override
    public Integer updateTime() {
        return projectdeclareinfoMapper.updateTime();
    }

}
