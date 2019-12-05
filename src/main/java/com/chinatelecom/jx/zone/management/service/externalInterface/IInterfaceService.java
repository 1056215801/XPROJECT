package com.chinatelecom.jx.zone.management.service.externalInterface;

import com.chinatelecom.jx.zone.management.bean.ResultBean;

public interface IInterfaceService {

	ResultBean queryCompanyValueListByTJ(Integer type, Integer query,
			String year, String month);

}
