package com.chinatelecom.jx.zone.management.service.projectActivity;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.expShare.ExpShareInfoBean;
import com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityInfoBean;
import  com.chinatelecom.jx.zone.management.bean.projectActivity.ProjectActivityTagBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.expShare.ExpShareInfoMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityInfoMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.projectActivity.ProjectActivityTagMapper;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
@Service
@Transactional
public class ProjectActivityTagServiceImpl implements IProjectActivityTagService {

	@Autowired
	private ProjectActivityTagMapper projectactivitytagMapper;
	@Autowired
	private ProjectActivityInfoMapper projectActivityInfoMapper;
	@Autowired
	private ExpShareInfoMapper expShareInfoMapper;
	
	@Override
	@Transactional(readOnly = false)
	public int insert(ProjectActivityTagBean record) {
		return projectactivitytagMapper.insertSelective(record);
	}
	 
	@Override
	public ResultBean insertByValidate(ProjectActivityTagBean info, Integer type) {
		int rst = 0;
		ResultBean resultBean = new ResultBean();
		try{
			
			if(type==1){
				ProjectActivityTagBean record = new ProjectActivityTagBean();
				record.setSortGrade(info.getSortGrade());
				record.setKind(info.getKind());
				List<ProjectActivityTagBean> list = projectactivitytagMapper
						.queryByCond(record);
				if(list.size() == 0){
					info.setCreateTime(new Timestamp(new Date().getTime()));
					rst = projectactivitytagMapper.insert(info);
				}else{
					resultBean.setCode(2);
					resultBean.setMsg("该序号已经被使用！");
					return resultBean;
				}
			}else{
				ProjectActivityTagBean record = new ProjectActivityTagBean();
				record.setKind(info.getKind());
				List<ProjectActivityTagBean> list = projectactivitytagMapper
						.queryByCond(record);
                int isUse = 0;
                for(int i = 0;i<list.size();i++){
                	if(list.get(i).getSortGrade()==info.getSortGrade() && list.get(i).getTagId().compareTo(info.getTagId())!=0 ){
                		isUse = 1;
                	}
                }
				if(isUse == 0){
					rst = projectactivitytagMapper.updateByPrimaryKeySelective(info);
				}else{
					resultBean.setCode(2);
					resultBean.setMsg("该序号已经被使用！");
					return resultBean;
				}
				
			}
			
			if(rst == 1){
				resultBean.setCode(1);
				resultBean.setMsg("保存成功！");
			}else{
				resultBean.setCode(0);
				resultBean.setMsg("保存失败！");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return resultBean;
	}
	
	
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return projectactivitytagMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				projectactivitytagMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}
	
	
	@Override
	public ResultBean deleteByValidate(BigDecimal id, String tagName, Integer kind) {
		int rst = 0;
		ResultBean resultBean = new ResultBean();
		
		/*boolean flag = tagIsUesd(tagName,kind);
		if(flag){
			resultBean.setCode(2);
			resultBean.setMsg("该标签正在被使用不能删除！");
			return resultBean;
		}*/
		
		rst = projectactivitytagMapper.deleteByPrimaryKey(id);
		
		if(rst == 1){
			resultBean.setCode(1);
			resultBean.setMsg("删除成功！");
		}else{
			resultBean.setCode(0);
			resultBean.setMsg("删除失败！");
		}
		return resultBean;
	}

	@Override
	@Transactional(readOnly = false)
	public ResultBean updateById(ProjectActivityTagBean record) {
		ResultBean resultBean = new ResultBean();
		int rst = projectactivitytagMapper.updateByPrimaryKeySelective(record);
		if(rst == 1){
			resultBean.setCode(1);
			resultBean.setMsg("修改成功！");
		}else{
			resultBean.setCode(0);
			resultBean.setMsg("修改失败！");
		}
		return resultBean;
	}

	@Override
	public ProjectActivityTagBean selectById(BigDecimal id) {
		return projectactivitytagMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<ProjectActivityTagBean> queryByCond(ProjectActivityTagBean record) {
		return projectactivitytagMapper.queryByCond(record);
	}

	//判断标签是否使用
	private boolean tagIsUesd(String tagName,Integer kind){
		List<?> list = new ArrayList<>();
		if(kind == 201){
			ProjectActivityInfoBean info = new ProjectActivityInfoBean();
			info.setTags(new String[]{tagName});
			list = projectActivityInfoMapper.queryByCond(info);
		}else if(kind == 202){
			ExpShareInfoBean info = new ExpShareInfoBean();
			info.setExpLabel(tagName);
			list = expShareInfoMapper.queryByCond(info);
		}
		
		if(list.size()==0){
			return false;
		}else{			
			return true;
		}
	}
	
}
