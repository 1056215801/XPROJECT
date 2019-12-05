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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.company.info.bean.CompanyInfoBean;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiCollectLogBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiGoodsInfoBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.WanjiSourceSearchBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IWanjiLogisticsInfoService;
import com.chinatelecom.jx.zone.management.service.personalCenter.IPersonalCenterService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.github.pagehelper.Page;

@Controller
public class WanjiLogisticsController extends BaseController {
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IWanjiLogisticsInfoService wanjiLogisticsInfoService;
	@Autowired
	private IPersonalCenterService personalCenterService;
	@Autowired
	private IAccountBindBeanService accountBindBeanService;

	/**
	 * ==============================================================================
	 * 页面同步跳转
	 * ==============================================================================
	 */
	/**
	 * 物流微信首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/auth/page/mobile/weixin/logistics/wanji/weixin/main")
	public String main(@RequestParam(value = "isBack", required = false) Boolean isBack, Model model,
			HttpServletRequest request) {
		int total = 0;
		try {
			BigDecimal[] paramId = getId();
			Map<String, List<?>> result = wanjiLogisticsInfoService.getPlatCarDict(paramId);

			// 获取车源总数
			WanjiSourceSearchBean info = new WanjiSourceSearchBean();
			info.setAccountId(paramId[0]);
			info.setCompanyId(paramId[1]);
			info.setSkip(0);
			info.setTake(1);
			Object carTotal = request.getSession().getAttribute("carTotal");
			if (carTotal != null) {
				total = Integer.parseInt(carTotal.toString());
			} else {
				total = wanjiLogisticsInfoService.getPlatCarSource(setDefaultValue(info)).getJsonValue()
						.getIntValue("Total");
				request.getSession().setAttribute("carTotal", total);
			}

			model.addAttribute("isBack", isBack);
			model.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
			model.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
			model.addAttribute("total", total);
			model.addAttribute("wanjiSourceSearchBean", new WanjiSourceSearchBean());
		} catch (Exception ex) {
			logger.error("万佶首页加载失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		return "/weixinPage/riskLogistics/logisticsService";
	}

	/**
	 * 万佶找车页跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logistics/wanji/weixin/findCar")
	public String findCar(@ModelAttribute("info") WanjiSourceSearchBean info, Model model) {
		try {
			model.addAttribute("info", info);
			model.addAttribute("wanjiCollectLogBean", new WanjiCollectLogBean());
		} catch (Exception ex) {
			logger.error("万佶车源列表页面加载失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		return "/weixinPage/riskLogistics/searchInterface_goods";
	}

	/**
	 * 跳转发布页面
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/logistics/wanji/weixin/create")
	public String create(Model model) {
		try {
			Map<String, List<?>> result = wanjiLogisticsInfoService.getInitCargo(getId());
			AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(getCurrentAccountId());

			model.addAttribute("cargoSubTypeDictsList", result.get("cargoSubTypeDictsList"));
			model.addAttribute("CarTypeDictsList", result.get("CarTypeDictsList"));
			model.addAttribute("CarLoadDictsList", result.get("CarLoadDictsList"));
			model.addAttribute("CarLengthDictsList", result.get("CarLengthDictsList"));
			model.addAttribute("accountName", accountInfoBean.getAccountName());
			model.addAttribute("accountCode", accountInfoBean.getAccountCode());
			model.addAttribute("wanjiGoodsInfoBean", new WanjiGoodsInfoBean());
		} catch (Exception ex) {
			logger.error("发布货源页面加载失败，详细信息" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		return "/weixinPage/logistics/releaseSupply";
	}

	/**
	 * 我发布货源列表
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/logistics/wanji/weixin/myList")
	public String myList(@RequestParam(value = "isZwb", required = false) String isZwb, Model model) {
		try {
			if (isZwb != null && isZwb.equals("true")) {
				model.addAttribute("isZwb", true);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "/weixinPage/riskLogistics/mySupply";
	}

	/**
	 * 车源收藏列表
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/logistics/wanji/weixin/collectList")
	public String collectList(Model model) {
		try {

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return "redirect:/error/404";
		}
		return "/weixinPage/logistics/myCollection";
	}

	/**
	 * 车源详情
	 */
	@RequestMapping(value = "/logistics/wanji/weixin/carDetail")
	public String carDetail(@RequestParam(value = "carStr", required = false) String carStr,
			@RequestParam(value = "collectId", required = false) BigDecimal collectId,
			@RequestParam(value = "pageType", required = false) Integer pageType, Model model) {
		WanjiCollectLogBean wanjiCollectLogBean = new WanjiCollectLogBean();
		try {
			if (collectId == null) {
				JSONObject jsonObject = JSONObject.parseObject(carStr);
				wanjiCollectLogBean = wanjiLogisticsInfoService.jsonObjectToBean(jsonObject, wanjiCollectLogBean);
			} else {
				wanjiCollectLogBean = wanjiLogisticsInfoService.selectCollectCarDetail(collectId);
			}
			model.addAttribute("carStr", carStr);
			model.addAttribute("wanjiCollectLogBean", wanjiCollectLogBean);
			model.addAttribute("pageType", pageType);
		} catch (Exception ex) {
			logger.error("万佶收藏车源详细获取失败，详细原因：" + ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		return "/weixinPage/riskLogistics/carSourceDetails_goods";
	}

	/**
	 * 增值服务
	 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/logistics/wanji/weixin/incrementServices")
	public String incrementServices(Model model, HttpServletRequest request) {
		return "/weixinPage/riskLogistics/incrementServices";
	}

	/**
	 * ==============================================================================
	 * json异步数据
	 * ==============================================================================
	 */
	/**
	 * 异步加载字典
	 */
	@RequestMapping(value = "/logistics/wanji/json/getPlatCarDict")
	public String getPlatCarDict(HttpServletResponse response, ModelMap modelMap) {
		try {
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

			BigDecimal[] paramId = getId();
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
	@RequestMapping(value = "/logistics/wanji/json/getInitCargo")
	public String getInitCargo(HttpServletResponse response, ModelMap modelMap) {
		try {
			response.addHeader("Access-Control-Allow-Origin", "*");
			response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

			BigDecimal[] paramId = getId();
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
	 * 异步加载车源列表
	 */
	@RequestMapping(value = "/logistics/wanji/json/getPlatCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getPlatCar(@ModelAttribute("wanjiSourceSearchBean") WanjiSourceSearchBean info,
			HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			BigDecimal[] paramId = getId();
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
	@RequestMapping(value = "/logistics/wanji/json/pushCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean pushCar(@RequestParam(value = "goodsId") BigDecimal goodsId, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		WanjiSourceSearchBean info = new WanjiSourceSearchBean();
		try {
			BigDecimal[] paramId = getId();
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
	@RequestMapping(value = "/logistics/wanji/json/getAddress", produces = MediaType.APPLICATION_JSON_VALUE)
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
	 * 发布货源
	 */
	@RequestMapping(value = "/logistics/wanji/json/publishCargo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean publishCargo(@ModelAttribute(value = "wanjiGoodsInfoBean") WanjiGoodsInfoBean wanjiGoodsInfoBean,
			HttpServletResponse response) {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany()) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			BigDecimal[] paramId = getId();
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
	@RequestMapping(value = "/logistics/wanji/json/myList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean myList(HttpServletResponse response) {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany()) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.getShipperCargoes(getId());
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
	@RequestMapping(value = "/logistics/wanji/json/collectCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean collectCar(@ModelAttribute("wanjiCollectLogBean") WanjiCollectLogBean wanjiCollectLogBean,
			HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany()) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			wanjiCollectLogBean.setCollectId(seq.getNextSeqIdToBigDecimal());
			wanjiCollectLogBean.setAccountId(getCurrentAccountId());
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
	@RequestMapping(value = "/logistics/wanji/json/cancelCollect", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean cancelCollect(@RequestParam(value = "carId") BigDecimal carId, HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany()) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.cancelCollect(carId, getCurrentAccountId());
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
	@RequestMapping(value = "/logistics/wanji/json/collectList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean collectList(@ModelAttribute("page") Page<WanjiCollectLogBean> page,
			HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");

		ResultBean resultBean = new ResultBean();
		try {
			if (getCurrentAccountId() == null) {
				resultBean.setCode(-2);
				resultBean.setMsg("请先登录！");
				return resultBean;
			} else {
				if (!isSetDefaultCompany()) {
					resultBean.setCode(4);
					resultBean.setMsg("请先设置默认企业！");
					return resultBean;
				}
			}
			resultBean = wanjiLogisticsInfoService.collectList(getCurrentAccountId(), page);
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

	private BigDecimal[] getId() {
		BigDecimal[] paramId = null;
		BigDecimal accountId = getCurrentAccountId();
		if (accountId != null) {
			BigDecimal companyId = getCompanyId();
			if (companyId == null) {
				CompanyInfoBean info = personalCenterService.selectDefaultCompanyForVisitor(getCurrentAccountId());

				List<AccountBindBean> list = accountBindBeanService.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(
						getCurrentAccountId(), new BigDecimal(1001), null);
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

	private boolean isSetDefaultCompany() {
		CompanyInfoBean info = null;
		try {
			info = personalCenterService.selectDefaultCompanyForVisitor(getCurrentAccountId());
		} catch (Exception ex) {
			logger.error("万佶物流，查询账户是否设置默认企业异常，详细原因：" + ex.getMessage(), ex);
		}

		if (info != null) {
			return true;
		} else {
			List<AccountBindBean> list = accountBindBeanService.selectListByAccountIdAndSystemIdAndOpenIdSearchKey(
					getCurrentAccountId(), new BigDecimal(1001), null);
			if (!list.isEmpty()) {
				return true;
			}
			return false;
		}
	}
}
