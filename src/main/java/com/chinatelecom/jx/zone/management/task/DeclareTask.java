package com.chinatelecom.jx.zone.management.task;

import org.springframework.beans.factory.annotation.Autowired;

import com.chinatelecom.jx.zone.management.common.Scheduled;
import com.chinatelecom.jx.zone.management.service.projectDeclare.IProjectDeclareNodeService;

//fixedDelay=0, 固定间隔
//cron 表达式  
//		  每隔5秒执行一次：*/5 * * * * ?
//     每隔1分钟执行一次：0 */1 * * * ?
//     每天23点执行一次：0 0 23 * * ?
//     每天凌晨1点执行一次：0 0 1 * * ?
//     每月1号凌晨1点执行一次：0 0 1 1 * ?
//     每月最后一天23点执行一次：0 0 23 L * ?
//     每周星期天凌晨1点实行一次：0 0 1 ? * L
//     在26分、29分、33分执行一次：0 26,29,33 * * * ?
//     每天的0点、13点、18点、21点都执行一次：0 0 0,13,18,21 * * ?

//@Scheduled(enable = true, cron = "0 0 0 * * ?")
public class DeclareTask {
	
	@Autowired
	private IProjectDeclareNodeService projectDeclareNodeService;
	
     public void betWeen(){
    	 /*ProjectDeclareNodeBean projectDeclareNodeBean = new ProjectDeclareNodeBean();
    	 List<ProjectDeclareNodeBean> list =  projectDeclareNodeService.queryByCond(projectDeclareNodeBean);
    	 for(int i = 0;i<list.size();i++){
    		 ProjectDeclareNodeBean projectDeclareNode = list.get(i);
    		 long diff = 0;
    		 if(projectDeclareNode.getEndTime()!=null){
    		 if(new Date().getTime()>projectDeclareNode.getEndTime().getTime()){
				 diff = new Date().getTime() - projectDeclareNode.getEndTime().getTime();
				 long between = diff / (24 * 60 * 60 * 1000);
				 projectDeclareNode.setRemainDay((int) between);
    		 }else{
    			 projectDeclareNode.setRemainDay(-1);
    		 }
			projectDeclareNodeService.updateById(projectDeclareNode);
    		 }
    	 }*/
     }
}
