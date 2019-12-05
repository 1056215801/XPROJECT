<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="commonPage.jsp"%>
<!-- Data Tables -->
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css?v=3.3.6"/>
<link href="${ctx}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<script src="${ctx}/static/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${ctx}/static/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/js/utils/XUtils.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/style.min.css?v=4.1.0"/>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" />
<style>
th, tr {
	text-align: left;
}

h5 a {
	margin-left: 5px;
}

.top_4px_line {
	background-color: #fff; border-color: #e7eaec; border-style: solid solid none; border-width: 4px 0 0; padding: 10px 15px;
}

.dataTables_processing {
	display: none;
}

#dataTable_info {
	margin-left: 11px; padding-top: 12px;
}

#dataTable_paginate {
	margin-right: 9px; padding-top: 4px;
}

#dataTable, #dataTable0, #dataTable1, #dataTable2, #dataTable3 {
	width: 100% !important; margin-bottom: 0px !important;
}

.dataTables_wrapper>.row:last-of-type {
	margin: 0 2px; background-color: #f3f3f4;
}
</style>
<!-- 表格规范样式 -->
<style>
.table {
	border: none;
}

.table tr th {
	text-align: center; border-left: none; border-right: none; background-color: #02385A !important; color: #fff;
}

.table tr td {
	text-align: center; border-left: none !important; border-right: none !important; vertical-align: middle !important;
}
</style>
<!-- 搜索框&按钮控制 -->
<style>
.searchBox {
	float: right; width: 100%; background-color: #EDEDED; padding: 15px 25px 10px 25px;
}

.margin_bottom_10 {
	margin-bottom: 10px;
}

.margin_bottom_20 {
	margin-bottom: 20px;
}

.margin_bottom_50 {
	margin-bottom: 50px;
}

.btn-group>button, .btn-group>a {
	margin-right: 7px;
}

.hideBtn {
	display: inline-block; padding: 6px 12px; margin-right: 10px; font-size: 14px; vertical-align: middle; cursor: pointer;
}
</style>
<script>
//获取企业挂点领导挂点干部信息
function getGdCompInfo(){
	if("${parkId}"=="1226"){
		$(".gdCompName").on("mouseover", function(){
			var compId = $(this).attr("compId");
			var title = nvlStr($(this).attr("title"));
			var obj = this;
			if (title == "") {
				title = $(this).html();
				$.ajax({
					url : "${ctx}/interface/json/officeCompanyInfo/detail",
					type : "post",
					data : {
						"companyId" : compId,
					},
					dataType : "json",
					success : function(result){
						if (result.success) {
							var info = result.value;
							var extend = result.extendInfo;
							if (info != undefined) {
								title += "\n挂点领导：";
							}
							if (extend != undefined) {
								var phone1 = nvlStr(extend.gdldPhone);
								var phone2 = nvlStr(extend.gdgbPhone);
								if(phone1!=""){
									phone1 = "("+phone1+")";
								}
								if(phone2!=""){
									phone2 = "("+phone2+")";
								}
								title += nvlStr(extend.gdldNames) +phone1+"\n挂点干部：" + nvlStr(extend.gdgbNames)+phone2;
							} else {
								title += "\n挂点干部："
							}
							$(obj).attr("title", title);
						}
					},
					error : function(){}
				});
			}
		});
	}
}


	/**
	 * dataTable异步分页初始化	(注:json中data数组命名为list)
	 * @param url				获取json数据url
	 * @param param				封装ajax参数
	 * @param columns			数组,描述列与json数据的对应关系 例如[{"data":"id"},{"data":"name"}]
	 * @param isReload			重新获取数据
	 * @param successFun		成功回调方法,自定义,没有为null
	 * @return
	 */
	
	function dataTableInit(url, param, columns, isReload, successFunc) {
		$('.dataTables-example').dataTable({
			"destroy": isReload,
			"searching": false, //本地搜索
			"lengthChange": false, //改变每页显示数量
			"ordering": false, //本地排序
			"serverSide": true, //服务器模式
			"processing": true, //显示处理中
			"bAutoWidth": true,
			// "bStateSave":true,//保存状态
			"ajax": function (data, callback, settings) {
				param.limit = data.length; //每页显示数量
				param.start = data.start; //开始项
				$.ajax({
					url: url,
					type: "post",
					data: param,
					dataType: "json",
					success: function (result) {
						var returnData = {};
						returnData.draw = data.draw;
						returnData.recordsTotal = result.total;
						returnData.recordsFiltered = result.total;
						returnData.data = result.list;
						if (successFunc != null) {
							successFunc(result);
						}
						callback(returnData);
					}
				});
			},
			"columns": columns,
			"fnDrawCallback": function () { //绘制后回调
// 				$(".i-checks").iCheck({
// 					checkboxClass: "icheckbox_square-green",
// 					radioClass: "iradio_square-green",
// 				});
				appendSkipPage_withoutid();
			}
		});
		

	}

	//根据ID给table赋值
	function dataTableInitWithId(tableId, url, param, columns, isReload,
		successFunc) {
		$('#' + tableId).dataTable({
			"destroy": isReload,
			"searching": false, //本地搜索
			"lengthChange": false, //改变每页显示数量
			"ordering": false, //本地排序
			"serverSide": true, //服务器模式
			"processing": true, //显示处理中
			"bAutoWidth": true,

			"ajax": function (data, callback, settings) {
				param.limit = data.length; //每页显示数量
				param.start = data.start; //开始项
				$.ajax({
					url: url,
					type: "post",
					data: param,
					dataType: "json",
					success: function (result) {
						var returnData = {};
						returnData.draw = data.draw;
						returnData.recordsTotal = result.total;
						returnData.recordsFiltered = result.total;
						returnData.data = result.list;
						if (successFunc != null) {
							successFunc(result);
						}
						callback(returnData);
					}
				});
			},
			"columns": columns,
			"fnDrawCallback": function () { //绘制后回调
				$(".i-checks").iCheck({
					checkboxClass: "icheckbox_square-green",
					radioClass: "iradio_square-green",
				});
				appendSkipPage(tableId);
			}
		});
	}

	//根据ID给table赋值(防止页数溢出)
	function dataTableInitWithIdNew(tableId, url, param, columns, isReload,
		successFunc, fnDrawFunc) {
		var iDisplayStart = param.pageNum == undefined ? 0 :
			((param.pageNum - 1) * 10);
		$('#' + tableId)
			.dataTable({
				"destroy": isReload,
				"searching": false, //本地搜索
				"lengthChange": false, //改变每页显示数量
				"ordering": false, //本地排序
				"serverSide": true, //服务器模式
				"processing": true, //显示处理中
				"bAutoWidth": true,
				"iDisplayStart": iDisplayStart, //跳转指定页

				"ajax": function (data, callback, settings) {
					var formData = $( '#searchForm' ).formToArray( null, [], null );
					if ( typeof formData !== 'undefined' ) {
						$.each( formData, function( i, d ) {
							param[d.name] = d.value;
						} );
					}
					param.limit = data.length; //每页显示数量
					param.start = data.start; //开始项
					$.ajax({
						url: url,
						type: "post",
						data: param,
						dataType: "json",
						success: function (result) {
							if (iDisplayStart >= result.total &&
								result.total != 0) { //跳转行数超过总数
								param.pageNum = parseInt((result.total - 1) / 10 + 1);
								dataTableInitWithIdNew(
									tableId, url,
									param, columns,
									true, successFunc,
									fnDrawFunc);
							} else {
								var returnData = {};
								returnData.draw = data.draw;
								returnData.recordsTotal = result.total;
								returnData.recordsFiltered = result.total;
								returnData.data = result.list;
								if (successFunc != null) {
									successFunc(result);
								}
								callback(returnData);
							}
						}
					});
				},
				"columns": columns,
				"fnDrawCallback": function () { //绘制后回调
					if (fnDrawFunc != null) {
						fnDrawFunc();
					}
					appendSkipPage(tableId);
				}
			});
		$(".dataTables-example tbody").on("click", "tr", function () {
			$(this).find("input").iCheck('toggle');
		});
	}

	/**
	 * 批量删除
	 * @param idsId				存放ids参数的input对象
	 * @param formId			提交删除表单的form对象
	 * @param name              勾选框name
	 * @return
	 */
	function commonBatchDelete(idsId, formId) {
		var ids = "";
		$('tbody input:checked').each(function () {
			if (ids != "") {
				ids += ",";
			}
			ids += $(this).val();
		});
		if (ids != "") {
			$("#" + idsId).val(ids);
			layerConfirm("是否确认删除？", function () {
				$("#" + formId).submit();
			});
		} else {
			layerTips("没有任何选择项");
		}
	}

	function batchDelete(idsId, formId, name) {
		var ids = "";
		$('tbody input[name="' + name + '"]:checked').each(function () {
			if (ids != "") {
				ids += ",";
			}
			ids += $(this).val();
		});
		if (ids != "") {
			$("#" + idsId).val(ids);
			layerConfirm("是否确认删除？", function () {
				$("#" + formId).submit();
			});
		} else {
			layerTips("没有任何选择项");
		}
	}

	/**
	 * 批量操作
	 * @param idsId				存放ids参数的input对象
	 * @param submitFunc		操作
	 * @param isLayer			是否弹出确认提示
	 * @param msg				提示内容
	 * @return
	 */
	function batchOperate(idsId, submitFunc, isLayer, msg) {
		var ids = "";
		$("tbody input:checked").each(function () {
			if (ids != "") {
				ids += ",";
			}
			ids += $(this).val();
		});
		if (ids != "") {
			$("#" + idsId).val(ids);
			if (isLayer) {
				layerConfirm(msg, function () {
					updatePage();
					submitFunc();
				});
			} else {
				submitFunc();
			}
		} else {
			layerAlert("请选择要操作的对象");
		}
	}

	/**
	 * 初始化表头
	 * @param tableId			表Id
	 * @param isCheck			是否有勾选框
	 * @param titleArray		表头数组
	 * @return
	 */
	function initTableHead(tableId, isCheck, titleArray) {
		var _div = "";
		for (var i = 0; i < titleArray.length; i++) {
			var title = nvlStr(titleArray[i]);
			var len = title.length;
			var width = len * 15;
			_div += "<th " + (len < 3 ? "style='min-width:" + width + "px;' " : "") + ">" + title + "</th>";
		}
		if (isCheck) {
			_div = "<th><input type=\"checkbox\" class=\"i-checks\" id=\"allCheck\"/></th>" +
				_div;
			//_div = "<th><input type=\"checkbox\" id=\"allCheck\" onclick=\"checkAll(this.checked);event.cancelBubble = true;\" /></th>" + _div;
		}
		_div = "<thead><tr>" + _div + "</tr></thead><tbody></tbody>";
		$("#" + tableId).append(_div);
	}

	function initTableHeadCustom(tableId, isCheck, titleArray, widthArray) {
		var _div = "";
		for (var i = 0; i < titleArray.length; i++) {
			var title = nvlStr(titleArray[i]);
			if (widthArray != null && widthArray.length > i) {
				var width = widthArray[i];
				_div += "<th " + "width='" + width + ";' " + ">" + title + "</th>";
			} else {
				_div += "<th>" + title + "</th>";
			}
		}
		if (isCheck) {
			_div = "<th width='50px;'><input type=\"checkbox\" class=\"i-checks\" id=\"allCheck\"/></th>" +
				_div;
		}
		_div = "<thead><tr>" + _div + "</tr></thead><tbody></tbody>";
		$("#" + tableId).append(_div);
	}


	/* 初始化全选 */
	function initCheckAll() {
		var th = $(".dataTables-example th").get(0);
		$(th).empty();
		$(th)
			.append(
				"<input type=\"checkbox\" class=\"i-checks\" id=\"allCheck\"/>");
		$(".i-checks").iCheck({
			checkboxClass: "icheckbox_square-green",
			radioClass: "iradio_square-green"
		});
		$('#allCheck').on('ifChecked', function (event) {
			$('tbody input').iCheck('check');
		});
		$('#allCheck').on('ifUnchecked', function (event) {
			$('tbody input').iCheck('uncheck');
		});

	}

	/**
	 * 查看时获取附件列表 无删除按钮 只作查看用
	 */
	function getAttachmentListForView(atIdList, attListLabelId, attIdLabelId) {
		getAttachmentList(atIdList, attListLabelId, attIdLabelId, "view");
	}

	function getAttachmentList(atIdList, attListLabelId, attIdLabelId, acType) {
		//附件编辑时展示
		if (atIdList != null && atIdList != "" && atIdList != undefined) {
			$.post("${ctx}/login/json/attachment/selectListByAttachmentIdList",
				"attachmentIdList=" + atIdList,
				function (datas) {
					var data = eval('(' + datas + ')');
					for (var i = 0; i < data.attachments.length; i++) {
						showAtts(data.attachments[i], attListLabelId,
							attIdLabelId, acType);
					}
				}, "json");
		}
	}

	//上传后显示已上传附件列表
	function showAtts(jsonData, attListLabelId, attIdLabelId, acType) {
		var url = "";
		/* url += '<li id="'+jsonData.attachmentId+'"><a href="'+jsonData.attachmentUrl+'" target="_blank" >'
		+ jsonData.remoteName
		+ '</a>'; */
		url += '<li id="' + jsonData.attachmentId + '"><a href="javascript:;" onclick="preview(\'' +
			jsonData.attachmentId +
			'\')">' +
			jsonData.remoteName +
			'</a>';

		if (acType == "edit") {
			url += '&nbsp;<a href="javascript:;"  onclick="deleteAtt(\'' +
				jsonData.attachmentId + '\',\'' + attIdLabelId +
				'\')">[删除]</a>';
		}
		url += '</li>';
		$('#' + attListLabelId).append(url);
	}

	//更新页码
	function updatePage() {
		$("#pageNum").val($(".paginate_button.active a").html());
	}

	//封装初始化方法
	function initCommonDataTable(id, titles, isCheck, url, param, columns,
		isReload, successFunc, fnDrawFunc) {
		//初始化标题
		if (!isReload) {
			var _div = "";
			for (var i = 0; i < titles.length; i++) {
				_div += "<th>" + titles[i] + "</th>";
			}
			if (isCheck) {
				_div = "<th><input type=\"checkbox\" class=\"i-checks\" id=\"allCheck\"/></th>" +
					_div;
			}
			_div = "<thead><tr>" + _div + "</tr></thead><tbody></tbody>";
			$("#" + id).append(_div);
		}
		//获取数据
		var start = param.pageNum == undefined ? 0 : ((param.pageNum - 1) * 10);
		$('#' + id)
			.dataTable({
				"destroy": isReload,
				"searching": false, //本地搜索
				"lengthChange": false, //改变每页显示数量
				"ordering": false, //本地排序
				"serverSide": true, //服务器模式
				"processing": true, //显示处理中
				"bAutoWidth": true,
				"iDisplayStart": start, //跳转指定页
				"columns": columns,
				"ajax": function (data, callback, settings) {
					param.limit = data.length; //每页显示数量
					param.start = data.start; //开始项
					$
						.ajax({
							url: url,
							type: "post",
							data: param,
							dataType: "json",
							success: function (result) {
								if (start >= result.total &&
									result.total != 0) { //跳转行数超过总数
									param.pageNum = parseInt((result.total - 1) / 10 + 1);
									initCommonDataTable(id,
										titles, isCheck,
										url, param,
										columns, isReload,
										successFunc,
										fnDrawFunc);
								} else {
									var returnData = {};
									returnData.draw = data.draw;
									returnData.recordsTotal = result.total;
									returnData.recordsFiltered = result.total;
									returnData.data = result.list;
									if (successFunc != null) {
										successFunc();
									}
									callback(returnData);
								}
							}
						});
				},
				"fnDrawCallback": function () { //绘制后回调
					if (isCheck) {
						//初始化全选
						$("#allCheck").iCheck('uncheck');
						var th = $("#" + id + " th").get(0);
						$(th).empty();
						$(th)
							.append(
								"<input type=\"checkbox\" class=\"i-checks\" id=\"allCheck\"/>");
						$(".i-checks")
							.iCheck({
								checkboxClass: "icheckbox_square-green",
								radioClass: "iradio_square-green"
							});
						$('#allCheck').on(
							'ifChecked',
							function (event) {
								$('tbody input')
									.iCheck('check');
							});
						$('#allCheck').on(
							'ifUnchecked',
							function (event) {
								$('tbody input').iCheck(
									'uncheck');
							});
					}

					if (fnDrawFunc != null) {
						fnDrawFunc();
					}
					appendSkipPage(id);
				}
			});
		//点击行勾选
		if (isCheck) {
			$("#" + id + " tbody").on("click", "tr", function () {
				$(this).find("input").iCheck('toggle');
			});
		}
	}

	//可展开搜索框
	function hideOper() {
		if ($("#hideBar").css("display") == "none") {
			$("#hideBar").slideDown();
			$("#hideBtn").html("<i class='fa fa-minus'></i>&nbsp;收起")
		} else {
			$("#hideBar").slideUp();
			$("#hideBtn").html("<i class='fa fa-plus'></i>&nbsp;展开")
		}
	}

	function appendSkipPage(tableId) {
		var table = $('#' + tableId).dataTable();
		var tableSetings = table.fnSettings();
		var paging_length = tableSetings._iDisplayLength; //当前每页显示多少  
		var page_start = tableSetings._iDisplayStart; //当前页开始的数据项  
		var page_last = (tableSetings.fnRecordsTotal()); //得到总数据项
		var page = (page_start / paging_length); //得到当前页码-1
		var page_total = Math.ceil(page_last / paging_length); //得到最后一页页码
		//添加跳转组件
		var jumpbtn =
			$("<li class='paginate_button' style='margin-right:10px;float:left;'>" +
				"   <div class='input-group' style='margin-left:2px;'>" +
				"       <span class='input-group-addon' style='padding:0px 5px;background-color:#fff;font-size: 12px;'>共" +page_total+"页 跳至第</span>" +
				"       <input type='text' class='form-control' style='text-align:center;padding: 8px 2px;height:29px;width:40px;border:1px solid #E5E6E7;' />" +
				"       <span class='input-group-addon' style='padding:0px 5px;background-color:#fff;font-size: 12px;'>页</span>" +
				"       <span class='input-group-addon' style='padding:0px 6px;'><a href='javascript:void(0)' style='color:#686B6D;'> Go </a></span>" +
				"   </div>" +
				"</li>")
		jumpbtn.find("input").off('keyup').on('keyup', function () {
			this.value = this.value.length == 1 ? this.value.replace(/[^1-9]/g, '1') : this.value.replace(/\D/g, '');
			if (this.value > page_total) {
				$(this).val(page_total);
			}
		});
		jumpbtn.find("a").on("click", function () {
			var pn = "";
			pn = $(this).parent().parent().find("input").val();
			if(pn){
				// console.log($(this).parent().parent().find("input").val());
				--pn;
				table.fnPageChange(pn);
			}
			
		});
		jumpbtn.find("input").bind('keypress',function(event){
			if(event.keyCode == 13)      {  
				if($(this).val()){
					var pn="";
					pn=$(this).val();
					--pn;
					table.fnPageChange(pn);
				} 
			}  
		});
		if(page_total>1){
			$(".previous").before(jumpbtn);
		}
	}
	function appendSkipPage_withoutid() {
		var table = $(".dataTables-example").dataTable();
		var tableSetings = table.fnSettings();
		var paging_length = tableSetings._iDisplayLength; //当前每页显示多少  
		var page_start = tableSetings._iDisplayStart; //当前页开始的数据项  
		var page_last = (tableSetings.fnRecordsTotal()); //得到总数据项
		var page = (page_start / paging_length); //得到当前页码-1
		var page_total = Math.ceil(page_last / paging_length); //得到最后一页页码
		//添加跳转组件
		var jumpbtn =
			$("<li class='paginate_button' style='margin-right:10px;float:left;'>" +
				"   <div class='input-group' style='margin-left:2px;'>" +
				"       <span class='input-group-addon' style='padding:0px 5px;background-color:#fff;font-size: 12px;'>共" +page_total+"页 跳至第</span>" +
				"       <input type='text' class='form-control' style='text-align:center;padding: 8px 2px;height:29px;width:40px;border:1px solid #E5E6E7;' />" +
				"       <span class='input-group-addon' style='padding:0px 5px;background-color:#fff;font-size: 12px;'>页</span>" +
				"       <span class='input-group-addon' style='padding:0px 6px;'><a href='javascript:void(0)' style='color:#686B6D;'> Go </a></span>" +
				"   </div>" +
				"</li>")
		jumpbtn.find("input").off('keyup').on('keyup', function () {
			this.value = this.value.length == 1 ? this.value.replace(/[^1-9]/g, '1') : this.value.replace(/\D/g, '');
			if (this.value > page_total) {
				$(this).val(page_total);
			}
		});
		jumpbtn.find("a").on("click", function () {
			var pn = "";
			pn = $(this).parent().parent().find("input").val();
			if(pn){
				// console.log($(this).parent().parent().find("input").val());
				--pn;
				table.fnPageChange(pn);
			}
		});
		jumpbtn.find("input").bind('keypress',function(event){
			if(event.keyCode == 13)      {  
				if($(this).val()){
					var pn="";
					pn=$(this).val();
					--pn;
					table.fnPageChange(pn);
				} 
			}  
		});
		if(page_total>1){
			$(".previous").before(jumpbtn);
		}		
	}
</script>