package com.chinatelecom.jx.zone.management.controller.logisticsInfo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.service.IAccountBindBeanService;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiGoodsInfoBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IWanjiLogisticsInfoService;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;

@Controller
public class WanjiLogisticsInterfaceController {
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IWanjiLogisticsInfoService wanjiLogisticsInfoService;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;
	@Autowired(required = true)@Qualifier("primaryKeySeq")
	protected SeqIdType seq;

	private static final Logger logger = LoggerFactory.getLogger(WanjiLogisticsInterfaceController.class);

	/**
	 * 异步加载字典
	 */
	@RequestMapping(value = "/interface/json/wanji/getPlatCarDict")
	public String getPlatCarDict(HttpServletResponse response, ModelMap modelMap) {
		try {
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

			BigDecimal[] paramId = getId(null, null);
			Map<String, List<?>> result = wanjiLogisticsInfoService.getPlatCarDict(paramId);

			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "万佶物流字典获取失败成功!");
			modelMap.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
			modelMap.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
		} catch (Exception ex) {
			logger.error("万佶物流字典获取失败，详细原因：" + ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常!");
		}
		return "jsonView";
	}

	/**
	 * 发布字典
	 * 
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/interface/json/wanji/getInitCargo")
	public String getInitCargo(HttpServletResponse response, ModelMap modelMap) {
		try {
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

			BigDecimal[] paramId = getId(null, null);
			Map<String, List<?>> result = wanjiLogisticsInfoService.getInitCargo(paramId);

			modelMap.addAttribute("success", true);
			modelMap.addAttribute("errorCode", 0);
			modelMap.addAttribute("errorMsg", "万佶物流发布字典获取失败成功!");
			modelMap.addAttribute("cargoSubTypeDictsList", result.get("cargoSubTypeDictsList"));
			modelMap.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
			modelMap.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
			modelMap.addAttribute("CarLengthDictsList", result.get("CarLengthDictsList"));
		} catch (Exception ex) {
			logger.error("万佶物流发布字典获取失败，详细原因：" + ex.getMessage(), ex);
			modelMap.addAttribute("success", false);
			modelMap.addAttribute("errorCode", -1);
			modelMap.addAttribute("errorMsg", "系统异常!");
		}
		return "jsonView";
	}

	/**
	 * 异步加载车源列表 accountId companyId
	 */
	@RequestMapping(value = "/interface/json/wanji/getPlatCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getPlatCar(@ModelAttribute("wanjiSourceSearchBean") WanjiSourceSearchBean info,
			HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			BigDecimal[] paramId = getId(info.getAccountId(), info.getCompanyId());
			info.setAccountId(paramId[0]);
			info.setCompanyId(paramId[1]);
			resultBean = wanjiLogisticsInfoService.getPlatCarSource(setDefaultValue(info));
		} catch (Exception ex) {
			logger.error("万佶物流车源列表获取失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶物流车源列表获取失败！");
		}
		return resultBean;
	}

	/**
	 * 推荐车源
	 */
	@RequestMapping(value = "/interface/json/wanji/pushCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean pushCar(
			@ModelAttribute("wanjiSourceSearchBean") WanjiSourceSearchBean info,
			@RequestParam(value = "goodsId") BigDecimal goodsId, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			BigDecimal[] paramId = getId(info.getAccountId(), info.getCompanyId());
			info.setAccountId(paramId[0]);
			info.setCompanyId(paramId[1]);
			resultBean = wanjiLogisticsInfoService.getPushCarSource(setDefaultValue(info), goodsId);

		} catch (Exception ex) {
			logger.error("万佶物流推送车源列表获取失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶物流推送车源列表获取失败！");
		}
		return resultBean;
	}

	/**
	 * 城市字典
	 */
	@RequestMapping(value = "/interface/json/wanji/getAddress", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<?> getAddress(@RequestParam(value = "parent") Integer parent, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		List<?> list = new ArrayList<>();
		try {
			list = wanjiLogisticsInfoService.getAddress(parent);
		} catch (Exception ex) {
			logger.error("获取万佶地址字典失败，详细原因：" + ex.getMessage(), ex);
			ex.printStackTrace();
		}
		return list;
	}

	/**
	 * 城市json
	 */
	@RequestMapping(value = "/interface/json/wanji/address")
	public String getAddress(HttpServletResponse response, ModelMap modelMap) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
		try {
			List<Map<String, Object>> list = wanjiLogisticsInfoService.getJSONAddress();
			modelMap.addAttribute("address", list);
		} catch (Exception ex) {
			logger.error("获取万佶地址字典失败，详细原因：" + ex.getMessage(), ex);
			ex.printStackTrace();
		}
		return "jsonView";
	}
	
	/**
	 * 发布货源 accountId 用户id
	 */
	@RequestMapping(value = "/interface/json/wanji/publishCargo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean publishCargo(@ModelAttribute(value = "wanjiGoodsInfoBean") WanjiGoodsInfoBean wanjiGoodsInfoBean,
			HttpServletResponse response) {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (wanjiGoodsInfoBean.getAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany(wanjiGoodsInfoBean.getAccountId())) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			BigDecimal[] paramId = getId(wanjiGoodsInfoBean.getAccountId(), wanjiGoodsInfoBean.getCompanyId());
			wanjiGoodsInfoBean.setAccountId(paramId[0]);
			wanjiGoodsInfoBean.setCompanyId(paramId[1]);
			wanjiGoodsInfoBean.setLimCarWidth(new BigDecimal(-1));
			wanjiGoodsInfoBean.setPrice(new BigDecimal(0));
			resultBean = wanjiLogisticsInfoService.publishCargo(wanjiGoodsInfoBean);
		} catch (Exception ex) {
			logger.error("万佶发布货源失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶发布货源失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	/**
	 * 我发布的货源列表
	 */
	@RequestMapping(value = "/interface/json/wanji/myGoodsList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean myList(@ModelAttribute(value = "wanjiGoodsInfoBean") WanjiGoodsInfoBean info,
			HttpServletResponse response) {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (info.getAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany(info.getAccountId())) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.getShipperCargoes(getId(info.getAccountId(), info.getCompanyId()));
		} catch (Exception ex) {
			logger.error("万佶我发布的货源列表加载失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶我发布的货源列表加载失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	/**
	 * 收藏车源
	 */
	@RequestMapping(value = "/interface/json/wanji/collectCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean collectCar(@ModelAttribute("wanjiCollectLogBean") WanjiCollectLogBean wanjiCollectLogBean,
			HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (wanjiCollectLogBean.getAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany(wanjiCollectLogBean.getAccountId())) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			wanjiCollectLogBean.setCollectId(seq.getNextSeqIdToBigDecimal());
			wanjiCollectLogBean.setAccountId(wanjiCollectLogBean.getAccountId());
			wanjiCollectLogBean.setStatus((short) 1);
			wanjiCollectLogBean.setCreateTime(new Timestamp(new Date().getTime()));
			if (StringUtil.checkNotNull(wanjiCollectLogBean.getActiveDt())) {
				wanjiCollectLogBean.setActiveDate(sdf.parse(wanjiCollectLogBean.getActiveDt()));
			}
			resultBean = wanjiLogisticsInfoService.collectCar(wanjiCollectLogBean);
		} catch (Exception ex) {
			logger.error("万佶收藏车源失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶收藏车源失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	/**
	 * 取消收藏车源
	 */
	@RequestMapping(value = "/interface/json/wanji/cancelCollect", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean cancelCollect(@ModelAttribute(value = "wanjiGoodsInfoBean") WanjiGoodsInfoBean info,
			@RequestParam(value = "carId") BigDecimal carId, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (info.getAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany(info.getAccountId())) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.cancelCollect(carId, info.getAccountId());
		} catch (Exception ex) {
			logger.error("万佶取消收藏车源失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("万佶取消收藏车源失败！");
			ex.printStackTrace();
		}
		return resultBean;
	}

	/**
	 * 收藏车源列表
	 */
	@RequestMapping(value = "/interface/json/wanji/collectList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean collectList(@ModelAttribute(value = "wanjiGoodsInfoBean") WanjiGoodsInfoBean info,
			@ModelAttribute("page") Page<WanjiCollectLogBean> page, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (info.getAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany(info.getAccountId())) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.collectList(info.getAccountId(), page);
		} catch (Exception ex) {
			logger.error("获取万佶收藏车源列表失败，详细原因：" + ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("获取万佶收藏车源列表失败！");
		}
		return resultBean;
	}

	private WanjiSourceSearchBean setDefaultValue(WanjiSourceSearchBean info) {
		if (info.getSkip() == null)
			info.setSkip(0);
		if (info.getTake() == null)
			info.setTake(5);
		if (info.getAdCode() == null)
			info.setAdCode(0);
		if (info.getTargetAdCode() == null)
			info.setTargetAdCode(0);
		if (info.getTypeCode() == null)
			info.setTypeCode(-1);
		if (info.getCarLoadType() == null)
			info.setCarLoadType(-1);
		if (info.getPlateNum() == null)
			info.setPlateNum("");
		if (info.getMinCarLoad() == null)
			info.setMinCarLoad(new BigDecimal(-1));
		if (info.getMaxCarLoad() == null)
			info.setMaxCarLoad(new BigDecimal(-1));
		if (info.getMinCarLength() == null)
			info.setMinCarLength(new BigDecimal(-1));
		if (info.getMaxCarLength() == null)
			info.setMaxCarLength(new BigDecimal(-1));
		if (info.getCarWidth() == null)
			info.setCarWidth(new BigDecimal(-1));

		return info;
	}

	private BigDecimal[] getId(BigDecimal accountId, BigDecimal companyId) {
		BigDecimal[] paramId = null;
		if (accountId != null) {
			if (companyId == null) {
				CompanyInfoBean info = personalCenterService.selectDefaultCompanyForVisitor(accountId);

				List<AccountBindBean> list = accountBindBeanService
						.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(1001), null);
				if (info == null && list.isEmpty()) {
					paramId = new BigDecimal[] { new BigDecimal("2016062216360980800018"), new BigDecimal("120") };
				} else {
					if (info != null) {
						paramId = new BigDecimal[] { accountId, info.getCompanyId() };
					} else {
						paramId = new BigDecimal[] { accountId,
								organizationIdSessionHelper.getRootIdBySessionAttribute() };
					}
				}
			} else {
				paramId = new BigDecimal[] { accountId, companyId };
			}

		} else {
			paramId = new BigDecimal[] { new BigDecimal("2016062216360980800018"), new BigDecimal("120") };
		}
		return paramId;
	}

	private boolean isSetDefaultCompany(BigDecimal accountId) {
		CompanyInfoBean info = null;
		try {
			info = personalCenterService.selectDefaultCompanyForVisitor(accountId);
		} catch (Exception ex) {
			logger.error("万佶物流，查询账户是否设置默认企业异常，详细原因：" + ex.getMessage(), ex);
		}

		if (info != null) {
			return true;
		} else {
			List<AccountBindBean> list = accountBindBeanService
					.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(accountId, new BigDecimal(1001), null);
			if (!list.isEmpty()) {
				return true;
			}
			return false;
		}
	}
}
