
package com.chinatelecom.jx.zone.management.controller.weixinConfig;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;
import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigMenuBean;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigInfoService;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigMenuService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.weixin.menu.Button;
import com.chinatelecom.jx.zone.management.weixin.menu.ClickButton;
import com.chinatelecom.jx.zone.management.weixin.menu.ComButton;
import com.chinatelecom.jx.zone.management.weixin.menu.Menu;
import com.chinatelecom.jx.zone.management.weixin.menu.ViewButton;
import com.chinatelecom.jx.zone.management.weixin.template.DataItem2;
import com.chinatelecom.jx.zone.management.weixin.template.TempItem;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.MenuApi;
import com.jfinal.weixin.sdk.api.TemplateData;
import com.jfinal.weixin.sdk.api.TemplateMsgApi;
import com.jfinal.weixin.sdk.api.UserApi;

@Controller
//@RequestMapping(value = "/weixinconfigmenu")
public class WeixinConfigMenuController extends BaseController {
	@Autowired
	private IWeixinConfigMenuService weixinConfigMenuService;
	@Autowired
	private IWeixinConfigInfoService weixinConfigInfoService;
 
	/**
	 * 微信菜单设置
	 * @param weixinConfigMenu
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigMenu/list")
	public String list( ServletRequest request, Model model) {
		try{
			WeixinConfigMenuBean menu =new WeixinConfigMenuBean();
			menu.setParentMenuId(new BigDecimal(-1));
			menu.setOrderByClause(" order_Num asc");
			List<WeixinConfigMenuBean> plist=weixinConfigMenuService.queryByCond(menu);
			model.addAttribute("parentList", plist);
			model.addAttribute("parentListSize", plist.size());
			List<BigDecimal> idList=new ArrayList<BigDecimal>();
			for(WeixinConfigMenuBean  p:plist){
				idList.add(p.getMenuId());
			}
		 	List<WeixinConfigMenuBean> clist=weixinConfigMenuService.queryByParentIds( idList);
			model.addAttribute("childrenList", clist);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return "weixinConfigMenu/list";
	}
	
	/**
	 * 同步到微信
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigMenu/json/syn", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String syn(Model model, ServletRequest request) {
		WeixinConfigMenuBean menu =new WeixinConfigMenuBean();
		menu.setParentMenuId(new BigDecimal(-1));
		menu.setOrderByClause(" order_Num asc");
		List<WeixinConfigMenuBean> plist=weixinConfigMenuService.queryByCond(menu);
		Menu mainMenu = new Menu();  
        Button[] mainButton= new Button[plist.size()]  ;  
        String returnStr="更新成功";
		try{
		 for(int j=0;j<plist.size();j++){
			 WeixinConfigMenuBean p=plist.get(j);
			 if(StringUtil.checkNotNull(p.getMenuType().trim())){ // view 或 click 
				if(p.getMenuType().equals("view")){
					 ViewButton vb = new ViewButton();  
				     vb.setName(p.getMenuName());  
				     vb.setType("".equals(p.getMenuType().trim())?null:p.getMenuType());  
				     vb.setUrl(p.getSaveValue()); 
				     mainButton[j]  =vb;
				}
				if(p.getMenuType().equals("click")){
					 ClickButton clb = new ClickButton();  
					 clb.setName(p.getMenuName());  
				     clb.setType("".equals(p.getMenuType().trim())?"click":p.getMenuType());  
				     clb.setKey(p.getSaveValue()); 
				     mainButton[j]  =clb;
				}
			 }else{ // 有子菜单
				List<WeixinConfigMenuBean> clist=weixinConfigMenuService.queryByParentId(p.getMenuId());
				if(clist.isEmpty()){//未设置子菜单
					if(p.getMenuType().equals("view")){
						 ViewButton vb = new ViewButton();  
					     vb.setName(p.getMenuName());  
					     vb.setType("".equals(p.getMenuType().trim())?"click":p.getMenuType());  
					     vb.setUrl(p.getSaveValue()); 
					     mainButton[j]  =vb;
					}
					if(p.getMenuType().equals("click")){
						 ClickButton clb = new ClickButton();  
						 clb.setName(p.getMenuName());  
					     clb.setType("".equals(p.getMenuType().trim())?"click":p.getMenuType());  
					     clb.setKey(p.getSaveValue()); 
					     mainButton[j]  =clb;
					}
				}else{// 有子菜单
					ComButton cb=new ComButton();
					cb.setName(p.getMenuName());
					cb.setType("".equals(p.getMenuType().trim())?"click":p.getMenuType());
					Button[] sub_button=new Button[clist.size()] ; 
					for(int i=0;i<clist.size();i++){
						WeixinConfigMenuBean c=clist.get(i) ;
						if(c.getMenuType().equals("view")){
							 ViewButton vb = new ViewButton();  
						     vb.setName(c.getMenuName());  
						     vb.setType("".equals(c.getMenuType().trim())?"click":c.getMenuType());  
						     vb.setUrl(c.getSaveValue()); 
							 sub_button[i]=vb;
						}
						if(c.getMenuType().equals("click")){
							 ClickButton clb = new ClickButton();  
							 clb.setName(c.getMenuName());  
						     clb.setType("".equals(c.getMenuType().trim())?"click":c.getMenuType());  
						     clb.setKey(c.getSaveValue()); 
							 sub_button[i]=clb;
						}
					}
					cb.setSub_button(sub_button);
					 mainButton[j]  =cb;
				}
			 }
		}
		mainMenu.setButton(mainButton);
		String s=creatMenu(mainMenu);
		if(!s.equals("ok")){
			returnStr=s;
		}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnStr="更新到微信失败";
		}
	 // model.addAttribute("weixinConfigMenu", weixinConfigMenu);
	  return returnStr;
	} 
	 
	/**
	 * 保存 
	 * @return
	 */
	@RequestMapping(value = "/weixinConfigMenu/save")
	public String save(
			RedirectAttributes redirectAttributes,Model model,
			ServletRequest request) {
		String[] menuName=request.getParameterValues("menuName") ;
		String[] saveValue=request.getParameterValues("saveValue") ;
		String[] menuType=request.getParameterValues("menuType") ;
		String[] orderNum=request.getParameterValues("orderNum") ;
		String[] parentMenuId=request.getParameterValues("parentMenuId") ;
		String[] isDelete=request.getParameterValues("isDelete") ;
		String[] ids=request.getParameterValues("ids") ;
		Map map =new HashMap();
		String message="操作成功";
		try{
		for(int i=0;i<ids.length;i++){
			if(isDelete[i].equals("1")){
				if(!ids[i].startsWith("temp")){
				  //删除
				   weixinConfigMenuService.deleteById(new BigDecimal(ids[i]));
				} 
			}else{ //创建
				if(ids[i].startsWith("temp")){
					WeixinConfigMenuBean  m=new WeixinConfigMenuBean();
					m.setMenuId(seq.getNextSeqIdToBigDecimal());
					m.setMenuName(menuName[i]);
					m.setMenuType(menuType[i]);
					m.setSaveValue(saveValue[i]);
					m.setOrderNum(new Short(orderNum[i]));
					if(parentMenuId[i].equals("-1")){
						map.put(ids[i], m.getMenuId()) ;
					}   
					if(parentMenuId[i].startsWith("temp")){
						BigDecimal pid=(BigDecimal)map.get(parentMenuId[i]) ;
						m.setParentMenuId(pid);
				    }else{
					    m.setParentMenuId(new BigDecimal(parentMenuId[i]));
				    }
					weixinConfigMenuService.insert(m);
				}else{//更新
					WeixinConfigMenuBean  m=weixinConfigMenuService.selectById(new BigDecimal(ids[i]));
					m.setMenuName(menuName[i]);
					m.setMenuType(menuType[i]);
					m.setSaveValue(saveValue[i]);
					m.setOrderNum(new Short(orderNum[i]));
					if(parentMenuId[i].startsWith("temp")){
						BigDecimal pid=(BigDecimal)map.get(parentMenuId[i]) ;
						m.setParentMenuId(pid);
				    }else{
					    m.setParentMenuId(new BigDecimal(parentMenuId[i]));
				    }
					weixinConfigMenuService.updateById(m);
				}
			}
		}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			message="操作异常，请联系管理员";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/weixinConfigMenu/list" ;
	}
	
	 /** 
     * 组装菜单数据 
     * @return 
     */  
    private  String creatMenu(Menu mainMenu) {  
    	 String jsonMenu = JsonKit.toJson(mainMenu).toString();
		    //System.out.println(jsonMenu);
		    ApiConfig ac = new ApiConfig();
			// 配置微信 API 相关常量 用于多微信账号管理
		    WeixinConfigInfoBean w=weixinConfigInfoService.selectById(new BigDecimal(0));
		    if(w==null){
		    	PropKit.use("weixin.properties");
		    	ac.setAppId(PropKit.get("appId"));
	 			ac.setAppSecret(PropKit.get("appSecret"));
		    }else{
		    	ac.setAppId(w.getAppid());   
				ac.setAppSecret(w.getAppsecret());  
		    }
 			
		    ApiConfigKit.setThreadLocalApiConfig(ac);
		   //创建菜单
	        ApiResult apiResult=MenuApi.createMenu(jsonMenu);
	       // System.out.println("========jsonMenu======="+jsonMenu);
	      //  System.out.println("========结果======="+apiResult.getJson());
    	return apiResult.getErrorMsg();
    }
	
    /** 
     * 测试模板消息 
     * @return 
     */	 
	@RequestMapping(value = "/weixinConfigMenu/json/testTemp", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String testTemp(Model model, ServletRequest request) {
	//	  System.out.println("========已有菜单======="+  getCurrentMenu());
		ApiConfig ac = new ApiConfig();
		// 配置微信 API 相关常量 用于多微信账号管理
	    WeixinConfigInfoBean w=weixinConfigInfoService.selectById(new BigDecimal(0));
	    if(w==null){
	    	PropKit.use("weixin.properties");
	    	ac.setAppId(PropKit.get("appId"));
 			ac.setAppSecret(PropKit.get("appSecret"));
 			ac.setToken(PropKit.get("token"));
	    }else{
	    	ac.setAppId(w.getAppid());   
			ac.setAppSecret(w.getAppsecret());  
	    } 
	    ApiConfigKit.setThreadLocalApiConfig(ac);
	    
		DataItem2 dataItem=new DataItem2();
		dataItem.setFirst( new TempItem("恭喜你，中大奖了！", "#009988") );
		dataItem.setKeyword1( new TempItem("双色球", "#009988") );
		dataItem.setKeyword2( new TempItem("一等奖，五百万人民币！", "#009988") );
		dataItem.setRemark(new TempItem("\n 祝你生活愉快", "#008000"));
		//活动取消  sck4Z-cPOGODoyJReL2ooBRW4110bg2J0XaS4XFd5a0 
		/*       {{first.DATA}}
		活动名称：{{keyword1.DATA}}
		活动时间：{{keyword2.DATA}}
		发起人：{{keyword3.DATA}}
		取消原因：{{keyword4.DATA}}
		{{remark.DATA}}*/
		// obnfavjAH7CRrrwIpVI7L7vHLLf0 me
		//String json=TempToJson.getTempJson("os-pJtxNrPOTjtuW0dqETxoFFyz8", "sck4Z-cPOGODoyJReL2ooBRW4110bg2J0XaS4XFd5a0",
		//		"#743A3A", "", dataItem); 
		//   System.out.println("====template====json ======="+json);
	     ApiResult result = TemplateMsgApi.send(TemplateData.New()
	    	    // 消息接收者
	    	    .setTouser("obnfavjAH7CRrrwIpVI7L7vHLLf0")
	    	    // 模板id
	    	    .setTemplate_id("sck4Z-cPOGODoyJReL2ooBRW4110bg2J0XaS4XFd5a0" )
	    	    .setTopcolor("#eb414a")
	    	    .setUrl("http://www.baidu.com")
	    	    // 模板参数
	    	    .add("first", "由于各种原因，活动取消了！\n", "#999")
	    	    .add("keyword1", "免费吃大餐", "#999")
	    	    .add("keyword2", "2016年10月1日", "#999")
	    	    .add("keyword3", "王老板", "#999")  
	    	    .add("keyword4", "各种原因吧，反正就是没的吃了", "#999")  
	    	    .add("remark", "其实我也不想的。", "#999")
	    	    .build()); 
		//发送模板消息
	//	ApiResult result=TemplateMsgApi.send(json);
	//	System.out.println("=======getAppId======"+ApiConfigKit.getApiConfig().getAppId());
	//	System.out.println("=======getAppSecret======"+ ApiConfigKit.getApiConfig().getAppSecret());
	//	System.out.println("=======accessToken======"+AccessTokenApi.getAccessToken().getAccessToken());
//		System.out.println("===========结果=============="+JsonKit.toJson(result));
//		System.out.println("========所有用户信息：" +UserApi.getFollows().getJson());
		return result.getJson();
	}
	private String getCurrentMenu(){
		//com.github.sd4324530.fastweixin.api.config.ApiConfig apiConfig = new com.github.sd4324530.fastweixin.api.config.ApiConfig(PropKit.get("appId"), PropKit.get("appSecret"));
		///MenuAPI menuAPI = new MenuAPI(apiConfig);
		//GetMenuResponse response = menuAPI.getMenu();
		//ApiResult r=MenuApi.getCurrentSelfMenuInfo();
		return "";//r.toString();
	}
	/*
	@RequestMapping(value = "/weixinConfigMenu/json/syn1", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String syn1(
			Model model, ServletRequest request) {
		WeixinConfigMenuBean menu =new WeixinConfigMenuBean();
		menu.setParentMenuId(new BigDecimal(-1));
		menu.setOrderByClause(" order_Num asc");
		List<WeixinConfigMenuBean> plist=weixinConfigMenuService.queryByCond(menu);
		WeixinConfigMenuBean  pMenu = null;
		WeixinConfigMenuBean  cMenu = null;
		List<MenuButton> list =new ArrayList<MenuButton>();
		if(plist!=null && plist.size()>0){
		try {
				for (int i = 0; i < plist.size(); i++) {
					pMenu = plist.get(i);
					List<WeixinConfigMenuBean> subNavList = weixinConfigMenuService.queryByParentId(pMenu.getMenuId());
					if(pMenu!=null){
						MenuButton mb=new MenuButton();
						mb.setName(pMenu.getMenuName());
						mb.setType( MenuType.VIEW);   
						if( subNavList.isEmpty() || subNavList==null){ // 无子菜单,直接跳转
							mb.setUrl(pMenu.getSaveValue() +"?menuname="+URLEncoder.encode(pMenu.getMenuName(),"utf-8"));
						}else{ // 带子菜单
							if(subNavList.size()>0){//非叶子节点，挂的有二级导航菜单
								 List<MenuButton> sblist =new ArrayList<MenuButton>();
								 int subNavSize = subNavList.size();
								 mb.setType( MenuType.CLICK);   
								 for (int j = 0; j < subNavSize; j++) {
									 cMenu = subNavList.get(j);
									 if(cMenu!=null){
										 MenuButton sb=new MenuButton();
										 sb.setName(cMenu.getMenuName());
										 sb.setType( MenuType.VIEW);
										 sb.setUrl(cMenu.getSaveValue()  +"?menuname="+URLEncoder.encode(cMenu.getMenuName(),"utf-8"));
										 sblist.add(sb);
									 }
								 }
								 mb.setSubButton(sblist);
							}else{//无子菜单 无子节点的 ，跳转到错误
								 mb.setName(pMenu.getMenuName());
								 mb.setUrl(pMenu.getSaveValue() +"?menuname="+URLEncoder.encode(pMenu.getMenuName(),"utf-8"));
							}
						}
						System.out.println( mb.getName()+"========mb========"+mb.getUrl());
						list.add(mb);
					}
				}
				PropKit.use("weixin.properties");
				com.github.sd4324530.fastweixin.api.config.ApiConfig apiConfig = new com.github.sd4324530.fastweixin.api.config.ApiConfig(PropKit.get("appId"), PropKit.get("appSecret"));
				MenuAPI menuAPI = new MenuAPI(apiConfig);
				com.github.sd4324530.fastweixin.api.entity.Menu fastweixinmenu = new com.github.sd4324530.fastweixin.api.entity.Menu();
				fastweixinmenu.setButton(list);
				ResultType rt=null; 
				try {
				  rt=menuAPI.createMenu(fastweixinmenu);
			  //  GetMenuResponse response = menuAPI.getMenu();
				  String s= JSON.toJSONString(fastweixinmenu);
				  System.out.println("=============菜单json: "+s);
			      System.out.println("=============返回结果: "+rt.getDescription());
				}catch(Exception e){
					e.printStackTrace();
				}
			 } catch (Exception e) {
						e.printStackTrace();
					}
			 System.out.println("======list==========="+list.size());
			
			}
		return "syn1";
	}
	*/
}