<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>江西省工业大数据企业实时用电</title>
</head>
<body class="gray-bg">
	<%@ include file="header.jsp"%>
	<div class="content p15 fz0">
		<input type="hidden" id="orgId" value="360000" name="orgId">
		<input type="hidden" id="orgType" value="1" name="orgType">
		<input type="hidden" id="year" value="" name="year">
		<input type="hidden" id="month" value="" name="month">
		<input type="hidden" id="type" value="1" name="type">
		<input type="hidden" id="compKind" value="" name="compKind">
		<input type="hidden" id="peakYear" value="" name="peakYear">
		<input type="hidden" id="peakMonth" value="" name="peakMonth">
		<input type="hidden" id="peakDay" value="" name="peakDay">
		<div class="elec-row">
			<div class="eco-floor electric-infor-second">
				<div class="boxStyleBg">
					<div class="dib half-w">
						<div class="chart3" id="ycEconMap"></div>
						<div class="map-areas map-areas2">
							<span style="cursor: pointer;">
								<h4>江西省</h4>
							</span>
							<span>
								<h4>宜春市</h4>
							</span>
						</div>
					</div>
					<div class="dib half-w">
						<div class="electric-title electric-title2">
							<span>企业实时用电</span>
							<span class="dbT">今日累计用电<b class="orangeT" id="ljyd"></b>万kwh</span>
						</div>
						<div class="company-half">
							<div class="dib half-w">
								<p>接入企业</p>
								<h2><font id="e1"></font>个</h2>
							</div>
							<div class="dib half-w">
								<p>接入监测分路总个数</p>
								<h2 class="blueT"><font id="e2"></font>个</h2>
							</div>
						</div>
						<div class="companybox-list">
							<span>
								<div class="middle-box">
									<p>重点企业</p>
									<h3><font id="e3">0</font>个</h3>
								</div>
							</span>
							<span>
								<div class="middle-box">
									<p>高耗能企业</p>
									<h3><font id="e4">0</font>个</h3>
								</div>
							</span>
							<span>
								<div class="middle-box">
									<p>专精特新企业</p>
									<h3><font id="e5">0</font>个</h3>
								</div>
							</span>
							<span>
								<div class="middle-box">
									<p>涉钢企业</p>
									<h3><font id="e6">0</font>个</h3>
								</div>
							</span>
							<span>
								<div class="middle-box">
									<p>锂电企业</p>
									<h3><font id="e7">0</font>个</h3>
								</div>
							</span>
							<span>
								<div class="middle-box">
									<p>中频炉企业</p>
									<h3><font id="e8">0</font>个</h3>
								</div>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tab-links" id="firstTab">
						<span class="on">重点企业日负荷曲线</span>
						<span>重点企业月用电</span>
						<span>重点企业每天用电高峰时段</span>
					</div>
					<div class="tabs">
						<div class="tab" id="firstTab0">
							<div class="chart3" id="electricChart"></div>
							<div class="electric-infor">
								<p id="today">今日最大负荷（<b class="bgT" id="tTime">11:15</b>）</p>
								<h3 class="bgT" id="jrfh"><font id="jrfh1"></font> <small>万 kw</small></h3>
								<p id="yesterday">昨日最大负荷（<b class="drT" id="yTime">11:15</b>）</p>
								<h3 class="drT" id="zrfh"><font id="zrfh1"></font> <small>万 kw</small></h3>
							</div>
						</div>
						<div class="tab" id="firstTab1" style="display: none;">
							<div class="chart3" id="electricChart2"></div>
							<div class="electric-infor">
								<p>本月累计电量</p>
								<h3 class="orangeT"><font id="bylj"></font> <small>万 kwh</small></h3>
								<p>同时段累计对比</p>
								<p class="bgT" id="nowTime"></p>
								<h2 class="purpleT"><b id="percent">12</b> <!-- <small>%</small> --></h2>
							</div>
						</div>
						<div class="tab" id="firstTab2" style="display: none;">
							<div style="position: absolute; top: 0px; right: 20px; z-index: 10;">
								<div class="fr selects">
									<div class="select">
										<p><font id="peakFont1">2018</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="peakUl1" style="max-height: 155px;">
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="peakFont2">1月</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="peakUl2" style="max-height: 155px;">
											</ul>
										</div>
									</div>
									<div class="select">
										<p><font id="peakFont3">1日</font><i class="fa fa-caret-down"></i></p>
										<div class="select-items">
											<ul id="peakUl3" style="max-height: 155px;">
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="chart3" id="electricChart3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="elec-row">
			<div class="eco-floor">
				<div class="outsideBox" onclick="location.href='${ctx}/front/cityDataCenter/gxwIndex/3'">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">工业用电</span>
					</div>
					<div class="tabContBar">
						<div class="dib half-w" style="cursor:pointer;">
							<div class="electric-item">
								<p><b>工业用电</b> - 累计</p>
								<h2><font id="total"></font><small>万kwh</small></h2>
								<h2 id="no1">暂未公布</h2>
							</div>
							<div class="electric-item">
								<p>同比增长</p>
								<h2><font id="total2"></font>.<font id="total3"></font><small>%</small></h2>
								<h2 id="no2">暂未公布</h2>
							</div>
							<div class="electric-item">
								<p>增幅全国排名</p>
								<h2><font id="total4"></font><small>名</small></h2>
								<h2 id="no3">暂未公布</h2>
							</div>
						</div>
						<div class="dib half-w" style="cursor:pointer;">
							<div class="electric-item">
								<p><b>工业用电</b> - 本月</p>
								<h2><font id="t1"></font><small>万kwh</small></h2>
								<h2 id="no4">暂未公布</h2>
							</div>
							<div class="electric-item">
								<p>同比增长</p>
								<h2><font id="t2"></font>.<font id="t3"></font><small>%</small></h2>
								<h2 id="no5">暂未公布</h2>
							</div>
							<div class="electric-item">
								<p>增幅全国排名</p>
								<h2><font id="t4"></font><small>名</small></h2>
								<h2 id="no6">暂未公布</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eco-floor">
				<div class="outsideBox">
					<img class="corner lt" src="${ctx}/static/image/cityDataCenter/jxNew/lt.png">
					<img class="corner rt" src="${ctx}/static/image/cityDataCenter/jxNew/rt.png">
					<img class="corner lb" src="${ctx}/static/image/cityDataCenter/jxNew/lb.png">
					<img class="corner rb" src="${ctx}/static/image/cityDataCenter/jxNew/rb.png">
					<div class="tabCaptionBar">
						<span class="tabCaption">企业预警</span>
					</div>
					<div class="tabContBar">
						<div class="warning">
							<div class="warn-box">
								<ul id="warning">
									<li>
										<p>11:30-12:00</p>
										<p>宜春奔威科技有限公司 产生了一条用电数据,<font class="redT">用电异常</font>!</p>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/plugins/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/echart4/echarts.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/dataCenter/gxwData.js"></script>
<script src="${ctx}/static/js/dataCenter/number.js"></script>
<script src="${ctx}/static/js/dataCenter/scroll.js"></script>
<script type="text/javascript">
	$(function(){
		$(".head>a:eq(1)").addClass("on");

		layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		//下拉框点击事件
		$(".select p").on("click",function(){
			$(this).next().slideToggle();
		})
		$("#firstTab span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			$(this).parent().next().find(".tab").fadeOut("fast");
			$("#type").val(ind+1);
			layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
			});
			setTimeout(function(){
				$("#firstTab"+ind).fadeIn("fast");
				getElectric();
			},210);
		});
		$(".map-areas span:eq(0)").on("click",function(){
			$(this).next().removeClass("on");
			$("#orgId").val('360000');
			getElecInfor(1);
			getAllElectric();
			getElectric();
		});
		$(".companybox-list span").on("click",function(){
			var ind = $(this).index();
			$(this).addClass("on").siblings().removeClass("on");
			if(ind+1 != $('#compKind').val()){
				$('#compKind').val(ind+1);
			}else{
				$(".companybox-list span").removeClass("on");
				$('#compKind').val(0);
			}
			getElectric();
		});
		
		getselectTime();
		getElecInfor(1); //用电
		getElectric(); //用电
		getDefaultDate(); //用电
	});
	//企业每天用电高峰时段日期筛选
	function getselectTime(){
		var year = "";
		var month = "";
		var day = "";
		if($("#peakYear").val() == "" || $("#peakMonth").val() == "" || $("#peakDay").val() == ""){
			var date = new Date();
			
			year = date.getFullYear();
			$("#peakYear").val(year);
			$('#peakFont1').text(year);
			
			month = date.getMonth()+1;
			if(month < 10){
				$("#peakMonth").val("0"+month);
			}else{
				$("#peakMonth").val(month);
			}
			$('#peakFont2').text(month+"月");
			
		    //这里传入的0代表获取上一个月的最后一天；如果传1，则获得当月的第一天；
		    day = new Date(year,month,0);
	        /* console.log(day.getDate()); */
	        if(date.getDate()<10){
	        	$("#peakDay").val("0"+date.getDate());
	        }else{
	        	$("#peakDay").val(date.getDate());
	        }
			$('#peakFont3').text(date.getDate()+"日");
			
			for(var i=year; i>2014;i--){
		    	$('#peakUl1').append('<li>'+i+'</li>');
		    }
			for(var i=1; i<13;i++){
		    	$('#peakUl2').append('<li>'+i+'月</li>');
		    }
		}else{
			year = $("#peakYear").val();
			month = $("#peakMonth").val();
		    day = new Date(year,month,0);
		}
	    
	    $('#peakUl3').empty();
	    for(var i=1; i<day.getDate()+1;i++){
	    	$('#peakUl3').append('<li>'+i+'日</li>');
	    }
		
	    var flag = true;
	    $(".select li").on("click",function(){
			if(flag){
				$(this).parents('.select-items').slideToggle();
				if($(this).parent().attr('id')=='peakUl1'){
					$('#peakFont1').text($(this).text());
		 			$('#peakYear').val($(this).text());
		 			getElectric();
				}else if($(this).parent().attr('id')=='peakUl2'){
		  			$('#peakFont2').text($(this).text());
					var month = $(this).text();
					month = month.substring(0,month.lastIndexOf('月'))
					if(month < 10){
						$("#peakMonth").val("0"+month);
					}else{
						$('#peakMonth').val(month);
					}
					getElectric();
				}else if($(this).parent().attr('id')=='peakUl3'){
					$('#peakFont3').text($(this).text());
					var day = $(this).text();
					day = day.substring(0,day.lastIndexOf('日'))
					if(day < 10){
			        	$("#peakDay").val("0"+day);
			        }else{
			        	$('#peakDay').val(day);
			        }
					getElectric();
				}
				flag = false;
				setTimeout(function(){
					getselectTime();
				},300)
			}
		})
	}
	//刷新
	var start = 0;
	var end = 13;
	//用电折线图
	var elecData = '';
	function getElectric(){
		var time = $("#peakYear").val()+"-"+$("#peakMonth").val()+"-"+$("#peakDay").val();
		
		var param = {
			type: $('#type').val(),
			orgId : $('#orgId').val(),
			compKind : $('#compKind').val(),
			time : time
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/electricCount",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					layer.closeAll();
				    var m = new Date().getMonth()+1;
				    var d = new Date().getDate();
				    var today = '截止 ('+m+'-'+d+')';
				    $("#nowTime").text(today);
				    var datas = result.data;
					if(param.type == 1) {
						//设置折线图显示时段
						end = Math.ceil((datas.bar1.charData.today.length/datas.bar1.charData.xAxis.length)*100) + 1;
						end = end > 100 ? 100 : end < 15 ? 15 : end;
						start = end - 15;
						
						$("#ljyd").rollNum({
					      	deVal: datas.bar1.maxData.powTo.split(".")[0],
					      	digit: datas.bar1.maxData.powTo.split(".")[0].length
					    });
						if(datas.bar1.maxData.today){
							var t1 = datas.bar1.maxData.today.split(".")[0];
							$("#jrfh1").rollNum({
						      	deVal: t1,
						      	digit: t1.length
						    });
							$("#tTime").text(datas.bar1.maxData.todayTime);
						} else { 
							$("#jrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
						if(datas.bar1.maxData.yesterday){
							var y1 = datas.bar1.maxData.yesterday.split(".")[0];
							var y2 = datas.bar1.maxData.yesterday.split(".")[1];
							$("#zrfh1").rollNum({
						      	deVal: y1,
						      	digit: y1.length
						    });
							$("#yTime").text(datas.bar1.maxData.yesterdayTime);
						} else { 
							$("#zrfh1").rollNum({
						      	deVal: 0,
						      	digit: 1
					    	});
						}
						elecData = datas.bar1.charData;
						elecLine(datas.bar1.charData);
					} else if(param.type == 2){
						$("#bylj").rollNum({
					      	deVal: datas.bar2.curValue.split(".")[0],
					      	digit: datas.bar2.curValue.split(".")[0].length
					    });
						$("#percent").text(datas.bar2.percent)
						electricBar(datas.bar2);
					} else {
						electricScatter(datas.bar3.maxListData);
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	function getAllElectric(){
		var param = {
			"orgId" : $('#orgId').val(),
			"year" : $('#year').val(),
			"month" : $('#month').val(),//$('#month').val(),
			"type" : 4,
			"orgType" : Number($('#orgType').val())
		}
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/eleManagement/jsonList",
			type : "post",
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					var t = result.value.list[result.value.list.length-1];
					if(t.AC_GYYDL_VALUE1 == 0) { $("#no1").show().prev().hide();}
					else { $("#no1").hide().prev().show();}
					if(t.AC_GYYDL_PERCENT1 == '0') { $("#no2").show().prev().hide();}
					else { $("#no2").hide().prev().show();}
					if(t.AC_GYYDL_ORDER1 == 0) { $("#no3").show().prev().hide();}
					else { $("#no3").hide().prev().show();}
					if(t.US_GYYDL_VALUE1 == 0) { $("#no4").show().prev().hide();}
					else { $("#no4").hide().prev().show();}
					if(t.US_GYYDL_PERCENT1 == '0') { $("#no5").show().prev().hide();}
					else { $("#no5").hide().prev().show();}
					if(t.US_GYYDL_ORDER1 == 0) { $("#no6").show().prev().hide();}
					else { $("#no6").hide().prev().show();}
					$("#total").rollNum({
				      	deVal: t.AC_GYYDL_VALUE1,
				      	digit: t.AC_GYYDL_VALUE1.toString().length
				    });
					if(t.AC_GYYDL_PERCENT1.toString().split(".")[1]){
						$("#total2").rollNum({
					      	deVal: t.AC_GYYDL_PERCENT1.toString().split(".")[0],
					      	digit: t.AC_GYYDL_PERCENT1.toString().split(".")[0].length
					    });
						$("#total3").rollNum({
					      	deVal: t.AC_GYYDL_PERCENT1.toString().split(".")[1],
					      	digit: t.AC_GYYDL_PERCENT1.toString().split(".")[1].length
					    });
					} else {
						$("#total2").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
						$("#total3").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
					}
					$("#total4").rollNum({
				      	deVal: t.AC_GYYDL_ORDER1,
				      	digit: t.AC_GYYDL_ORDER1.toString().length
				    });
					$("#t1").rollNum({
				      	deVal: t.US_GYYDL_VALUE1,
				      	digit: t.US_GYYDL_VALUE1.toString().length
				    });
					$("#t2").rollNum({
				      	deVal: t.US_GYYDL_PERCENT1.toString().split(".")[0],
				      	digit: t.US_GYYDL_PERCENT1.toString().split(".")[0].length
				    });
					if(t.US_GYYDL_PERCENT1.toString().split(".")[1]){
						$("#t3").rollNum({
					      	deVal: t.US_GYYDL_PERCENT1.toString().split(".")[1],
					      	digit: t.US_GYYDL_PERCENT1.toString().split(".")[1].length
					    });
					} else {
						$("#t3").rollNum({
					      	deVal: 0,
					      	digit: 1
					    });
					}
					$("#t4").rollNum({
				      	deVal: t.US_GYYDL_ORDER1.toString(),
				      	digit: t.US_GYYDL_ORDER1.toString().length
				    });
				}
			},
			error : function() {
				//layerTips("校验权限异常");
			}
		});
	};
	//用电数据
	function getElecInfor(type){
		var param = {
			"orgId" : $('#orgId').val()
		};
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/electric/companyCount",
			type : "post",
		 	async: false,
			data : param,
			dataType : "json",
			success : function(result){
				if(result.success){
					$("#e1").rollNum({
				      	deVal: result.companyData.count.COUNT1,
				      	digit: result.companyData.count.COUNT1.length
				    });
					$("#e2").rollNum({
				      	deVal: result.companyData.count.COUNT2,
				      	digit: result.companyData.count.COUNT2.length
				    });
					$("#e3").rollNum({
				      	deVal: result.companyData.count.COUNT3,
				      	digit: result.companyData.count.COUNT3.length
				    });
					$("#e4").rollNum({
				      	deVal: result.companyData.count.COUNT4,
				      	digit: result.companyData.count.COUNT4.length
				    });
					$("#e5").rollNum({
				      	deVal: result.companyData.count.COUNT5,
				      	digit: result.companyData.count.COUNT5.length
				    });
					$("#e6").rollNum({
				      	deVal: result.companyData.count.COUNT6,
				      	digit: result.companyData.count.COUNT6.length
				    });
					$("#e7").rollNum({
				      	deVal: result.companyData.count.COUNT7,
				      	digit: result.companyData.count.COUNT7.length
				    });
					$("#e8").rollNum({
				      	deVal: result.companyData.count.COUNT8,
				      	digit: result.companyData.count.COUNT8.length
				    });
				    var data = [ 
						{name : '南昌市', value : ["360100",'NANCHANG']}, 
						{name : '景德镇市', value : ["360200",'JINGDEZHEN']}, 
						{name : '萍乡市', value : ["360300",'PINGXIANG']}, 
						{name : '九江市', value : ["360400",'JIUJIANG']}, 
						{name : '新余市', value : ["360500",'XINYU']}, 
						{name : '鹰潭市', value : ["360600",'YINGTAN']}, 
						{name : '赣州市', value : ["360700",'GANZHOU']}, 
						{name : '吉安市', value : ["360800",'JIAN']}, 
						{name : '宜春市', value : ["360900",'YICHUN']}, 
						{name : '抚州市', value : ["361000",'FUZHOU']},
						{name : '上饶市', value : ["361100",'SHANGRAO']} 
					]
					$.get('${ctx}/static/map/360000.json', function (chinaJson) {
					    echarts.registerMap('yc', chinaJson);
						ycEconMap(data);
					});
					if(type == 1){
						var div = '';
						for(var j=0;j<2;j++){
							for(var i = 0; i < result.companyData.warnList.length; i++){
								var info = result.companyData.warnList[i];
								div += '<li>';
								div += '<p>'+ info.time + '</p>';
								div += '<p>'+ info.companyName + ' 产生了一条用电数据,';
								div += '<font class="greenT">用电正常</font></p>';
								div += '</li>';
							}
						}
						$("#warning").html(div);
						var list = result.companyData.countList;
						for(var j = 0; j < list.length; j++){
							list[j].name = list[j].spaceName;
							list[j].value = list[j].spaceId;
							for(var i = 0; i < yc3.length; i++){
								if(list[j].spaceId == yc3[i].name){
									yc3[i].value[2] = list[j].count;
								}
							}
						}
					}
				}
			},
			error : function() {
				//alert("校验权限异常");
			}
		});
	}
	//获取最近有数据的年月
	function getDefaultDate(){
		$.ajax({
			url : "${OfficeUrl}XOffice/interface/json/eleManagement/defYearAndMonth",
			type : "post",
			async:false, 
			data : {
				"orgId" : $('#orgId').val(),
				"kind" : 0
			},
			success : function(result) {
				if (result.success) {
					$('#year').val(result.value.year);
					$('#month').val(result.value.month);
					getAllElectric();
				}
			},
			error : function() {
				layer.msg("数据获取异常！");
			}
		})
	}
</script>
</html>
