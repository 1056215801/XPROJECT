package com.chinatelecom.jx.zone.management.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.area.info.bean.AreaInfoBean;
import com.chinatelecom.jx.zone.area.info.proxy.IAreaInfoBeanProxy;
import com.chinatelecom.jx.zone.attachment.client.bean.InvokeAttachmentRst;
import com.chinatelecom.jx.zone.attachment.client.helper.AttachmentClientHelper;
import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.government.info.bean.GovernmentInfoBean;
import com.chinatelecom.jx.zone.government.info.proxy.IGovernmentInfoBeanProxy;
import com.chinatelecom.jx.zone.management.bean.weixinConfig.WeixinConfigInfoBean;
import com.chinatelecom.jx.zone.management.common.CommonStaticParam;
import com.chinatelecom.jx.zone.management.service.showLogin.IShowLoginService;
import com.chinatelecom.jx.zone.management.service.weixinConfig.IWeixinConfigInfoService;
import com.chinatelecom.jx.zone.management.util.EncryptUtil;
import com.chinatelecom.jx.zone.management.util.ProjectProps;
import com.chinatelecom.jx.zone.management.util.QRCodeUtil;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoBean;
import com.chinatelecom.jx.zone.organization.info.proxy.IOrganizationInfoBeanProxy;
import com.chinatelecom.jx.zone.organization.util.OrganizationUtils;
import com.chinatelecom.jx.zone.session.helper.AccountIdSessionHelper;
import com.chinatelecom.jx.zone.session.helper.OrganizationIdSessionHelper;
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;
import com.github.pagehelper.Page;
import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;

public class BaseController {
	private boolean success = false;
	private int errorCode = -1;
	private String errorMsg = null;
	@Autowired(required = true)@Qualifier("primaryKeySeq")  
	protected SeqIdType seq;
	protected static final BigDecimal Yichun_ID = new BigDecimal(3609009); // 宜春工信委ID
	protected static final BigDecimal Jinxian_ID = new BigDecimal(1200);// 进贤园区ID
    protected static final BigDecimal FGW_ID = new BigDecimal("90020180129150931800055000000001"); // 江西发改委ID
    protected static final BigDecimal GXW_ID = new BigDecimal("3600009"); // 江西工信委ID
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private AccountIdSessionHelper accountIdSessionHelper;		
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;
	@Autowired
	private IWeixinConfigInfoService weixinConfigInfoService;	
	@Autowired
	private IOrganizationInfoBeanProxy organizationInfoBeanService;
	@Autowired
	private OrganizationIdSessionHelper organizationIdSessionHelper ;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
    protected IAreaInfoBeanProxy areaProxy;
	@Autowired
	private ISystemLogSync systemLogSync;
	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;
	@Autowired
	private IModuleInfoBeanLookup moduleInfoBeanProxy;
	@Autowired
    private IOrganizationInfoBeanProxy organizationInfoBeanProxy;
	@Autowired
	private AttachmentClientHelper attachmentClientHelper;
	@Autowired
	protected IShowLoginService showLoginService;
	@Autowired
    protected IGovernmentInfoBeanProxy governmentInfoBeanProxy;
	 
	
	protected boolean getSuccess() {
		return success;
	}

	protected void setSuccess(boolean success) {
		this.success = success;
	}

	protected int getErrorCode() {
		return errorCode;
	}

	protected void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	protected String getErrorMsg() {
		return errorMsg;
	}

	protected void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	protected void setSuccessMsg(String msg) {
		setSuccess(true);
		setErrorCode(0);
		setErrorMsg(msg);
	}

	protected void setFalseMsg(String msg) {
		setSuccess(false);
		setErrorCode(20);
		setErrorMsg(msg);
	}

	protected void setFalseMsg(int code, String msg) {
		setSuccess(false);
		setErrorCode(code);
		setErrorMsg(msg);
	}

	protected HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
	}
	/**
	 * 获取当前登录用户的所属园区列表 
	 * @return
	 */  
	protected List<OrganizationInfoBean>  getParkList() {
		//List<OrganizationInfoBean> list =organizationIdSessionHelper.selectSuperiorListByAccountIdAndOrganizationKindAndSystemIdArrayAndSearchKey(
		//		null, (short)2 ,null,null);
		return null ;
	}
	/**
	 * 获取当前登录用户的默认园区ＩＤ
	 * 
	 * @return
	 */  
	protected BigDecimal getCurrentParkId() {
		 BigDecimal id = null;
	        try {
	            id = getCurrentParkBean().getOrganizationId();
	        } catch (Exception ex) {
	            logger.error("获取所属园区ID失败，详细原因：" + ex.getMessage(), ex);
	        }
	        return id;
	}
	/**
	 * 获取当前登录用户的企业ID
	 * 
	 * @return
	 */  
	protected BigDecimal getCompanyId() {
		BigDecimal oid=null ;
		try{
			oid=organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
		}catch(Exception e ){
			oid=null ;
		}
		if(oid!=null){
			OrganizationInfoBean  organizationInfoBean = organizationInfoBeanService.selectSuperiorByOrganizationIdAndOrganizationKind(oid,(short)3);
			if(organizationInfoBean!=null)		
				return organizationInfoBean.getOrganizationId();
			else
				return null ;
		}else
			return null ;
	}
	 /**
     * 获取rootID
     * 
     * @return
     */
    protected BigDecimal getRootId() {
        BigDecimal rootId = null;
        try {
            rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
        } catch (Exception ex) {

            logger.error("获取rootID失败，详细原因：" + ex.getMessage(), ex);
        }
        return rootId;
    }
    /**
     * 获取当前登录用户的组织Id
     * 
     * @return
     */
    protected BigDecimal getOrganizationId() {
        BigDecimal orgId = null;
        try {
            orgId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
        } catch (Exception ex) {
            logger.error("获取组织Id失败，详细原因：" + ex.getMessage(), ex);
        }
        return orgId;
    }
    /**
     * 获取当前登录用户的默认园区名称
     * 
     * @return
     */
    protected String getCurrentParkName() {
        String name = null;
        try {
            name = getCurrentParkBean().getOrganizationName();
        } catch (Exception ex) {

            logger.error("获取园区名称失败，详细原因：" + ex.getMessage(), ex);
        }
        return name;
    }
    /**
     * 获取root名称
     * 
     * @return
     */
    protected String getRootName() {
        String rootName = "";
        try {
            OrganizationInfoBean bean = organizationInfoBeanProxy.selectByPrimaryKey(getRootId());
            rootName = bean.getOrganizationName();
        } catch (Exception ex) {

            logger.error("获取root名称失败，详细原因：" + ex.getMessage(), ex);
        }
        return rootName;
    }
    /**
     * 获取当前用户所属园区的parkBean实体信息 政府单位用户返回所属单位组织实体信息
     * 
     * @return
     */
    protected OrganizationInfoBean getCurrentParkBean() {
        OrganizationInfoBean record = null;
        try {
            BigDecimal rootId = this.getRootId();
            // 根据单位ID（rootId）获取第一级父id
            record = organizationInfoBeanProxy.selectSuperiorByOrganizationIdAndOrganizationKind(rootId,
                    OrganizationUtils.KIND_PARK);
            if (record == null) {// 由于政府单位只有单位rootId信息 因此政府单位获取的record实体为null
                record = organizationInfoBeanProxy.selectByPrimaryKey(rootId);
            }
        } catch (Exception ex) {

            logger.error("获取所属园区bean失败，详细原因：" + ex.getMessage(), ex);
        }
        return record;
    }
    
    
    /**
     * 获取当前登录用户的组织类型
     * 0：区域；1：政府；2：园区；3：企业；4：部门；园区列表节点类型为5，企业列表类型为6，企业片区为6，游客列表为7，通讯录分组为8。
     * @return
     */
    protected Short getOrganizationType() {
        Short type = null;
        try {
            BigDecimal orgId = organizationIdSessionHelper.getOrganizationIdBySessionAttribute();
            if (orgId != null) {
                OrganizationInfoBean bean = organizationInfoBeanProxy.selectByPrimaryKey(orgId);
                type = (bean == null) ? null : bean.getOrganizationKind();
            }
        } catch (Exception ex) {
            logger.error("获取组织类型失败，详细原因：" + ex.getMessage(), ex);
        }
        return type;
    }

	/**
	 * 根据园区ＩＤ获取名称
	 * 
	 * @return
	 */ 
	protected String getParkNameById(BigDecimal id) {
		OrganizationInfoBean o=organizationInfoBeanService.selectByPrimaryKey(id);
		if(o!=null)
			return o.getOrganizationName();
		else 
			return "";
	}
	 
	/**
	 * 得到IP
	 */
	protected String getIpAddr(HttpServletRequest request) {
		String ipAddress = null;
		try {
			ipAddress = request.getHeader("x-forwarded-for");
			if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
				ipAddress = request.getHeader("Proxy-Client-IP");
			}
			if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
				ipAddress = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
				ipAddress = request.getRemoteAddr();
				if (ipAddress.equals("127.0.0.1")) {
					// 根据网卡取本机配置的IP
					InetAddress inet = null;
					try {
						inet = InetAddress.getLocalHost();
					} catch (UnknownHostException e) {
						logger.error(e.getMessage(), e);
					}
					ipAddress = inet.getHostAddress();
				}

			}
			// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
			if (ipAddress != null && ipAddress.length() > 15) {
				if (ipAddress.indexOf(",") > 0) {
					ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return ipAddress;
	   
	  }
	 

	/**
	 * 发送短信
	 * 
	
	protected void  sendMsg(List<String> destTerminals,List<String> destNames,String content,HttpServletRequest request){
		try {
			//List<String> destTerminals =new ArrayList<String>();
			//destTerminals.add("18970055933");
			//List<String> destNames=new ArrayList<String>();
			//destNames.add("张力" );
			Timestamp t=new Timestamp(System.currentTimeMillis());
		 	submitQxtSmHelper.submitSimpleSmJob(this.getParkId(), "园区", this.getCurrentAccountId(), "登陆账号名字", new Integer(0).shortValue(), content, t, null, destTerminals, destNames,  new Integer(1).shortValue(), this.getIpAddr(request), new Integer(2).shortValue(),t);
		} catch (Exception ex) {
			  ex.printStackTrace();
		}
	}
	protected  	List<CompanyInfoBean> getCompanyListByParkId(BigDecimal  parkId){
		if(parkId==null)
			return null ;
		else
			return companyInfoBeanService.selectListByParkIdAndSearchKey(parkId,null);
	}
	
	protected  	List<AccountInfoBean> getAccountListByParkIdAndRoleId(BigDecimal  parkId,BigDecimal  roleId){
		if(parkId==null || roleId==null)
			return null ;
		else
			return  accountInfoBeanService.selectByParkIdAndRoleId(parkId, roleId);
	} */
	
	/**
	 * 分页
	 * @param page
	 * @param model
	 * @param url
	 */
	protected void setPageInfo(Page<?> page,Model model,String url ){
	    model.addAttribute("page", page);
		model.addAttribute("pageUrl", url);
		model.addAttribute("pageNum", page.getPageNum());
		model.addAttribute("pageSize", page.getPageSize());
		model.addAttribute("pageTotal", page.getTotal());
     	model.addAttribute("totalPages", page.getPages());
     // 	model.addAttribute("total", page.getTotal());
     //	model.addAttribute("rows", 11); 
   }
	
	protected String getUploadRootDir() throws Exception {
		String root = this.getClass().getResource("/").getPath();
		String path = new File(root).getParentFile().getParentFile()
				.getCanonicalPath();
			return path;
	}
	 /**
     * 获取systemId
     */
    protected BigDecimal getThisSystemId() {
        BigDecimal SystemId = null;
        try {
            SystemId = systemInfoBeanProxy.selectSystemIdByThisSystemCode();
        } catch (Exception ex) {
            logger.error("获取systemId失败，详细原因：" + ex.getMessage(), ex);
        }
        return SystemId;
    }
	/**
	 * 是否登录
	 */
	protected boolean isLogin() throws Exception {
		boolean b=false ;
		try{
			b= accountIdSessionHelper.isAccountAlreadyLogin() ;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
			return b;
	}
	/**
	 * 获取当前登录用户ＩＤ
	 * 
	 * @return
	 */ 
	protected BigDecimal getCurrentAccountId() {
		BigDecimal id=null ;
		try{ 
			id=accountIdSessionHelper.getAccountIdBySessionAttribute();
		}catch(Exception e){
			id=null;
		}
		return id;
	}
     /**
	 * 获取当前登录用户名字
	 * 
	 * @return
	 */ 
	protected String getCurrentAccountName() {
		AccountInfoBean b=accountInfoBeanProxy.selectByPrimaryKey(accountIdSessionHelper.getAccountIdBySessionAttribute()) ;
        if(b==null)
        	return  null;
        else
        	return b.getAccountName() ;
	} 
	/**
	 * 获取用户信息
	 * 
	 * @return
	 */
	protected AccountInfoBean getCurrentAccount() {
		AccountInfoBean b = null;
		try {
			if(accountIdSessionHelper.isAccountAlreadyLogin()){
				b = accountInfoBeanProxy.selectByPrimaryKey(accountIdSessionHelper.getAccountIdBySessionAttribute());
			}
		} catch (Exception ex) {
			logger.error("获取用户信息失败，详细原因：" + ex.getMessage(), ex);
		}
		return b;
	}
    /**
     * 获取当前用户登录账号
     * 
     * @return
     */
    protected String getCurrentAccountCode() {
        String name = null;
        try {
            AccountInfoBean b = getCurrentAccount();
            if (b != null)
                name = b.getAccountCode();
        } catch (Exception ex) {

            logger.error("获取用户code信息失败，详细原因：" + ex.getMessage(), ex);
        }
        return name;
    }
    
    /**
     * 企业服务平台md5加密
     * @return
     */
    protected String getMd5AccountCode(){
    	String name = getCurrentAccountCode();
    	if(StringUtil.checkNotNull(name)){
    		name = EncryptUtil.getInstance().Base64Encode(name);
    	}
    	return name;
    }
    
	protected void initWxConfig(){
    	ApiConfig ac = new ApiConfig();
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
    }
	
	/**
	 * 生成二维码
	 * @return
	 */
	protected String createQrcode(String text,BigDecimal moduleId )throws Exception{
	  // String text= "http://localhost:8080/projectDeclare/qrcode";
		 
		 String website = ProjectProps.getProp("website");
		 String url="";
		 File file=null ; //\src\main\webapp\WEB-INF\views\static\img
		 //本地
//		 String imagePath=  File.separator+"src"+ File.separator +"main"+ File.separator +"webapp"+ File.separator +"WEB-INF"+ File.separator +"views"+ File.separator +"static"+ File.separator +"img"+ File.separator  +"logo.jpg" ;
		 //服务器
		 String imagePath= File.separator +"WEB-INF"+ File.separator +"views"+ File.separator +"static"+ File.separator +"img"+ File.separator  +"logo.jpg" ;
		 String tmpDir = this.getUploadRootDir()   ;
		  try{  //无图
		        //QRCodeUtil.encode(text,"","E:/360Downloads",true);
		        //有图
		        String f=QRCodeUtil.encode(website+text,tmpDir+imagePath, tmpDir ,true);
		        file=new File(tmpDir+File.separator+f);
		     	InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) ,moduleId,"","","",(short)0, new Boolean(false), file) ;
				if(rst!=null){
					 url=rst.getAttachment().getAttachmentUrl();
				 } 
		    }catch (Exception e) {
		    	logger.error(e.getMessage(), e);
		    }finally{
		    	if(file!=null)
		    		file.delete();
		     }
		  return url;
		 }
	/**
	 * 判断是否是手机浏览器
     * android : 所有android设备
     * mac os : iphone ipad
     * windows phone:Nokia等windows系统的手机
     */
	protected boolean  isMobileDevice(HttpServletRequest request ){
		String requestHeader = request.getHeader("user-agent");
        String[] deviceArray = new String[]{"android","iphone os","windows phone","windowswechat"};
        if(requestHeader == null)
            return false;
        requestHeader = requestHeader.toLowerCase();
        for(int i=0;i<deviceArray.length;i++){
            if(requestHeader.indexOf(deviceArray[i])>0){
                return true;
            }
        }
        return false;
	}
	
	
	/**
	 * 读取测试账号
	 */
	public List<?> selectTestAccount(){
		List<?> list = new ArrayList<>();
		try{
			StringBuilder sql = new StringBuilder(128)
						.append("select account_name accountName, account_id accountId ")
						.append("from t_account_info  where length(account_id) = 11");
			list = jdbcTemplate.queryForList(sql.toString());
		}catch(Exception ex){
			logger.error("读取测试账号列表失败，详细原因："+ex.getMessage(),ex);
		}
		return list;
	}
	
	 /**
     * 记录操作日志(要登录)
     */
    protected void saveLog(String thisModuleName, HttpServletRequest request, String logDetail) throws Exception {
        try {
            if (!StringUtil.checkNotNull(thisModuleName)) {
                thisModuleName = "";
            }
            final BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName(thisModuleName);
            systemLogSync.insert(request,thisModuleId, (short) 0, 0, logDetail);
        } catch (Exception ex) {
            logger.error("记录操作日志失败，详细原因：" + ex.getMessage(), ex);
        }
    }
	
	
	/**
	 * 插入方法行为日志
	 * @param request
	 * @param thisModuleUnique 模块名称
	 * @param logDetail 日志详细信息， 例如“【模块名称】，id为xxxxxxxx，删除记录成功！”
	 * @param logGrade 日志级别 0通知 1告警 2错误 3高危
	 * @param logRst 日志状态0成功，其他失败
	 * @throws Exception
	 */
	protected void insertBehaviorLog(HttpServletRequest request, String thisModuleUnique, 
			String logDetail, Short logGrade, Integer logRst){
		try {
			final BigDecimal thisModuleId = moduleInfoBeanProxy
					.selectModuleIdByModuleUnique(thisModuleUnique);
			int rst = systemLogSync.insert(request, thisModuleId, logGrade, logRst, logDetail);
			
			if(rst <= 0){
				logger.error("行为日志插入失败！");
			}
			
		} catch (Exception e) {
			logger.error("行为日志插入异常，详细原因："+e.getMessage(), e);
		}
	}
	
	   /**
     * 获取当前用户的级别
     * @return
     */
    protected String getAccountType(BigDecimal rootId) {
    	if(rootId == null){
    		rootId = getRootId();
    	}
    	String accountType = CommonStaticParam.ACCOUNT_TYPE_NONE;//未知、数据异常
    	OrganizationInfoBean rootBean = organizationInfoBeanProxy.selectByPrimaryKey(rootId);//用户所属单位类型
    	if(rootBean != null && rootBean.getOrganizationKind() != null){
    		Short rootKind = rootBean.getOrganizationKind();
    		if(rootKind == 3){//企业
    			accountType = CommonStaticParam.ACCOUNT_TYPE_QIYE;
    		}else if(rootKind == 2){//园区
    			accountType = CommonStaticParam.ACCOUNT_TYPE_YUANQU;
    		}else if(rootKind == 1){//政府
    			//判断省级、市级、区县级
    			OrganizationInfoBean area = organizationInfoBeanProxy.selectSuperiorByOrganizationIdAndOrganizationKind(rootBean.getOrganizationId(),
                        (short) 0);
    			AreaInfoBean areaInfo = areaProxy.selectByPrimaryKey(area.getOrganizationId());
    			if(areaInfo != null){
    				if(areaInfo.getAreaKind() == 1){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_GUOJIA;
    				}else if(areaInfo.getAreaKind() == 2){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_SHENGFEN;//省份
    				}else if(areaInfo.getAreaKind() == 3){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_DISHI;
    				}else if(areaInfo.getAreaKind() == 4){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_QUXIAN;
    				}
    			}
    		}else if(rootKind == 0){/* 区域 add by szc 指定区域ID获取对应的用户类型 */ 
    			AreaInfoBean areaInfo = areaProxy.selectByPrimaryKey(rootId);
    			if(areaInfo != null){
    				if(areaInfo.getAreaKind() == 1){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_GUOJIA;
    				}else if(areaInfo.getAreaKind() == 2){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_SHENGFEN;//省份
    				}else if(areaInfo.getAreaKind() == 3){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_DISHI;
    				}else if(areaInfo.getAreaKind() == 4){
    					accountType = CommonStaticParam.ACCOUNT_TYPE_QUXIAN;
    				}
    			}
    		}
    	}
    	return accountType;
    }
    /**
     * 获取当前用户所属单位的类别
     * 
     * @return
     */
    protected Short getRootKind() {
        BigDecimal rootId = null;
        try {
            if (this.isLogin())
                rootId = organizationIdSessionHelper.getRootIdBySessionAttribute();
            if (rootId != null) {
                OrganizationInfoBean rootBean = organizationInfoBeanProxy.selectByPrimaryKey(rootId);
                if (rootBean != null)
                    return rootBean.getOrganizationKind();
                else
                    return null;
            } else
                return null;
        } catch (Exception ex) {
            logger.error("获取systemId失败，详细原因：" + ex.getMessage(), ex);
        }
        return null;
    }
    
    /**
     * 获取当前用户所属组织所属省市县id
     * 
     * @param 数组下标:0.省 1.市 2.县  (-1表示无)
     * @return
     */
    public BigDecimal[] getCurrentAreaIds(){
    	 BigDecimal[] ids=new  BigDecimal[3];
    	  try {
			BigDecimal Province=organizationIdSessionHelper.getProvinceIdBySessionAttribute();
			BigDecimal city=organizationIdSessionHelper.getAreaIdBySessionAttribute();
			BigDecimal county=organizationIdSessionHelper.getSpaceIdBySessionAttribute();
			ids[0]= Province ;
			ids[1]=city ;
			ids[2]= county ;
    	  } catch (Exception e) {
              logger.error(" 获取当前用户所属组织所属省市县id失败，" + e.getLocalizedMessage(), e);
          }
    	  return ids ;
    } 
    /**
     * 获取Area实体
     * 
     * @return
     */
    protected OrganizationInfoBean getAreaBean() {
        return getAreaBean(null);
    }
    
    protected OrganizationInfoBean getAreaBean(BigDecimal orgId) {
    	if(orgId == null){
    		orgId = getOrganizationId();
    	}
        OrganizationInfoBean areaBean = null;
        try {
            areaBean = organizationInfoBeanProxy.selectSuperiorByOrganizationIdAndOrganizationKind(orgId,
                    (short) 0);
        } catch (Exception ex) {

            logger.error("获取Area实体失败，详细原因：" + ex.getMessage(), ex);
        }
        return areaBean;
    }
    
    
    /**
     * 获取登录用户的政府级别，
     * 1国家，2省级，3市级，4县，-1测试
     */ 
    protected Short getGovernmentKind(){
    	Short governmentKind =null ;
    	Short organizationType = getOrganizationType();
		if(organizationType==1 || organizationType==4){ //政府机构或部门。
			GovernmentInfoBean governmentInfoBean = governmentInfoBeanProxy.selectByPrimaryKey(this.getRootId());
			if(governmentInfoBean!=null){
				governmentKind=  governmentInfoBean.getGovernmentKind() ;//政府级别：省级，市级
			}
		}
		return  governmentKind;
    }
    
    
//  跨域请求控制
    protected boolean  accessControlAllow(HttpServletResponse response){
    	 final String[]  ALLOW_DOMAIN =  showLoginService.getAccessAllowUrl().split(",")  ;
    	 String originHeader = response.getHeader("Origin");
    	   if (Arrays.asList( ALLOW_DOMAIN).contains(originHeader)) {
    		   response.addHeader("Access-Control-Allow-Origin", originHeader);
    		   response.addHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    		   return true;
    	   }else
    	  return false ;
    }
}
