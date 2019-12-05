package com.chinatelecom.jx.zone.management.service.document;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.management.util.HttpToolkit;


@Service
@Transactional
public class DocumentIssuedServiceImpl implements IDocumentIssuedService{
	@Value("${documentIssued}")
	private String documentIssued;
	
	private static final Logger logger = LoggerFactory
			.getLogger(DocumentIssuedServiceImpl.class);
	
	@Override
	public String getJsonStrWithUrlAndParams(String url, Map<String, Object> params) {
		String jsonStr="";
		try {
			url = documentIssued+url;
			logger.info("----------------------------"+url);
			jsonStr = HttpToolkit.GETMethod(url, params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return jsonStr;
	}

}
