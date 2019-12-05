<!-- ç±»å1 --><%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>园区招聘</title>
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
						<div class="artical-nav"><p class="artical_p"></p><a  onclick="getUrl()" href="javascript:;">返回列表 ></a></div>
						<div class="artical-content">
						  		<div class="tab" id="tab0">
								<div class="declareDataBar fz0">
									<div class="text-box_title">
										<div class="title-text">
										   <img src="${ctx}/static/image/homePage_yc/medal.png" style="width:15px;"> <span class="declareTitle">
											</span>
											<div class="declareData">
												<font id="font1"></font>
												<font id="font2"></font>
												<font id="font3"></font>
											</div>
										</div>
									</div>
								<div class="company_contens">
									<div class="company_texts"></div>
								</div>
								</div>
							</div>
							<div class="detail-title"><img  src="${ctx}/static/image/homePage_yc/gwjs.png" style="width:145px"></div>
								<div class="job-contents">
									<div class="publicities fz0" id="jobList">
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
<script src="${ctx}/static/js/url.min.js"></script>
<script type="text/javascript">
$(function(){
	if('${entranceId}'==3600009){
		$(".nav-content a:eq(3)").addClass("on");
		$("#thirdMenu p:eq(0) a:eq(1)").addClass("on");
	}else{
		$(".nav-content a:eq(2)").addClass("on");
		$(".second-menu p:eq(0) a:eq(1)").addClass("on");
	};
	$(".second-menu p:eq(0) a:eq(1)").addClass("on");
	$(".source-room a").removeClass("on");
	$(".source-room a:eq(11)").addClass("on");
	getDetail('${id}');
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
});
function getUrl(){
	var type = "${entranceId eq '3609009'?'3':'4'}";
	window.location.href= '${ctx}/yc/list?type='+type+'&entranceId=${entranceId}';
}
function getDetail(id){
	var time = dateToTimeStr(${time},'yyyy-MM-dd');
	console.log('${id}');
	console.log(time);
	 $.ajax({
/*  			url : "${urlPath}XOffice/interface/json/recruitInfo/recruitDetail",
 */			url : "${urlPath}XOffice/interface/json/recruitInfo/detail",
			type:'get',
			data:{'companyId':id,
				   'recruitTime': time
				},
			dataType:'json',
			success:function(data){
				console.log(data)
				var companyInfo = data.companyInfo;
				$('.declareTitle').html(companyInfo.companyName);
				$('.artical_p').html(companyInfo.companyName+'招聘');
				var detail = data.infoList[0]
				$('#font1').html('发布时间：'+dateToTimeStr(detail.createTime,'yyyy-MM-dd'));
				if(detail.companyAddress){
					$('#font2').html('公司地址：'+detail.companyAddress);
				}else{
					$('#font2').hide();
				}
				if(detail.companyPhone){
					$('#font3').html('联系方式：'+detail.companyPhone);
				}else{
					$('#font3').hide();
				}
				$('.company_texts').html(detail.companyDetail);
				var infoList = data.infoList;
				for (var i=0;i<infoList.length;i++){
				      var info = infoList[i];
				      var _div = "";
				      var number = "";
					_div += '<div class="job-item">'
					if(info.status==0){
						_div += '<img src="${ctx}/static/image/homePage_yc/stopTip.png" class="stopTip" style="width:50px">'
					}
					if(info.status==1){
						_div += '<img src="${ctx}/static/image/homePage_yc/position-1.png"  style="width:15px">'
					}else{
				        _div +=  '<img src="${ctx}/static/image/homePage_yc/position-0.png" style="width:15px">'
						
					}
				  if(info.recruitNumber&&info.recruitNumber!=0&&info.recruitNumber!=''){
						_div += '<span>'+info.recruitTitle+'['+info.recruitNumber+']</span>'

			      }else{
						_div += '<span>'+info.recruitTitle+'[若干人]</span>'

			      }
				  _div += '<div>'
				  if(info.salaryMin&&info.salaryMax){
						_div += '<span class="fz16 redT job_span" style="margin-left: 0px;">薪资：'+info.salaryMin+'-'+info.salaryMax+'</span>'
				  }
				  if(info.education){
					     var education = "不限";
					     if(info.education==0){
						     education = "不限";
					     }else if(info.education==1){
						     education = "初中及以下";
					     }else if(info.education==2){
						     education = "高中";
					     }else if(info.education==3){
						     education = "专科";
					     }else if(info.education==4){
						     education = "本科";
					     }else if(info.education==5){
						     education = "研究生及以上";
					     }
						_div += '<span class="fz16 redT job_span">学历：'+education+'</span>'
				  }
				  if(info.workExp){
						_div += '<span class="fz16 redT job_span">工作经验：'+info.workExp+'年</span>'
				  }
				  _div += '</div>'
					_div += '<p class="p1">职位描述</p>'
					_div += '<p class="p2">'+info.recruitDetail+'</p>'
				    _div += '</div>';
				    $('#jobList').append( _div);
					
				}
				

			},
			error:function(){
				alert("访问后台异常!");
			}
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
				if(value.length>0){
					var attachmentUrl = value[0].attachmentUrl;
					$('.detailImg_div').append('<img class="detailImg" src="'+attachmentUrl+'">');
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
			ss : paddNum(date.getSeconds()),
		// 秒
		}
		format || (format = "yyyy-MM-dd hh:mm:ss");
 		return format.replace(/([a-z])(\1)*/ig, function(m) {
			return cfg[m];
		});
	}
</script>
</html>
