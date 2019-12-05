<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>物流平台-车源搜索</title>
<link href="${ctx}/static/css/logistics/logisticsPlatform.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectHeader2.css" rel="stylesheet"/>
<link href="${ctx}/static/css/projectFooter.css" rel="stylesheet"/>
<style type="text/css">
.hidden{
	display: none;
}
</style>
</head>

<body>

<!-- 列表种类1:车源列表 2:货源列表 3:收藏列表 -->
<input type="hidden" id="kind" value="1"/>
<!-- 页码 -->
<input type="hidden" id="pageNum" value="1">
<form action="" method="post" id="detailForm">
	<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
	<input type="hidden" id="info" name="info"/>
	<!-- 物流种类 1:万佶物流 2:中危宝物流 -->
	<input type="hidden" id="type" name="type" value="${type}"/>
</form>

<div class="logistics_main">
	<div class="project_header">
	    <%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="logistics_content">
		<div class="search_cont">
			<div class="dataStatisticsBar clearfix">
				<div class="dataStatistics">
					一共搜索到
					<font class="redFont_num" id="total"></font><span id="totalUnit">辆</span>
					<c:choose>
						<c:when test="${type==1}">
							<font class="greenFont_name">货物运输</font><span id="kindUnit">车源</span>
						</c:when>
						<c:when test="${type==2}">
							<font class="greenFont_name">危化运输</font><span id="kindUnit">车源</span>
						</c:when>
					</c:choose>
				</div>
				<div class="returnPage" onclick="window.location.href='${ctx}/front/logistics/main'">返回上一页</div>
			</div>
			<div class="titleName clearfix">
				<ul>
					<li><a href="javascript:;">车源信息</a></li>
					<li><a href="javascript:;">我发布的</a></li>
					<li><a href="javascript:;">我收藏的</a></li>
				</ul>
				<div class="releaseSource" onclick="window.location.href='${ctx}/front/logistics/publish?type=${type}'">发布货源</div>
			</div>
			<div class="titleItem">
				<div>
					<c:choose>
						<c:when test="${type==1}">
							<div class="carSourceScreenBar" id="wanjiSearch">
								<div class="screenType">
									<span style="color:#000; font-size: 12px;">当前位置：</span>
									<select id="srcProvince" class="screenRegion" style="width:20%;" ><option value="0" >省份/自治区</option></select> 
									<select id="srcCity" class="screenRegion" style="width:20%;" disabled><option value="0" >城市/自治州</option></select>
									<select id="srcTown" class="screenRegion" style="width:20%;" disabled><option value="0">区/县</option></select>
								</div>
								<div class="screenType">
									<span style="color:#000; font-size: 12px;">期望流向：</span>
									<select id="destProvince" class="screenRegion" style="width:20%;" ><option value="0" >省份/自治区</option></select> 
									<select id="destCity" class="screenRegion" style="width:20%;" disabled><option value="0">城市/自治州</option></select>
									<select id="destTown" class="screenRegion" style="width:20%;" disabled><option value="0">区/县</option></select>
									<span class="screenBtn" onclick="search()">确定</span>
								</div>
								<div class="screenType">
									<span style="color:#000; font-size: 12px;">车型：</span>
									<span id="carType" style="margin-left: 20px;">
										<span class="searchOptions selected" data="-1" onclick="selectTag('carType',this)">不限</span>
										<c:forEach items="${CarTypeDictsList}" var="info">
											<span class="searchOptions" data="${info.Code}" onclick="selectTag('carType',this)">${info.Name}</span>
										</c:forEach>
									</span>
								</div>
								<div class="screenType">
									<span style="color:#000; font-size: 12px;">载型：</span>
									<span id="carLoadType" style="margin-left: 20px;">
										<span class="searchOptions selected" data="-1" onclick="selectTag('carLoadType',this)">不限</span>
										<c:forEach items="${CarLoadDictsList}" var="info">
											<span class="searchOptions" data="${info.Code}" onclick="selectTag('carLoadType',this)">${info.Name}</span>
										</c:forEach>
									</span>
								</div>
								<!-- <div class="screenType">
									<span style="color:#000; font-size: 12px;">车牌号：</span>
									<input type="text" placeholder="请输入车牌号" class="screenRegion" maxlength="10">
								</div> -->
							</div>
						</c:when>
						<c:when test="${type==2}">
							<div class="carSourceScreenBar" id="wanjiSearch">
								<div class="screenType">
									<span>当前位置：</span>
									<select id="beginArea" class="screenRegion" style="width:15%;" ><option value="-1">地区</option></select>
									<select id="beginProvince" class="screenRegion" style="width:15%;" disabled><option value="-1">省份/自治区</option></select> 
									<select id="beginCity" class="screenRegion" style="width:15%;" disabled><option value="-1">城市/自治州</option></select>
									<select id="beginTown" class="screenRegion" style="width:15%;" disabled><option value="-1">区/县</option></select>
								</div>
								<div class="screenType">
									<span>期望流向：</span>
									<select id="endArea" class="screenRegion" style="width:15%;" ><option value="-1">地区</option></select> 
									<select id="endProvince" class="screenRegion" style="width:15%;" disabled value="-1"><option>省份/自治区</option></select>
									<select id="endCity" class="screenRegion" style="width:15%;" disabled value="-1"><option>城市/自治州</option></select>
									<select id="endTown" class="screenRegion" style="width:15%;" disabled value="-1"><option>区/县</option></select>
									<span class="screenBtn" onclick="search()">确定</span>
								</div>
								<div class="screenType">
									<span>车型：</span>
									<span id="carTypeId">
										<span class="searchOptions selected" data="" onclick="selectTag('carTypeId',this)">不限</span>
										<span class="searchOptions" data="25" onclick="selectTag('carTypeId',this)">铝合金罐车</span>
										<span class="searchOptions" data="26" onclick="selectTag('carTypeId',this)">不锈钢罐车</span>
										<span class="searchOptions" data="27" onclick="selectTag('carTypeId',this)">压力罐车</span>
										<span class="searchOptions" data="28" onclick="selectTag('carTypeId',this)">铁罐车</span>
										<span class="searchOptions" data="29" onclick="selectTag('carTypeId',this)">仓栏危化品车</span>
										<span class="searchOptions" data="30" onclick="selectTag('carTypeId',this)">集装箱危化品车</span>
										<span class="searchOptions" data="69" onclick="selectTag('carTypeId',this)">不锈钢保温罐车</span>
										<span class="searchOptions" data="70" onclick="selectTag('carTypeId',this)">碳钢罐车</span>
										<span class="searchOptions" data="71" onclick="selectTag('carTypeId',this)">铝罐车</span>
										<span class="searchOptions" data="72" onclick="selectTag('carTypeId',this)">玻璃钢罐车</span>
										<span class="searchOptions" data="73" onclick="selectTag('carTypeId',this)">高栏车</span>
										<span class="searchOptions" data="74" onclick="selectTag('carTypeId',this)">平板车</span>
										<span class="searchOptions" data="75" onclick="selectTag('carTypeId',this)">厢式车</span>
										<span class="searchOptions" data="76" onclick="selectTag('carTypeId',this)">其他</span>
									</span>
								</div>
								<div class="screenType">
									<span>剩余重量：</span>
									<span id="sendCount">
										<span class="searchOptions selected" data="-1" onclick="selectTag('sendCount',this)">不限</span>
										<span class="searchOptions" data="1" onclick="selectTag('sendCount',this)">1吨以下</span>
										<span class="searchOptions" data="2" onclick="selectTag('sendCount',this)">1-5吨</span>
										<span class="searchOptions" data="3" onclick="selectTag('sendCount',this)">5-10吨</span>
										<span class="searchOptions" data="4" onclick="selectTag('sendCount',this)">10-20吨</span>
										<span class="searchOptions" data="5" onclick="selectTag('sendCount',this)">20吨以上</span>
									</span>
								</div>
								<div class="screenType">
									<span>运输方式：</span>
									<span id="sendType">
										<span class="searchOptions selected" data="" onclick="selectTag('sendType',this)">不限</span>
										<span class="searchOptions" data="0" onclick="selectTag('sendType',this)">零担</span>
										<span class="searchOptions" data="1" onclick="selectTag('sendType',this)">整车</span>
									</span>
								</div>
								<div class="screenType">
									<span>运价：</span>
									<span id="sendPrice">
										<span class="searchOptions selected" data="-1" onclick="selectTag('sendPrice',this)">面议</span>
										<span class="searchOptions" data="1" onclick="selectTag('sendPrice',this)">5000元以下</span>
										<span class="searchOptions" data="2" onclick="selectTag('sendPrice',this)">5000-10000元</span>
										<span class="searchOptions" data="3" onclick="selectTag('sendPrice',this)">10000-15000元</span>
										<span class="searchOptions" data="4" onclick="selectTag('sendPrice',this)">15000元以上</span>
									</span>
								</div>
							</div>
						</c:when>
					</c:choose>
					
				</div>
				
				<div style="display:none;">
					<!-- 这是我发布的区域  -->
				</div>
				
				<div style="display:none;">
					<!-- 这是我收藏的区域  -->
				</div>
			</div>	
			<div class="searchResultBar">
				<div class="searchResult">
					<table id="list">
						<!-- 异步列表展示处 -->
					</table>
				</div>
				<div id="getMore" style="margin:10px 0;">
					<a href="javascript:void(0);" onclick="getMore()" class="renovate">
						<span class="renovateTitle">加载更多</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script>
 $(function(){
	$('.tabItem').children().eq(0).css({'display':'none'});
	$('.tabItem').children().eq(1).css({'display':'block'}); 
    $(".tabName ul li").each(function(){//页面头部模块切换控制
		var index=$(this).index();
		$(".tabName ul li").eq(1).addClass("nameClick");
		$(this).click(function(){
			$(this).addClass("nameClick").siblings().removeClass("nameClick");
			$(".tabItem>ul").eq(index).stop(true).show().siblings().stop(true).hide();
		});
    });
	$(".tabItem ul li").each(function(){
		$(".tabItem ul li").eq(4).addClass("itemClick");
		$(this).click(function(){
			$(this).addClass("itemClick").siblings().removeClass("itemClick");
		});
    });
	$(".header_WeChat").click(function(){		
    	var div = $(".WeChatQRcode"); 
		if(div.css("display")=="none"){ 
	  		div.slideDown("fast"); 
		}else{ 
	  		div.slideUp("fast"); 
		} 
    });
	$(".titleName ul li").each(function(){//页面内容切换控制
		var index=$(this).index();
		$(".titleName ul li").eq(0).addClass("titleClick");
		$(this).click(function(){
			$(this).addClass("titleClick").siblings().removeClass("titleClick");
			$(".titleItem>div").eq(index).stop(true).show().siblings().stop(true).hide();
			var type = $("#type").val();
			if(index==0){
				$("#kind").val(1);
				$("#list").empty();
				if(type==1){
					getWanjiCarList(1,6,2);					
				}else{					
					getZwbCarList(1,6);
				}
			}else if(index==1){
				$("#kind").val(2);
				$("#list").empty();
				if(type==1)
					getWanjiGoodsList();
				else
					getZwbGoodsList();
			}else if(index==2){
				$("#kind").val(3);
				$("#list").empty();
				if(type==1)
					getWanjiCollectList(1,6);
				else
					getZwbCollectList(1,6);
			}
		});
    });
 });
</script>
<script type="text/javascript">
	$(function(){
		var type = '${type}';
		if(type==1){
			//地址字典
			getWanjiArea(-1, 1, 1);
			getWanjiArea(-1, 1, 2);
			//车源列表
			getWanjiCarList(1,6,1);
		}else if(type==2){
			//地址字典
			getZwbArea(0, 1, 1);
			getZwbArea(0, 1, 2);
			getZwbCarList(1,6);
		}
		
		$("#srcProvince").change(function(){
			getWanjiArea($(this).val(),2,1);
		});
		$("#destProvince").change(function(){
			getWanjiArea($(this).val(),2,2);
		});
		
		$("#srcCity").change(function(){
			getWanjiArea($(this).val(),3,1);
		});
		$("#destCity").change(function(){
			getWanjiArea($(this).val(),3,2);
		}); 
		
		$("#beginArea").change(function(){
			getZwbArea($(this).val(),2,1);
		});
		$("#endArea").change(function(){
			getZwbArea($(this).val(),2,2);
		});
		$("#beginProvince").change(function(){
			getZwbArea($(this).val(),3,1);
		});
		$("#endProvince").change(function(){
			getZwbArea($(this).val(),3,2);
		});
		
		$("#beginCity").change(function(){
			getZwbArea($(this).val(),4,1);
		});
		$("#endCity").change(function(){
			getZwbArea($(this).val(),4,2);
		}); 
		
		$(".optionBtnRel").click(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				$(this).addClass("selected");
			}
		});
	});


	function getWanjiArea(parent, areaKind, addKind){
		if(parent==0){
			if(addKind==1){
				if(areaKind==2){
					$("#srcCity").empty();
					$("#srcCity").append('<option value="0">城市/自治州</option>');
					$("#srcCity").attr("disabled","disabled");
					$("#srcTown").empty();
					$("#srcTown").append('<option value="0">区/县</option>');
					$("#srcTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#srcTown").empty();
					$("#srcTown").append('<option value="0">区/县</option>');
					$("#srcTown").attr("disabled","disabled");
				}
			}else if(addKind==2){
				if(areaKind==2){
					$("#destCity").empty();
					$("#destCity").append('<option value="0">城市/自治州</option>');
					$("#destCity").attr("disabled","disabled");
					$("#destTown").empty();
					$("#destTown").append('<option value="0">区/县</option>');
					$("#destTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#destTown").empty();
					$("#destTown").append('<option value="0">区/县</option>');
					$("#destTown").attr("disabled","disabled");
				}
			}
			return;
		}
		
		if(addKind==1){
			if(areaKind==2){
				$("#srcTown").empty();
				$("#srcTown").append('<option value="0">区/县</option>');
				$("#srcTown").attr("disabled","disabled");
			}
		}else if(addKind==2){
			if(areaKind==2){
				$("#destTown").empty();
				$("#destTown").append('<option value="0">区/县</option>');
				$("#destTown").attr("disabled","disabled");
			}
		}
		
		if(areaKind==2){
			if(addKind==1){
				$("#srcCity").removeAttr("disabled");
			}else if(addKind==2){
				$("#destCity").removeAttr("disabled");
			}
		}else if(areaKind==3){
			if(addKind==1){
				$("#srcTown").removeAttr("disabled");
			}else if(addKind==2){
				$("#destTown").removeAttr("disabled");
			}
		}
		
		$.ajax({
			url:"${ctx}/logistics/wanji/json/getAddress",
			type:"get",
			data:{"parent":parent},
			dataType:"json",
			success:function(result){
				if(areaKind==2){
					if(addKind==1){
						$("#srcCity").empty().append('<option value="0">城市/自治州</option>');
					}else if(addKind==2){
						$("#destCity").empty().append('<option value="0">城市/自治州</option>');
					}
				}else if(areaKind==3){
					if(addKind==1){
						$("#srcTown").empty().append('<option value="0">区/县</option>');
					}else if(addKind==2){
						$("#destTown").empty().append('<option value="0">区/县</option>');
					}
				}
				//'<option value="0">省份/自治区</option>';
				for(var i=0;i<result.length;i++){
					var info = result[i];
					var _div = '<option value="'+info.CODE+'">'+info.NAME+'</option>';
					if(areaKind==1){
						if(addKind==1){
							$("#srcProvince").append(_div);
						}else if(addKind==2){
							$("#destProvince").append(_div);
						}
					}else if(areaKind==2){
						if(addKind==1){
							$("#srcCity").append(_div);
						}else if(addKind==2){
							$("#destCity").append(_div);
						}
					}else{
						if(addKind==1){
							$("#srcTown").append(_div);
						}else if(addKind==2){
							$("#destTown").append(_div);
						}
					}
				}
				
			},
			error:function(){
				layer.msg("地址请求超时，请刷新页面！");
			}
		});	
	}
	
	function getZwbArea(parent, areaKind, addKind){
		if(parent==-1){
			if(addKind==1){
				if(areaKind==2){
					$("#beginProvince").empty();
					$("#beginProvince").append('<option value="-1">省份/自治区</option>');
					$("#beginProvince").attr("disabled","disabled");
					$("#beginCity").empty();
					$("#beginCity").append('<option value="-1">城市/自治州</option>');
					$("#beginCity").attr("disabled","disabled");
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#beginCity").empty();
					$("#beginCity").append('<option value="-1">城市/自治州</option>');
					$("#beginCity").attr("disabled","disabled");
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}else if(areaKind==4){
					$("#beginTown").empty();
					$("#beginTown").append('<option value="-1">区/县</option>');
					$("#beginTown").attr("disabled","disabled");
				}
			}else if(addKind==2){
				if(areaKind==2){
					$("#endProvince").empty();
					$("#endProvince").append('<option value="-1">省份/自治区</option>');
					$("#endProvince").attr("disabled","disabled");
					$("#endCity").empty();
					$("#endCity").append('<option value="-1">城市/自治州</option>');
					$("#endCity").attr("disabled","disabled");
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}else if(areaKind==3){
					$("#endCity").empty();
					$("#endCity").append('<option value="-1">城市/自治州</option>');
					$("#endCity").attr("disabled","disabled");
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}else if(areaKind==4){
					$("#endTown").empty();
					$("#endTown").append('<option value="-1">区/县</option>');
					$("#endTown").attr("disabled","disabled");
				}
			}
			return;
		}
		
		if(addKind==1){
			if(areaKind==2){
				$("#beginCity").empty();
				$("#beginCity").append('<option value="-1">城市/自治州</option>');
				$("#beginCity").attr("disabled","disabled");
				$("#beginTown").empty();
				$("#beginTown").append('<option value="-1">区/县</option>');
				$("#beginTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#beginTown").empty();
				$("#beginTown").append('<option value="-1">区/县</option>');
				$("#beginTown").attr("disabled","disabled");
			}
		}else if(addKind==2){
			if(areaKind==2){
				$("#endCity").empty();
				$("#endCity").append('<option value="-1">城市/自治州</option>');
				$("#endCity").attr("disabled","disabled");
				$("#endTown").empty();
				$("#endTown").append('<option value="-1">区/县</option>');
				$("#endTown").attr("disabled","disabled");
			}else if(areaKind==3){
				$("#endTown").empty();
				$("#endTown").append('<option value="-1">区/县</option>');
				$("#endTown").attr("disabled","disabled");
			}
		}
		
		if(areaKind==2){
			if(addKind==1){
				$("#beginProvince").removeAttr("disabled");
			}else if(addKind==2){
				$("#endProvince").removeAttr("disabled");
			}
		}else if(areaKind==3){
			if(addKind==1){
				$("#beginCity").removeAttr("disabled");
			}else if(addKind==2){
				$("#endCity").removeAttr("disabled");
			}
		}else if(areaKind==4){
			if(addKind==1){
				$("#beginTown").removeAttr("disabled");
			}else if(addKind==2){
				$("#endTown").removeAttr("disabled");
			}
		}
		
		var kind = Number(areaKind)-1;
		$.ajax({
			url:"${ctx}/logistics/zwb/json/area",
			type:"get",
			data:{"parent":parent,"kind":kind},
			dataType:"json",
			success:function(result){
				if(areaKind==2){
					if(addKind==1){
						$("#beginProvince").empty().append('<option value="-1">省份/自治区</option>');
					}else if(addKind==2){
						$("#endProvince").empty().append('<option value="-1">省份/自治区</option>');
					}
				}else if(areaKind==3){
					if(addKind==1){
						$("#beginCity").empty().append('<option value="-1">城市/自治州</option>');
					}else if(addKind==2){
						$("#endCity").empty().append('<option value="-1">城市/自治州</option>');
					}
				}else if(areaKind==4){
					if(addKind==1){
						$("#beginTown").empty().append('<option value="-1">区/县</option>');
					}else if(addKind==2){
						$("#endTown").empty().append('<option value="-1">区/县</option>');
					}
				}
				//'<option value="0">省份/自治区</option>';
				var list = result.value;
				for(var i=0;i<list.length;i++){
					var info = list[i];
					var _div = '<option value="'+info.ID+'">'+info.NAME+'</option>';
					if(areaKind==1){
						if(addKind==1){
							$("#beginArea").append(_div);
						}else if(addKind==2){
							$("#endArea").append(_div);
						}
					}else if(areaKind==2){
						if(addKind==1){
							$("#beginProvince").append(_div);
						}else if(addKind==2){
							$("#endProvince").append(_div);
						}
					}else if(areaKind==3){
						if(addKind==1){
							$("#beginCity").append(_div);
						}else if(addKind==2){
							$("#endCity").append(_div);
						}
					}else{
						if(addKind==1){
							$("#beginTown").append(_div);
						}else if(addKind==2){
							$("#endTown").append(_div);
						}
					}
				}
				
			},
			error:function(){
				layer.msg("地址请求超时，请刷新页面！");
			}
		});	
	}
	
	function ityzl_SHOW_LOAD_LAYER(){  
        return layer.msg('努力中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,time:100000}) ;  
    } 

	function getWanjiCarList(pageNum, pageSize, indexType){
		//获取搜索条件值
		var AdCode = 0;
		var TargetAdCode = 0;
		var TypeCode = -1;
		var CarLoadType = -1;
		
		if(indexType==1){//初始化搜索条件
			TypeCode = '${TypeCode}';
			CarLoadType = '${CarLoadType}';
			
			var AdCodes = '${AdCodes}'.split(",");
			var TargetAdCodes = '${TargetAdCodes}'.split(",");
			if(AdCodes[0]!=0){
				getWanjiArea(AdCodes[0],2,1);
				AdCode = AdCodes[0];
			} 
			
			if(AdCodes[1]!=0){
				getWanjiArea(AdCodes[1],3,1);
				AdCode = AdCodes[1];
			}
			
			if(AdCodes[2]!=0){
				AdCode = AdCodes[2];
			}
			if(TargetAdCodes[0]!=0){
				getWanjiArea(TargetAdCodes[0],2,2);
				TargetAdCode = TargetAdCodes[0];
			} 
			if(TargetAdCodes[1]!=0){
				getWanjiArea(TargetAdCodes[1],3,2);
				TargetAdCode = TargetAdCodes[1];
			}
			if(TargetAdCodes[2]!=0){
				TargetAdCode = TargetAdCodes[2];
			}
			
			setTimeout(function(){
				$("#srcProvince option").each(function(){
					if(AdCodes[0]==$(this).val()){
						$(this).attr("selected", true);
					}
				});
				$("#srcCity option").each(function(){
					if(AdCodes[1]==$(this).val()){
						$(this).attr("selected", "selected");
					}
				});
				$("#srcTown option").each(function(){
					if(AdCodes[2]==$(this).val()){
						$(this).attr("selected", "selected");
					}
				});
				$("#destProvince option").each(function(){
					if(TargetAdCodes[0]==$(this).val()){
						$(this).attr("selected", "selected");
					}
				});
				$("#destCity option").each(function(){
					if(TargetAdCodes[1]==$(this).val()){
						$(this).attr("selected", "selected");
					}
				});
				$("#destTown option").each(function(){
					if(TargetAdCodes[2]==$(this).val()){
						$(this).attr("selected", "selected");
					}
				});
				
			},1500);
			
			
			
			$("#carType .searchOptions").each(function(){
				$(this).removeClass("selected");
				if($(this).attr("data") == TypeCode){
					$(this).addClass("selected");
				}
			});
			
			$("#carLoadType .searchOptions").each(function(){
				$(this).removeClass("selected");
				if($(this).attr("data") == CarLoadType){
					$(this).addClass("selected");
				}
			});
			
		}else{
			if(!$("#srcTown").attr("disabled")){
				AdCode = $("#srcTown").val();
				if(AdCode==0){
					AdCode = $("#srcCity").val();
				}
			}else{
				if(!$("#srcCity").attr("disabled")){
					AdCode = $("#srcCity").val();
					if(AdCode==0){
						AdCode = $("#srcProvince").val();
					}
				}else{
					AdCode = $("#srcProvince").val();
				}
			}
			
			if(!$("#destTown").attr("disabled")){
				TargetAdCode = $("#destTown").val();
				if(TargetAdCode==0){
					TargetAdCode = $("#destCity").val();
				}
			}else{
				if(!$("#destCity").attr("disabled")){
					TargetAdCode = $("#destCity").val();
					if(TargetAdCode==0){
						TargetAdCode = $("#destProvince").val();
					}
				}else{
					TargetAdCode = $("#destProvince").val();
				}
			}
			
			$("#carType .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					TypeCode = $(this).attr("data");
				}
			});
			
			$("#carLoadType .searchOptions").each(function(){
				if($(this).hasClass("selected")){
					CarLoadType = $(this).attr("data");
				}
			});
		}
		console.log(AdCode);
		console.log(TargetAdCode)
		var index = null;
		$.ajax({
			url:"${ctx}/logistics/wanji/json/getPlatCar",
			type:"post",
			data:{
				"${_csrf.parameterName}" : '${_csrf.token}',
				"Take" : pageSize,
				"Skip" : (pageNum-1)*pageSize,
				"AdCode" : AdCode,
				"TargetAdCode" : TargetAdCode,
				"TypeCode" : TypeCode,
				"CarLoadType" : CarLoadType
				/*"PlateNum" : '${info.plateNum}' */
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==1){
					var total = result.jsonValue.Total;
					if(pageNum==1 && result.jsonValue.Total!=null){
						$("#total").text(total);
						$("#totalUnit").text("辆");
						$("#kindUnit").text("车源");
					}
				    $("#pageNum").val(Number(pageNum)+1);
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var CarTypeName = info.CarTypeName;
						var CarLoadTypeName = info.CarLoadTypeName;
						var Avatar = info.Avatar;
						if(CarTypeName == null){
							CarTypeName = "";
						}
						if(CarLoadTypeName == null){
							CarLoadTypeName = "";
						}
						if(Avatar == null){
							Avatar = "${ctx}/static/image/logistics/headPortrait.png";
						}
						
						var _div = '<tr>'
							+'<td width="5%">'
							+'<img src="${ctx}/static/image/logistics/product.jpg" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.CurPlace+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+CarTypeName+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+CarLoadTypeName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">全国</span>'
							+'</td>'
							+'<td width="20%" style="text-align:left;">'
							+'<span class="redLabel">载重:'+info.CarLoad+'吨</span><br>'
							+'<span class="redLabel">车长:'+info.CarLength+'&nbsp;车宽:'+info.CarWidth+'米</span>'
							+'</td>'
							+'<td width="15%" style="text-align:left;">'
							+'<img src="'+Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
							+'<span class="resultName">'
							+'<div>'+info.Name+'</div>';
							if(info.IsAuth){
								_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
							}
						_div += '</span>'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<span class="resultTime">'+info.StrLocationDt+'</span>'
							+'</td>'
							+'<td width="5%">';
							if(info.isCollect=="true"){
								_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}else{
								_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}
						_div += '</td>'
							+'<td width="10%">'
							+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
						
					}
					if((pageSize*pageNum)<total){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}
	
	function getZwbCarList(pageNum, pageSize){
		//获取搜索条件值
		var beginAreaId=null;
		var endAreaId=null;
		var carTypeId=null;
		var goodsWeightStart=null;
		var goodsWeightEnd=null;
		var sendType=null;
		var totalPriceStart=null;
		var totalPriceEnd=null;
		var biddingState=null;
		
		var sendCount=null;
		var sendPrice=null;
		
		if(!$("#beginTown").attr("disabled")){
			beginAreaId = $("#beginTown").val();
			if(beginAreaId==-1){
				beginAreaId = $("#beginCity").val();
				if(beginAreaId==-1){
					beginAreaId = $("#beginProvince").val();
				}
			}
		}else{
			if(!$("#beginCity").attr("disabled")){
				beginAreaId = $("#beginCity").val();
				if(beginAreaId==-1){
					beginAreaId = $("#beginProvince").val();
				}
			}else{
				if(!$("#beginProvince").attr("disabled")){
					beginAreaId = $("#beginProvince").val();
					if(beginAreaId==-1){
						beginAreaId = $("#beginArea").val();
					}
				}else{
					beginAreaId = $("#beginArea").val();
				}
			}
		}
		
		if(!$("#endTown").attr("disabled")){
			endAreaId = $("#endTown").val();
			if(endAreaId==-1){
				endAreaId = $("#endCity").val();
				if(endAreaId==-1){
					endAreaId = $("#endProvince").val();
				}
			}
		}else{
			if(!$("#endCity").attr("disabled")){
				endAreaId = $("#endCity").val();
				if(endAreaId==-1){
					endAreaId = $("#endProvince").val();
				}
			}else{
				if(!$("#endProvince").attr("disabled")){
					endAreaId = $("#endProvince").val();
					if(endAreaId==-1){
						endAreaId = $("#endArea").val();
					}
				}else{
					endAreaId = $("#endArea").val();
				}
			}
		}
		
		$("#carTypeId .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				carTypeId = $(this).attr("data");
			}
		});
		
		$("#sendType .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				sendType = $(this).attr("data");
			}
		});
		
		$("#sendCount .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				sendCount = $(this).attr("data");
			}
		});
		if(sendCount==-1){
			
		}else if(sendCount==1){
			goodsWeightStart = 0;
			goodsWeightEnd = 1;
		}else if(sendCount==2){
			goodsWeightStart = 1;
			goodsWeightEnd = 5;
		}else if(sendCount==3){
			goodsWeightStart = 5;
			goodsWeightEnd = 10;
		}else if(sendCount==4){
			goodsWeightStart = 10;
			goodsWeightEnd = 20;
		}else if(sendCount==4){
			goodsWeightStart = 20;
		}
		
		$("#sendPrice .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				sendPrice = $(this).attr("data");
			}
		});
		if(sendPrice==-1){
			biddingState = 1;
		}else if(sendPrice==1){
			totalPriceStart = 0;
			totalPriceEnd = 5000;
		}else if(sendPrice==2){
			totalPriceStart = 5000;
			totalPriceEnd = 10000;
		}else if(sendPrice==3){
			totalPriceStart = 10000;
			totalPriceEnd = 15000;
		}else if(sendPrice==4){
			totalPriceStart = 15000;
		}
		
		if(beginAreaId==-1){
			beginAreaId = null;
		}
		if(endAreaId==-1){
			endAreaId = null;
		}
		
		var index = null;
		$.ajax({
			url:"${ctx}/logistics/zwb/json/findCar",
			type:"post",
			data:{
				"curPage":pageNum,
				"pageCount":pageSize,
				"carTypeId":carTypeId,
				"goodsWeightStart":goodsWeightStart,
				"goodsWeightEnd":goodsWeightEnd,
				"sendType":sendType,
				"totalPriceStart":totalPriceStart,
				"totalPriceEnd":totalPriceEnd,
				"biddingState":biddingState,
				"beginAreaId":beginAreaId,
				"endAreaId":endAreaId,
				"${_csrf.parameterName}":'${_csrf.token}'
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==50000){
					var total = result.jsonValue.totalCount;
					if(pageNum==1 && total!=null){
						$("#total").text(total);
						$("#totalUnit").text("辆");
						$("#kindUnit").text("车源");
					}
					$("#pageNum").val(Number(pageNum)+1);
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<tr>'
							+'<td width="5%">'
							+'<img src="https://www.zwb56.com'+info.carTypeIcon+'" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.beginAreaName+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+info.linesFlag+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+info.sendType+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.endAreaName+'</span>'
							+'</td>'
							+'<td width="20%" style="text-align:left;">'
							+'<span class="redLabel">载重:'+info.tonnage+'吨</span><br>'
							+'<span class="redLabel">车长:'+info.length+'米</span>'
							+'</td>'
							+'<td width="15%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
							+'<span class="resultName">'
							+'<div>'+info.carTypeName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<span class="resultTime">'+info.timeInfo+'</span>'
							+'</td>'
							+'<td width="5%">';
							if(info.isCollectionCar=="1"){
								_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}else{
								_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}
						_div += '</td>'
							+'<td width="10%">'
							+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
					}
					if((pageSize*pageNum)<total){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}
	
	function getWanjiGoodsList(){
		var index = null;
		
		$.ajax({
			url:"${ctx}/logistics/wanji/json/mylist",
			type:"post",
			data:{
				"${_csrf.parameterName}" : '${_csrf.token}'
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==1){	
					var list = result.jsonValue.Cargoes;
					var total = result.jsonValue1.Total;
					$("#total").text(total);
					$("#totalUnit").text("次");
					$("#kindUnit").text("货源");
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var Avatar = info.Avatar;
						var _div = "";
						if(i>5){
							_div += '<tr class="hidden">';
						}else{
							_div += '<tr>';
						}
						_div += '<td width="5%">'
							+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.SrcName+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+info.StrTypeCode+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+info.SubTypeName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.DestName+'</span>'
							+'</td>'
							+'<td width="20%">'
							+'<span class="redLabel">'+info.StrCount+'</span><br>'
							+'<span class="redLabel">'+info.LimCarLength1+'&nbsp;'+info.LimCarLength2+'&nbsp;'+info.LimCarLength2+'米</span>'
							+'</td>'
							+'<td width="15%">';
							if(Avatar == null || Avatar == ""){
								_div += '<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">';
							}else{
								_div += '<img src="'+Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">';
							}
							_div += '<span class="resultName">'
							+'<div>'+info.Contact+'</div>'
							+'<div width="37" style="display:block;" class="resultConnect">'+info.StrPrice+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultTime">'+info.StrCreateDt+'</span>'
							+'</td>'
							+'<td width="5%">'
							+'</td>'
							+'<td width="10%">'
							+'<span class="" >'+info.Phone+'</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
						
					}
					if(list.length>6){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					if(result.code==-2){
						layer.msg("亲，您还没登录！");
					}else if(result.code==4){
						layer.msg(result.msg);
					}
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}
	
	function getZwbGoodsList(){
		var index = null;
		$.ajax({
			url:"${ctx}/logistics/zwb/json/findGoods",
			type:"post",
			data:{
				"${_csrf.parameterName}" : '${_csrf.token}'
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==70000){	
					var list = result.value;
					var total = result.jsonValue.totalCount;
					$("#total").text(total);
					$("#totalUnit").text("次");
					$("#kindUnit").text("货源");
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var Avatar = info.Avatar;
						if(Avatar == null){
							Avatar = "${ctx}/static/image/logistics/headPortrait.png";
						}
						var _div = "";
						if(i>5){
							_div += '<tr class="hidden">';
						}else{
							_div += '<tr>';
						}
						_div += '<td width="5%">'
							+'<img src="https://www.zwb56.com'+info.supplyTypeIcon+'" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.startArea+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+info.bidding+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+info.sendType+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.endArea+'</span>'
							+'</td>'
							+'<td width="20%">'
							+'<span class="redLabel">'+info.weight+'吨</span><br>'
							+'<span class="redLabel">'+info.supplyTypeName+'</span>'
							+'</td>'
							+'<td width="15%">'
							+'<img src="'+Avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
							+'<span class="resultName">'
							+'<div>'+info.name+'</div>'
							+'<div width="37" style="display:block;" class="resultConnect">'+info.statusName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultTime">'+info.timeInfo+'</span>'
							+'</td>'
							+'<td width="5%">'
							+'</td>'
							+'<td width="10%">'
							+'<span class="" >'
							+'<img src="${ctx}/static/image/investigation/edit.png" title="编辑" style="cursor: pointer; padding:5px;width:25px;height:25px;" onclick="editZwbGoods('+info.id+')"/>'
							+'<img src="${ctx}/static/image/investigation/delete.png" title="删除" style="cursor: pointer;padding:5px;width:25px;height:25px;" onclick="deleteZwbGoods('+info.id+',this)"/>'
							+'</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
						
					}
					if(list.length>6){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					if(result.code==-2){
						layer.msg("亲，您还没登录！");
					}
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}
	
	function getWanjiCollectList(pageNum,pageSize){
		var index = null;
		$.ajax({
			url:"${ctx}/logistics/wanji/json/collectList",
			type:"post",
			data:{
				"${_csrf.parameterName}" : '${_csrf.token}',
				"pageSize" : pageSize ,
				"pageNum" : pageNum
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==1){
				    $("#pageNum").val(Number(pageNum)+1);
					var list = result.value;
					var total = result.jsonValue.total; 
					$("#total").text(total);
					$("#totalUnit").text("辆");
					$("#kindUnit").text("收藏车源");
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var carTypeName = info.carTypeName;
						var carLoadTypeName = info.carLoadTypeName;
						var avatar = info.driverAvatar;
						
						if(carTypeName == null){
							carTypeName = "";
						}
						if(carLoadTypeName == null){
							carLoadTypeName = "";
						}
						if(avatar == null){
							avatar = "${ctx}/static/image/logistics/headPortrait.png";
						}
						
						var _div = '<tr>'
							+'<td width="5%">'
							+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.curPlace+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+carTypeName+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+carLoadTypeName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">全国</span>'
							+'</td>'
							+'<td width="20%" style="text-align:left;">'
							+'<span class="redLabel">载重:'+info.carLoad+'吨</span><br>'
							+'<span class="redLabel">车长:'+info.carLength+'&nbsp;车宽:'+info.carWidth+'米</span>'
							+'</td>'
							+'<td width="15%" style="text-align:left;">'
							+'<img src="'+avatar+'" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
							+'<span class="resultName">'
							+'<div>'+info.driverName+'</div>';
							if(info.isAuth){
								_div += '<img src="${ctx}/static/image/logistics/authentication.png" width="37" style="display:block;">';
							}
						_div += '</span>'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<span class="resultTime">'+getTime(info.activeDate)+'</span>'
							+'</td>'
							+'<td width="5%">'
							+'<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">'
							+'</td>'
							+'<td width="10%">'
							+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
						
					}
					$("#getMore").show();
					if((pageSize*pageNum)<total){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					if(result.code==-2){
						layer.msg("亲，您还没登录！");
					}else if(result.code==4){
						layer.msg(result.msg);
					}
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}
	
	function getZwbCollectList(pageNum, pageSize){
		var index = null;
		$.ajax({
			url:"${ctx}/logistics/zwb/json/findCar",
			type:"post",
			data:{
				"curPage" : pageNum,
				"pageCount" : pageSize,
				"collectCar": "1",
				"${_csrf.parameterName}":'${_csrf.token}'
			},
			dataType:"json",
			beforeSend:function(){
				index = ityzl_SHOW_LOAD_LAYER(); 
		    },
			success:function(result){
				layer.close(index);
				if(result.code==50000){
					var total = result.jsonValue.totalCount;
					if(pageNum==1 && total!=null){
						$("#total").text(total);
						$("#totalUnit").text("辆");
						$("#kindUnit").text("收藏车源");
					}
					$("#pageNum").val(Number(pageNum)+1);
					var list = result.value;
					for(var i=0;i<list.length;i++){
						var info = list[i];
						var _div = '<tr>'
							+'<td width="5%">'
							+'<img src="https://www.zwb56.com'+info.carTypeIcon+'" width="62" height="62" style="margin:0 8px;">'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/currentLocation.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.beginAreaName+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<span class="resultConnect">'
							+'<div>'+info.linesFlag+'</div>'
							+'<img src="${ctx}/static/image/logistics/directionLine.png" width="60" height="5" style="display:block;">'
							+'<div>'+info.sendType+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%">'
							+'<img src="${ctx}/static/image/logistics/destination.png" width="30" height="30">'
							+'<span class="resultAdd">'+info.endAreaName+'</span>'
							+'</td>'
							+'<td width="20%" style="text-align:left;">'
							+'<span class="redLabel">载重:'+info.tonnage+'吨</span><br>'
							+'<span class="redLabel">车长:'+info.length+'米</span>'
							+'</td>'
							+'<td width="15%" style="text-align:left;">'
							+'<img src="${ctx}/static/image/logistics/headPortrait.png" width="50" height="50" style="border-radius:50%; overflow:hidden;">'
							+'<span class="resultName">'
							+'<div>'+info.carTypeName+'</div>'
							+'</span>'
							+'</td>'
							+'<td width="10%" style="text-align:left;">'
							+'<span class="resultTime">'+info.timeInfo+'</span>'
							+'</td>'
							+'<td width="5%">';
							if(info.isCollectionCar=="1"){
								_div += '<img src="${ctx}/static/image/logistics/alreadyCollect.png" class="collect" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}else{
								_div += '<img src="${ctx}/static/image/logistics/notCollected.png" width="20" height="20" style="cursor:pointer;" data='+JSON.stringify(info)+' onclick="collect(this)">';
							}
						_div += '</td>'
							+'<td width="10%">'
							+'<span class="detailsBtn" data='+JSON.stringify(info)+' onclick="detail(this)">查看详情</span>'
							+'</td>'
							+'</tr>';
						$("#list").append(_div);
					}
					if((pageSize*pageNum)<total){
						$("#getMore").show();
					}else{
						$("#getMore").hide();
					}
				}else{
					if(result.code==-2){
						layer.msg("亲，您还没登录！");
					}
					$("#getMore").hide();
				}
			},
			error:function(){
				layer.msg("列表加载失败，请刷新重试！");
			}
			
		});
	}

	function getMore(){
		var type = $("#type").val();
		var kind = $("#kind").val();
		var pageNum = $("#pageNum").val();
		if(kind==1){
			if(type==1){
				getWanjiCarList(pageNum,6,2);
			}else if(type==2){
				getZwbCarList(pageNum,6);
			}
		}else if(kind==3){
			if(type==1){
				getWanjiCollectList(pageNum,6);
			}else if(type==2){
				getZwbCollectList(pageNum,6);
			}
		}else{
			$("#list tr").each(function(){
				if($(this).hasClass("hidden")){
					$(this).removeClass("hidden");
				}
			});
			$("#getMore").hide(); 
		}
	}
	
	function detail(obj){
		$("#info").val("("+$(obj).attr("data")+")");
		$("#detailForm").attr("action","${ctx}/front/logistics/detail").submit();
	}
	
	function collect(obj){
	//	var info =  eval("("+$(obj).attr("data")+")");
		var info = JSON.parse($(obj).attr("data"));
		var type = $("#type").val();
		var kind = $("#kind").val();
		var carId = null;
		if(kind==1){
			carId = info.Id;
		}else if(kind==3){
			carId = info.carId;
		}
		if(type==1){
			var IsAuth;
			var IsCompany;
			var IsCarAuth;
			var Avatar;
			var ActiveDt= info.ActiveDt;
			if(kind==1){
				if(info.IsAuth){
					IsAuth = 1;
				}else {
					IsAuth = 0;
				}
				if(info.IsCompany){
					IsCompany = 1;
				}else{
					IsCompany = 0;
				}
				if(info.IsCarAuth){
					IsCarAuth = 1;
				}else{
					IsCarAuth = 0;
				}
				if(info.Avatar==""||info.Avatar==null){
					Avatar="";
				}
				ActiveDt=ActiveDt.substring(0,10);
			}
			
			if($(obj).hasClass("collect")){
				$.ajax({
					url:"${ctx}/logistics/wanji/json/cancelCollect",
					type:"post",
					data:{
						"carId":carId,
						"${_csrf.parameterName}" : '${_csrf.token}'
					},
					dataType:"json",
					success:function(result){
						if(result.code==1){
							$(obj).removeClass("collect");
							$(obj).attr("src","${ctx}/static/image/logistics/notCollected.png");
							if(kind==3){
								$(obj).parent().parent().remove();
							}
							info.isCollect = "false";
							$(obj).parent().next().children().attr("data",JSON.stringify(info));
							layer.msg("取消收藏成功！");
						}else if(result.code==-2){
							layer.msg("亲，您还没有登录")
						}else if(result.code==4){
							layer.msg(result.msg);
						}else{
							layer.alert(result.msg);
						}
					},
					error:function(){
						layer.alert("操作异常，请刷新重试！");
					}
				});
				
			}else{
				$.ajax({
					url:"${ctx}/logistics/wanji/json/collectCar",
					type:"post",
					data:{
						"carId":carId,
						"activeDt":ActiveDt,
						"plateNum" : info.PlateNum,
						"isAuth" : IsAuth,
						"isCompany" : IsCompany,
						"isCarauth" : IsCarAuth,
						"carWidth" : info.CarWidth,
						"carLength" : info.CarLength,
						"carLoad" : info.CarLoad,
						"carLoadTypeName" :info.CarLoadTypeName,
						"carTypeName" : info.CarTypeName,
						"driverAvatar":info.Avatar,
						"driverName":info.Name,
						"driverId":info.DriverId,
						"driverTelphone" : info.Telphone,
						"curPlace":info.CurPlace,
						"${_csrf.parameterName}" : '${_csrf.token}'
					},
					dataType:"json",
					success:function(result){
						if(result.code==1){
							$(obj).addClass("collect");
							$(obj).attr("src","${ctx}/static/image/logistics/alreadyCollect.png");
							layer.msg("收藏成功！");
							info.isCollect = "true";
							$(obj).parent().next().children().attr("data",JSON.stringify(info));
						}else if(result.code==-2){
							layer.msg("亲，您还没有登录")
						}else if(result.code==4){
							layer.msg(result.msg);
						}else{
							layer.alert(result.msg);
						}
					},
					error:function(){
						layer.alert("操作异常，请刷新重试！");
					}
				});
			}
		}else{
			if($(obj).hasClass("collect")){
				$.ajax({
					url:"${ctx}/logistics/zwb/json/cancelCollect",
					type:"post",
					data:{
						"carSourceId":info.id,
						"${_csrf.parameterName}" : '${_csrf.token}'
					},
					dataType:"json",
					success:function(result){
						if(result.code==50013){
							$(obj).removeClass("collect");
							$(obj).attr("src","${ctx}/static/image/logistics/notCollected.png");
							if(kind==3){
								$(obj).parent().parent().remove();
							}
							info.isCollectionCar = 0;
							$(obj).parent().next().children().attr("data",JSON.stringify(info));
							layer.msg("取消收藏成功！");
						}else if(result.code==-2){
							layer.msg("亲，您还没有登录")
						}else{
							layer.alert(result.msg);
						}
					},
					error:function(){
						layer.alert("操作异常，请刷新重试！");
					}
				});
				
			}else{
				$.ajax({
					url:"${ctx}/logistics/zwb/json/collectCar",
					type:"post",
					data:{
						"carSourceId":info.id,
						"${_csrf.parameterName}" : '${_csrf.token}'
					},
					dataType:"json",
					success:function(result){
						if(result.code==50005){
							$(obj).addClass("collect");
							$(obj).attr("src","${ctx}/static/image/logistics/alreadyCollect.png");
							layer.msg("收藏成功！");
							info.isCollectionCar = 1;
							$(obj).parent().next().children().attr("data",JSON.stringify(info));
						}else if(result.code==-2){
							layer.msg("亲，您还没有登录")
						}else{
							layer.alert(result.msg);
						}
					},
					error:function(){
						layer.alert("操作异常，请刷新重试！");
					}
				});
			}
		}
		
	}
	
	//long类型时间转换
	function getTime(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ?( '0' + date.getDate() ) : date.getDate() ) + ' ';
		h = (date.getHours() < 10 ?( '0' + date.getHours() ) : date.getHours() ) + ':';
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() );
		/* s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() ); */
		return (Y + M + D + h + m );
	}
	
	function selectTag(id, obj){
		$("#"+id+" .searchOptions").each(function(){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}
		});
		$(obj).addClass("selected");
	}
	
	function search(){
		var type = $("#type").val();
		$("#list").empty();
		if(type==1){
			getWanjiCarList(1,6,2);
		}else if(type==2){
			getZwbCarList(1,6);
		}
	}
	
	function editZwbGoods(goodsId){
		window.location.href="${ctx}/front/logistics/edit?type=2&goodsId="+goodsId;
	}
	
	function deleteZwbGoods(goodsId,obj){
		layer.confirm("确认删除？",function(){
			$.ajax({
				url:"${ctx}/logistics/zwb/json/delGoods",
				type:"get",
				data:{"goodsId":goodsId},
				success:function(result){
					if(result.code==-2){
						layer.msg(result.msg);
					}else if(result.code==40000){
						layer.msg("货源删除成功！");
						$(obj).parent().parent().parent().remove();
					}else{
						layer.alert(layer.msg);
					}
				}
			});
		},function(){});
	}
	
</script>

</body>
</html>
