package com.chinatelecom.jx.zone.management.service.logisticsInfo;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiGoodsInfoBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.wanjiCollect.WanjiCollectLogMapper;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.wanji.helper.InvokerHelper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service("wanjiLogisticsInfoService")
@Transactional(rollbackFor=Exception.class)
public class WanjiLogisticsInfoServiceImpl implements IWanjiLogisticsInfoService{
	@Autowired
	private InvokerHelper invokerHelper;
	@Autowired
	private WanjiCollectLogMapper wanjiCollectLogMapper;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	@Transactional(timeout = 60)
	public Map<String, List<?>> getPlatCarDict(BigDecimal[] paramId) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("accountId", paramId[0].toString());
		paramMap.put("companyId", paramId[1].toString());
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("GetPlatCarCriteria", paramMap);
		
		Map<String, List<?>> result = new HashMap<>();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			// 车型字典
			List<?> CarTypeDictsList = JSON.parseObject(jsonObject.getString("CarTypeDicts"), List.class);
			// 载型字典
			List<?> CarLoadDictsList = JSON.parseObject(jsonObject.getString("CarLoadDicts"), List.class);
			result.put("CarTypeDictsList", CarTypeDictsList);
			result.put("CarLoadDictsList", CarLoadDictsList);
		}
		
		return result;
	}

	@Override
	@Transactional(timeout = 60)
	public ResultBean getPlatCarSource(WanjiSourceSearchBean info) {
		Map<String, String> paramMap = getMap(info);
		
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("GetPlatCarsEx", paramMap);
		
		ResultBean resultBean = new ResultBean();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject valueJson = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			
			int Total = valueJson.getIntValue("Total");
			@SuppressWarnings("unchecked")
			List<JSONObject> PlatCars = JSONObject.parseObject(valueJson.getString("PlatCars"), List.class);
			
			//收藏列表
			WanjiCollectLogBean wanjiCollectLogBean = new WanjiCollectLogBean();
			wanjiCollectLogBean.setAccountId(info.getAccountId());
			wanjiCollectLogBean.setStatus((short)1);
			List<WanjiCollectLogBean> collectList = wanjiCollectLogMapper.queryByCond(wanjiCollectLogBean);
			
			List<String> carIdList = new ArrayList<>();
			if (collectList.size()!=0){
				for (WanjiCollectLogBean record : collectList) {
					carIdList.add(record.getCarId().toString());
				}
			}
			
			//添加isCollect字段
			List<JSONObject> carList = new ArrayList<>();
			if(PlatCars!=null&&!PlatCars.isEmpty()){
				for (int i = 0; i < PlatCars.size(); i++) {
					JSONObject jsonObject = PlatCars.get(i);
					String carId = jsonObject.getString("Id");
					if (carIdList.contains(carId)) {
						jsonObject.put("isCollect", "true");
					} else {
						jsonObject.put("isCollect", "false");
					}
					carList.add(jsonObject);
				}
			}
			
			resultBean.setCode(1);
			resultBean.setValue(carList);
			resultBean.setJsonValue(JSONObject.parseObject("{\"Total\":" + Total + "}"));
		}else{
			resultBean.setCode(0);
			resultBean.setMsg("获取车源列表失败！");
		}
		
		return resultBean;
	}
	
	@Override
	public List<?> getAddress(Integer parent) {
		String sql = "select * from t_wanji_address where parent = ? ";
		return jdbcTemplate.queryForList(sql, new Object[]{parent});
	}

	@Override
	public Map<String, List<?>> getInitCargo(BigDecimal[] paramId) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("accountId", paramId[0].toString());
		paramMap.put("companyId", paramId[0].toString());
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("GetInitCargo", paramMap);
		
		Map<String, List<?>> result = new HashMap<>();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			// 货物子类型字典
			List<?> cargoSubTypeDictsList = JSON.parseObject(jsonObject.getString("CargoSubTypeDicts"), List.class);
			// 车型字典
			List<?> CarTypeDictsList = JSON.parseObject(jsonObject.getString("CarTypeDicts"), List.class);
			// 载型字典
			List<?> CarLoadDictsList = JSON.parseObject(jsonObject.getString("CarLoadDicts"), List.class);
			// 车长字典
			List<?> CarLengthDictsList = JSON.parseObject(jsonObject.getString("CarLengthDicts"), List.class);
			
			result.put("cargoSubTypeDictsList", cargoSubTypeDictsList);
			result.put("CarTypeDictsList", CarTypeDictsList);
			result.put("CarLoadDictsList", CarLoadDictsList);
			result.put("CarLengthDictsList", CarLengthDictsList);
		}
		
		return result;
	}

	@Override
	public ResultBean publishCargo(WanjiGoodsInfoBean wanjiGoodsInfoBean) {
		Map<String, String> paramMap = getMap(wanjiGoodsInfoBean);
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("PublishCargo", paramMap);
		ResultBean resultBean = new ResultBean();
		if(invokeInfoBean.getErrorCode()==0){
			resultBean.setCode(1);
			resultBean.setMsg("发布货源成功！");
		}else{
			resultBean.setCode(0);
			resultBean.setMsg("发布货源失败！");
		}
		return resultBean;
	}

	@Override
	public ResultBean getShipperCargoes(BigDecimal[] paramId) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("accountId", paramId[0].toString());
		paramMap.put("companyId", paramId[0].toString());
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("GetShipperCargoes", paramMap);
		
		ResultBean resultBean = new ResultBean();
		if(invokeInfoBean.getErrorCode()==0){
			JSONObject jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			
			resultBean.setCode(1);
			resultBean.setMsg("获取我的货源列表成功！");
			resultBean.setJsonValue(JSONObject.parseObject(
					"{\"Cargoes\":" + jsonObject.getString("Cargoes") + "}"));
			resultBean.setJsonValue1(JSONObject.parseObject(
					"{\"Total\":" + jsonObject.getString("Total") + "}"));
		}else{
			resultBean.setCode(0);
			resultBean.setMsg("获取我的货源列表失败！");
		}
		
		return resultBean;
	}

	@Override
	public WanjiCollectLogBean selectCollectCarDetail(BigDecimal collectId) {
		return wanjiCollectLogMapper.selectByPrimaryKey(collectId);
	}

	@Override
	public ResultBean collectCar(WanjiCollectLogBean wanjiCollectLogBean) {
		WanjiCollectLogBean info = new WanjiCollectLogBean();
		info.setCarId(wanjiCollectLogBean.getCarId());
		info.setAccountId(wanjiCollectLogBean.getAccountId());
		List<WanjiCollectLogBean> list = wanjiCollectLogMapper.queryByCond(info);
		ResultBean resultBean = new ResultBean();
		if(list.size()==0){
			int i = wanjiCollectLogMapper.insert(wanjiCollectLogBean);
			resultBean.setCode(i);
			resultBean.setMsg(i==1?"收藏车源成功！":"收藏车源失败！");
		}else{
			WanjiCollectLogBean record = list.get(0);
			record.setStatus((short)1);
			record.setCreateTime(new Timestamp(new Date().getTime()));
			int i = wanjiCollectLogMapper.updateByPrimaryKey(record);
			resultBean.setCode(i);
			resultBean.setMsg(i==1?"收藏车源成功！":"收藏车源失败！");
		}
		
		return resultBean;
	}

	@Override
	public ResultBean cancelCollect(BigDecimal carId, BigDecimal accountId) {
		ResultBean resultBean = new ResultBean();
		WanjiCollectLogBean wanjiCollectLogBean = new WanjiCollectLogBean();
		wanjiCollectLogBean.setCarId(carId);
		wanjiCollectLogBean.setAccountId(accountId);
		wanjiCollectLogBean.setStatus((short)1);
		List<WanjiCollectLogBean> list = wanjiCollectLogMapper.queryByCond(wanjiCollectLogBean);
		
		if(list.size()==0){
			resultBean.setCode(0);
			resultBean.setMsg("车源信息不存在！");
		}else{
			WanjiCollectLogBean record = list.get(0);
			record.setStatus((short)0);
			int i = wanjiCollectLogMapper.updateByPrimaryKey(record);
			resultBean.setCode(i);
			resultBean.setMsg(i==1?"取消收藏车源成功！":"取消收藏车源失败！");
		}
		return resultBean;
	}

	@Override
	public ResultBean collectList(BigDecimal accountId, Page<WanjiCollectLogBean> page) {
		WanjiCollectLogBean info = new WanjiCollectLogBean();
		info.setAccountId(accountId);
		info.setStatus((short)1);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		page = (Page<WanjiCollectLogBean>)wanjiCollectLogMapper.queryByCond(info);
		
		ResultBean resultBean = new ResultBean();
		
		if(page.getTotal()==0){
			resultBean.setCode(0);
			resultBean.setMsg("暂无收藏车源！");
		}else{
			resultBean.setCode(1);
			resultBean.setMsg("查询收藏车源列表成功！");
			resultBean.setValue(page.getResult());
			resultBean.setJsonValue(JSONObject.parseObject("{\"total\":" + page.getTotal() + "}"));
		}
		
		return resultBean;
	}
	
	/**
	 * 封装实体值到map
	 * @param info
	 * @return
	 */
	private Map<String, String> getMap(Object info){
		Map<String, String> paramMap = new HashMap<String, String>();
		Field[] fields = info.getClass().getDeclaredFields();
		try{
			for(int i=0;i<fields.length;i++){
				String name = fields[i].getName(); // 获取属性的名称
				String type = fields[i].getGenericType().toString(); // 获取属性的类型
				String nameM = "";
				if("companyId".equals(name)||"accountId".endsWith(name)){
					nameM = name.substring(0,1).toUpperCase()+name.substring(1);
				}else{
					nameM = name;
				}
				
				if(type.equals("class java.lang.String")){
					Method m = info.getClass().getMethod("get" + nameM);
	                String value = (String)m.invoke(info); // 调用getter方法获取属性值
	                if(StringUtil.checkNotNull(value)){
	               	 	paramMap.put(name, value.toString());
	                }
	            } 
				if(type.equals("class java.lang.Integer")){
					Method m = info.getClass().getMethod("get" + nameM);
					Integer value = (Integer)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value.toString());
	                }
	            } 
				if(type.equals("class java.lang.Double")){
					Method m = info.getClass().getMethod("get" + nameM);
					Double value = (Double)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value.toString());
	                }
	            } 
				if(type.equals("class java.lang.Short")){
					Method m = info.getClass().getMethod("get" + nameM);
					Short value = (Short)m.invoke(info); 
	                if(value != null){
	               	 	paramMap.put(name, value.toString());
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
	public WanjiCollectLogBean jsonObjectToBean(JSONObject jsonObject,
			WanjiCollectLogBean info) {;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
			info.setDriverId(jsonObject.getString("DriverId"));
			info.setDriverAvatar(jsonObject.getString("Avatar"));
			info.setDriverName(jsonObject.getString("Name"));
			info.setDriverTelphone(jsonObject.getString("Telphone"));
			info.setIsAuth((short)(jsonObject.getBoolean("IsAuth")==true?1:0));
			info.setIsCarauth((short)(jsonObject.getBoolean("IsCarAuth")==true?1:0));
			info.setIsCompany((short)(jsonObject.getBoolean("IsCompany")==true?1:0));
			info.setIsCollect(jsonObject.getBoolean("isCollect")==true?"true":"false");
			info.setCarId(new BigDecimal(jsonObject.getInteger("Id")));
			info.setCarWidth(new BigDecimal(jsonObject.getString("CarWidth")));
			info.setCarLoad(new BigDecimal(jsonObject.getString("CarLoad")));
			info.setCarLength(new BigDecimal(jsonObject.getString("CarLength")));
			info.setCurPlace(jsonObject.getString("CurPlace"));
			info.setPlateNum(jsonObject.getString("PlateNum"));
			info.setCarTypeName(jsonObject.getString("CarTypeName"));
			info.setCarLoadTypeName(jsonObject.getString("CarLoadTypeName"));
			info.setActiveDate(sdf.parse(jsonObject.getString("ActiveDt").substring(0,9)));
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return info;
	}

	@Override
	public ResultBean getPushCarSource(WanjiSourceSearchBean wanjiSourceSearchBean
			, BigDecimal goodsId) {
		ResultBean resultBean = new ResultBean();
		String sql = "SELECT SRC_AD_CODE, DEST_AD_CODE, LIMCAR_TYPECODE, LIMCAR_LOADTYPECODE FROM T_WANJI_PUBLISHCARGO_LOG WHERE CARGO_ID = ? ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[]{goodsId});
		if(list.size()>0){
			Map<String, Object> map = list.get(0);
			wanjiSourceSearchBean.setAdCode(Integer.valueOf(map.get("SRC_AD_CODE").toString()));
			wanjiSourceSearchBean.setTargetAdCode(Integer.valueOf(map.get("DEST_AD_CODE").toString()));
			wanjiSourceSearchBean.setTypeCode(Integer.valueOf(map.get("LIMCAR_TYPECODE").toString()));
			wanjiSourceSearchBean.setCarLoadType(Integer.valueOf(map.get("LIMCAR_LOADTYPECODE").toString()));
			
			resultBean = getPlatCarSource(wanjiSourceSearchBean);
			if(resultBean.getValue().size()==0){
				wanjiSourceSearchBean.setTypeCode(-1);
				wanjiSourceSearchBean.setCarLoadType(-1);
				resultBean = getPlatCarSource(wanjiSourceSearchBean);
				if(resultBean.getValue().size()==0){
					wanjiSourceSearchBean.setAdCode(0);
					wanjiSourceSearchBean.setTargetAdCode(0);
					resultBean = getPlatCarSource(wanjiSourceSearchBean);
				}
			}
		}else{
			resultBean = getPlatCarSource(wanjiSourceSearchBean);
		}
		
		return resultBean;
	}

	@Override
	public List<Map<String, Object>> getJSONAddress() {
		String sql = "select * from (select * from t_wanji_address where id not in(2067,2069,2070,2065,2066,2223,2224,2225,2226,2227,2228,2229))start with parent = -1 connect by prior code  = parent";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		
		
		List<JSONObject> list1 = new ArrayList<>();
		List<Map<String, Object>> list11 = new ArrayList<>();
		if(!list.isEmpty()){
			for(Map<String, Object> record : list){
				if(Integer.parseInt(record.get("kind").toString())==1){
					JSONObject jo = new JSONObject();
					jo.put("name", record.get("name"));
					jo.put("code", record.get("code"));
					list1.add(jo);
				}
			}
			
			if(!list1.isEmpty()){
				for(JSONObject jsonObject : list1){
					List<JSONObject> list2 = new ArrayList<>();
					List<Map<String, Object>> list22 = new ArrayList<>();
					for(Map<String, Object> record : list){
						if(Integer.parseInt(record.get("kind").toString())==2&&
								Integer.parseInt(record.get("parent").toString())==Integer.parseInt(jsonObject.get("code").toString())){
							JSONObject jo = new JSONObject();
							jo.put("name", record.get("name"));
							jo.put("code", record.get("code"));
							list2.add(jo);
						}
					}
					
					if(!list2.isEmpty()){
						for(JSONObject jsonObject2 : list2){
							List<Map<String, Object>> list3 = new ArrayList<>();
							for(Map<String, Object> record : list){
								if(Integer.parseInt(record.get("kind").toString())==3&&
										Integer.parseInt(record.get("parent").toString())==Integer.parseInt(jsonObject2.get("code").toString())){
									Map<String, Object> map = new LinkedHashMap<>();
									map.put("code", record.get("code"));
									map.put("name", record.get("name"));
									list3.add(map);
									
								}
							}
							Map<String, Object> map1 = new LinkedHashMap<>();
							map1.put("name", jsonObject2.get("name"));
							map1.put("code", jsonObject2.get("code"));
							if(!list3.isEmpty()){						
								map1.put("sub", list3);
							}
							list22.add(map1);
						}
					}
					Map<String, Object> map2 = new LinkedHashMap<>();
					map2.put("name", jsonObject.get("name"));
					map2.put("code", jsonObject.get("code"));
					if(!list2.isEmpty()){						
						map2.put("sub", list22);
					}
					list11.add(map2);
				}
			}
			
		}
		
		return list11;
	}

	@Override
	public JSONObject getSSOLoginUrlByAccountId(Map<String, String> parameters) {
		InvokeInfoBean<?> invokeInfoBean = invokerHelper.invoking("AuthorizeInvoker", parameters);
		
		JSONObject jsonObject = new JSONObject();
		String loginUrl = "";
		if(invokeInfoBean.isSuccess()){
			jsonObject = JSONObject.parseObject(invokeInfoBean.getValue().toString());
			loginUrl = jsonObject.getString("authUrl");
		}
		
		jsonObject.put("success", invokeInfoBean.isSuccess());
		jsonObject.put("errorCode", invokeInfoBean.getErrorCode());
		jsonObject.put("errorMsg", invokeInfoBean.getErrorMsg());
		jsonObject.put("loginUrl", loginUrl);
		
		return jsonObject;
	}

}
