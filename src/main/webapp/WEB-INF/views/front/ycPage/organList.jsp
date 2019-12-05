<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<%@ include file="../common/page.jsp"%><!-- 前端分页 -->
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>服务机构</title>
<%-- <link href="${ctx}/static/css/projectDeclare/buttons.css"
	rel="stylesheet" /> --%>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<%-- 	
<link href="${ctx}/static/css/pagination/pagination.css" rel="stylesheet" /> --%>
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet" />
</head>

<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
			<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<div class="project_content_header">
			<div class="container newNav">
			     <div class="newNavSub">
			     	<img src="${ctx}/static/image/homePage_yc/projectDsc.png" />
			     </div>
			    <div class="newNavSub">
			    	<p class="navTitle">服务机构</p>
			    	<p><font class="projectNum" id="projectNum1">0</font>&nbsp;
				   <font id="font1">家</font> &nbsp;&nbsp; <font id="font2">服务机构入驻</font></p>
			     </div>
			</div>
		</div>
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9">
						<div class="artical-list">
							<div class="titleName">
								<ul style="display: inline-block;">
									<li class="on" id="li1">宜春</li>
									<li id="li2">江西省</li>
									<li id="li3">我发布的</li>
								</ul>
								<div class="searchBar">
									<input type="text" id="searchKey" name="searchKey" placeholder="标题关键字" style="border-radius: 4px;border: 1px solid #e1e1e1;"/>
									<img src="${ctx}/static/image/homePage_yc/seach.png" width="15" onclick="search()">
								</div>
								<input type="hidden" id="type" value="0" /> <input
									type="hidden" id="pageNum" value="1" />
							</div>
							<div class="searchKeyBox">
								<div class="searchKeys searchKeys1">
										<div class="searchOptions"><span>分类</span></div>
										<div class="searchOptions options" id="declareGrade1">
											<div class="optionBtn selected" value=""
												onclick="selectByKey(this,'',1);">全部</div>
										</div>
										<div class="searchOptions open">展开</div>
									</div>
								<div class="searchKeys searchKeys2" style="display: none">
									<div class="searchOptions"><span>地域</span></div>
									<div class="searchOptions options" id="declareGrade2"></div>
								</div>
							</div>	
							<div class="title-items">
								<div class="title-content" id="set0">
									<div id="ycList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize0"></div>
										<div class="m-style M-box0"></div>
									</div>
								</div>
								<div class="title-content" id="set1" style="display: none;">
									<div id="allList"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize1"></div>
										<div class="m-style M-box1"></div>
									</div>
								</div>
								<div class="title-content" id="set2" style="display: none;">
									<div id="mylist"></div>
									<div class="fz0">
										<div class="pageSize" id="pageSize2"></div>
										<div class="m-style M-box2"></div>
									</div>
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
<script src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script> 
<script type="text/javascript">
	var provinceId = 360000;
	var spaceId = '';
	var serviceKind = '';
	var selectType = '1';//1标识服务类别搜索 2标识地域搜索
	var institutionName = "";
	if ('${entranceId}' == '3609009') {
		areaId = 360900;
	}
	var isBox0 = true
	var isBox1 = true;
	var isBox2 = true;
	var spaceId = '';
	if($(".searchKeyBox").height() < 40){$(".open").hide();}        //判断是否要展开
	else { $(".searchKeyBox").css("height","45px");}
	
	$(".open").on("click",function() { //展开收起筛选项
		$(this).toggleClass("on");
		var $l = 0;
		$(".options").each(function(){ $l += $(this).height() + 10;})
		if($(this).hasClass("on")) { 
			$(".searchKeyBox").css("height", $l + 'px');
			$(".open").text("收起");
		}
		else { 
			$(".searchKeyBox").css("height","45px");
			$(".open").text("展开");
		}
	})
	$(function() {
		getTypeList();
		if ('${entranceId}' == '3609009') {
			$('#li1').show();
			$("#li2").removeClass("on");
			$("#li1").addClass("on");
			$('#set0').show();
			$('#set1').hide()
			$("#type").val('0');
			$('.searchKeys2').hide();
		} else {
			$('#li1').hide();
			$("#li1").removeClass("on");
			$("#li2").addClass("on");
			$('#set0').hide();
			$('#set1').show();
			$("#type").val('1');
			$('.searchKeys2').show();
		}
		if('${entranceId}'==3600009){
			$(".nav-content a:eq(3)").addClass("on");
			$("#thirdMenu p:eq(2) a:eq(2)").addClass("on");
		}else{
			$(".nav-content a:eq(2)").addClass("on");
			$(".second-menu p:eq(2) a:eq(2)").addClass("on");
		}
		
		$(".source-room a").removeClass("on");
		$(".source-room a:eq(13)").addClass("on");
		$(".fir-floor").show()
		$(".publish-btn h1").text('发布机构')
		if ('${accountId}' != '' && '${organizationType}' == 3) {
			$(".publish-btn-pic").show();
		}
		
		//加载地址
		getArea();
		$(".fr li").eq(1).addClass("on");
		$(".titleName li").on(
				"click",
				function() { //大项目tab切换
					var $ind = $(this).index();
					if ($ind == 2) {
						areaId = '';
						spaceId = '';
						serviceKind = '';
						if ('${accountId}' == '') {
							layer.msg('亲，您还没登录!');
							return;
						}
						isBox2 = true;
						$('.searchKeys2').hide();
					} else if ($ind == 1) {
						areaId = '';
						serviceKind = '';
						isBox1 = true;
						$('.searchKeys2').show();
					} else if ($ind == 0) {
						areaId = '360900';
						serviceKind = '';
						isBox0 = true;
						$('.searchKeys2').hide();
					}
					$(".searchKeys1 .optionBtn").removeClass("selected");
					$(".searchKeys1 .optionBtn:eq(0)").addClass("selected");
					$(".searchKeys2 .optionBtn").removeClass("selected");
					$(".searchKeys2 .optionBtn:eq(0)").addClass("selected");
					$(".searchKeys3 .optionBtn").removeClass("selected");
					$(".searchKeys3 .optionBtn:eq(0)").addClass("selected");
					$(
					".title-content:eq(" + $ind+ ") .searchKeys .optionBtn:eq(0)").addClass("selected");
					var kindId = "";
					$(".searchKeys1 .optionBtn").each(function() {
						var $ind2 = $(this).text().indexOf("(");
						var t = $(this).text().substring(0, $ind2)
						if ($ind2 > -1) {
							$(this).text(t)
						}
					})
					$(".searchKeys2 .optionBtn").each(function() {
						var $ind2 = $(this).text().indexOf("(");
						var t = $(this).text().substring(0, $ind2)
						if ($ind2 > -1) {
							$(this).text(t)
						}
					})
					$(".searchKeys3 .optionBtn").each(function() {
						var $ind2 = $(this).text().indexOf("(");
						var t = $(this).text().substring(0, $ind2)
						if ($ind2 > -1) {
							$(this).text(t)
						}
					})
					$("#type").val($ind);
					getInfoList(1, 10, $ind);

					$(this).addClass("on").siblings().removeClass("on");
					$("#set" + $ind).siblings().fadeOut("fast");
					setTimeout(function() {
						$("#set" + $ind).fadeIn("fast");
					}, 200);
					var $l = 0;    //判断是否要展开
					$(".options").each(function(){$l += $(this).height() + 10;
					})
					$(".open").removeClass("on").text("展开");
					if($l < 40){$(".open").hide();} 
					else { $(".searchKeyBox").css("height","45px"); $(".open").show();}
				});
		$(document).on("click", function(e) {
			$('.organ_phone').fadeOut();
		});

		if ('${entranceId}' == '3609009') {
			getInfoList(1, 10, 0);
		} else {
			getInfoList(1, 10, 1);
		}

		var msg = '${message}';
		if (msg != null && msg != "") {
			tips(msg);
			msg = null;
		}
		//回车触发搜索事件
		$("#searchKey").bind('keydown', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});
	});
	function getDetail(id) {
		window.open ("${ctx}/organ/detail/" + id + '?entranceId='+ '${entranceId}' ,'_blank');
		
	}
	function picChange() {
		window.location.href = "${ctx}/personalCenter/companyEdit";
	}
	function getTypeList() {
		$.ajax({
			   url : "${urlPath}XOffice/interface/json/serviceKindInfo/list",
				type : "post",
				data : {
					"parkId" : '',
				},
				dataType : "json",
				success : function(result) {
					var list = result.value;
					if (result.success) {
						for (var i = 0; i < list.length; i++) {
							var _div = '<div class="optionBtn" onclick="selectByKey(this,\''
									+ list[i].kindId
									+ '\');">'
									+ list[i].kindName + '</div>';
							$('#declareGrade1').append(_div);
						}

					}
				}
			})
	}
	function getArea() {
		var areaList = [ {
			title : "全省",
			value : "360000",
		}, {
			title : "南昌市",
			value : "360100",
		}, {
			title : "景德镇市",
			value : "360200",
		}, {
			title : "萍乡市",
			value : "360300",
		}, {
			title : "九江市",
			value : "360400",
		}, {
			title : "新余市",
			value : "360500",
		}, {
			title : "鹰潭市",
			value : "360600",
		}, {
			title : "赣州市",
			value : "360700",
		}, {
			title : "吉安市",
			value : "360800",
		}, {
			title : "宜春市",
			value : "360900"
		}, {
			title : "抚州市",
			value : "361000"
		}, {
			title : "上饶市",
			value : "361100"
		} ];
		for (var i = 0; i < areaList.length; i++) {
			var map = areaList[i];
			var _div = "";
			if (map.title == '全省') {
				_div += '<div class="optionBtn selected" value=\'' + map.value
						+ '\'  onclick="selectByKey2(this,' + map.value
						+ ');">'
			} else {
				_div += '<div class="optionBtn" value=\'' + map.value
						+ '\'  onclick="selectByKey2(this,' + map.value
						+ ',2);">'

			}
			_div += map.title
			_div += '</div>'
			$('#declareGrade2').append(_div);
		}

	}
	function add() {
		if ('${accountId}' == '') {
			tips('亲，您还没有登录');
			return;
		} else {
			if ('${organizationType}' == 3) {
				if ('${isComplete}' == 'true') {
					window.location.href = "${ctx}/organ/edit?entranceId=${entranceId}";
				} else {
					layer.msg('请注册企业信息！')
				}

			} else {
				layer.msg('不是企业账号不能发布！')
			}

		}

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
	function getInfoList(pageNum, pageSize, type) {
		if (areaId == '360000') {
			areaId = '';
		}
		$('#pageNum').val(pageNum);
		var number = $('#pageNum').val();
		$.ajax({
					url : "${urlPath}XOffice/interface/json/serviceInstitutionInfo/list",
					type : "post",
					data : {
						"pageNum" : pageNum,
						"pageSize" : pageSize,
						"instPrId" : provinceId,
						"instAreaId" : areaId,
						"instSpaceId" : spaceId,
						"serviceKindId" : serviceKind,
						"institutionName": institutionName,
						"orderByClause" : "create_time desc",
						"accountId" : type == 2 ? '${accountId}' : '',
						"type" : '0'
					},
					dataType : "json",
					success : function(result) {
						if (result.code == -1) {
							if (type == 0 && pageNum == 1) {
								$('#ycList').empty();
							} else if (type == 1 && pageNum == 1) {
								$('#allList').empty();
							} else if (type == 2 && pageNum == 1) {
								$('#mylist').empty();
							}
						} else if (result.code == 2) {
							if (type == 0) {
								$('#ycList')
										.html(
												'<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							} else if (type == 1) {
								$('#allList')
										.html(
												'<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							} else if (type == 2) {
								$('#mylist')
										.html(
												'<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
							}
							$('#getmoreAllActi').hide();
							$('#getmoreAllActii').hide();
						} else if (result.code == -2) {
							layer.msg(result.msg);
							if (type == 0 && pageNum == 1) {
								$('#ycList').empty();
							} else if (type == 1 && pageNum == 1) {
								$('#allList').empty();
							} else if (type == 2 && pageNum == 1) {
								$('#mylist').empty();
							}
							$('#getmoreYcActi').hide();
							$('#getmoreAllActi').hide();
							$('#getmoreAllActii').hide();
						} else {
							var list = result.value;
							var total = result.total;
							$('#projectNum1').text(total);
							$(".optionBtn").each(
									function() {
										if ($(this).hasClass("selected")
												&& pageNum == 1) {
											if (result.total == 0) {
												var $ind = $(this).text()
														.indexOf("(");
												var t = $(this).text()
														.substring(0, $ind)
												if ($ind > -1) {
													$(this).text(t)
												}
												$(this).text($(this).text());
											} else {
												var $ind = $(this).text()
														.indexOf("(");
												var t = $(this).text()
														.substring(0, $ind)
												if ($ind > -1) {
													$(this).text(t)
												}
												$(this).text(
														$(this).text() + "("
																+ result.total
																+ ")");
											}

										}
									})
							if (type == 0) {
								$('#ycList').empty();
							} else if (type == 1) {
								$('#allList').empty();
							} else if (type == 2) {
								$('#mylist').empty();
							}
							if (list.length > 0) {
								for (var i = 0; i < list.length; i++) {
									var info = list[i];
									var _div = "";
									_div += '<div class="declareDataBar">'
									_div += '<a target="_blank"  href="${ctx}/organ/detail/'+info.id+'?entranceId=${entranceId}" style="font-size:0;">'
									_div += '<img src="'+info.logoUrl+'" style="border: 1px solid #ccc;">'
									_div += '<div class="text-box organ-box">'
									_div += '<div class="text-box_title" style="margin-left:10px;">'
									_div += '<div class="title-text"><div class="declareTitle" style="font-weight: bold;">'
									_div += '</span>' + info.institutionName
											+ '</div>'
									_div += '<div class="declareData">'
									_div += '<img src="/XProject/static/image/experienceSharing/browseCount.png">'
									if (info.viewCount1) {
										_div += '<font style="border:none;">浏览量：'
												+ (Number(info.viewCount) + Number(info.viewCount1))
												+ '</font>&nbsp;&nbsp;'

									} else {
										_div += '<font style="border:none;">浏览量：'
												+ info.viewCount
												+ '</font>&nbsp;&nbsp;'
									}
									_div += '<img src="/XProject/static/image/homePage_yc/position.png">'
									if (info.instPrName) {
										_div += '<font>' + info.instPrName
												+ '</font>'
									}
									if (info.instAreaName) {
										_div += '<font>' + info.instAreaName
												+ '</font>'
									}
									if (info.instSpaceName) {
										_div += '<font>' + info.instSpaceName
												+ '</font>'
									}
									_div += '<div class="organType">'
									_div += '<p>服务类别：'
											+ (info.serviceKindName ? info.serviceKindName
													: '') + '</p>'
									_div += '</div>'
									_div += '<div class="organType">'
									_div += '<p>擅长领域：' + info.researchDirection
											+ '</p>'
									_div += '</div></div></div></div></div>'
									_div += '<div class="organ-box-3">'
									_div += '<div class="organ_phone" style="display:none;"><p>'
											+ info.contactName
											+ '：'
											+ info.contactPhone + '</p></div>'
									_div += '<div class="organ_red organ_red1" onclick="getDetail(\''
											+ info.id + '\')">查看详情</div>'
									if (type == 2) {
										_div += '<div class="organ-edit">'
										_div += '<span onclick="editOrgan(\''
												+ info.id + '\')">编辑</span>'
										_div += '<span onclick="deleteOrgan(\''
												+ info.id + '\')">删除</span>'
										_div += '</div>'
									} else {
										_div += '<div class="organ_red organ_red2" onclick="getPhone(this,'
												+ info.contactPhone
												+ ')">立即联系</div>'

									}
									_div += '</div>'
									_div += '</a>'
									_div += '</div>'
									if (type == 0) {
										if (number * 10 < result.total && pageNum ==1) {
											if(isBox0){
											 isBox0 = false;
											 showPagination('.M-box0',result.total,getInfoList,type);
											}
											$('#pageSize0').show();
											$('#pageSize0').html('共检索到'+result.total+' 条数据，每页10条');
									} else if(number * 10 >= result.total && pageNum ==1){
										$('.M-box0').hide();
										$('#pageSize0').hide();
									}
										$('#ycList').append(_div);
									} else if (type == 1) {
										if (number * 10 < result.total && pageNum ==1) {
												if(isBox1){
													 isBox1 = false;
													 showPagination('.M-box1',result.total,getInfoList,type);
												}
												$('#pageSize1').show();
												$('#pageSize1').html('共检索到'+result.total+' 条数据，每页10条');
										} else if(number * 10 >= result.total && pageNum ==1){
											$('.M-box1').hide();
											$('#pageSize1').hide();

										}
										$('#allList').append(_div);
									} else if (type == 2) {
										if (number * 10 < result.total && pageNum ==1) {
											if(isBox2){
												 isBox2 = false;
												 showPagination('.M-box2',result.total,getInfoList,type);
											}
											$('#pageSize2').show();
											$('#pageSize2').html('共检索到'+result.total+' 条数据，每页10条');
									} else if(number * 10 >= result.total && pageNum ==1){
										$('.M-box2').hide();
										$('#pageSize2').hide();

									}
										$('#mylist').append(_div);
									}
								}
								$(".organ_red2").on('click',function(){
						             return false;
						         });
								$(".organ-edit").on('click',function(){
						             return false;
						         })
						         $(".organ_red1").on('click',function(){
						             return false;
						         })
							} else {
								if (type == 0) {
									$('.M-box0').hide();
									$('#pageSize0').hide();
									$('#ycList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
								} else if (type == 1) {
									$('.M-box1').hide();
									$('#pageSize1').hide();
									$('#allList').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
								} else if (type == 2) {
									$('.M-box2').hide();
									$('#pageSize2').hide();
									$('#mylist').html('<div style="width:100%; text-align: center; padding: 100px 0;"><span class="renovateTitle">暂无更多信息</span></div>');
								}

							}

						}
					},
					error : function() {
						//tips("请求超时，请稍后重试");
					},
				});
	}
	function search(){
		$("#pageNum").val("1")
		var type = $('#type').val();
		if(type==0){
			isBox0 = true;
		}else if(type==1){
			isBox1 = true;
		}else{
			isBox2 = true;
		}
		institutionName = $('#searchKey').val();
		getInfoList(1, 10, type);
	}
	function getPhone(a, contactPhone) {
		$('.organ_phone').fadeOut();
		$(a).siblings('.organ_phone').fadeIn();
	}
	function selectByKey(obj, kind) {
		$("#pageNum").val("1")
		var type = $('#type').val();
		var pageNum = Number($("#pageNum").val());
		$(".searchKeys1 .optionBtn").removeClass("selected");
		$(".searchKeys1 .optionBtn").each(function() {
			var $ind = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind)
			if ($ind > -1) {
				$(this).text(t)
			}
			if(type==0){
				isBox0 = true;
			}else if(type==1){
				isBox1 = true;
			}else{
				isBox2 = true;
			}
		})
		$(obj).addClass("selected");
		serviceKind = kind
		$("#declareGrade1 .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
			}
			isBox1 = true;
		});
		getInfoList(pageNum, 10, type);
	}

	function selectByKey2(obj, id) {
		$("#pageNum").val("1")
		var pageNum = Number($("#pageNum").val());
		var type = $('#type').val();
		$(".searchKeys2 .optionBtn").removeClass("selected");
		$(".searchKeys2 .optionBtn").each(function() {
			var $ind = $(this).text().indexOf("(");
			var t = $(this).text().substring(0, $ind)
			if ($ind > -1) {
				$(this).text(t)
			}
			if(type==0){
				isBox0 = true;
			}else if(type==1){
				isBox1 = true;
			}else{
				isBox2 = true;
			}
		})
		$(obj).addClass("selected");
		areaId = id;
		$("#declareGrade2 .optionBtn").each(function() {
			if ($(this).hasClass("selected")) {
			}
			isBox1 = true;

		});
		getInfoList(pageNum, 10, type);
	}
	function deleteOrgan(id) {//删除我发布的机构
		confirm(
				'确认删除？',
				function(index) {
					$
							.ajax({
								url : '${urlPath}XOffice/interface/json/serviceInstitutionInfo/delete',
								type : 'post',
								data : {
									'ids' : id
								},
								dataType : 'json',
								success : function(data) {
									$('#myList').empty();
									getInfoList(1, 10, 2);
								},
								error : function() {
									layer.msg(data.errorMsg);
								}
							});

				}, function() {
				});

	}
	function editOrgan(id) {//进入编辑界面
		window.location.href = "${ctx}/organ/edit?entranceId=${entranceId}"
				+ '&id=' + id;
	}
	function getmore() {
		var pageNum = Number($("#pageNum").val()) + 1;
		var type = $('#type').val();
		if (type == 0) {
			getInfoList(pageNum, 10, type);
		} else if (type == 1) {
			getInfoList(pageNum, 10, type);
		} else if (type == 2) {
			areadId = '';
			serviceKind = '';
			getInfoList(pageNum, 1, type);
		}
	}
</script>
</html>
