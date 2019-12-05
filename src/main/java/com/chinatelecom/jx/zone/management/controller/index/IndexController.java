package com.chinatelecom.jx.zone.management.controller.index;

import java.io.File;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinatelecom.jx.util.CryptUtils;
import com.chinatelecom.jx.zone.management.controller.BaseController;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.jfinal.kit.PathKit;

/**
 * 系统首页展示及跳转
 * 
 * @author ZuoGuangDe
 * 
 */
@Controller
public class IndexController  extends BaseController {
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;
	@Autowired
	private IShowLoginService  showLoginService ;
	// 引导到系统登录后主页
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/login/page/index/index")
	public String index(Model model, HttpServletRequest request) {
		BigDecimal accountId=	accountIdSessionHelper.getAccountIdBySessionAttribute() ;
		return "admin/main";
	}
	/**
	 * 单点到政务2.0
	 * @return
	 */
	@RequestMapping(value = "/toXOffice")
	public String toXOffice(HttpServletRequest request)throws Exception {
		String domain=showLoginService.getUrlPath()+"XOffice";
		String type=request.getParameter("type") ;
		String path=request.getParameter("path");
		String replaceFlag=request.getParameter("replaceFlag") ;
		if(this.isLogin()){// 已登录，单点过去
			String accessToken = new java.text.SimpleDateFormat("yyyyMMddHHmmss")
					.format(new java.util.Date());
			String userCode = CryptUtils.encryptDESede(accessToken, getCurrentAccount().getAccountCode());
			String url = CryptUtils.encryptDESede(accessToken, "/" );
			if("1".equals(type)){//精准帮扶
				url =  CryptUtils.encryptDESede(accessToken, "/oneApplication?menuId=90020170420090111801119000000001&subMenuId=90020170422145831801119000000006&isCheckFlag=1" );
			}
			if("2".equals(type)){//信息互动
				url =  CryptUtils.encryptDESede(accessToken, "/oneApplication?menuId=90020170411145151801119000000003" );
			}
			if("3".equals(type)){//应用   
				url =  CryptUtils.encryptDESede(accessToken, "/admin/application" );
			}
			if("0".equals(type)){ //自定义路径
				if(StringUtil.checkNotNull(path)){
					if("1".equals(replaceFlag)){
						path = path.replace("@", "&");
					}
					//中文菜单名称转码
					path=StringUtil.encodeChinese(path);
					url = CryptUtils.encryptDESede(accessToken,  path );
				}
			}
			
			String paths = domain+ "/auth/page/validateUnifiedSSOLogin?userCode=" + userCode
					+ "&accessToken=" + accessToken + "&url=" + url;
			return  "redirect:"+paths;
		}
		else {//未登录
			if("0".equals(type)){ //自定义路径
				String url="/" ;
				if(StringUtil.checkNotNull(path)){
					url=path ;
				}
				return  "redirect:"+domain+url;
			}else
			    return  "forward:/homePage/yc";
		}
	}
	/**
	 * 前台首页
	 * @return
	 */
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request) {
		// return new ModelAndView("forward:/WEB-INF/views/images/1.jpg");
		// return "forward:/WEB-INF/views/images/" + imageUrl;
		//request.getSession().invalidate();
		if(this.isMobileDevice(request)){
			return "redirect:/auth/page/mobile/weixin/experienceSharing/weixin/main";
		}
		else 
			return  "forward:/homePage/main";
		//return "/index";
	}
	
	/**
	 *  
	 * @return
	 */
	@RequestMapping(value = "/headerSelect")
	public String headerSelect(Model model,HttpServletRequest request)throws Exception {
		String entranceId= request.getParameter("entranceId");
		//判断文件是否存在
		if(!StringUtil.checkNotNull(entranceId)){
			if(request.getSession().getAttribute("entranceId")!=null)
			    entranceId= request.getSession().getAttribute("entranceId").toString();
			else
				entranceId= "" ;
		}
		model.addAttribute("isLogin",this.isLogin());
		model.addAttribute("clientId",showLoginService.getJxGovCaClientId());
		if(isExist("header_"+entranceId+".jsp")){
			return  "front/common/header_"+entranceId;
		}else{
			return  "front/common/header" ;
		}
	}
	
	@RequestMapping(value = "/footerSelect")
	public String footerSelect(HttpServletRequest request) {
		String entranceId= request.getParameter("entranceId");
		if(!StringUtil.checkNotNull(entranceId)){
			if(request.getSession().getAttribute("entranceId")!=null)
			    entranceId= request.getSession().getAttribute("entranceId").toString();
			else
				entranceId= "" ;
		}
		if(isExist("footer_"+entranceId+".jsp"))
			return  "front/common/footer_"+entranceId;
		else
			return  "front/common/footer" ;
	}
	@RequestMapping(value = "/slideSelect")
	public String slideSelect(HttpServletRequest request) {
		String entranceId= request.getParameter("entranceId");
		if(!StringUtil.checkNotNull(entranceId)){
			if(request.getSession().getAttribute("entranceId")!=null)
			    entranceId= request.getSession().getAttribute("entranceId").toString();
			else
				entranceId= "" ;
		}
		if(isExist("slide_"+entranceId+".jsp"))
			return  "front/common/slide_"+entranceId;
		else
			return  "front/common/slide";
	}
	
	private boolean isExist(String fileName){
		  File file=new File(PathKit.getWebRootPath()+"/WEB-INF/views/front/common/"+fileName );
		  return file.exists() ;
	} 
}
