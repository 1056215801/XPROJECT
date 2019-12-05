package com.chinatelecom.jx.zone.management.weixin.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;
import com.chinatelecom.jx.zone.management.bean.weixinReceivedMsg.WeixinReceivedMsgBean;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigInfoService;
import com.chinatelecom.jx.zone.management.service.weixinConfigReply.IWeixinConfigReplyService;
import com.chinatelecom.jx.zone.management.service.weixinReceivedMsg.IWeixinReceivedMsgService;

import com.chinatelecom.jx.zone.management.util.SpringUtils;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.UserApi;
import com.jfinal.weixin.sdk.jfinal.MsgControllerAdapter;
import com.jfinal.weixin.sdk.msg.in.InImageMsg;
import com.jfinal.weixin.sdk.msg.in.InLinkMsg;
import com.jfinal.weixin.sdk.msg.in.InLocationMsg;
import com.jfinal.weixin.sdk.msg.in.InShortVideoMsg;
import com.jfinal.weixin.sdk.msg.in.InTextMsg;
import com.jfinal.weixin.sdk.msg.in.InVideoMsg;
import com.jfinal.weixin.sdk.msg.in.InVoiceMsg;
import com.jfinal.weixin.sdk.msg.in.event.InCustomEvent;
import com.jfinal.weixin.sdk.msg.in.event.InFollowEvent;
import com.jfinal.weixin.sdk.msg.in.event.InLocationEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMassEvent;
import com.jfinal.weixin.sdk.msg.in.event.InMenuEvent;
import com.jfinal.weixin.sdk.msg.in.event.InQrCodeEvent;
import com.jfinal.weixin.sdk.msg.in.event.InShakearoundUserShakeEvent;
import com.jfinal.weixin.sdk.msg.in.event.InTemplateMsgEvent;
import com.jfinal.weixin.sdk.msg.in.event.InVerifyFailEvent;
import com.jfinal.weixin.sdk.msg.in.event.InVerifySuccessEvent;
import com.jfinal.weixin.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;
import com.jfinal.weixin.sdk.msg.out.News;
import com.jfinal.weixin.sdk.msg.out.OutImageMsg;
import com.jfinal.weixin.sdk.msg.out.OutNewsMsg;
import com.jfinal.weixin.sdk.msg.out.OutTextMsg;
import com.jfinal.weixin.sdk.msg.out.OutVoiceMsg;

/**
 * 微信消息处理
 * 将此 DemoController 在YourJFinalConfig 中注册路由， 并设置好weixin开发者中心的 URL 与 token ，使
 * URL 指向该 DemoController 继承自父类 WeixinController 的 index
 */
 
public class WeixinMsgController extends MsgControllerAdapter {
	public static String nearbyContent;// 附近
	public static String location;// 地理位置114.037125,22.645319
	public static String weahterContent;
	public String Regex = "[\\+ ~!@#%^-_=]?";
  	private static IWeixinConfigReplyService  weixinConfigReplyService= SpringUtils.getBean(IWeixinConfigReplyService.class);
 	private static IWeixinConfigInfoService weixinConfigService= SpringUtils.getBean(IWeixinConfigInfoService.class);
 	private static IAccountWeixinBeanProxy accountWeixinProxyService= SpringUtils.getBean(IAccountWeixinBeanProxy.class);
 	private static IWeixinReceivedMsgService weixinReceivedMsgService= SpringUtils.getBean(IWeixinReceivedMsgService.class);
 	private static ISystemLogSync systemLogSync= SpringUtils.getBean(ISystemLogSync.class);
 	private static Log logger = Log.getLog(WeixinMsgController.class);
	/**
	 * 如果要支持多公众账号，只需要在此返回各个公众号对应的 ApiConfig 对象即可 可以通过在请求 url 中挂参数来动态从数据库中获取
	 * ApiConfig 属性值
	 */
	@Override
	public ApiConfig getApiConfig() {
		ApiConfig ac = new ApiConfig();
		// 配置微信 API 相关常量
		ac.setToken(PropKit.get("token"));
		ac.setAppId(PropKit.get("appId"));  
		ac.setAppSecret(PropKit.get("appSecret"));
		/**
		 * 是否对消息进行加密，对应于微信平台的消息加解密方式： 1：true进行加密且必须配置 encodingAesKey
		 * 2：false采用明文模式，同时也支持混合模式
		 */
		ac.setEncryptMessage(false);
		ac.setEncodingAesKey( "setting it in config file");
		return ac;
	}

	/**
	 * 文本消息 本例子中根据消息中的不同文本内容分别做出了不同的响应，同时也是为了测试 jfinal weixin
	 * sdk的基本功能： 本方法仅测试了 OutTextMsg、OutNewsMsg、OutMusicMsg 三种类型的OutMsg，
	 * 其它类型的消息会在随后的方法中进行测试
	 */
	//@Override
	@Override
	protected void processInTextMsg(InTextMsg inTextMsg) {
		String content = inTextMsg.getContent().trim();
		String  openId = inTextMsg.getToUserName();
		 WeixinConfigInfoBean w= weixinConfigService.selectByOpenId(openId);
		logger.debug("用户发送到服务器的内容:"+ content);
		StringBuilder text = new StringBuilder(w.getDescription());
		
		//保存文字消息
		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setType(inTextMsg.getMsgType());
		record.setStatus("1");
		record.setContent(inTextMsg.getContent());
		record.setCreateTime(inTextMsg.getCreateTime().toString());
		record.setFromUserName(inTextMsg.getFromUserName());
		record.setMsgId(inTextMsg.getMsgId());
		record.setToUserName(inTextMsg.getToUserName());
		weixinReceivedMsgService.insert(record);
		//
		renderOutTextMsg(text.toString());
		}
	//
	/**
	 * 图片消息
	 */
	@Override
	protected void processInImageMsg(InImageMsg inImageMsg) {
 		OutImageMsg outMsg = new OutImageMsg(inImageMsg);
//		// 将刚发过来的图片再发回去
 		outMsg.setMediaId(inImageMsg.getMediaId());
 		//保存图片消息
 		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setStatus("1");
		record.setType(inImageMsg.getMsgType());
		record.setMediaId(inImageMsg.getMediaId());
		record.setPicUrl(inImageMsg.getPicUrl());
		record.setCreateTime(inImageMsg.getCreateTime().toString());
		record.setFromUserName(inImageMsg.getFromUserName());
		record.setMsgId(inImageMsg.getMsgId());
		record.setToUserName(inImageMsg.getToUserName());
		weixinReceivedMsgService.insert(record);
		render(outMsg); 					
	}

	/**
	 * 语音消息
	 */
	@Override
	protected void processInVoiceMsg(InVoiceMsg inVoiceMsg) {
		OutVoiceMsg outMsg = new OutVoiceMsg(inVoiceMsg);
		// 将刚发过来的语音再发回去
		outMsg.setMediaId(inVoiceMsg.getMediaId());
		//保存图片消息
		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setStatus("1");
		record.setType(inVoiceMsg.getMsgType());
		record.setMediaId(inVoiceMsg.getMediaId());
		record.setMsgId(inVoiceMsg.getMsgId());
		record.setToUserName(inVoiceMsg.getToUserName());
		record.setFromUserName(inVoiceMsg.getFromUserName());
		record.setCreateTime(inVoiceMsg.getCreateTime().toString());
		record.setFormat(inVoiceMsg.getFormat());
	    weixinReceivedMsgService.insert(record);
		render(outMsg);
	}

	/**
	 * 视频消息
	 */
	@Override
	protected void processInVideoMsg(InVideoMsg inVideoMsg) {
		/*
		 * 腾讯 api 有 bug，无法回复视频消息，暂时回复文本消息代码测试 OutVideoMsg outMsg = new
		 * OutVideoMsg(inVideoMsg); outMsg.setTitle("OutVideoMsg 发送");
		 * outMsg.setDescription("刚刚发来的视频再发回去"); // 将刚发过来的视频再发回去，经测试证明是腾讯官方的 api
		 * 有 bug，待 api bug 却除后再试 outMsg.setMediaId(inVideoMsg.getMediaId());
		 * render(outMsg);
		 */
		OutTextMsg outMsg = new OutTextMsg(inVideoMsg);
		outMsg.setContent("\t视频消息已成功接收，该视频的 mediaId 为: " + inVideoMsg.getMediaId());
		//保存视频消息
		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setStatus("1");
		record.setType(inVideoMsg.getMsgType());
		record.setMediaId(inVideoMsg.getMediaId());
		record.setMsgId(inVideoMsg.getMsgId());
		record.setToUserName(inVideoMsg.getToUserName());
		record.setFromUserName(inVideoMsg.getFromUserName());
		record.setCreateTime(inVideoMsg.getCreateTime().toString());
		record.setThumbMediaId(inVideoMsg.getThumbMediaId());
		weixinReceivedMsgService.insert(record);
		render(outMsg);
	}
	/**
	 * 短视频消息
	 */
	@Override
	protected void processInShortVideoMsg(InShortVideoMsg inShortVideoMsg) {
		OutTextMsg outMsg = new OutTextMsg(inShortVideoMsg);
		outMsg.setContent("\t视频消息已成功接收，该视频的 mediaId 为: " + inShortVideoMsg.getMediaId());
		//保存视频消息
		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setStatus("1");
		record.setType(inShortVideoMsg.getMsgType());
		record.setMediaId(inShortVideoMsg.getMediaId());
		record.setMsgId(inShortVideoMsg.getMsgId());
		record.setToUserName(inShortVideoMsg.getToUserName());
		record.setFromUserName(inShortVideoMsg.getFromUserName());
		record.setCreateTime(inShortVideoMsg.getCreateTime().toString());
		record.setThumbMediaId(inShortVideoMsg.getThumbMediaId());
		weixinReceivedMsgService.insert(record);
		render(outMsg);
	}

	/**
	 * 地址位置消息
	 */
	@Override
	protected void processInLocationMsg(InLocationMsg inLocationMsg) {
//		OutTextMsg outMsg = new OutTextMsg(inLocationMsg);
//		outMsg.setContent("已收到地理位置消息:" + "\nlocation_X = " + inLocationMsg.getLocation_X() + "\nlocation_Y = "
//				+ inLocationMsg.getLocation_Y() + "\nscale = " + inLocationMsg.getScale() + "\nlabel = "
//				+ inLocationMsg.getLabel());
//		render(outMsg);
		String Location_X = inLocationMsg.getLocation_X();
		String Location_Y = inLocationMsg.getLocation_Y();
//		System.out.println("Location_X:" + Location_X + " Location_Y:"
//				+ Location_Y);
		location=Location_Y+","+Location_X;
		//保存视频消息
		SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
		BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
		WeixinReceivedMsgBean record=new WeixinReceivedMsgBean();
		record.setId(id);
		record.setStatus("1");
		record.setType(inLocationMsg.getMsgType());
		record.setScale(inLocationMsg.getScale());
		record.setMsgId(inLocationMsg.getMsgId());
		record.setToUserName(inLocationMsg.getToUserName());
		record.setFromUserName(inLocationMsg.getFromUserName());
		record.setCreateTime(inLocationMsg.getCreateTime().toString());
		record.setLabel(inLocationMsg.getLabel());	
		record.setLocationX(inLocationMsg.getLocation_X());
		record.setLocationY(inLocationMsg.getLocation_Y());
		weixinReceivedMsgService.insert(record);
	}
	/**
	 * 扫码事件
	 */
	@Override
	protected void processInQrCodeEvent(InQrCodeEvent inQrCodeEvent) {
//		System.out.println("=====扫码关注========"+inQrCodeEvent.getFromUserName());
		logger.debug("扫码未关注：" + inQrCodeEvent.getFromUserName());
		/*if (InQrCodeEvent.EVENT_INQRCODE_SUBSCRIBE.equals(inQrCodeEvent.getEvent())) {
			logger.debug("扫码未关注：" + inQrCodeEvent.getFromUserName());
			OutTextMsg outMsg = new OutTextMsg(inQrCodeEvent);
			outMsg.setContent("感谢您的关注，二维码内容：" + inQrCodeEvent.getEventKey());
			render(outMsg);
		}
		if (InQrCodeEvent.EVENT_INQRCODE_SCAN.equals(inQrCodeEvent.getEvent())) {
			logger.debug("扫码已关注：" + inQrCodeEvent.getFromUserName());
			String key = inQrCodeEvent.getEventKey();
			renderOutTextMsg(key);
		}*/
	}
	/**
	 * 发送地理位置事件
	 */
	@Override
	protected void processInLocationEvent(InLocationEvent inLocationEvent) {
		logger.debug("发送地理位置事件：" + inLocationEvent.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inLocationEvent);
		outMsg.setContent("地理位置是：\n" + inLocationEvent.getLatitude()+"\n"+inLocationEvent.getLongitude());
		render(outMsg);
	}

	@Override
	protected void processInMassEvent(InMassEvent inMassEvent) {
		logger.debug("测试方法：processInMassEvent()");
		renderNull();
	}

	/**
	 * 自定义菜单事件
	 */
	@Override
	protected void processInMenuEvent(InMenuEvent inMenuEvent) {
		logger.debug("菜单事件：" + inMenuEvent.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inMenuEvent);
		outMsg.setContent("菜单事件内容是：" + inMenuEvent.getEventKey());
		render(outMsg);
	}

	@Override
	protected void processInSpeechRecognitionResults(InSpeechRecognitionResults inSpeechRecognitionResults) {
		logger.debug("语音识别事件：" + inSpeechRecognitionResults.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inSpeechRecognitionResults);
		outMsg.setContent("语音识别内容是：" + inSpeechRecognitionResults.getRecognition());
		render(outMsg);
	}

	/**
	 * 链接消息 特别注意：测试时需要发送我的收藏中的曾经收藏过的图文消息，直接发送链接地址会当做文本消息来发送
	 */
	@Override
	protected void processInLinkMsg(InLinkMsg inLinkMsg) {
		OutNewsMsg outMsg = new OutNewsMsg(inLinkMsg);
		outMsg.addNews("链接消息已成功接收", "链接使用图文消息的方式发回给你，还可以使用文本方式发回。点击图文消息可跳转到链接地址页面，是不是很好玩 :)",
				"http://mmbiz.qpic.cn/mmbiz/zz3Q6WSrzq1ibBkhSA1BibMuMxLuHIvUfiaGsK7CC4kIzeh178IYSHbYQ5eg9tVxgEcbegAu22Qhwgl5IhZFWWXUw/0",
				inLinkMsg.getUrl());
		render(outMsg);
	}

	@Override
	protected void processInCustomEvent(InCustomEvent inCustomEvent) {
		System.out.println("processInCustomEvent() 方法测试成功");
	}

	/**
	 * 关注/取消 
	 */
	@Override
	protected void processInFollowEvent(InFollowEvent event) {
		OutNewsMsg outMsg = new OutNewsMsg(event);
		String userOpenId =outMsg.getToUserName();
		String openId =outMsg.getFromUserName(); 
		WeixinConfigInfoBean wi=weixinConfigService.selectByOpenId(openId);
		String appId=wi==null?"":wi.getAppid() ;
		//event.getFromUserName() :os-pJt5v1rjay8I2dzV_bfoOSwgI 用户ID
		//event.getToUserName() : gh_10e6750e3f32  公众号原始ID
			 if(event.getEvent().equals(InFollowEvent.EVENT_INFOLLOW_SUBSCRIBE)){
				  logger.info(event.getToUserName()+":关注了"   ); 
				  ApiResult apiResult = UserApi.getUserInfo(userOpenId );
				  JSONObject userObject=JSON.parseObject(apiResult.getJson());
				    String city=userObject.getString("city");
					String country=userObject.getString("country");
					String groupid=userObject.getString("groupid");
					String headimgurl=userObject.getString("headimgurl");
					String language=userObject.getString("language");
					String nickname=userObject.getString("nickname");
					String openid=userObject.getString("openid");
					String province=userObject.getString("province");
					String remark=userObject.getString("remark");
					String sex=userObject.getString("sex");
					String subscribe=userObject.getString("subscribe");
					String subscribe_time=userObject.getString("subscribe_time");
					String unionid=userObject.getString("unionid");
					SeqIdType seq = SpringUtils.getBean("primaryKeySeq",SeqIdType.class);
				 BigDecimal id=seq.getNextSeqIdToBigDecimal() ;
				 AccountWeixinBean  accountWeixinBean = new AccountWeixinBean();
				 accountWeixinBean.setAccountId(new BigDecimal(-1)); 
				 accountWeixinBean.setAppId(appId);
				 accountWeixinBean.setBindId(id);
				 accountWeixinBean.setCity(city);
				 accountWeixinBean.setCountry(country);
				 accountWeixinBean.setCreateTime(new Date());
				 accountWeixinBean.setGroupId(groupid);
				 accountWeixinBean.setHeadImgurl(headimgurl);
				 accountWeixinBean.setLanguage(language);
				 accountWeixinBean.setNickName(nickname);
				 accountWeixinBean.setOpenId(openid);
				 accountWeixinBean.setProvince(province);
				 accountWeixinBean.setRemark(remark);
				 accountWeixinBean.setSex(sex);
				 accountWeixinBean.setSubscribe(subscribe);
			 	 accountWeixinBean.setSubscribeTime(Long.valueOf(subscribe_time));
				 accountWeixinBean.setUnionId(unionid);
				 accountWeixinProxyService.validateInsertSelective(accountWeixinBean) ;
				 WeixinConfigInfoBean w= weixinConfigService.selectByOpenId(openId);
					ArrayList<News> articles = new ArrayList<News>();
					News article = new News();
					article.setTitle(w.getWxName());
					article.setDescription(w.getWelcomeText());
		 			article.setUrl("");
		 			article.setPicUrl(w.getWelcomeImg());
					articles.add(article);
					outMsg.addNews(articles);
//					outMsg=createArticle(park.getId(),outMsg);
//					outMsg= createYQX(park.getId(),outMsg) ;
 				//systemLogSync.insert(null, null , null,null,
				//	(short) 0, -1,"用户：【"+ event.getToUserName()+"】关注了："+appId);
					try{
						outMsg.addNews(weixinConfigReplyService.createMsg());
					}catch(Exception e){
						logger.error(e.getMessage(), e);	
					}
					render(outMsg);
			 }
			 if(event.getEvent().equals(InFollowEvent.EVENT_INFOLLOW_UNSUBSCRIBE)){ 
				 logger.info(event.getToUserName()+":取消关注"   ); 
				  AccountWeixinBean  bean = accountWeixinProxyService.selectByOpenIdAndAppId(userOpenId, appId);
				  if(bean!=null){
					  accountWeixinProxyService.validateDeleteByPrimaryKey(bean.getBindId());
				  }
				 // systemLogSync.insert(null, null , null,null,
				 //	 	(short) 0, -1,"用户：【"+ event.getToUserName()+"】不再关注："+appId);
			 	  renderNull();
			 }
			
		 
	}
	// 处理接收到的模板消息是否送达成功通知事件
	@Override
	protected void processInTemplateMsgEvent(InTemplateMsgEvent inTemplateMsgEvent) {
		String status = inTemplateMsgEvent.getStatus();
		renderOutTextMsg("模板消息是否接收成功：" + status);
	}
	/**
	 * 摇一摇
	 */
	@Override
	protected void processInShakearoundUserShakeEvent(InShakearoundUserShakeEvent inShakearoundUserShakeEvent) {
		logger.debug("摇一摇周边设备信息通知事件：" + inShakearoundUserShakeEvent.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inShakearoundUserShakeEvent);
		outMsg.setContent("摇一摇周边设备信息通知事件UUID：" + inShakearoundUserShakeEvent.getUuid());
		render(outMsg);
	}

	@Override
	protected void processInVerifySuccessEvent(InVerifySuccessEvent inVerifySuccessEvent) {
		logger.debug("资质认证成功通知事件：" + inVerifySuccessEvent.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inVerifySuccessEvent);
		outMsg.setContent("资质认证成功通知事件：" + inVerifySuccessEvent.getExpiredTime());
		render(outMsg);
	}

	@Override
	protected void processInVerifyFailEvent(InVerifyFailEvent inVerifyFailEvent) {
		logger.debug("资质认证失败通知事件：" + inVerifyFailEvent.getFromUserName());
		OutTextMsg outMsg = new OutTextMsg(inVerifyFailEvent);
		outMsg.setContent("资质认证失败通知事件：" + inVerifyFailEvent.getFailReason());
		render(outMsg);
	}
	/*private OutNewsMsg createArticle( OutNewsMsg outMsg) {
		WeixinSet ws1 = getWeinxinSet(parkId, WxConstUtils.CT_RB);
		WeixinSet ws2 = getWeinxinSet(parkId, WxConstUtils.CMCC_RB);
		WeixinSet ws3 = getWeinxinSet(parkId, WxConstUtils.CU_RB);
		if (ws1 != null && ws1.getStatus() == 1
				&& StringUtil.checkNotNull(ws1.getSetValue())) {
			News article1 = new News();
			article1.setTitle("电信用户领取免费流量");
			article1.setDescription("电信用户领取免费流量");
			article1.setUrl(ws1.getSetValue());
			article1.setPicUrl(WxConstUtils.PIC_URL);
			outMsg.addNews(article1);
		}
		if (ws2 != null && ws2.getStatus() == 1
				&& StringUtil.checkNotNull(ws2.getSetValue())) {
			News article2 = new News();
			article2.setTitle("移动用户领取免费流量");
			article2.setDescription("移动用户领取免费流量");
			article2.setUrl(ws2.getSetValue());
			article2.setPicUrl(WxConstUtils.PIC_URL);
			outMsg.addNews(article2);
		}
		if (ws3 != null && ws3.getStatus() == 1
				&& StringUtil.checkNotNull(ws3.getSetValue())) {
			News article3 = new News();
			article3.setTitle("联通用户领取免费流量");
			article3.setDescription("联通用户领取免费流量");
			article3.setUrl(ws3.getSetValue());
			article3.setPicUrl(WxConstUtils.PIC_URL);
			outMsg.addNews(article3);
		}
		return outMsg;
	}
	private OutNewsMsg createYQX( OutNewsMsg outMsg) {
		List<News> returnList = new ArrayList<News>();
		WeixinSet ws1 = getWeinxinSet(parkId, WxConstUtils.Y1);
		WeixinSet ws2 = getWeinxinSet(parkId, WxConstUtils.Y2);
		if (ws1 != null && ws1.getStatus() == 1
				&& StringUtil.checkNotNull(ws1.getSetValue())) {
			News article1 = new News();
			article1.setTitle(ws1.getSetName());
			article1.setDescription(ws1.getSetName());
			article1.setUrl(ws1.getSetValue());
			if(StringUtil.checkNotNull(ws1.getLocation())){
				article1.setPicUrl(ws1.getLocation());
			}else{
				article1.setPicUrl(WxConstUtils.Y_PIC_URL);
			}
			returnList.add(article1);
		}
		if (ws2 != null && ws2.getStatus() == 1
				&& StringUtil.checkNotNull(ws2.getSetValue())) {
			News article2 = new News();
			article2.setTitle(ws2.getSetName());
			article2.setDescription(ws2.getSetName());
			article2.setUrl(ws2.getSetValue());
			if(StringUtil.checkNotNull(ws2.getLocation())){
				article2.setPicUrl(ws2.getLocation());
			}else{
				article2.setPicUrl(WxConstUtils.Y_PIC_URL);
			}
			returnList.add(article2);
		}
		outMsg.addNews(returnList);
		return  outMsg ;
	}
	 */
}
