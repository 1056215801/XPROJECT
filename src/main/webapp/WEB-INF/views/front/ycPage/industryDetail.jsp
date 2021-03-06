<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>产业动态</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet" />
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-nav"><p>产业动态</p><a href="${ctx}/industry/list?entranceId=${entranceId}">返回列表 ></a></div>
						<div class="artical-content">
							<div class="declareDataBar fz0">
							  <a href="javascript:;">
							    <div class="text-box">
							   		 <div class="text-box_title">
										<div class="title-text">
										   <div class="">
										   		<div class="declareTitle">
												</div>
												<div class="declareData declareData1">
													<font></font>
												</div>
												<div class="declareData declareData2">
													<font></font>
												</div>
										   </div>
										</div>
									</div>
							    </div>
							    <img id="img">
							  </a>
							</div>
							<div class="main-contents">
								<div class="texts"></div>
								<div class="files" id="attList">
									<p>附件：</p>
								</div>
							</div>
						</div>
					</div>
					
					<c:import url="/slideSelect" charEncoding="UTF-8">
					 	<c:param name="entranceId" value="${entranceId}" />
					</c:import>
				</div>
			</div>
		</div>

		<div id="authorityTips" style="display: none;">
			<div>
				<img src="${ctx}/static/image/projectDeclare/headPortrait.png"
					width="90px;" height="90px;"
					style="display: block; margin: 25px auto;">
				<div style="margin: 0 auto 30px; color: #aaa; text-align: center;">你当前账号未开通发布项目权限</div>
				<div style="width: 80%; margin: 0 auto;">
					<input type="button" class="button button-raised button_Contral"
						style="width: 37%;" value="暂不申请"> <input type="button"
						class="button button-raised button-caution button_Contral"
						style="width: 58%;" value="我要申请">
				</div>
			</div>
		</div>

	<c:import url="/footerSelect" charEncoding="UTF-8">
	 	<c:param name="entranceId" value="${entranceId}" />
	</c:import>
	</div>
</body>
<script src="${ctx}/static/js/ycsgxw/global.js"></script>
<script type="text/javascript">
var id;
$(function(){
	/* $(".nav-content a").removeClass("on");
	$(".nav-content a:eq(2)").addClass("on"); */
	$(".second-menu p:eq(2) a:eq(1)").addClass("on");
	$(".fr li").eq(1).addClass("on");
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	getDetail('${id}');
});
function getDetail(id){
	 $.ajax({
			url : "${urlPath}XOffice/interface/json/columnInfo/getColumnNewsDetail",
			type:'post',
			data:{'newsId':id},
			dataType:'json',
			success:function(data){
				var  detail = data.newsInfo;
				$('.declareTitle').html(detail.newsTitle);
				$('.declareData1 font').html('发布时间:'+ dateToTimeStr(detail.createTime,"yyyy-MM-dd hh:mm:ss"));
				$('.texts').html(detail.newsContent);
				if(detail.newsSummary&&detail.newsSummary!=''){
					$('.declareData2 font').html('摘要:'+ detail.newsSummary);
				} 
				if(detail.imageUrl&&detail.imageUrl){
					$('#img').attr('src',detail.imageUrl);
					$('#img').show();
				}else{
					$('#img').hide();
				}
			 	if(detail.atIdList&&detail.atIdList!=''){
					getAtts(detail.atIdList);
					$("#attList").show();
				}else{
				}
				
				
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
	
}

function dateToTimeStr(str,fmatter){
	  return formatDate(new Date(str), fmatter);
	}
	// 格式化日期,
	function formatDate(date, format) {
		var paddNum = function(num) {
			num += "";
			return num.replace(/^(\d)$/, "0$1");
		}
		// 指定格式字符
		var cfg = {
			yyyy : date.getFullYear(), // 年 : 4位
			yy : date.getFullYear().toString().substring(2),// 年 : 2位
			M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
			MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
			d : date.getDate(), // 日 : 如果1位的时候不补0
			dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
			hh : paddNum(date.getHours()), // 时
			mm : paddNum(date.getMinutes()), // 分
			ss : paddNum(date.getSeconds())
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
function getAtts(attIdList){
	 $.ajax({
			url:'${ctx}/login/json/attachment/selectListByAttachmentIdList',
			type:'get',
			data:{'attachmentIdList':attIdList},
			dataType:'json',
			success:function(data){
				var value = JSON.parse(data).attachments;
				if(value==null||value==""){
					$("#attr").hide();
				}
				
				for(var i = 0;i<value.length;i++){
					$('#attList').append(
							 "<p>附件"+(i+1)+"<a href='"+value[i].downloadUrl+"' target='_blank'>"+value[i].remoteName+"</a></p>"
							);
				}
			},
			error:function(){
				alert("访问后台异常!");
			}
		});
}
function authorityTips() { //权限提示弹框
	layer.open({
		type : 1,
		title : false,
		shadeClose : true,
		shade : [ 0 ],
		area : [ '500px', '280px' ],
		closeBtn : 0,
		content : $('#authorityTips')
	});
};
 function add(){
	 $.ajax({
			url:"${ctx}/projectDeclare/isUpgrade",
			type:"get",
			success:function(result){
				 if(result==0){
					confirm('您尚未升级成政府用户，是否去升级？', function(index) {
						 window.location.href="${ctx}/projectDeclare/upgradeCreate";
					},function(){});  
				}else if(result==2){
					tips('您已提交升级申请，请耐心等待审核结果！');
				}else if(result==1){
					 window.location.href="${ctx}/projectDeclare/create";
				}else if(result==3){
					tips('请先登录！');
				} 
            },
			error:function(){
				layer.alert("创建异常！");
				},
			});
 }
</script>
</html>
