package com.chinatelecom.jx.zone.management.service.companyDetail;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.bean.companyInfo.BaseDimension;
import com.chinatelecom.jx.zone.management.bean.companyInfo.EquityEnum;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.companyDetail.CompanyDetailMapper;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.BoundListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@Transactional(rollbackFor = Exception.class)
public class CompanyDetailServiceImpl implements ICompanyDetailService {

	@Autowired
	private CompanyDetailMapper companyDetailMapper;
	@Value("${UrlPath}")
	private String UrlPath;
	@Autowired
    private RedisTemplate<String,Integer> redisTemplate;
	
	@Override
	public Map<String, Object> selectFirstDataByCompanyId(BigDecimal companyId) {
		Map<String, Object> map = companyDetailMapper.selectFirstDataByCompanyId(companyId);
		return map;
	}

	@Override
	public List<JSONObject> selectSecondDataByCompanyIdAndKind(BigDecimal companyId, String kind) throws Exception {
		
		String url = UrlPath + "XProject/static/json/companyTable.json";
		String result = HttpToolkit.GETMethod( url, null );
		JSONObject obj = JSONObject.parseObject(result);
		
		String tableName = obj.getString(kind);
		String orderByClause = obj.getString(kind+"排序");
		
		List<Map<String, Object>> list = companyDetailMapper.selectSecondDataByCompanyId(tableName,companyId,orderByClause);
		
		List<JSONObject> newList = new ArrayList<JSONObject>();
		if(!list.isEmpty()) {
			url = UrlPath + "XProject/static/json/companyTableDetail.json";
			result = HttpToolkit.GETMethod( url, null );
			obj = JSONObject.parseObject(result);
			obj = JSONObject.parseObject(JSONObject.parseObject(result).getString(tableName));
			
			for(Map<String, Object> record : list) {
				JSONObject bean = new JSONObject();
				for(String key : obj.keySet()) {
					if(key.indexOf("-")>0) {
						String[] keys = key.split("-");		
						if(record.get(keys[0].toUpperCase())!=null) {
							JSONArray ja = ( JSONArray ) JSONArray.parse( record.get(keys[0].toUpperCase()).toString() );
							JSONObject jo = JSONObject.parseObject(ja.get(0).toString());							
							bean.put(obj.getString(key), jo.get(keys[1]));
						}
					}else {						
						bean.put(obj.getString(key), record.get(key.toUpperCase()));
					}
					
				}
				newList.add(bean);
			}
			
		}
		
		return newList;
	}

	 public static String captureName(String name) {
	    char[] cs=name.toCharArray();
	    cs[0]-=32;
	    return String.valueOf(cs);
		        
	}


	
	/*****************************************************
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * ***************************************************
	 */


    private void resolveResultByPath(JSONObject data, JSONObject pathResolve){
        if (pathResolve.size() < 1) return;
        for (String tableName : data.keySet()){
            JSONArray tableData = new JSONArray();
            for (int i = 0;i < data.getJSONArray(tableName).size();i++){
                JSONObject itemData = data.getJSONArray(tableName).getJSONObject(i);
                for (String field : itemData.keySet()){
                    if (pathResolve.keySet().stream().anyMatch(fullFieldName -> tableName.equals(fullFieldName.split("/")[0]) && field.equals(fullFieldName.split("/")[1]))){
                        if(!StringUtils.isEmpty(itemData.getString(field))){
                            Object value = JSONObject.parseObject(itemData.getString(field)).get(pathResolve.getString(tableName+"/"+field));
                            itemData.put(field,value);
                        }
                    }
                }
                tableData.add(itemData);
            }
            data.remove(tableName);
            data.put(tableName,tableData);
        }
    }

    public JSONObject keyConversion(JSONObject data){
        JSONObject result = new JSONObject();
        for (String tableName : data.keySet()){
            JSONArray dataArray = new JSONArray();
            for (int i = 0;i < data.getJSONArray(tableName).size();i++){
                JSONObject jsonObject = data.getJSONArray(tableName).getJSONObject(i);
                if (jsonObject == null) {
                    dataArray.add(new JSONObject());
                    break;
                }
                JSONObject dataItem = new JSONObject();
                jsonObject.keySet().forEach(key -> dataItem.put(BaseDimension.getFieldDescByFieldAndTable(key,tableName),jsonObject.get(key)));
                dataArray.add(dataItem);
            }
            result.put(BaseDimension.getTableDescByTableName(tableName),dataArray);
        }
        return result;
    }

    public static boolean isNumeric(String str){
        for(int i = str.length();--i >= 0;){
            int chr = str.charAt(i);
            if(chr < 48 || chr > 57)
                return false;
        }
        return true;
    }

    private int scoreWithEquity(BaseDimension equityTypeEnum,BigDecimal companyId){
        int total = 0;
        String scoreField = String.valueOf(EquityEnum.getScoreByViewName(equityTypeEnum.getViewName()));
        List<String> tableList = Arrays.stream(equityTypeEnum.getTableList()).filter(BaseDimension.TablePair::isCount).map(BaseDimension.TablePair::getTableName).collect(Collectors.toList());
        if (isNumeric(scoreField)){
            total += companyDetailMapper.dimensionCountByCompany(tableList,companyId) * Integer.valueOf(scoreField);
        } else{
            List<Map<String,Object>> resultList = companyDetailMapper.dimensionDetailByCompany(Collections.singletonList(scoreField),companyId,tableList.get(0));
            for (Map<String,Object> result : resultList){
                total += EquityEnum.getScoreByViewNameAndValue(equityTypeEnum.getViewName(),String.valueOf(result.get(scoreField)));
            }
        }
        return total;
    }

    @Override
    public JSONObject equityDimensionCountByCompany(BigDecimal companyId){
        Map<String,Integer> data = new ConcurrentHashMap<>();
        Arrays.asList(BaseDimension.values()).parallelStream().filter(dimension -> dimension.getDimension().equalsIgnoreCase("EQUITY")).forEach(equityTypeEnum -> {
            List<String> tablePairList=new ArrayList<>();
            for (BaseDimension.TablePair tablePair:equityTypeEnum.getTableList()){
                if (tablePair.isCount()) tablePairList.add(tablePair.getTableName());
            }
            data.put(equityTypeEnum.getViewName(),companyDetailMapper.dimensionCountByCompany(tablePairList,companyId));
        });
        return new JSONObject().fluentPut("competitiveMap",data);
    }

    @Override
    public JSONObject riskDimensionCountByCompany(BigDecimal companyId){
        Map<String,Integer> data = riskTotal(companyId);
        JSONArray indicator = new JSONArray();
        List<Integer> value = new ArrayList<>();

        for (String dimensionType:data.keySet()){
            JSONObject item = new JSONObject();
            item.put("max",10);
            item.put("min",-15);
            item.put("name",dimensionType);
            indicator.add(item);
            value.add(data.get(dimensionType));
        }
        JSONObject companyRisk = new JSONObject().fluentPut("indicator",indicator).fluentPut("value",value).fluentPut("total",value.stream().reduce(0,(total,next) -> total + next));
        return new JSONObject().fluentPut("companyRisk",companyRisk);
    }

    @Override
    public JSONObject detailByCompanyAndDimension(BigDecimal companyId, String type) {
	    BaseDimension dimensionTypeEnum=BaseDimension.findByViewName(type);

	    Map<String,List<BaseDimension.FieldPair>> group = Arrays
                .stream(Objects.requireNonNull(dimensionTypeEnum).getFieldList())
                .collect(Collectors.groupingBy(BaseDimension.FieldPair::getTable));

	    JSONObject data = new JSONObject();
	    JSONObject pathResolve = new JSONObject();

	    for (String tableName:group.keySet()){
	        for (BaseDimension.FieldPair fieldPair:group.get(tableName)){
	            if (fieldPair.getFieldName().contains("/")){
	                String field = (fieldPair.getFieldName().split("/"))[0];
	                pathResolve.put(tableName+ "/" + field,fieldPair.getFieldName().split("/")[1]);
                }
            }
            List<Map<String,Object>> result = companyDetailMapper.dimensionDetailByCompany(group.get(tableName).stream()
                    .map(pair -> pair.getFieldName().contains("/") ? (pair.getFieldName().split("/"))[0] : pair.getFieldName())
                    .collect(Collectors.toList()),companyId,tableName);
            data.put(tableName,result);
        }

        resolveResultByPath(data,pathResolve);
        return keyConversion(data);
    }

    @Override
    public JSONObject gsBaseDetailByCompany(BigDecimal companyId) {
	    Map<String,List<Map<String,Object>>> mapData = new ConcurrentHashMap<>();

        Map<String,List<BaseDimension.FieldPair>> group=Arrays
                .stream(Objects.requireNonNull(BaseDimension.BASE_INFO).getFieldList())
                .collect(Collectors.groupingBy(BaseDimension.FieldPair::getTable));

        group.keySet().parallelStream().forEach(tableName -> {
            List<Map<String,Object>> result=companyDetailMapper.dimensionDetailByCompany(group.get(tableName).stream()
                    .map(BaseDimension.FieldPair::getFieldName)
                    .collect(Collectors.toList()),companyId,tableName);
            mapData.put(tableName,result);
        });
        JSONObject conversionData = keyConversion((JSONObject) JSONObject.toJSON(mapData));
        JSONObject data = new JSONObject();
        for (String key:conversionData.keySet()) {
            JSONArray array = conversionData.getJSONArray(key);
            data.put(key,array.size()>1?array:array.size()==1?array.getJSONObject(0):new JSONObject());
        }

        String base = BaseDimension.BASE_INFO.getViewName();
        String webSite = BaseDimension.getTableDescByTableName("X_DATA.Z_S_WEB_SITE");
        String contactInfo = BaseDimension.getTableDescByTableName("X_DATA.Z_S_CONTACT_INFO");
        String industry = BaseDimension.getTableDescByTableName("X_DATA.Z_S_INDUSTRY");

        for (String key:data.getJSONObject(webSite).keySet()){
            data.getJSONObject(contactInfo).put(key,data.getJSONObject(webSite).get(key));
        }
        data.remove(webSite);
        for (String key:data.getJSONObject(industry).keySet()){
            data.getJSONObject(base).put(key,data.getJSONObject(industry).get(key));
        }
        data.remove(industry);

        String employees = BaseDimension.getTableDescByTableName("X_DATA.Z_S_EMPLOYEES");

        JSONArray employeesArray = new JSONArray();
        for (int i=0;i<data.getJSONArray(employees).size();i++) {
            JSONObject item = data.getJSONArray(employees).getJSONObject(i);
            String nameKey = BaseDimension.getFieldDescByFieldAndTable("NAME","X_DATA.Z_S_EMPLOYEES");
            Integer companySize=0;
            List<Map<String,Object>> seniorPersonList=companyDetailMapper.dimensionDetailByCompanyAndPerson(Collections.singletonList("*"),companyId,"X_DATA.Z_PER_SENIOR_GROUP_ITEMS",item.getString(nameKey));
            for (Map<String,Object> seniorPerson:seniorPersonList){
                if (String.valueOf(seniorPerson.get("VALUE")).equals("1")){
                    Object count = seniorPerson.get("COUNT");
                    if (null!=count && !StringUtils.isEmpty(String.valueOf(companySize))){
                        companySize = Integer.valueOf(String.valueOf(count));
                    }
                }
            }
            item.put("关联企业数量",companySize);
            employeesArray.add(item);
        }
        data.remove(employees);
        data.put(employees,employeesArray);
        return data;
    }

    @Override
    public JSONObject reportReviewInfoByCompany(BigDecimal companyId){
	    return new JSONObject().fluentPut("Uri",companyDetailMapper.getReportInfoByCompany(companyId).get("ATTACHMENT_URL"));
    }

    @Override
    public JSONArray associationMap(BigDecimal companyId) {
        Map<String,List<Map<String,Object>>> data = new HashMap<>();

        Map<String,List<BaseDimension.FieldPair>> group=Arrays
                .stream(BaseDimension.ASSOCIATION.getFieldList())
                .collect(Collectors.groupingBy(BaseDimension.FieldPair::getTable));
        group.keySet().forEach(tableName -> {
            List<Map<String,Object>> result=companyDetailMapper.dimensionDetailByCompany(group.get(tableName).stream()
                    .map(BaseDimension.FieldPair::getFieldName)
                    .collect(Collectors.toList()),companyId,tableName);
            data.put(tableName,result);
        });
        JSONObject result = new JSONObject();
        for (String tableName:data.keySet()){
            List<Map<String,Object>> dataItems = data.get(tableName);
            JSONArray array = new JSONArray();
            for (Map<String,Object> dataItem:dataItems){
                JSONObject item = new JSONObject();
                String value = String.valueOf(dataItem.get("STOCK_TYPE"));
                item.putAll(dataItem);
                item.remove("STOCK_TYPE");
                item.put("STOCK_TYPE",StringUtils.isEmpty(value) || value.contains("自然人")?0:1);
                array.add(item);
            }
            result.put(tableName,array);
        }
        return keyConversion(result).getJSONArray(BaseDimension.getTableDescByTableName("X_DATA.Z_S_PARTNERS"));
    }

    @Override
    public String getCompanyName(BigDecimal companyId){
	    return companyDetailMapper.findCompanyNameById(companyId);
    }

    @Override
    public JSONObject countByYear(BigDecimal companyId,String type,String viewName) {
        List<Map<String,Object>> all = Collections.synchronizedList(new ArrayList<>());
        List<BaseDimension> source =  Arrays.asList(BaseDimension.values()).parallelStream().filter(dimension -> dimension.getDimension().equalsIgnoreCase(type)).collect(Collectors.toList());
        if (!viewName.equals("ALL")) source = source.stream().filter(dimension -> viewName.equals(dimension.getViewName())).collect(Collectors.toList());
        source.parallelStream().forEach(dimensionTypeEnum -> {
            for (BaseDimension.TablePair tablePair : dimensionTypeEnum.getTableList()){
                if (tablePair.isCount()) {
                    List<Map<String,Object>> reduce = companyDetailMapper.dimensionDetailByCompany(Arrays.stream(dimensionTypeEnum.getFieldList()).filter(fieldPair -> fieldPair.getTable().equals(tablePair.getTableName())).map(pair -> pair.getFieldName().contains("/") ? (pair.getFieldName().split("/"))[0] : pair.getFieldName()).collect(Collectors.toList()),companyId,tablePair.getTableName());
                    for (Map<String,Object> item : reduce){
                        item.put("group",String.valueOf(item.get(tablePair.getDateField())).substring(0,4));
                        all.add(item);
                    }
                }
            }
        });
        JSONObject result = new JSONObject();
        Map<Object,List<Map<String,Object>>> data = all.stream().collect(Collectors.groupingBy(map -> map.get("group")));
        for (Object key : data.keySet()){
            result.put(String.valueOf(key),data.get(key).size());
        }
        return result;
    }

    @Override
    public List<Map<String,Object>> riskList(BigDecimal companyId) {
        List<Map<String,Object>> all = Collections.synchronizedList(new ArrayList<>());
        Arrays.asList(BaseDimension.values()).parallelStream().filter(dimension -> dimension.getDimension().equalsIgnoreCase("RISK")).forEach(dimensionTypeEnum -> {
            JSONArray query = new JSONArray();
            Map<String,Object> item = new HashMap<>();
            for (BaseDimension.TablePair tablePair : dimensionTypeEnum.getTableList()){
                List<Map<String,Object>> reduce = companyDetailMapper.dimensionDetailByCompany(Arrays.stream(dimensionTypeEnum.getFieldList()).filter(fieldPair -> fieldPair.getTable().equals(tablePair.getTableName())).map(pair -> pair.getFieldName().contains("/") ? (pair.getFieldName().split("/"))[0] : pair.getFieldName()).collect(Collectors.toList()),companyId,tablePair.getTableName());
                if (dimensionTypeEnum.getReduce()){
                    if (reduce.size() > 0) {
                        item.put("DATE",reduce.get(0).get(tablePair.getDateField()));
                        query.add(new JSONObject().fluentPut("TABLE_NAME",tablePair.getTableName()).fluentPut("ID",reduce.get(0).get("PRIMARY_ID")));
                    }
                    if (tablePair.isCount()) item.put("TYPE",dimensionTypeEnum.getViewName());
                } else{
                    for (Map<String,Object> temp : reduce){
                        Map<String,Object> inner = new HashMap<>();
                        inner.put("TYPE",dimensionTypeEnum.getViewName());
                        inner.put("QUERY",new JSONArray().fluentAdd(new JSONObject().fluentPut("TABLE_NAME",tablePair.getTableName()).fluentPut("ID",temp.get("PRIMARY_ID"))));
                        inner.put("DATE",temp.get(tablePair.getDateField()));
                        all.add(inner);
                    }

                }
            }

            if (dimensionTypeEnum.getReduce() && item.size() > 0 && query.size() > 0) {
                item.put("QUERY",query);
                all.add(item);
            }

        });
        return all;
    }

    @Override
    public Map<String, Object> getDetailById(JSONArray queryList) {
        Map<String,Object> reduce = new HashMap<>();
        for (int i = 0;i <  queryList.size();i++){
            JSONObject query = queryList.getJSONObject(i);
            reduce.putAll(companyDetailMapper.getDetailById(Arrays.stream(BaseDimension.findByTableName(query.getString("TABLE_NAME")).getFieldList()).filter(fieldPair -> fieldPair.getTable().equals(query.getString("TABLE_NAME"))).map(BaseDimension.FieldPair::getFieldName).collect(Collectors.toList()),query.getString("ID"),query.getString("TABLE_NAME")));
        }
        return reduce;
    }

    @Override
    public Map<String,Integer> innovation(BigDecimal companyId) {
        Map<String,Integer> data = new HashMap<>();
        List<Integer> sortResult;
        if (redisTemplate.hasKey("COMPANY_EQUITY_SORT")){
            BoundListOperations<String,Integer> ops = redisTemplate.boundListOps("COMPANY_EQUITY_SORT");
            sortResult = ops.range(0,ops.size() -1);
        } else{
            List<String> companyList = companyDetailMapper.allCompanyId();
            sortResult = Collections.synchronizedList(new ArrayList<>(companyList.size()));
            companyList.parallelStream().forEach(id -> {
                Integer total = 0;
                for (BaseDimension equityTypeEnum : BaseDimension.values()){
                    if (!equityTypeEnum.getDimension().equalsIgnoreCase("EQUITY")) continue;
                    total += scoreWithEquity(equityTypeEnum,new BigDecimal(id));
                }
                if (!sortResult.contains(total)) sortResult.add(total);
            });
            redisTemplate.opsForList().leftPushAll("COMPANY_EQUITY_SORT",sortResult.toArray(new Integer[]{}));
            redisTemplate.expire("COMPANY_EQUITY_SORT",7L,TimeUnit.DAYS);
        }
        //Current Company
        Integer currentTotal = 0;
        for (BaseDimension equityTypeEnum : BaseDimension.values()){
            if (!equityTypeEnum.getDimension().equalsIgnoreCase("EQUITY")) continue;
            currentTotal += scoreWithEquity(equityTypeEnum,companyId);
        }
        sortResult.sort((x, y) -> (x < y) ? 1 : ((x.equals(y)) ? 0 : -1));
        data.put("SORT",sortResult.indexOf(currentTotal) + 1);
        data.put("TOTAL",currentTotal);
        return data;
    }

    @Override
    public Map<String, Integer> investCount(BigDecimal companyId) {
        Map<String,Integer> data = new HashMap<>();
        data.put(BaseDimension.INVEST.getViewName(),companyDetailMapper.dimensionCountByCompany(Arrays.stream(BaseDimension.INVEST.getTableList()).map(BaseDimension.TablePair::getTableName).collect(Collectors.toList()),companyId));
        data.put(BaseDimension.HOLD.getViewName(),companyDetailMapper.dimensionCountByCompany(Arrays.stream(BaseDimension.HOLD.getTableList()).map(BaseDimension.TablePair::getTableName).collect(Collectors.toList()),companyId));
        return data;
    }

    @Override
    public JSONObject invest(BigDecimal companyId) {
        JSONObject data = new JSONObject();
        Pattern pattern = Pattern.compile("\\d+\\.*\\d*");
        NumberFormat percentFormat = NumberFormat.getPercentInstance();
        for (BaseDimension dimension : new BaseDimension[]{BaseDimension.PARTNERS,BaseDimension.INVEST}){
            List<Map<String,Object>> resultSet = companyDetailMapper.dimensionDetailByCompany(
                    Arrays.stream(dimension.getFieldList()).map(BaseDimension.FieldPair::getFieldName).collect(Collectors.toList()),
                    companyId,
                    Arrays.stream(dimension.getTableList()).map(BaseDimension.TablePair::getTableName).collect(Collectors.toList()).get(0));
            if (dimension == BaseDimension.INVEST){
                for (Map<String,Object> result : resultSet){
                    String REGIST_CAPI = String.valueOf(result.get("REGIST_CAPI"));
                    String FUNDED_RATIO = String.valueOf(result.get("FUNDED_RATIO"));
                    Matcher matcher = pattern.matcher(REGIST_CAPI);
                    if (matcher.find()){
                        double registCapi = Double.valueOf(matcher.group(0));
                        try {
                            double fundedRatio = percentFormat.parse(FUNDED_RATIO).doubleValue();
                            result.put("SHOULD_CAPI",new BigDecimal(fundedRatio * registCapi).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
                        } catch (ParseException ignored){
                            System.err.println(FUNDED_RATIO);
                        }
                    }

                }
            }
            data.put(dimension.getViewName(),resultSet);
        }
        data.put("企业名称",companyDetailMapper.findCompanyNameById(companyId));

        return data;
    }


    @Override
    public Map<String,Integer> riskTotal(BigDecimal companyId){
        Map<String,Integer> data=new ConcurrentHashMap<>();
        Arrays.asList(BaseDimension.values()).parallelStream().filter(dimension -> dimension.getDimension().equalsIgnoreCase("RISK")).forEach(dimensionTypeEnum -> {
            List<String> tablePairList=new ArrayList<>();
            for (BaseDimension.TablePair tablePair:dimensionTypeEnum.getTableList()){
                if (tablePair.isCount()) tablePairList.add(tablePair.getTableName());
            }
            data.put(dimensionTypeEnum.getViewName(),companyDetailMapper.dimensionCountByCompany(tablePairList,companyId));
        });
        return data;
    }
}
