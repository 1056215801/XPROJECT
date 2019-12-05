package com.chinatelecom.jx.zone.management.service.document;

import java.util.Map;

public interface IDocumentIssuedService {
	//二次封装文件下达接口
	public String getJsonStrWithUrlAndParams(String url,Map<String, Object> params);
}
