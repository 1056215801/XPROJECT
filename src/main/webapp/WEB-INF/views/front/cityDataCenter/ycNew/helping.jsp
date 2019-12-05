<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${ctx}/static/plugins/swiper/swiper.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<title>宜春工业大数据精准帮扶</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
    <div class="nav-title">
    	<form action="" method="post" id="form">
			<input type="hidden" id="year" name="year" value="">
			<input type="hidden" id="month" name="month" value="">
		</form>
    	<div class="nav">	
			<div class="nav-text">
				<div class="eightIndustry" style="padding-right: 30px;" onclick="changeDiv()">
					<img src="${ctx}/static/image/cityDataCenter/ycNew/barIcon.png">
					<font>精准帮扶</font>
				</div>
			   <div class="selects" id="forthTab00" style="display: inline-block;">
					<div class="select select1">
						<p><font id="font1">2018</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="ul1"></ul>
						</div>
					</div>
					<div class="select select2">
						<p><font id="font2">10月</font><i class="fa fa-caret-down"></i></p>
						<div class="select-items">
							<ul id="ul2">
								<li>1月</li>
								<li>2月</li>
								<li>3月</li>
								<li>4月</li>
								<li>5月</li>
								<li>6月</li>
								<li>7月</li>
								<li>8月</li>
								<li>9月</li>
								<li>10月</li>
								<li>11月</li>
								<li>12月</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		 <!-- <div class="return" onclick="location.href='${ctx}/front/cityDataCenter/ycIndex/1?orgId=3609009'"><img src="${ctx}/static/image/liData/back.png"><font>返回首页</font></div> -->   
		</div> 
    </div>
	<div class="container-fluid eight-content">
		<div class="help-floor">
			<div class="help-room">
				<div class="room-contain">
					<div class="help-item">
						<span>
							<img src="${ctx}/static/image/cityDataCenter/ycNew/helping.png">
							<h1 class="yellowT"><font id="t1">0</font><small>个</small></h1>
							<p>本月累计问题</p>
						</span>
						<span>
							<img src="${ctx}/static/image/cityDataCenter/ycNew/helping.png">
							<h1 class="yellowT"><font id="t2">0</font><small>个</small></h1>
							<p>本月已解决问题</p>
						</span>
						<span>
							<img src="${ctx}/static/image/cityDataCenter/ycNew/helping.png">
							<h1 class="yellowT"><font id="t3">0</font><small>次</small></h1>
							<p>本月走访</p>
						</span>
						<span>
							<img src="${ctx}/static/image/cityDataCenter/ycNew/helping.png">
							<h1 class="yellowT"><font id="t4">0</font><small>家</small></h1>
							<p>本月走访企业</p>
						</span>
					</div>
				</div>
			</div>
			<div class="help-room">
				<div class="room-contain">
					<div class="helping-title">诉求分析</div>
					<div class="help-content" id="helpContent">
						<div class="top-item">
							<font class="dib">招聘员工</font>
							<div class="dib"><span></span></div>
							<b class="dib">485</b>
						</div>
						<div class="top-item">
							<font class="dib">招聘员工</font>
							<div class="dib"><span></span></div>
							<b class="dib">485</b>
						</div>
						<div class="top-item">
							<font class="dib">招聘员工</font>
							<div class="dib"><span></span></div>
							<b class="dib">485</b>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="help-floor">
			<div class="help-room">
				<div class="room-contain">
					<div class="chart3" id="helping"></div>
				</div>
			</div>
			<div class="help-room">
				<div class="room-contain">
					<div class="helping-title">帮扶动态</div>
					<div class="help-content" id="actContent">
						<div class="act-item">
							<span class="dib">
								<h3>19</h3>
								<h5>2018-08</h5>
							</span>
							<p class="dib">宜春工业园区  张三走访了一次企业，发布了 一条技术专家类型诉求</p>
						</div>
						<div class="act-item">
							<span class="dib">
								<h3>19</h3>
								<h5>2018-08</h5>
							</span>
							<p class="dib">宜春工业园区  张三走访了一次企业，发布了 一条技术专家类型诉求</p>
						</div>
						<div class="act-item">
							<span class="dib">
								<h3>19</h3>
								<h5>2018-08</h5>
							</span>
							<p class="dib">宜春工业园区  张三走访了一次企业，发布了 一条技术专家类型诉求</p>
						</div>
						<div class="act-item">
							<span class="dib">
								<h3>19</h3>
								<h5>2018-08</h5>
							</span>
							<p class="dib">宜春工业园区  张三走访了一次企业，发布了 一条技术专家类型诉求</p>
						</div>
						<div class="act-item">
							<span class="dib">
								<h3>19</h3>
								<h5>2018-08</h5>
							</span>
							<p class="dib">宜春工业园区  张三走访了一次企业，发布了 一条技术专家类型诉求</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/ycData.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(3)").addClass("on");
		
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		})
		getselectYear();
		getData();
	});
	function getselectYear(){
		var date = new Date();
		var y = date.getFullYear();
	    for(var i=y; i>2014;i--){
	    	$('#ul1').append('<li>'+i+'</li>');
	    }
		$(".select li").on("click",function(){
			$(this).parents('.select-items').slideToggle();
			if($(this).parent().attr('id')=='ul1'){
 				$('#year').val($(this).text());
			}else if($(this).parent().attr('id')=='ul2'){
				var month = $(this).text();
				month = month.substring(0,month.lastIndexOf('月'));
				$('#month').val(month);
			}
			getData();
		})
	}
	function getData(){
		var y = $('#year').val() == '' ? undefined : $('#year').val();
		var m = $('#month').val() == '' ? undefined : $('#month').val();
		var param = {
			realType: 1,//假数据为0，真数据为1
			year: y,
			month: m
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/companyAppeal/dataStatisticsDetail",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					if(param.realType != 0){
						$('#year').val(result.year);
			 			$('#font1').text(result.year);
						$('#month').val(result.month);
			 			$('#font2').text(result.month+'月');
					}
		 			$('#t1').text(result.total1);
		 			$('#t2').text(result.total2);
		 			$('#t3').text(result.total3);
		 			$('#t4').text(result.total4);

					var _div = '';  //动态列表
					_div += '<div class="rollBar">';
					for(var i=0;i<result.list.length;i++){
						var info = result.list[i];
						var desc = nvlStr(info.appealDesc);
						var tips = "";
						var id = "";
						var  type = 1;
						if(info.taskId){
							id = info.taskId;
							type = 1;
						}else if (info.id){
							id = info.id;
							type = 2;
						}else{
							id = "";
						}
						if(desc=="走访"){
							tips = nvlStr(info.interviewParkName)+' '+nvlStr(info.interviewerName)+'走访了'+nvlStr(info.companyName)+'，企业未提出困难';
						}else if(desc=="结束"){
							tips = nvlStr(info.interviewParkName)+' '+nvlStr(info.interviewerName)+'办结了'+nvlStr(info.companyName)+'的'+nvlStr(info.appealTypeName)+'问题，请及时关注';
						}else if(desc=="处理"){
							tips = nvlStr(info.interviewParkName)+' '+nvlStr(info.interviewerName)+'处理了'+nvlStr(info.companyName)+'的'+nvlStr(info.appealTypeName)+'问题，已流转下一人员';
						}else if(nvlStr(info.id)==""){
							tips = nvlStr(info.companyName)+'发起了'+nvlStr(info.appealTypeName)+'诉求';
						}else{
							tips =nvlStr(info.interviewParkName)+' '+nvlStr(info.interviewerName)+'走访了'+nvlStr(info.companyName)+'，企业反馈了'+nvlStr(info.appealTypeName)+'诉求';
						}
						
							var m = formatCSTDate(info.interviewDate,"yyyy-MM");
							var d = formatCSTDate(info.interviewDate,"dd");
							_div += '<div class="act-item" onclick="helpDetail(\''+id+ '\',\''+ type+ '\')">';
							_div += '<span class="dib">';
							_div += '<h3>'+d+'</h3>';
							_div += '<h5>'+m+'</h5>';
							_div += '</span>';
							_div += '<p class="dib">'+tips+'</p>';
							_div += '</div>';
					}
					_div += '</div>';
					$("#actContent").html(_div);
					
					var _div2 = '';  //TOP3
					for(var i=0;i<result.topList.length;i++){
						var l = (result.topList[i].total/result.total1).toFixed(2)*100 + '%' ;
						_div2 += '<div class="top-item">';
						_div2 += '<font class="dib">'+result.topList[i].appealTypeName+'</font>';
						_div2 += '<div class="dib"><span style="width: '+l+';"></span></div>';
						_div2 += '<b class="dib">'+result.topList[i].total+'</b>';
						_div2 += '</div>';
					}
					$("#helpContent").html(_div2);
					
					var x = [],y1 = [],y2 = [],y3 = [];
					for(var key in result.map1){
						x.push(key);
						y1.push(result.map1[key]);
					}
					for(var key in result.map2){
						y2.push(result.map2[key]);
					}
					for(var key in result.map3){
						y3.push(result.map3[key]);
					}
					helping2(x,y1,y2,y3);
				}
			},
			error : function() {
				layerTips("校验权限异常");
			}
		});
	}
	function helpDetail(id,type){
		if(id==''){
			return;
		}
		if(isLogin=='1'){
			var url;
			if(type==1){
				url= "/companyAppealInfo/companyAppealInfoView/"+id;
			}else{
				url= "/companyInterviewRecord/companyInterviewRecordView/"+id;
			}
			layer.open({
				  id:'cframe',			
				  type: 2,
				  title: false,
				  closeBtn: 1, //不显示关闭按钮
				  shade: [.4],
				  area: ['70%', '80%'],
				  anim: 2,
				  content: ["${ctx}/toXOffice?type=0&replaceFlag=1&path="+encodeURI(url)], //iframe的url，no代表不显示滚动条
				  btn: ['关闭'],
				  yes: function(index, layero){
					  layer.closeAll();
				  },cancel: function(){ 
		            
		        }
			}); 
			
			
		}else{
			goPage("${ctx}/front/cityDataCenter/ycIndex/10?orgId=3609009");
		}
		
		
		
		
	}
	function nvlStr(s){
		if(s!=null && s!=undefined && s!="null" && s!="undefined"){
			return s;
		}else{
			return "";
		}
	}
	
	// 格式化CST日期的字串
	function formatCSTDate(strDate, format) {
		return formatDate(new Date(strDate), format);
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
</script>
</html>
