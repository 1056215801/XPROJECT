package com.chinatelecom.jx.zone.management.service.logisticsInfo;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.ZwbSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.zwbPublishgoods.ZwbPublishgoodsLogMapper;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import com.chinatelecom.jx.zone.management.util.MyBeanUtils;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.util.SynConsts;

@Service("zwbLogisticsInfoService")
@Transactional
public class ZwbLogisticsInfoServiceImpl implements IZwbLogisticsInfoService{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private ZwbPublishgoodsLogMapper zwbPublishgoodsLogMapper;
	@Value("${zwbLogistics}")
	private String zwbLogistics;

	
	
	@Override
	public String getToken(String userName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userName", userName);
		
		JSONObject json = invoker(paramMap, SynConsts.zwb_getToken_Url);
		String token = json.getString("token");
		
		return token;
	}

	@Override
	public ResultBean publishOrModifyGoods(ZwbPublishgoodsLogBean info) {
		ResultBean resultBean = new ResultBean();
		if(info.getToken()==null){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else if(info.getGoodsTypeId()==null){
			resultBean.setCode(1);
			resultBean.setMsg("货物类型goodsTypeId参数未设置！");
		}else if(info.getGoodsWeight()==null){
			resultBean.setCode(1);
			resultBean.setMsg("货物重量goodsWeight参数未设置！");
		}else if(info.getSendType()==null){
			resultBean.setCode(1);
			resultBean.setMsg("配送方式sendType参数未设置！");
		}else if(info.getBeginAreaId()==null){
			resultBean.setCode(1);
			resultBean.setMsg("发货地址beginAreaId参数未设置！");
		}else if(info.getBeginContacts()==null){
			resultBean.setCode(1);
			resultBean.setMsg("发货联系人电话beginContacts参数未设置！");
		}else if(info.getEndAreaId()==null){
			resultBean.setCode(1);
			resultBean.setMsg("收货地址endAreaId参数未设置！");
		}else{
			String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";
			
			if(!info.getBeginContacts().matches(regExp)){
				resultBean.setCode(1);
				resultBean.setMsg("发货联系人电话beginContacts参数格式不正确！");
			}else{
				Map<String, Object> paramMap = getMap(info);
				paramMap.put("loadTime", info.getLoadTimeStr());
				
				JSONObject json = null;
				if(info.getGoodsId()==null){
					json = invoker(paramMap, SynConsts.zwb_publishGoods_Url);
				}else{
					json = invoker(paramMap, SynConsts.zwb_modGoods_Url);
				}
				
				resultBean.setCode(json.getInteger("code"));
				resultBean.setMsg(json.getString("info"));
				
				if(resultBean.getCode()==20000||resultBean.getCode()==30000){
					if(info.getGoodsId()==null){
						info.setGoodsId(json.getInteger("goodsId"));
						createGoodsInfo(info, 1);
					}else{
						createGoodsInfo(info, 2);
					}
				}
			}
		}
		
		return resultBean;
	}

	@Override
	public ResultBean delGoods(String token, Integer goodsId) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(token)){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else if(goodsId==null){
			resultBean.setCode(1);
			resultBean.setMsg("货源id:goodsId参数未设置！");
		}else{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("token", token);
			paramMap.put("goodsId", goodsId);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_delGoods_Url);
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
			
			/*if(resultBean.getCode()==40000){
				zwbPublishgoodsLogMapper.deleteByPrimaryKey(new BigDecimal(goodsId));
			}*/
		}
		return resultBean;
	}

	@Override
	public ResultBean findGoods(ZwbSourceSearchBean info) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(info.getToken())){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else{
			Map<String, Object> paramMap = getMap(info);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_findGoods_Url);
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
			resultBean.setValue(JSON.parseObject(json.getString("records").replaceAll(" ", ""),List.class));
			resultBean.setJsonValue(JSONObject.parseObject(
					"{\"totalCount\":\"" + json.getInteger("totalCount") + "\"}"));
		}
		
		return resultBean;
	}

	@Override
	public ResultBean findGoodsDetailById(String token, Integer goodsId) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(token)){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else if(goodsId==null){
			resultBean.setCode(1);
			resultBean.setMsg("货源id:goodsId参数未设置！");
		}else{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("token", token);
			paramMap.put("goodsId", goodsId);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_goodsDetail_Url);
			String value = json.getString("records");
			JSONObject valueObject = JSONObject.parseObject("{\"goodsInfo\":" + value + "}");
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
			resultBean.setJsonValue1(valueObject);
		}
		
		return resultBean;
	}

	@Override
	public ResultBean findCar(ZwbSourceSearchBean info) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(info.getToken())){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else{
			Map<String, Object> paramMap = getMap(info);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_findCarSource_Url);
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
			resultBean.setValue(JSON.parseObject(json.getString("records").replaceAll(" ", ""),List.class));
			resultBean.setJsonValue(JSONObject.parseObject(
					"{\"totalCount\":\"" + json.getInteger("totalCount") + "\"}"));
			
			/*StringBuilder newParam = new StringBuilder().append("[{");
			for(Map.Entry<String, Object> entry:paramMap.entrySet()){
				newParam.append("\"" + entry.getKey() + "\":\"" + entry.getValue() + "\","); 
			}
			newParam.append("}]");
			resultBean.setJsonValue1(JSONObject.parseObject(
					"{\"zwbSourceSearchBean\":" + newParam + "}"));
			*/
			
			List<JSONObject> list = new ArrayList<>();
			for(Map.Entry<String, Object> entry:paramMap.entrySet()){
				JSONObject param = new JSONObject();
				param.put(entry.getKey(), entry.getValue());
				list.add(param);
			}
			
			JSONObject jo1 = new JSONObject();
			jo1.put("zwbSourceSearchBean", list.toString());
			resultBean.setJsonValue1(jo1);
			
		}
		
		return resultBean;
	}

	@Override
	public ResultBean collectCar(String token, Integer carSourceId) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(token)){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else if(carSourceId==null){
			resultBean.setCode(1);
			resultBean.setMsg("车源id:carSourceId参数未设置！");
		}else{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("token", token);
			paramMap.put("carSourceId", carSourceId);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_collectCarSource_Url);
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
		}
		
		return resultBean;
	}
	
	/**
	 * 调用接口
	 * @param paramMap
	 * @param url
	 * @return
	 */
	private JSONObject invoker(Map<String, Object> paramMap,String url){
		String backJson =""; 
		String _url = new StringBuilder(124).append(zwbLogistics)
				.append(url).toString();
		try{
			/*if("/api/jx/user_getToken".equals(url)){
				backJson = HttpToolkit.GETMethod(_url, paramMap);
			}else{				
				backJson = HttpToolkit.POSTMethod(_url, paramMap);
			}*/
			backJson = HttpToolkit.GETMethod(_url, paramMap);
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
		return  JSONObject.parseObject(backJson) ;
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
	public ZwbPublishgoodsLogBean selectByPrimaryKey(Integer goodsId) {
		ZwbPublishgoodsLogBean info = zwbPublishgoodsLogMapper
				.selectByPrimaryKey(new BigDecimal(goodsId));
		String sql = "select id from t_zwb_address connect by prior parent = id start with id =? order by kind asc ";
		
		List<?> list1 = jdbcTemplate.queryForList(sql, new Object[]{info.getBeginAreaId()});
		Integer[] beginAreaIds = new Integer[4];
		for(int i=0;i<list1.size();i++){
			String str = list1.get(i).toString();
			beginAreaIds[i] = Integer.valueOf(str.substring(4,str.length()-1));
		}
		info.setBeginAreaIds(beginAreaIds);
		
		List<?> list2 = jdbcTemplate.queryForList(sql, new Object[]{info.getEndAreaId()});
		Integer[] endAreaIds = new Integer[4];
		for(int i=0;i<list2.size();i++){
			String str = list2.get(i).toString();
			endAreaIds[i] = Integer.valueOf(str.substring(4,str.length()-1));
		}
		info.setEndAreaIds(endAreaIds);
		
		return info;
	}

	@Override
	public ResultBean getAddressInfo(Short kind, Integer parent) {
		ResultBean resultBean = new ResultBean();
		if(kind==null){
			resultBean.setCode(1);
			resultBean.setMsg("地址层级：kind参数未设置！");
		}else if(parent==null){
			resultBean.setCode(1);
			resultBean.setMsg("地址父节点：parent参数未设置！");
		}else{
			String sql = "select * from t_zwb_address where parent = ? and kind = ? ";
			List<?> list = jdbcTemplate.queryForList(sql, new Object[]{parent, kind});
			resultBean.setCode(1);
			resultBean.setMsg("中危宝地址获取成功！");
			resultBean.setValue(list);
		}
		
		return  resultBean ;
	}
	public ResultBean createGoodsInfo(ZwbPublishgoodsLogBean info, Integer type){
		int i = 0;
		if(type==1){
			//新增
			info.setCreateTime(new Timestamp(new Date().getTime()));
			i = zwbPublishgoodsLogMapper.insert(info);
		}else{
			//编辑
			ZwbPublishgoodsLogBean record = zwbPublishgoodsLogMapper
					.selectByPrimaryKey(new BigDecimal(info.getGoodsId()));
			MyBeanUtils.copyProperties(info, record);
			i = zwbPublishgoodsLogMapper.updateByPrimaryKey(record);
		}
		
		ResultBean resultBean = new ResultBean();
		resultBean.setCode(i);
		resultBean.setMsg(i==1?"success":"false");
		
		return  resultBean ;
	}

	@Override
	public ResultBean cancelCollect(String token, Integer carSourceId) {
		ResultBean resultBean = new ResultBean();
		if(!StringUtil.checkNotNull(token)){
			resultBean.setCode(1);
			resultBean.setMsg("token参数未设置！");
		}else if(carSourceId==null){
			resultBean.setCode(1);
			resultBean.setMsg("车源id:carSourceId参数未设置！");
		}else{
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("token", token);
			paramMap.put("carSourceId", carSourceId);
			
			JSONObject json = invoker(paramMap, SynConsts.zwb_cancelCollectionCarSource_Url);
			
			resultBean.setCode(json.getInteger("code"));
			resultBean.setMsg(json.getString("info"));
		}
		
		return resultBean;
	}
}
