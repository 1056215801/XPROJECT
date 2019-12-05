package com.chinatelecom.jx.zone.management.controller.logisticsInfo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.management.bean.ResultBean;
import com.chinatelecom.jx.zone.management.bean.logisticsInfo.ZwbSourceSearchBean;
import com.chinatelecom.jx.zone.management.bean.zwbPublishgoods.ZwbPublishgoodsLogBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.logisticsInfo.IZwbLogisticsInfoService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;

/**
 * 中危宝物流
 * @author MR_WU
 *
 */
@Controller
public class ZwbLogisticsController extends BaseController{
	@Autowired
	private IZwbLogisticsInfoService zwbLogisticsInfoService;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper;
	
	/**
	 * ==============================================================================
	 * 									页面跳转
	 * ==============================================================================
	 */
	/**
	 * 物流-危险货物   
	 */
    @RequestMapping(value = "/logistics/zwb/weixin/SearchRisks")
	public String findGoods(
			@ModelAttribute("zwbSourceSearchBean")ZwbSourceSearchBean zwbSourceSearchBean,
			HttpServletRequest request,Model model){
		model.addAttribute("zwbSourceSearchBean",zwbSourceSearchBean);
		return "/weixinPage/riskLogistics/searchInterface_risk";
	}
	/**
	 * 我的收藏
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/weixin/collection")
	public String findCollection(Model model){
		return "/weixinPage/riskLogistics/myCollection";
	}
	/**
	 * 车源详情-危险货物
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/weixin/SearchRisksDetail")
	public String detailRisks(
			@RequestParam(value = "dataStr", required = false) String dataStr,
			Model model){
		try{
			if(StringUtil.checkNotNull(dataStr)){
				JSONObject jsonObject = JSON.parseObject(dataStr);
				model.addAttribute("info", jsonObject);
			}
		}catch(Exception ex){
			logger.error("车源详情信息转换json数据失败，"+ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		
		return "/weixinPage/riskLogistics/carSourceDetails_risk";
	}
	
	
	/**
	 * 发布、编辑编辑货源
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/weixin/edit")
	public String editGoods(
			@RequestParam(value = "goodsId", required = false)Integer goodsId, 
			@RequestParam(value = "biddingState", required = false)Integer biddingState, 
			Model model){
		ZwbPublishgoodsLogBean zwbPublishgoodsLogBean = new ZwbPublishgoodsLogBean();
		try{
			if(goodsId != null){
				//获取货源详情，本地数据
				zwbPublishgoodsLogBean = zwbLogisticsInfoService.selectByPrimaryKey(goodsId);
			}
			model.addAttribute("zwbPublishgoodsLogBean", zwbPublishgoodsLogBean);
			model.addAttribute("biddingState", biddingState);
		}catch(Exception ex){
			logger.error("获取本地货源记录失败，"+ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		
		return "/weixinPage/riskLogistics/releaseSupply_risk";
	}
		
	
	/**
	 * 查看货源详情
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/weixin/goodsDetail")
	public String goodsDetail(
			@RequestParam(value = "goodsId")Integer goodsId,
			@RequestParam(value = "biddingState")Integer biddingState,
			HttpServletRequest request, Model model){
		ResultBean resultBean = new ResultBean();
		try{
			resultBean = zwbLogisticsInfoService
					.findGoodsDetailById(getToken(request), goodsId);
			model.addAttribute("zwbPublishgoodsLogBean",resultBean.getJsonValue1());
			model.addAttribute("biddingState",biddingState);//一口价改为竞价 原价格不会清空 用这个参数作为标识 1为竞价 2为一口价
		}catch(Exception ex){
			logger.error("获取货源详情失败，"+ex.getMessage(), ex);
			return "redirect:/error/404";
		}
		return "/weixinPage/riskLogistics/supplyDetails";
	}
	
	
	/**
	 * ==============================================================================
	 * 									json数据
	 * ==============================================================================
	 */
	
	/**
	 * 异步获取车源信息
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/findCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonFindCar(
			@ModelAttribute("zwbSourceSearchBean")ZwbSourceSearchBean zwbSourceSearchBean,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		try{
			if("1".equals(zwbSourceSearchBean.getCollectCar())){
				if(getCurrentAccountId()==null){
					resultBean.setCode(-2);
					resultBean.setMsg("亲，您还没有登录");
					return resultBean;
				}
			}
			zwbSourceSearchBean.setToken(getToken(request));
			resultBean = zwbLogisticsInfoService.findCar(zwbSourceSearchBean);
		}catch(Exception ex){
			logger.error("获取车源列表失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("获取车源列表失败!");
		}
		return resultBean;
	}
	
	/**
	 * 异步收藏车源
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/collectCar", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonCollectCar(
			@RequestParam(value = "carSourceId")Integer carSourceId,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			resultBean = zwbLogisticsInfoService.collectCar(getToken(request),carSourceId);
		}catch(Exception ex){
			logger.error("收藏车源失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("收藏车源失败!");
		}
		return resultBean;
	}
	
	
	/**
	 * 异步收藏车源
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/cancelCollect", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonCancelCollect(
			@RequestParam(value = "carSourceId")Integer carSourceId,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			resultBean = zwbLogisticsInfoService.cancelCollect(getToken(request),carSourceId);
		}catch(Exception ex){
			logger.error("取消收藏车源失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("取消收藏车源失败!");
		}
		return resultBean;
	}
	
	
	/**
	 * 异步获取货源列表
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/findGoods", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonFindGoods(
			@ModelAttribute("zwbSourceSearchBean")ZwbSourceSearchBean zwbSourceSearchBean,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			zwbSourceSearchBean.setToken(getToken(request));
			resultBean = zwbLogisticsInfoService.findGoods(zwbSourceSearchBean);
		}catch(Exception ex){
			logger.error("获取货源列表失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("获取货源列表失败!");
		}
		return resultBean;
	}
	
	/**
	 * 异步保存货源信息
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/saveGoods", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonSaveGoods(
			@ModelAttribute("zwbPublishgoodsLogBean")ZwbPublishgoodsLogBean zwbPublishgoodsLogBean,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			
			zwbPublishgoodsLogBean.setToken(getToken(request));
			zwbPublishgoodsLogBean.setLoadTime(new Timestamp(new Date().getTime()));
			zwbPublishgoodsLogBean.setLoadTimeStr(sdf.format(new Date()));
			if(zwbPublishgoodsLogBean.getGoodsId()==null){
				zwbPublishgoodsLogBean.setAccountId(getCurrentAccountId());
				zwbPublishgoodsLogBean.setOrganizationId(organizationIdSessionHelper
						.getOrganizationIdBySessionAttribute());
			}
			resultBean = zwbLogisticsInfoService.publishOrModifyGoods(zwbPublishgoodsLogBean);
		}catch(Exception ex){
			logger.error(zwbPublishgoodsLogBean.getGoodsId()==null?"发布":"编辑"
					+"货源信息失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg(zwbPublishgoodsLogBean.getGoodsId()==null?"发布":"编辑"+"货源信息失败！");
		}
		return resultBean;
	}
	
	/**
	 * 异步删除货源信息
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/delGoods", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean jsonDelGoods(
			@RequestParam(value = "goodsId")Integer goodsId,
			HttpServletRequest request){
		ResultBean resultBean = new ResultBean();
		try{
			if(getCurrentAccountId()==null){
				resultBean.setCode(-2);
				resultBean.setMsg("亲，您还没有登录");
				return resultBean;
			}
			resultBean = zwbLogisticsInfoService.delGoods(getToken(request),goodsId);
		}catch(Exception ex){
			logger.error("删除货源信息失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("删除货源信息失败!");
		}
		return resultBean;
	}
	
	/**
	 * 获取中危宝地址字典
	 * @param kind
	 * @param parent
	 * @return
	 */
	@RequestMapping(value = "/logistics/zwb/json/area", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean getAddressInfo(
			@RequestParam(value = "kind", defaultValue = "0")Short kind,
			@RequestParam(value = "parent", defaultValue = "")Integer parent){
		ResultBean resultBean = new ResultBean();
		try{
			resultBean = zwbLogisticsInfoService.getAddressInfo(kind,parent);
		}catch(Exception ex){
			logger.error("获取中危宝地址字典失败，"+ex.getMessage(), ex);
			resultBean.setCode(-1);
			resultBean.setMsg("获取中危宝地址字典失败!");
		}
		return resultBean;
	}

	/**
	 * ==============================================================================
	 * 									私有方法
	 * ==============================================================================
	 */
	/**
	 * 通过登录账户手机号获取token
	 * @param request
	 * @return
	 */
	private String getToken(HttpServletRequest request){
		Object token = "";		
		try{
			if(getCurrentAccountId()==null){
				token = zwbLogisticsInfoService.getToken("18900000000");
			}else{
				AccountInfoBean info = accountInfoBeanProxy
						.selectByPrimaryKey(getCurrentAccountId());
				if(info!=null){
					token = zwbLogisticsInfoService.getToken(info.getAccountCode());
				}else{
					token = zwbLogisticsInfoService.getToken("18900000000");
				}
			}	
		}catch(Exception ex){
			logger.error("获取token失败，"+ex.getMessage(), ex);
		}
		return token.toString();
	}
}
