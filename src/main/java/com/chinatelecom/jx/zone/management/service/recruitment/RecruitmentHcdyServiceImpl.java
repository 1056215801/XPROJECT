package com.chinatelecom.jx.zone.management.service.recruitment;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.hcdy.helper.HcdyInvokerHelper;
import com.chinatelecom.jx.zone.hcdy.positionmanage.log.bean.HcdyRecruitmentLogBean;
import com.chinatelecom.jx.zone.management.util.StringUtil;

@Service
@Transactional(rollbackFor=Exception.class)
public class RecruitmentHcdyServiceImpl implements IRecruitmentHcdyService {
	@Autowired
	private HcdyInvokerHelper invokerHelper;

	@Override
	public List<?> getCompanyList(Map<String, Object> paramMap) {
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("getRecruitSuccessInvoker", paramMap);
		
		List<?> companyList = new ArrayList<>();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			companyList = JSON.parseObject(jsonObject.getString("companyList"), List.class);
		}
		
		return companyList;
	}

	@Override
	public int publish(HcdyRecruitmentLogBean info) {
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("positionManageInvoker", getMap(info));
		return invokeInfoBean.getErrorCode();
	}
	
	/**
	 * 封装实体值到map
	 * @param info
	 * @return
	 */
	private Map<String, Object> getMap(Object info){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		Field[] fields = info.getClass().getDeclaredFields();
		try{
			for(int i=0;i<fields.length;i++){
				String name = fields[i].getName(); // 获取属性的名称
				String type = fields[i].getGenericType().toString(); // 获取属性的类型
				String nameM = name.substring(0,1).toUpperCase()+name.substring(1);
				
				if(type.equals("class java.lang.String")){
					Method m = info.getClass().getMethod("get" + nameM);
	                String value = (String)m.invoke(info); // 调用getter方法获取属性值
	                if(StringUtil.checkNotNull(value)){
	               	 	paramMap.put(name, value);
	                }
	            } 
				if(type.equals("class java.lang.Integer")){
					Method m = info.getClass().getMethod("get" + nameM);
					Integer value = (Integer)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value);
	                }
	            } 
				if(type.equals("class java.lang.Double")){
					Method m = info.getClass().getMethod("get" + nameM);
					Double value = (Double)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value);
	                }
	            } 
				if(type.equals("class java.lang.Short")){
					Method m = info.getClass().getMethod("get" + nameM);
					Short value = (Short)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value);
	                }
	            } 
				
				if(type.equals("class java.math.BigDecimal")){
					Method m = info.getClass().getMethod("get" + nameM);
					if(m.invoke(info)!=null){
						BigDecimal value = new BigDecimal(m.invoke(info).toString()); 
						paramMap.put(name, value.toString());
					}
	            } 
				
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return paramMap;
	}

	@Override
	public List<?> getAjInfolist(Map<String, Object> paramMap) {
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("getAjInfoInvoker", paramMap);
		
		List<?> ajList = new ArrayList<>();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			ajList = JSON.parseObject(jsonObject.getString("ajList"), List.class);
		}
		
		return ajList;
	}

	@Override
	public InvokeInfoBean<?> hcdyLogin(Map<String, Object> paramMap) {
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("loginInvoker", paramMap);
		return invokeInfoBean;
	}
}
