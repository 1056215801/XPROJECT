<%@page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%@include file="/platform/common/commoninput.jsp"%>
<%@include file="/WEB-INF/common/meta-print.jsp"%>
<% 
	Map<String,List<String[]>> logMap = (Map<String,List<String[]>>)request.getAttribute("logMap");
	if(logMap == null ){
		logMap = new HashMap<String,List<String[]>>();
	}
	//党政办公室主任阅批	
	List<String[]> logList = (List<String[]>)logMap.get("拟办意见");
	String[] contents = new String[]{"","","",""};	
	if(logList != null && logList.size() > 0){
		//for(int i =0;i<logList.size();i++){
			contents = logList.get(0);
		//}
	}
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>收文</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<OBJECT  ID="jatoolsPrinter" CLASSID="CLSID:B43D3361-D075-4BE2-87FE-057188254255"  codebase="/OfficeAutomationPlatform/js/printCab/jatoolsPrinter.cab#version=8,6,0,0"></OBJECT> 
		<style type="text/css">
			.doctext{color:black;font-family:"宋体";}
			body table td{font-family:'宋体';}
		</style>		
		<script type="text/javascript">

$(function() {
	printafter();
		$("#changeModel").click(function(){
			var content = '<iframe id="cframe" name="cframe" src="<%=basePath%>Spring/page/printModel/modelContentCreate" width="500px" height="350px" frameborder="0" allowTransparency="false" scrolling="yes"/>';
			window.top.mydailog = art.dialog({
				lock : true,
				padding : 0,
				title : "更换模板内容",
				background : '#43484d',
				opacity : 0.6,
				content : content,
				button: [	{name:"确定", callback:function(){
								window.frames["cframe"].setVal();
								var docId = $("#id").val();
								var workProcessId = $("#workProcessId").val();
								var tt = $("#tt").val();
								var zh = $("#zh").val();
								var wh = $("#wh").val();
								/* if(wh == ""){
									return false;
								} */
								var param = "docId="+docId+"&workProcessId="+workProcessId+"&tt="+tt+"&zh="+zh+"&wh="+wh;
								window.location.href = "<%=basePath%>Spring/page/printModel/changeModel?"+param;
							}},
							{name:"关闭", callback:function(){}}
					],
				init: function(){
		        	var list = art.dialog.list;
		        	for (var i in list) {
		        	   list[i].close();
		        	}
		        }
			});
			
		});
});
function printafter(){
	$("#titletable").attr("width","90%");
	$("#procetable").attr("width","90%");
	$("#dispatchtable").attr("width","90%");
}

function doprint(){
	myDoc = {
	     	documents: document,
	     	copyrights: '杰创软件拥有版权  www.jatools.com' // 版权声明,必须   
	    };
	   //jatoolsPrinter.print(myDoc, true); // 直接打印，不弹出打印机设置对话框 
	jatoolsPrinter.printPreview(myDoc); 
}

</script>
	</head>
	<body  >
					<input type="hidden" id="pageid" value="OfficeDoc_DocDispatchdocManage" />
			<form  method="post" action="" name="form1">
				<input type="hidden" name="ismange" value="1" />
				<input type="hidden" name="id" id="id" />
				<input type="hidden" id="workProcessId" value="${workProcessId }"/>
				<input type="hidden" name="tt" id="tt" value=""/>
				<input type="hidden" name="zh" id="zh" value=""/>
				<input type="hidden" name="wh" id="wh" value=""/>
				<div class="wrap" id="page1">
					<table width="100%" border="0">
						<tr>
							<td valign="top">
								<div id="framediv" class="frame" style="text-align:center;">
									<br/>
									<table id="titletable" width="80%" cellpadding="0" cellspacing="0" class="editTable1" >
										<tr>
											<th colspan=2 height=60></th>
										</tr>
										<tr>
											<th colspan="2" style="text-align:center;font-family:'宋体';font-size:30px;font-weight:bold;color:red;">
												南昌临空经济区纪工委监察组<br/>收　文　专　用　纸  
											</th>
										</tr>
										<tr>
											<td width=60%  height=60>
												收文　　
												<span class="notxt doctext">
													${content.zh }
												</span>
												　　第　
												<span class="notxt doctext">
												( ${docInComingDoc.swnx } )　${content.wh } 
												</span>
												号
											</td>
											<td  align="right">
											<span class="notxt doctext">
											<fmt:formatDate value="${docInComingDoc.djsj}" pattern="yyyy"/>	
											</span> 年 
											<span class="notxt doctext">
												<fmt:formatDate value="${docInComingDoc.djsj}" pattern="MM"/>	
											</span>月 	
											<span class="notxt doctext">
												 <fmt:formatDate value="${docInComingDoc.djsj}" pattern="dd"/>	
											</span>日
											</td>
										</tr>
									</table>
									<table id="procetable" width="80%" cellpadding="0" cellspacing="0" class="editTable1"  >
									<tr>
										<td colspan=2 valign=top rowspan=2 width="50%" height=140 >
											来文：<span class="notxt doctext">${docInComingDoc.lwdw }</span>
										</td>
										<td colspan=2 valign=top height=120 style="border-bottom:0px;">
										</td>
									</tr>
									<tr>
										<td height=20 align=right>
											<span class="notxt doctext">
											<fmt:formatDate value="${docInComingDoc.lwsj}" pattern="yyyy"/>	
											</span> 年 
											<span class="notxt doctext">
												<fmt:formatDate value="${docInComingDoc.lwsj}" pattern="MM"/>	
											</span>月 	
											<span class="notxt doctext">
												 <fmt:formatDate value="${docInComingDoc.lwsj}" pattern="dd"/>	
											</span>日
										</td>
									</tr>
										<tr>
										<td colspan=4 valign=top  height=200 style="border-bottom:0px;border-top:1px solid red;">标题：
											<span class="notxt doctext">
												${docInComingDoc.bt }
											 </span>
										</td>
										</tr>
										<tr>
										<td colspan=4  height=20 style="border-bottom:0px;border-top:1px solid red;">拟办和批示：</td>
										</tr>
										<tr>
										<td width=25% style="border-bottom:0px;"></td>
										<td colspan=3 height=340 style="border-bottom:0px;">
											<span class="notxt doctext">
											<%
											//签发
											logList = (List<String[]>)logMap.get("拟办");
											//String pishi = "";
											if(logList != null && logList.size() > 0){
												for(int i =0;i<logList.size();i++){
													String[] pishi = new String[]{"","","","",""};
													pishi = logList.get(i);
													//qianfaPerson += "," + qianfa[3];
													 
											%>
											<br/>
											<%=pishi[2]%>　<%=pishi[3]%>　<%=pishi[4]%>
											<br/>
											
											<%
												}
											}
											%>
											<br/>
											<br/>
											<%
											//签发
											logList = (List<String[]>)logMap.get("部门领导处理");
											//String pishi = "";
											if(logList != null && logList.size() > 0){
												for(int i =0;i<logList.size();i++){
													String[] pishi = new String[]{"","","","",""};
													pishi = logList.get(i);
													//qianfaPerson += "," + qianfa[3];
													 
											%>
											<br/>
											<%=pishi[2]%>　<%=pishi[3]%>　<%=pishi[4]%>
											<br/>
											<%
												}
											}
											%>
											<%
											//签发
											logList = (List<String[]>)logMap.get("分管领导处理");
											//String pishi = "";
											if(logList != null && logList.size() > 0){
												for(int i =0;i<logList.size();i++){
													String[] pishi = new String[]{"","","","",""};
													pishi = logList.get(i);
													//qianfaPerson += "," + qianfa[3];
													 
											%>
											<br/>
											<%=pishi[2]%>　<%=pishi[3]%>　<%=pishi[4]%>
											<br/>
											<%
												}
											}
											%>
											
											<%
											//签发
											logList = (List<String[]>)logMap.get("吴主任批示");
											//String pishi = "";
											if(logList != null && logList.size() > 0){
												for(int i =0;i<logList.size();i++){
													String[] pishi = new String[]{"","","","",""};
													pishi = logList.get(i);
													//qianfaPerson += "," + qianfa[3];
													 
											%>
											<br/>
											<%=pishi[2]%>　<%=pishi[3]%>　<%=pishi[4]%>
											<br/>
											<%
												}
											}
											%>
											
											<%
											//签发
											logList = (List<String[]>)logMap.get("肖书记批示");
											//String pishi = "";
											if(logList != null && logList.size() > 0){
												for(int i =0;i<logList.size();i++){
													String[] pishi = new String[]{"","","","",""};
													pishi = logList.get(i);
													//qianfaPerson += "," + qianfa[3];
													 
											%>
											<br/>
											<%=pishi[2]%>　<%=pishi[3]%>　<%=pishi[4]%>
											<br/>
											<%
												}
											}
											%>
											 </span>
										</td>
									</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
					</div>
					<table id="dispatchtable" width="80%" cellpadding="0" cellspacing="0" class="editTable1">
							<tr>
								<td height="50" colspan="6" align="center" style="border:0px;">
									<button id="print" onclick="doprint()" >打印预览 </button>
									<input type="button" id="changeModel" value="更改模板内容"/>
								</td>
							</tr>
						</table>
			</form>
	</body>
</html>
