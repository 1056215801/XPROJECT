package com.chinatelecom.jx.zone.management.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.attachment.client.bean.AttachmentClientBean;
import com.chinatelecom.jx.zone.attachment.client.bean.InvokeAttachmentRst;
import com.chinatelecom.jx.zone.attachment.client.bean.InvokeRst;
import com.chinatelecom.jx.zone.attachment.client.helper.AttachmentClientHelper;
import com.chinatelecom.jx.zone.captcha.helper.SignatureImageCaptchaSessionHelper;
import com.chinatelecom.jx.zone.management.util.QRCodeUtil;
import com.chinatelecom.jx.zone.management.util.StringUtil;
/**
 * 通用页面
 * @author Administrator
 *
 */
@Controller
public class CommonController extends BaseController {
	
	@Autowired
	SignatureImageCaptchaSessionHelper  imageCaptchaSessionHelper ;
	@Autowired
	private AttachmentClientHelper attachmentClientHelper;
	
	private static final Logger logger = LoggerFactory
			.getLogger(CommonController.class);
	/**
	 * 无权限页
	 * @return
	 */
	@RequestMapping(value = "/error/401")
	public String error401(Model model, ServletRequest request) {
		return "common/401";
	}
	@RequestMapping(value = "/error/404")
	public String error404(Model model, ServletRequest request) {
		return "common/404";
	}
	@RequestMapping(value = "/weixin/error/404")
	public String weixinerror404(Model model, ServletRequest request) {
		return "common/weixin/404";
	}
	// uploadify 控件上传
	@RequestMapping(value = "/saveUploadifyAtt"  ) 
	@ResponseBody
	public String saveUploadifyAtt( MultipartFile[] attFile,
			@RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId,
			HttpServletRequest request) throws Exception {
		String para=request.getParameter("para");
		AttachmentClientBean attachment = new AttachmentClientBean ();
		File tempUploadFile =null ;
		MultipartFile file=attFile[0] ;
		String tmpDir = this.getUploadRootDir() + File.separator + "ueditorUpload" + File.separator + "TempFiles";
		File uploadDir = new File(tmpDir);
		if (!uploadDir.isDirectory()) {
			uploadDir.mkdirs();
		}
		try{
			String newTmpFilePath = tmpDir + File.separator + file.getOriginalFilename();
			tempUploadFile = new File(newTmpFilePath);
			FileCopyUtils.copy(file.getBytes(), tempUploadFile);
			//AttachSynImp uploadClient = new AttachSynImp();
			//attachment = uploadClient.uploadFile(tempUploadFile,"xProject");
			 InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) ,moduleId,request.getSession().getId(),getIpAddr(request),"",(short)0, new Boolean(true), tempUploadFile) ;
			 if(rst!=null){
				 attachment=rst.getAttachment();
			 }else
				 attachment=null ;
		} catch (Exception e) {
			logger.error("uploadify上传附件到服务端失败2。");
		}finally{
			tempUploadFile.delete();
		}
		 return  JSON.toJSONString(attachment);
	}

	//移动端上传附件
	@RequestMapping(value = "/saveAtt" , produces = MediaType.APPLICATION_JSON_VALUE) 
	@ResponseBody
	public  AttachmentClientBean  saveAtt(@RequestParam("file") MultipartFile  attFile,
			@RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId,
			HttpServletRequest request)throws Exception{
	//	List<UploadFile> attFile = getFiles();
		AttachmentClientBean  ae = new AttachmentClientBean ();
		  File tempUploadFile =null ;
		  MultipartFile file = attFile ;
			if (file == null ) {
				 CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext()); 
				 MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
		            //取得request中的所有文件名  
		            Iterator<String> iter = multiRequest.getFileNames();  
		            while(iter.hasNext()){  
		                //记录上传过程起始时的时间，用来计算上传时间  
		                int pre = (int) System.currentTimeMillis();  
		                //取得上传文件  
		                MultipartFile f  = multiRequest.getFile(iter.next());  
		                if(file != null){  
		                    //取得当前上传文件的文件名称  
		                    String myFileName = file.getOriginalFilename();  
		                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在
		                    if(myFileName.trim() !=""){  
//		                        System.out.println(myFileName);  
		                        //重命名上传后的文件名  
		                        String fileName = "demoUpload" + file.getOriginalFilename();  
		                        //定义上传路径  
		                        String path = "H:/" + fileName;  
		                        File localFile = new File(path);  
		                        f.transferTo(localFile);  
		                    }  
		                }else{
		                	// System.out.println("=========null======" );
		                } 
		                //记录上传该文件后的时间  
		                int finaltime = (int) System.currentTimeMillis();  
//		                System.out.println(finaltime - pre);  
		            }  	
			}else{
				if (file.getSize() > 100 * 1024 * 1024) {
					 logger.error("=========文件超过100M，上传失败===========");
				}else{
					try{
						String tmpDir = this.getUploadRootDir() + File.separator + "ueditorUpload" + File.separator + "TempFiles";
						File uploadDir = new File(tmpDir);
						if (!uploadDir.isDirectory()) {
							uploadDir.mkdirs();
						}
						String newTmpFilePath = tmpDir + File.separator + file.getOriginalFilename();
						tempUploadFile = new File(newTmpFilePath);
						FileCopyUtils.copy(file.getBytes(), tempUploadFile);
						//AttachSynImp client = new AttachSynImp();
						//AttachmentEntity attachObj = client.uploadFile(tempUploadFile,"XProject");
						InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) , moduleId,request.getSession().getId(),getIpAddr(request),"",(short)0, new Boolean(true), tempUploadFile) ;
						 if(rst!=null){
						//if (attachObj != null){
							ae=rst.getAttachment();
						}
					} catch (Exception e) {
						logger.error("webUploadify上传附件到服务端失败2。");
					}finally{
						tempUploadFile.delete();
					}
				}
		 }
		return ae;
	}
	// 上传附件
	@RequestMapping(value = "/saveAtts" , produces = MediaType.APPLICATION_JSON_VALUE) 
	@ResponseBody
	public List<AttachmentClientBean> saveAtts(MultipartFile[] attFile,
			@RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId,
			HttpServletRequest request)throws Exception {
	//	List<UploadFile> attFile = getFiles();
		List<AttachmentClientBean> ae = new ArrayList<AttachmentClientBean>();
		for (int i = 0; i < attFile.length; i++) {
			MultipartFile file = attFile[i];
			if (file != null && !"".equals(file.getOriginalFilename())) {
				// File f = file.getFile();
				// uploads(file, f);
				if (file.getSize() > 100 * 1024 * 1024) {
					// rtn= URLEncoder.encode("failure:附件大小不能超过100M", "UTF-8");
					try {
						 
					} catch (Exception e) {
						logger.error("=========文件超过100M，上传失败===========");
						// System.out.println("=========文件超过100M，上传失败===========");
						continue;
					}
				}
				//AttachSynImp client = new AttachSynImp();
				File f=new File(file.getOriginalFilename());
				//AttachmentEntity attachObj = client.uploadFile(f,"xProject");
				InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) ,moduleId,request.getSession().getId(),getIpAddr(request),"",(short)0, new Boolean(true), f) ;
				 if(rst!=null){
				//if (attachObj != null)
					ae.add(rst.getAttachment());
				 }
			}
		}
		return ae;
	}

	// 获取附件
	@RequestMapping(value = "/ajaxGetAtts" , produces = MediaType.APPLICATION_JSON_VALUE) 
	@ResponseBody 
	public List<AttachmentClientBean>  ajaxGetAtts(HttpServletRequest request)throws Exception {
		List<AttachmentClientBean> attList = new ArrayList<AttachmentClientBean>();
		String attIds = request.getParameter("attIds");
		if (StringUtil.checkNotNull(attIds)) {
			String[] id = attIds.split(",");
			for (int i = 0; i < id.length; i++) {
				if (StringUtil.checkNotNull(id[i])) {
					try {
						//AttachmentEntity a = AttachSynImp
						//		.queryByAttachmentId(id[i]);
						InvokeAttachmentRst a=attachmentClientHelper.selectByAttachmentId(new BigDecimal(id[i]));
						if (a != null && a.getAttachment()!= null) {
							attList.add(a.getAttachment());
						}
					} catch (Exception e) {
						logger.error(i + "=======获取附件失败=====附件ID：" + id[i]);
					}
				}
			}
		}
		return attList;
	}

	// ueditor 上传图片
	@RequestMapping(value = "/uploadimage") 
	@ResponseBody
	public String uploadimage(@RequestParam("upfile") MultipartFile  attFile,
			@RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId,
			HttpServletRequest request)throws Exception {
		MultipartFile file=attFile  ;
		String tmpDir = this.getUploadRootDir() + File.separator + "ueditorUpload" + File.separator + "TempFiles";
		File uploadDir = new File(tmpDir);
		if (!uploadDir.isDirectory()) {
			uploadDir.mkdirs();
		}
		String newTmpFilePath = tmpDir + File.separator + attFile.getOriginalFilename();
		File tempUploadFile = new File(newTmpFilePath);
		FileCopyUtils.copy(file.getBytes(), tempUploadFile);
		Map<String, String> map = new HashMap<String, String>();
		map.put("state", "FALSE");
		// 定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		// PrintWriter out = response.getWriter();
		// getResponse().setContentType("application/json; charset=UTF-8");
		try {
			//AttachSynImp uploadClient = new AttachSynImp();
			//AttachmentEntity attachment = uploadClient.uploadFile(tempUploadFile,"xProject/ueditor");
			
			 InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) , moduleId,request.getSession().getId(),getIpAddr(request),"",(short)0, new Boolean(true), tempUploadFile) ;
			//String s=rst.getAttachment().getAttachmentUrl() ;
			//System.out.println("=====new=====url==========="+s);
			if (rst != null) {
//				System.out.println("image url：" + rst.getAttachment().getAttachmentUrl());
				map.put("url",  rst.getAttachment().getAttachmentUrl());
				map.put("title",  rst.getAttachment().getRemoteName());
				map.put("original",  rst.getAttachment().getRemoteName());
				map.put("state", "SUCCESS");
			} else {
				logger.error("ueditor上传附件到服务端失败1。");
			}
			//uploadedFile.delete();
		} catch (Exception e) {
			logger.error("ueditor上传附件到服务端失败2。");
		}finally{
			tempUploadFile.delete();
		}
		//attachmentClientHelper.requestPostAttachmentAndResponseObject(thirdSeq, accountId, organizationId, rootId, moduleId, generateSnapshot, attachment)
		
		// renderJson(map); 兼容IE10以下
		 return  JSON.toJSONString(map);
		//return map;
	}
	/**
	 * 删除附件
	 * @param attachmentId 附件ID
	 * @return true:删除成功 false:删除失败
	 */
	//删除附件
	@RequestMapping(value = "/delAtt") 
	@ResponseBody
	public String delAtt(Model model, ServletRequest request) throws Exception {
		 String attachmentId=request.getParameter("attachmentId");
		 InvokeRst obj= null ; 
		 try {
		// AttachSynImp uploadClient = new AttachSynImp();
		 obj= attachmentClientHelper.deleteByAttachmentId(new BigDecimal(attachmentId));
		 //obj= uploadClient.deleteSingleFile(attachmentId);
		 }catch (Exception e) {
				logger.error("删除附件失败。");
		 }finally{
		 }
		return JSON.toJSONString(obj);
	}
	
	
	/**
	 * 生成二维码
	 */
	@RequestMapping(value = "/qrcode") 
	@ResponseBody
	public String qrcode( @RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId, HttpServletRequest request)throws Exception{
		 String text= "http://localhost:8080/projectDeclare/qrcode";
		 String url="";
		 File file=null ;
		 String tmpDir = this.getUploadRootDir() + File.separator + "ueditorUpload" + File.separator + "TempFiles";
		  try{  //无图
		        //QRCodeUtil.encode(text,"","E:/360Downloads",true);
		        //有图
		        String f=QRCodeUtil.encode(text,tmpDir+File.separator+"8.png", tmpDir ,true);
		        file=new File(tmpDir+File.separator+f);
		       // AttachSynImp uploadClient = new AttachSynImp();
				//AttachmentEntity attachment = uploadClient.uploadFile(file,"xProject");
		        InvokeAttachmentRst rst=attachmentClientHelper.requestPostAttachmentAndResponseObject(new BigDecimal(-1) ,moduleId,request.getSession().getId(),getIpAddr(request),"",(short)0, new Boolean(true), file) ;
				if (rst != null){
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
	 * 附件上传新
	 * 
	 * @param thirdSeq  第三方ID （关联）
	 * @param moduleId  模块ID （系统内模块ID）
	 * @param generateSnapshot 是否生成预览图
	 * @param remark  备注 
	 * @param downloadKind  下载类型 null或0=无限制
	 * @param attachment 附件
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/session/attachment/publish", method = RequestMethod.POST)
	@ResponseBody
	public String publish(@RequestParam(value = "thirdSeq", required = false) BigDecimal thirdSeq,
			@RequestParam(value = "moduleId", defaultValue = "-1") BigDecimal moduleId,
			@RequestParam(value = "generateSnapshot", defaultValue = "0") Boolean generateSnapshot,
			@RequestParam(value = "remark", defaultValue = "") String remark,
			@RequestParam(value = "downloadKind", defaultValue = "0") Short downloadKind,
			@RequestParam("attachment") MultipartFile attachment, HttpServletRequest request) {
		boolean success = false;
		int errorCode = -1;
		String errorMsg = null;
		JSONObject jo = new JSONObject(true);
		String sessionId = request.getSession().getId();
		String ipAddress = getIpAddr(request);
		BigDecimal systemId = new BigDecimal(-1) ;//备用
		BigDecimal accountId = new BigDecimal(-1) ;
		BigDecimal rootId = new BigDecimal(-1) ;
		BigDecimal organizationId = new BigDecimal(-1) ;
		try {
			if (this.isLogin()) {
				systemId = this.getThisSystemId();
				accountId = this.getCurrentAccountId();
				organizationId = this.getOrganizationId();
				rootId = this.getRootId();
			}
			InvokeAttachmentRst rst = attachmentClientHelper.requestPostAttachmentAndResponseObject(thirdSeq, accountId,
					organizationId, rootId, moduleId, sessionId, ipAddress, remark, downloadKind, generateSnapshot,
					attachment);

			success = rst.isSuccess();
			errorCode = rst.getErrorCode();
			errorMsg = rst.getErrorMsg();
			jo.put("attachment", rst.getAttachment());
			success = true;
			errorCode = 0;
			errorMsg = "发布资源成功！";
		} catch (Exception ex) {
			errorMsg = "发布资源失败，" + ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
		}

		jo.put("success", success);
		jo.put("errorCode", errorCode);
		jo.put("errorMsg", errorMsg);

		return jo.toJSONString();
	}
	
}