package com.chinatelecom.jx.zone.management.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chinatelecom.jx.io.CloseBean;

/*****打包下载*****/

public class ZipDownloadUtil {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	//zip压缩包打包上传
	public  void zipUpload(File[] file,File strZipPath,Map<String,String> fileNameMap){
			ZipOutputStream out = null;
			FileInputStream fis = null;
			try {
				byte[] buffer = new byte[1024];
				//生成zip文件
				out = new ZipOutputStream(new FileOutputStream(strZipPath));
				//传入需要同时下载的多个文件，此处采用入参的File数组
				//File[] file1 = {new File("result.txt"),new File("source.txt")};
				for(int i=0;i<file.length;i++) {
					if(file[i] != null){
						fis = new FileInputStream(file[i]);
						out.putNextEntry(new ZipEntry(fileNameMap.get(file[i].getName())));
						int len;
						//读入需要下载的文件的内容，打包到zip文件
						while((len = fis.read(buffer))>0) {
							out.write(buffer,0,len);
						}
						out.closeEntry();//关闭当前的压缩条目并将流写入下一个条目
					}
				}
			} catch (Exception e) {
				 logger.error("打包ZIP文件失败，" + e.getLocalizedMessage(),e);
			} finally {
				CloseBean.closeIs(fis);
				CloseBean.closeOs(out);
			}
		}
		
		//zip压缩包下载
		public   void  zipDownload(String strZipName,File strZipPath, 
				HttpServletResponse response){
			try {
				//创建内容类型，此处默认字节流
				String contentType = "application/octet-stream";
				if (logger.isDebugEnabled()) {
					StringBuilder builder = new StringBuilder(1024);
					builder.append("本地文件位置FilePath: ").append(strZipPath).append("下载文件名称FileName: ").append(strZipName);
					logger.debug(builder.toString());
				}
				response.setContentType(contentType);
				response.setHeader("Content-Disposition", "attachment;filename="
						+ new String(strZipName.getBytes("gb2312"), "ISO8859-1"));
				
				FileInputStream is = null;
				ServletOutputStream os = null;
				byte[] buffer = new byte[1024];
				try {
					is = new FileInputStream(strZipPath);
					os = response.getOutputStream();
					//读出需要下载的文件的内容，下载为zip文件
					for (int length = is.read(buffer); length != -1; length = is.read(buffer)) {
						os.write(buffer, 0, length);
					}
					os.flush();// 这里一定要调用flush()方法 
				} catch (Exception er) {
				//	logger.error("下载Zip文件失败，" + er.getLocalizedMessage(),er);
				} finally {
					CloseBean.closeOs(os);
					CloseBean.closeIs(is);
				}
				if (logger.isDebugEnabled()) {
					StringBuilder builder = new StringBuilder(128);
					builder.append("本地文件视图数据下载输出成功，文件位置FilePath：").append(strZipPath).append("。");
					logger.debug(builder.toString());
				}
				try {//需要删除该临时文件
					boolean deleted = strZipPath.delete();
					if (deleted) {
						StringBuilder builder = new StringBuilder(128);
						builder.append("删除本地文件成功，文件位置FilePath：").append(strZipPath).append("。");
						logger.debug(builder.toString());
					} else {
						StringBuilder builder = new StringBuilder(128);
						builder.append("删除本地文件失败，文件位置FilePath：").append(strZipPath).append("。");
						logger.warn(builder.toString());
					}
				} catch (Exception ex) {
					StringBuilder builder = new StringBuilder(128);
					builder.append("删除本地文件失败，文件位置FilePath：").append(strZipPath).append("，").append(ex.getLocalizedMessage());
					logger.error(builder.toString());
				}
			} catch (Exception e) {
				//logger.error("下载Zip文件并删除临时文件失败，" + e.getLocalizedMessage(),e);
			} 
		}
}
