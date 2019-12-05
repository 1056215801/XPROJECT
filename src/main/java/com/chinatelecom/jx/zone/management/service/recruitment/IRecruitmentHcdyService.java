package com.chinatelecom.jx.zone.management.service.recruitment;

import java.util.List;
import java.util.Map;

import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.hcdy.positionmanage.log.bean.HcdyRecruitmentLogBean;


public interface IRecruitmentHcdyService {
	public List<?> getCompanyList(Map<String, Object> paramMap);

	public int publish(HcdyRecruitmentLogBean info);

	public List<?> getAjInfolist(Map<String, Object> paramMap);

	public InvokeInfoBean<?> hcdyLogin(Map<String, Object> paramMap);
}
