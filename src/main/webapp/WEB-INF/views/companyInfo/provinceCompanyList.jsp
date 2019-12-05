<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<%@ include file="../common/commonDataTables.jsp"%>
<head>
<title>企业列表</title>
<style>
.dataTables_processing {
	display: none;
}

#DataTables_Table_0_info {
	margin-left: 9px; padding-top: 12px;
}

#DataTables_Table_0_paginate {
	margin-right: 9px; padding-top: 4px;
}

.top_4px_line {
	background-color: #fff; border-color: #e7eaec; border-style: solid solid none; border-width: 4px 0 0; padding: 10px 15px;
}

#DataTables_Table_0 {
	width: 100% !important;
}

.dataTables_wrapper>.row:last-of-type {
	margin: 0 2px; background-color: #f3f3f4;
}
.dataTables_wrapper {
    padding-bottom: 5px;
}
.row .col-sm-6:nth-child(1){
	width:50%;
}
.row .col-sm-6:nth-child(2){
	width:100%;
}
</style>
</head>
<body style="background-color: #f3f3f4;">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins" style="margin-bottom: 0;">
			<div class="ibox-content top_4px_line">
				<!-- 搜索栏 -->
				<div class="searchBox margin_bottom_10">
					<div class="row">
						<div class="col-sm-9 col-xs-9">
							<input type="text" placeholder="企业名称" class="form-control" id="companyName">
						</div>
						<span class="input-group-btn">
							<button type="button" class="btn btn-success" onclick="getCompanyList(true);">
								<i class="fa fa-search"></i>搜索
							</button>
						</span>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover dataTables-example" style="text-align: center;">
					<div style="color: red;">
						【${orgName}】累计企业<span id="manageCompanyListCount">${data.total}</span>家<span id="searchTotal"></span>。
					</div>
					<!-- ，其中规上${num1}家，投产${num2}家。 -->
					<thead>
						<tr>
							<th>企业名称</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<form method="post" id="deleteForm" action="${ctx}/login/page/companyInfo/delete">
		<input type="hidden" id="companyId" name="companyId" />
		<input type="hidden" name="orgId" value="${orgId}" />
	</form>
</body>
<script>
	var compIds = [];
	$(document).ready(function(){
		try {
			compIds =  JSON.parse('${compIds}');
		} catch (e) {
			
		}
		getCompanyList(false);
	});
	function getCompanyList(isReload){
		param = {};
		param.orgId = "${orgId}";
		param.level = "${level}";
		param.treeType = "${treeType}";
		if("${orgId}"=="1245"){
			param.onlyNew = "1";
		}
		if (isReload) {
			if ($("#companyName").val() != "") {
				param.companyName = $("#companyName").val();
			}
		}
		var columns = [ {
			"render" : function(data, type, row, meta){
				var compId = row.companyId+"";
				return "<div onclick='view(\"" + nvlStr(row.companyId) + "\");'>" + nvlStr(row.companyName) +($.inArray(compId, compIds)>=0?"&nbsp;&nbsp;<font title='新版企业数据' color='red'>new</font>":"")+ "</div>";
			}
		} ];
		//${officeUrl}
		dataTableInit("${officeUrl}XOffice/interface/json/officeCompanyInfo/companyList", param, columns, isReload,
			function(result){
			// 				$("#searchTotal").html("，共检索到企业" + nvlStr(result.total, "0") + "家");
			});
	}
	function clearSearch(){
		$("#companyName").val("");
		$("#industryType").val("");
		getCompanyList(true);
	}
	//触发企业画像事件
	function view(id){
		var link = '';
		switch ('${parkId}') {
			case '1058':
				link = 'gxIndex';
				break;
			case '32914188':
				link = 'yzyyIndex';
				break;
			case '1262':
				link = 'lcIndex';
				break;
			case '1251':
				link = 'thIndex';
				break;
			case '1245':
				link = 'jianIndex';
				break;
		    default: 
		    	link = "jgsIndex";
		}
		parent.parent.location.href = "${ctx}/front/cityDataCenter/"+link+"/${index}?companyId="+id;
	}
	/* 非空字符串 */
	function nvlStr(str, value){
		if (str == null || str == undefined || str == "undefined") {
			return value != null && value != undefined ? value : "";
		}
		return str;
	}
</script>
</html>