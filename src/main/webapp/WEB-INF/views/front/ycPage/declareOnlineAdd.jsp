<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage_front.jsp"%>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit"  />  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目申报</title>
<link href="${ctx}/static/css/projectDeclare/buttons.css"rel="stylesheet"/>
<link href="${ctx}/static/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/css/homePage/homePage_yc.css" rel="stylesheet"/>
<style>
.application-form h1{
    margin: 10px auto 0;
    color: #000;
    font-size: 25px;
    font-weight: bold;
    text-align: center;
}
.application-form .tipText{
    text-align: left;
    color:#ff0000;
    padding-bottom: 10px;
    padding-top: 40px;
}
.form-content {
    width:100%;
}
.form-control[readonly] {
    background: none;
}
.tableTip {
	width: 100%;
	color: #000;
	margin-bottom: 5px;
}
.tableTipLeft {float: left;}
.tableTipRight {float: right;}
.form-content table{
    width: 100%;
    border-collapse :collapse 
}
.form-content table+.tableTip {margin-top: 10px;}
.form-content table+table {margin-top: 20px;}
.form-content tr{
    width: 100%;
    height: 50px;
}
.form-content tr td{
    position: relative;
    border: 1px solid #e7eaec;
    font-size:14px;
    padding: 12px 5px;
    vertical-align: middle;
}
.td10 {width: 10%;}
.td15{width: 15%;}
.td23 {width: 23.33%;}
.td33 {width: 33.33%;}
.td35{width: 35%;}
.td85{width: 85%;}
.td90 {width: 90%;}
.td100 {width: 100%;}
.dataName {
	color: #333;
    font-weight: bold;
    text-align: center;
    background: rgba(230,230,230,0.5);
}
.dataValue {}
.tac {text-align: center;}
.dataTitle {
	color: #333;
    font-weight: bold;
    text-align: center;
}
.form-content .input-content{
    border: 1px solid #A9A9A9;
    margin-left: 10px;
    padding-left: 5px;
    height: 30px;
    width: 84%;
    color: #333;
    text-align: left;
}
.form-content .area-content {
	border: 1px solid #A9A9A9;
    margin-left: 10px;
    text-indent: 7px;
    width: 84%;
    color: #333;
    text-align: left;
    overflow: hidden;
}

.sumbitBtn {
    margin: 25px 0;
    width: 100%;
    position: relative;
    text-align: center;
}
.blueBtnContral {
	float: left;
	color: #fff;
	cursor: pointer;
	font-weight: bold;
	background-color: #2d8bff;
	border: 1px solid #2d8bff;
	border-radius: 5px;
	height: 42px;
	width: 142px;
	padding: 3px 0;
	margin-right: 28px;
}
.greenBtnContral {
	background-color: rgba(102, 204, 153, 1);
	border: 1px solid rgba(102, 204, 153, 1);
	margin-right: 0px;
}
</style>
</head>
<body>
	<div class="project_main">
		<c:import url="/headerSelect" charEncoding="UTF-8">
		 	<c:param name="entranceId" value="${entranceId}" />
		</c:import>
		<!-- 所属模块，必填 --><input type="hidden" id="moduleId" value="90020171109144912000062000000008"/>
		<!-- 附件备注，选填 --><input type="hidden" id="attachementRemark" value="项目申报" />
		<div class="project_artical">
			<div class="container main-content">
				<div class="row articals">
					<div class="col-md-9" style="background-color: #fff;">
						<form action="" id="form">
							<div class="title-content" id="set0" >
                                <div class="artical-content" style="border: none">
                                    <div class="releaseItem">
										<div class="application-form noprint" id="application-form">
											<h1>宜春市项目申请表</h1>
											<p class="tipText">* 备注：本项目申报表用于项目申报预审，相关信息需如实填报，申报项目时需提供证明材料，发现弄虚作假行为将影响项目申报。</p>
											<div class="form-content">
												<form id="cloudForm">
													<input type="hidden" id="logId" name="logId" value=""/>
													<div class="tableTip clearfix">
														<div class="tableTipLeft">类型：市产业促进引导资金项目</div>
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr>
															<td class="td15 dataName" colspan="2"><span>填报单位</span></td>
															<td class="td35 dataValue" colspan="2">
																<input id="rootName" type="text" class="input-content" name="rootName" value="${rootName}" maxlength="64">
															</td>
															<td class="td15 dataName" colspan="2"><span>填报时间</span></td>
															<td class="td35 dataValue" colspan="2">
																<!-- <input id="reportTime" class="form-control layer-date input-content" name="reportTime" readonly/> -->
																<input class="form-control input-content jedateGroup wicon max" id="reportTime" name="reportTime" fmt="YYYY-MM-DD">
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="2">项目名称</td>
															<td class="td35 dataValue" colspan="2">
																<input id="projectName" type="text" class="input-content" name="projectName" maxlength="128">
															</td>
															<td class="td15 dataName" colspan="2">建设地点</td>
															<td class="td35 dataValue" colspan="2">
																<input id="address" type="text" class="input-content" name="address" maxlength="128">
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="2">联系人姓名及职务</td>
															<td class="td35 dataValue" colspan="2">
																<input id="contactInfo" type="text" class="input-content" name="contactInfo" maxlength="64">
															</td>
															<td class="td15 dataName" colspan="2">联系人电话</td>
															<td class="td35 dataValue" colspan="2">
																<input id="contactPhone" type="text" class="input-content" name="contactPhone" maxlength="64">
															</td>
														</tr>
													</table>
													<div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr><td class="td100 dataTitle" colspan="6">一、企业基本情况</td></tr>
														<tr>
															<td class="td10 dataName" colspan="1">所有制形式</td>
															<td class="td23 dataValue" colspan="1">
																<input id="ownership" type="text" class="input-content" name="ownership" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">注册资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="registerCapital" type="text" class="input-content" name="registerCapital" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')"  maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">实缴注册资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="realCapital" type="text" class="input-content" name="realCapital"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">银行信用等级</td>
															<td class="td23 dataValue" colspan="1">
																<input id="creditRating" type="text" class="input-content" name="creditRating" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">长期贷款余额</td>
															<td class="td23 dataValue" colspan="1">
																<input id="loanBalance" type="text" class="input-content" name="loanBalance" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')"  maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">资产负债率(%)</td>
															<td class="td23 dataValue" colspan="1">
																<input id="zcfzPercent" type="text" class="input-content" name="zcfzPercent" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')"  maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">研发投入比(%)</td>
															<td class="td23 dataValue" colspan="1">
																<input id="yftrPercent" type="text" class="input-content" name="yftrPercent" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')"  maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">企业总资产</td>
															<td class="td23 dataValue" colspan="1">
																<input id="totalAssets" type="text" class="input-content" name="totalAssets" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')"  maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">企业员工总数</td>
															<td class="td23 dataValue" colspan="1">
																<input id="employeesCount" type="text" class="input-content" name="employeesCount" oninput="value=value.replace(/[^\d]/g,'')"  maxlength="10">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">法人代表</td>
															<td class="td23 dataValue" colspan="1">
																<input id="legalPerson" type="text" class="input-content" name="legalPerson" maxlength="32">
															</td>
															<td class="td10 dataName" colspan="1">法人联系方式</td>
															<td class="td23 dataValue" colspan="1">
																<input id="legalPhone" type="text" class="input-content" name="legalPhone" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1"></td>
															<td class="td23 dataValue" colspan="1"></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">获得各方面的主要荣誉</td>
															<td class="td90 dataValue" colspan="5">
																<textarea id="honor" class="area-content" rows="3" name="honor" maxlength="2000"></textarea >
															</td>
														</tr>
													</table>
													<table style="margin-top: -1px;">
														<tr>
															<td class="td10 dataName" colspan="1" rowspan="2">近三年指标情况</td>
															<td class="td30 dataValue tac" colspan="2">2017年</td>
															<td class="td30 dataValue tac" colspan="2">2018年</td>
															<td class="td30 dataValue tac" colspan="2">2019年（预计）</td>
														</tr>
														<tr>
															<td class="td15 dataValue tac" colspan="1">总值</td>
															<td class="td15 dataValue tac" colspan="1">同比(%)</td>
															<td class="td15 dataValue tac" colspan="1">总值</td>
															<td class="td15 dataValue tac" colspan="1">同比(%)</td>
															<td class="td15 dataValue tac" colspan="1">总值</td>
															<td class="td15 dataValue tac" colspan="1">同比(%)</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">主营业务销售收入</td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue1" type="text" class="input-content" name="zyywsrValue1" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent1" type="text" class="input-content" name="zyywsrPercent1" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue2" type="text" class="input-content" name="zyywsrValue2" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent2" type="text" class="input-content" name="zyywsrPercent2" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue3" type="text" class="input-content" name="zyywsrValue3" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent3" type="text" class="input-content" name="zyywsrPercent3" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">利润</td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue1" type="text" class="input-content" name="lrValue1"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent1" type="text" class="input-content" name="lrPercent1"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue2" type="text" class="input-content" name="lrValue2"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent2" type="text" class="input-content" name="lrPercent2"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue3" type="text" class="input-content" name="lrValue3"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent3" type="text" class="input-content" name="lrPercent3"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">税收</td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue1" type="text" class="input-content" name="ssValue1"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent1" type="text" class="input-content" name="ssPercent1"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue2" type="text" class="input-content" name="ssValue2"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent2" type="text" class="input-content" name="ssPercent2"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue3" type="text" class="input-content" name="ssValue3"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent3" type="text" class="input-content" name="ssPercent3"  oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2"></td>
														</tr>
													</table>
													<div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr><td class="td100 dataTitle" colspan="6">二、项目基本情况</td></tr>
														<tr>
															<td class="td10 dataName" colspan="1">所属产业</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="" type="text" class="input-content" name=""> -->
																<select id="industrytype" class="input-content" name="industrytype">
																	<option value="0">节能环保</option>
																	<option value="1">新能源</option>
																	<option value="2">新材料</option>
																	<option value="3">生物和新医药</option>
																	<option value="4">航空产业</option>
																	<option value="5">先进装备制造</option>
																	<option value="6">新一代信息技术</option>
																	<option value="7">锂电及电动汽车</option>
																	<option value="8">绿色食品</option>
																	<option value="9">其它</option>
																</select>
															</td>
															<td class="td10 dataName" colspan="1">项目建设起止年月</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="startMonth" class="form-control layer-date input-content" style="display: inline-block; width: 70%; margin-left: 0;" name="startMonth" readonly/> -->
																<span>起：</span><input class="form-control input-content jedateGroup wicon" style="display: inline-block; width: 70%; margin-left: 0;" id="startMonth" name="startMonth" fmt="YYYY-MM">
																<!-- <input id="endMonth" class="form-control layer-date input-content" style="display: inline-block; width: 70%; margin-left: 0;" name="endMonth" readonly/> -->
																<span>止：</span><input class="form-control input-content jedateGroup wicon" style="display: inline-block; width: 70%; margin-left: 0;" id="endMonth" name="endMonth" fmt="YYYY-MM">
															</td>
															<td class="td10 dataName" colspan="1">项目性质</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="" type="text" class="input-content" name=""> -->
																<select id="projectType" class="input-content" name="projectType">
																	<option value="0">新建</option>
																	<option value="1">技改</option>
																</select>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">开工状态</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="" type="text" class="input-content" name=""> -->
																<select id="workStatus" class="input-content" name="workStatus">
																	<option value="0">新开-未开工</option>
																	<option value="1">新开-已开工</option>
																	<option value="2">新开-已完工</option>
																	<option value="3">续建-在建</option>
																	<option value="4">续建-部分投产</option>
																	<option value="5">续建-完工投产</option>
																</select>
															</td>
															<td class="td10 dataName" colspan="1">项目形象进度</td>
															<td class="td23 dataValue" colspan="1">
																<span>完成投资</span><input id="finishInvest" type="text" class="input-content" name="finishInvest" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" style="width: calc(84% - 80px); margin: 0 5px;" maxlength="12" precision="2"><span>万元</span>
																<span>形象进度</span><input id="progress" type="text" class="input-content" name="progress" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" style="width: calc(84% - 80px); margin: 0 5px;" maxlength="12" precision="2"><span>(%)</span>
															</td>
															<td class="td10 dataName" colspan="1">资金申请年度</td>
															<td class="td23 dataValue tac" colspan="1">
																<span id="thisYear">2019年</span>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">总投资</td>
															<td class="td23 dataValue" colspan="1">
																<input id="totalInvest" type="text" class="input-content" name="totalInvest" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">固定资产投资</td>
															<td class="td23 dataValue" colspan="1">
																<input id="fixedInvest" type="text" class="input-content" name="fixedInvest" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">铺底流动资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="floorMoney" type="text" class="input-content" name="floorMoney" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">自有资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="selfMoney" type="text" class="input-content" name="selfMoney" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">银行贷款</td>
															<td class="td23 dataValue" colspan="1">
																<input id="bankLoan" type="text" class="input-content" name="bankLoan" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">其他资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="otherMoney" type="text" class="input-content" name="otherMoney" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">项目核准/备案文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="approvalNum" type="text" class="input-content" name="approvalNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">银行贷款落实文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="loanNum" type="text" class="input-content" name="loanNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">符合的重点方向</td>
															<td class="td23 dataValue" colspan="1">
																<input id="keyDirect" type="text" class="input-content" name="keyDirect" maxlength="64">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">土地审批文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="landNum" type="text" class="input-content" name="landNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">城市规划文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="cityNum" type="text" class="input-content" name="cityNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">申请扶持资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="supportMoney" type="text" class="input-content" name="supportMoney" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">环评审批文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="environmentNum" type="text" class="input-content" name="environmentNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">节能评估报告</td>
															<td class="td23 dataValue" colspan="1">
																<input id="energyNum" type="text" class="input-content" name="energyNum" maxlength="64">
															</td>
															<td class="td10 dataName" colspan="1">申请扶持方式</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="" type="text" class="input-content" name=""> -->
																<select id="supportType" class="input-content" name="supportType">
																	<option value="0">委托贷款</option>
																	<option value="1">信托贷款</option>
																	<option value="2">可转债</option>
																	<option value="3">商业保理</option>
																	<option value="4">定向融资工具</option>
																	<option value="5">与基金管理人及社会资本合作设立专项基金</option>
																	<option value="6">符合法律法规及监管政策的其他运作方式</option>
																</select>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">近三年获市级财政性资金支持情况</td>
															<td class="td90 dataValue" colspan="5">
																<textarea id="supportDesc" class="area-content" rows="3" name="supportDesc" maxlength="2000"></textarea >
															</td>
														</tr>
													</table>
													<div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr><td class="td100 dataTitle" colspan="6">三、建成后预计效果</td></tr>
														<tr>
															<td class="td10 dataName" colspan="1">新增销售收入</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addXssr" type="text" class="input-content" name="addXssr" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">新增利润</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addLr" type="text" class="input-content" name="addLr" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
															<td class="td10 dataName" colspan="1">新增税收</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addSs" type="text" class="input-content" name="addSs" oninput="value=value.match(/^[+-]?\d*\.?\d{0,2}/,'')" maxlength="12" precision="2">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">新增出口创汇</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addCkch" type="text" class="input-content" name="addCkch" oninput="value=value.match(/^[+-]?\d*\.?\d{0,4}/,'')" maxlength="12" precision="4">
															</td>
															<td class="td10 dataName" colspan="1">新增就业人数</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addJyrs" type="text" class="input-content" name="addJyrs" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1"></td>
															<td class="td23 dataValue" colspan="1"></td>
														</tr>
													</table>
													<!-- <div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div> -->
													<table>
														<tr><td class="td100 dataTitle" colspan="6">四、HR信息</td></tr>
														<tr>
															<td class="td10 dataName" colspan="1">管理人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue1" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1">销售人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue2" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1">工程师以上总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue3" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">技术研发人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue4" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1">生产人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue5" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1">大专学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue6" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">本科学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue7" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td10 dataName" colspan="1">硕士及以上学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue8" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10">
															</td>
															<td class="td33 dataValue tac" colspan="2">
																<span>企业总人数：</span><span id="peopleNum">0</span><span>人</span>
															</td>
														</tr>
													</table>
													<!-- <div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div> -->
													<table>
														<tr><td class="td100 dataTitle" colspan="6">五、项目内容</td></tr>
														<tr>
															<td class="td15 dataName" colspan="1">企业主营业务、主要产品和销售规模、主营业务收入在国内和省内行业排名</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content1" class="area-content" rows="4" name="content1" maxlength="2000"></textarea >
															</td>
															<td class="td15 dataName" colspan="1">项目采用主要技术及来源，技术的产业化程度</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content2" class="area-content" rows="4" name="content2" maxlength="2000"></textarea >
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="1">项目主要产品及规模</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content3" class="area-content" rows="4" name="content3" maxlength="2000"></textarea >
															</td>
															<td class="td15 dataName" colspan="1">企业现有研发平台，企业主要研发技术及专利</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content4" class="area-content" rows="4" name="content4" maxlength="2000"></textarea >
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="1">项目主要建设内容</td>
															<td class="td85 dataValue" colspan="3">
																<textarea id="content5" class="area-content" rows="4" name="content5" maxlength="2000"></textarea >
															</td>
														</tr>
													</table>
												</form>
												<div class="sumbitBtn">
													<input type="button" value="提交申请" onclick="formSubmit(1)" class="blueBtnContral greenBtnContral" id="sumbitApply" style="float: none;"> 	
													<input type="button" value="保存草稿" onclick="formSubmit(0)" class="blueBtnContral" id="draftApply" style="float: none;"> 
													<div style="clear:both;"></div>
												</div>
											</div>
										</div>
                                    </div>	
								</div>
                            </div>
						</form>
						<%-- <form action="${ctx}/projectDeclare/applySaveToYc" id="form">
							<input type="hidden" id="atUrlList" name="atUrlList"/> 
							<input type="hidden" id="atIdList" name="atIdList"/> 
							<input type="hidden" id="declareId" name="declareId" value="${declareId }"/>
							
							<div class="enterprise_input">
								<div class="enterprise_attr" style="margin-left:15px;">附件</div>
								<div id="fileUpload" style="float: left; margin-left: 15px;">
									<input type="button" value="上传附件" class="uploadAttachBtn" id="file_uploads" name="file_uploads">
									<span id="fileQueues"></span>
								</div>
								<div style="clear: both;"></div>
								<div style="margin-left:80px;" id="attList"></div>
							</div>
						</form> --%>
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
$(function(){
	$(".nav-content a:eq(4)").addClass("on");
	$(".source-room a").removeClass("on");
	/* $(".fir-floor").show();
	$(".publish-btn h1").text('在线申请'); */
	
	$(".artical-tab p").on("click",function(){          //大项目tab切换
		 var $ind = $(this).index();
		 $(this).addClass("on").siblings().removeClass("on");
		 $("#tab"+$ind).siblings().fadeOut("fast");
		 setTimeout(function(){ $("#tab"+$ind).fadeIn("fast");},200);
		 if($(this).index() == 2 && '${accountId}' == ''){
			tips("亲，请先登陆哦！");
			$("#myGetmoreAllActi").hide();
		 }
	});
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	
	initJedate();
	
	//资金申请年度获取默认年份
	var date = new Date();
	$("#thisYear").text(date.getFullYear()+"年")
	
	var today=formatDate(date,"yyyy-MM-dd");
	$("#reportTime").val(today);
	//动态加载HR信息企业总人数
	$("#employeesCount").change(function(){
		$("#peopleNum").text($("#employeesCount").val());
	});
	isGetDraftInfo();
});

//重载退出登录 回到项目申报列表 
function logout(){
	 $.post("${ctx}/session/logout", {'ajax': 1}, function (data) {
	        	 $('#nologin').show();
	             $('#login').hide();
	             $('#userName').html('');
	             restoreSession();
		         window.location.href = "${ctx}/declare/list?entranceId=3609009";
	     }); 
}

function sumCheck(value){
	if(value != "" && value != undefined){
		return Number(value);
	}else {
		return Number(0);
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
	
var ajaxFlag = 0;
function formSubmit(status){
	if(status == 1){
		var rootName = $("#rootName").val();
		if(rootName == "" || rootName == undefined){
			tips('请输入填报单位');
			return false;
		}
		var reportTime = $("#reportTime").val();
		if(reportTime == "" || reportTime == undefined){
			tips('请输入填报时间');
			return false;
		}
		var projectName = $("#projectName").val();
		if(projectName == "" || projectName == undefined){
			tips('请输入项目名称');
			return false;
		}
		var address = $("#address").val();
		if(address == "" || address == undefined){
			tips('请输入建设地点');
			return false;
		}
		var contactInfo = $("#contactInfo").val();
		if(contactInfo == "" || contactInfo == undefined){
			tips('请输入联系人姓名及职务');
			return false;
		}
		var contactPhone = $("#contactPhone").val();
		if(contactPhone == "" || contactPhone == undefined){
			tips('请输入联系人电话');
			return false;
		}
		/* 一、企业基本情况 */
		var ownership = $("#ownership").val();
		if(ownership == "" || ownership == undefined){
			tips('请输入所有制形式');
			return false;
		}
		var registerCapital = $("#registerCapital").val();
		if(registerCapital == "" || registerCapital == undefined){
			tips('请输入注册资金');
			return false;
		}
		var realCapital = $("#realCapital").val();
		if(realCapital == "" || realCapital == undefined){
			tips('请输入实缴注册资金');
			return false;
		}
		var creditRating = $("#creditRating").val();
		if(creditRating == "" || creditRating == undefined){
			tips('请输入银行信用等级');
			return false;
		}
		var loanBalance = $("#loanBalance").val();
		if(loanBalance == "" || loanBalance == undefined){
			tips('请输入长期贷款余额');
			return false;
		}
		var zcfzPercent = $("#zcfzPercent").val();
		if(zcfzPercent == "" || zcfzPercent == undefined){
			tips('请输入资产负债率');
			return false;
		}
		var yftrPercent = $("#yftrPercent").val();
		if(yftrPercent == "" || yftrPercent == undefined){
			tips('请输入研发投入比');
			return false;
		}
		var totalAssets = $("#totalAssets").val();
		if(totalAssets == "" || totalAssets == undefined){
			tips('请输入企业总资产');
			return false;
		}
		var employeesCount = $("#employeesCount").val();
		if(employeesCount == "" || employeesCount == undefined){
			tips('请输入企业员工总数');
			return false;
		}
		var legalPerson = $("#legalPerson").val();
		if(legalPerson == "" || legalPerson == undefined){
			tips('请输入法人代表');
			return false;
		}
		var legalPhone = $("#legalPhone").val();
		if(legalPhone == "" || legalPhone == undefined){
			tips('请输入法人联系方式');
			return false;
		}
		var honor = $("#honor").val();
		if(honor == "" || honor == undefined){
			tips('请输入获得各方面的主要荣誉');
			return false;
		}
		var zyywsrValue1 = $("#zyywsrValue1").val();
		if(zyywsrValue1 == "" || zyywsrValue1 == undefined){
			tips('请输入前年主营业务收入');
			return false;
		}
		var zyywsrPercent1 = $("#zyywsrPercent1").val();
		if(zyywsrPercent1 == "" || zyywsrPercent1 == undefined){
			tips('请输入前年主营业务同比');
			return false;
		}
		var lrValue1 = $("#lrValue1").val();
		if(lrValue1 == "" || lrValue1 == undefined){
			tips('请输入前年利润收入');
			return false;
		}
		var lrPercent1 = $("#lrPercent1").val();
		if(lrPercent1 == "" || lrPercent1 == undefined){
			tips('请输入前年利润同比');
			return false;
		}
		var ssValue1 = $("#ssValue1").val();
		if(ssValue1 == "" || ssValue1 == undefined){
			tips('请输入前年税收收入');
			return false;
		}
		var ssPercent1 = $("#ssPercent1").val();
		if(ssPercent1 == "" || ssPercent1 == undefined){
			tips('请输入前年税收同比');
			return false;
		}
		var zyywsrValue2 = $("#zyywsrValue2").val();
		if(zyywsrValue2 == "" || zyywsrValue2 == undefined){
			tips('请输入去年主营业务收入');
			return false;
		}
		var zyywsrPercent2 = $("#zyywsrPercent2").val();
		if(zyywsrPercent2 == "" || zyywsrPercent2 == undefined){
			tips('请输入去年主营业务同比');
			return false;
		}
		var lrValue2 = $("#lrValue2").val();
		if(lrValue2 == "" || lrValue2 == undefined){
			tips('请输入去年利润收入');
			return false;
		}
		var lrPercent2 = $("#lrPercent2").val();
		if(lrPercent2 == "" || lrPercent2 == undefined){
			tips('请输入去年利润同比');
			return false;
		}
		var ssValue2 = $("#ssValue2").val();
		if(ssValue2 == "" || ssValue2 == undefined){
			tips('请输入去年税收收入');
			return false;
		}
		var ssPercent2 = $("#ssPercent2").val();
		if(ssPercent2 == "" || ssPercent2 == undefined){
			tips('请输入去年税收同比');
			return false;
		}
		var zyywsrValue3 = $("#zyywsrValue3").val();
		if(zyywsrValue3 == "" || zyywsrValue3 == undefined){
			tips('请输入今年主营业务收入');
			return false;
		}
		var zyywsrPercent3 = $("#zyywsrPercent3").val();
		if(zyywsrPercent3 == "" || zyywsrPercent3 == undefined){
			tips('请输入今年主营业务同比');
			return false;
		}
		var lrValue3 = $("#lrValue3").val();
		if(lrValue3 == "" || lrValue3 == undefined){
			tips('请输入今年利润收入');
			return false;
		}
		var lrPercent3 = $("#lrPercent3").val();
		if(lrPercent3 == "" || lrPercent3 == undefined){
			tips('请输入今年利润同比');
			return false;
		}
		var ssValue3 = $("#ssValue3").val();
		if(ssValue3 == "" || ssValue3 == undefined){
			tips('请输入今年税收收入');
			return false;
		}
		var ssPercent3 = $("#ssPercent3").val();
		if(ssPercent3 == "" || ssPercent3 == undefined){
			tips('请输入今年税收同比');
			return false;
		}
		/* 二、项目基本情况 */
		var industry = $("#industrytype  option:selected").text();
		var startMonth = $("#startMonth").val();
		if(startMonth == "" || startMonth == undefined){
			tips('请输入开始年月');
			return false;
		}
		var endMonth = $("#endMonth").val();
		if(endMonth == "" || endMonth == undefined){
			tips('请输入结束年月');
			return false;
		}
		var projectType = $("#projectType  option:selected").text();
		var workStatus = $("#workStatus  option:selected").text();
		var finishInvest = $("#finishInvest").val();
		if(finishInvest == "" || finishInvest == undefined){
			tips('请输入完成投资');
			return false;
		}
		var progress = $("#progress").val();
		if(progress == "" || progress == undefined){
			tips('请输入形象进度');
			return false;
		}
		var year = new Date().getFullYear();
		var totalInvest = $("#totalInvest").val();
		if(totalInvest == "" || totalInvest == undefined){
			tips('请输入总投资');
			return false;
		}
		var fixedInvest = $("#fixedInvest").val();
		if(fixedInvest == "" || fixedInvest == undefined){
			tips('请输入固定资产投资');
			return false;
		}
		var floorMoney = $("#floorMoney").val();
		if(floorMoney == "" || floorMoney == undefined){
			tips('请输入铺底流动资金');
			return false;
		}
		var selfMoney = $("#selfMoney").val();
		if(selfMoney == "" || selfMoney == undefined){
			tips('请输入自有资金');
			return false;
		}
		var bankLoan = $("#bankLoan").val();
		if(bankLoan == "" || bankLoan == undefined){
			tips('请输入银行贷款');
			return false;
		}
		var otherMoney = $("#otherMoney").val();
		if(otherMoney == "" || otherMoney == undefined){
			tips('请输入其他资金');
			return false;
		}
		var approvalNum = $("#approvalNum").val();
		if(approvalNum == "" || approvalNum == undefined){
			tips('请输入项目核准/备案文号');
			return false;
		}
		var loanNum = $("#loanNum").val();
		if(loanNum == "" || loanNum == undefined){
			tips('请输入银行贷款落实文号');
			return false;
		}
		var keyDirect = $("#keyDirect").val();
		if(keyDirect == "" || keyDirect == undefined){
			tips('请输入符合的重点方向');
			return false;
		}
		var landNum = $("#landNum").val();
		if(landNum == "" || landNum == undefined){
			tips('请输入土地审批文号');
			return false;
		}
		var cityNum = $("#cityNum").val();
		if(cityNum == "" || cityNum == undefined){
			tips('请输入城市规划文号');
			return false;
		}
		var supportMoney = $("#supportMoney").val();
		if(supportMoney == "" || supportMoney == undefined){
			tips('请输入申请扶持资金');
			return false;
		}
		var environmentNum = $("#environmentNum").val();
		if(environmentNum == "" || environmentNum == undefined){
			tips('请输入环评审批文号');
			return false;
		}
		var energyNum = $("#energyNum").val();
		if(energyNum == "" || energyNum == undefined){
			tips('请输入节能评估报告');
			return false;
		}
		var supportType = $("#supportType  option:selected").text();
		var supportDesc = $("#supportDesc").val();
		if(supportDesc == "" || supportDesc == undefined){
			tips('请输入近三年获市级财政性资金支持情况');
			return false;
		}
		/* 三、建成后预计效果 */
		var addXssr = $("#addXssr").val();
		if(addXssr == "" || addXssr == undefined){
			tips('请输入新增销售收入');
			return false;
		}
		var addLr = $("#addLr").val();
		if(addLr == "" || addLr == undefined){
			tips('请输入新增利润');
			return false;
		}
		var addSs = $("#addSs").val();
		if(addSs == "" || addSs == undefined){
			tips('请输入新增税收');
			return false;
		}
		var addCkch = $("#addCkch").val();
		if(addCkch == "" || addCkch == undefined){
			tips('请输入新增出口创汇');
			return false;
		}
		var addJyrs = $("#addJyrs").val();
		if(addJyrs == "" || addJyrs == undefined){
			tips('请输入新增就业人数');
			return false;
		}
		/* 四、HR信息 */
		var hrValue1 = $("#hrValue1").val();
		if(hrValue1 == "" || hrValue1 == undefined){
			tips('请输入管理人员总数');
			return false;
		}
		var hrValue2 = $("#hrValue2").val();
		if(hrValue2 == "" || hrValue2 == undefined){
			tips('请输入销售人员总数');
			return false;
		}
		var hrValue3 = $("#hrValue3").val();
		if(hrValue3 == "" || hrValue3 == undefined){
			tips('请输入工程师以上总数');
			return false;
		}
		var hrValue4 = $("#hrValue4").val();
		if(hrValue4 == "" || hrValue4 == undefined){
			tips('请输入技术研发人员总数');
			return false;
		}
		var hrValue5 = $("#hrValue5").val();
		if(hrValue5 == "" || hrValue5 == undefined){
			tips('请输入生产人员总数');
			return false;
		}
		var hrValue6 = $("#hrValue6").val();
		if(hrValue6 == "" || hrValue6 == undefined){
			tips('请输入大专学历总数');
			return false;
		}
		var hrValue7 = $("#hrValue7").val();
		if(hrValue7 == "" || hrValue7 == undefined){
			tips('请输入本科学历总数');
			return false;
		}
		var hrValue8 = $("#hrValue8").val();
		if(hrValue8 == "" || hrValue8 == undefined){
			tips('请输入硕士及以上学历总数');
			return false;
		}
		/* 五、项目内容 */
		var content1 = $("#content1").val();
		if(content1 == "" || content1 == undefined){
			tips('请输入企业主营业务、主要产品和销售规模、主营业务收入在国内和省内行业排名');
			return false;
		}
		var content2 = $("#content2").val();
		if(content2 == "" || content2 == undefined){
			tips('请输入项目采用主要技术及来源，技术的产业化程度');
			return false;
		}
		var content3 = $("#content3").val();
		if(content3 == "" || content3 == undefined){
			tips('请输入项目主要产品及规模');
			return false;
		}
		var content4 = $("#content4").val();
		if(content4 == "" || content4 == undefined){
			tips('请输入企业现有研发平台，企业主要研发技术及专利');
			return false;
		}
		var content5 = $("#content5").val();
		if(content5 == "" || content5 == undefined){
			tips('请输入项目主要建设内容');
			return false;
		}

		if(employeesCount!="" && Number(hrValue1) + Number(hrValue2) + Number(hrValue3) + Number(hrValue4) + Number(hrValue5) > Number(employeesCount)){
			tips('HR职位人数之和不能大于企业总人数');
			return false;
		}
		if(employeesCount!="" && Number(hrValue6) + Number(hrValue7) + Number(hrValue8) > Number(employeesCount)){
			tips('HR学历人数之和不能大于企业总人数');
			return false;
		}
	}else{
		var rootName = $("#rootName").val();
		var reportTime = $("#reportTime").val();
		var projectName = $("#projectName").val();
		var address = $("#address").val();
		var contactInfo = $("#contactInfo").val();
		var contactPhone = $("#contactPhone").val();
		/* 一、企业基本情况 */
		var ownership = $("#ownership").val();
		var registerCapital = $("#registerCapital").val();
		var realCapital = $("#realCapital").val();
		var creditRating = $("#creditRating").val();
		var loanBalance = $("#loanBalance").val();
		var zcfzPercent = $("#zcfzPercent").val();
		var yftrPercent = $("#yftrPercent").val();
		var totalAssets = $("#totalAssets").val();
		var employeesCount = $("#employeesCount").val();
		var legalPerson = $("#legalPerson").val();
		var legalPhone = $("#legalPhone").val();
		var honor = $("#honor").val();
		var zyywsrValue1 = $("#zyywsrValue1").val();
		var zyywsrPercent1 = $("#zyywsrPercent1").val();
		var lrValue1 = $("#lrValue1").val();
		var lrPercent1 = $("#lrPercent1").val();
		var ssValue1 = $("#ssValue1").val();
		var ssPercent1 = $("#ssPercent1").val();
		var zyywsrValue2 = $("#zyywsrValue2").val();
		var zyywsrPercent2 = $("#zyywsrPercent2").val();
		var lrValue2 = $("#lrValue2").val();
		var lrPercent2 = $("#lrPercent2").val();
		var ssValue2 = $("#ssValue2").val();
		var ssPercent2 = $("#ssPercent2").val();
		var zyywsrValue3 = $("#zyywsrValue3").val();
		var zyywsrPercent3 = $("#zyywsrPercent3").val();
		var lrValue3 = $("#lrValue3").val();
		var lrPercent3 = $("#lrPercent3").val();
		var ssValue3 = $("#ssValue3").val();
		var ssPercent3 = $("#ssPercent3").val();
		/* 二、项目基本情况 */
		var industry = $("#industrytype  option:selected").text();
		var startMonth = $("#startMonth").val();
		var endMonth = $("#endMonth").val();
		var projectType = $("#projectType  option:selected").text();
		var workStatus = $("#workStatus  option:selected").text();
		var finishInvest = $("#finishInvest").val();
		var progress = $("#progress").val();
		var year = new Date().getFullYear();
		var totalInvest = $("#totalInvest").val();
		var fixedInvest = $("#fixedInvest").val();
		var floorMoney = $("#floorMoney").val();
		var selfMoney = $("#selfMoney").val();
		var bankLoan = $("#bankLoan").val();
		var otherMoney = $("#otherMoney").val();
		var approvalNum = $("#approvalNum").val();
		var loanNum = $("#loanNum").val();
		var keyDirect = $("#keyDirect").val();
		var landNum = $("#landNum").val();
		var cityNum = $("#cityNum").val();
		var supportMoney = $("#supportMoney").val();
		var environmentNum = $("#environmentNum").val();
		var energyNum = $("#energyNum").val();
		var supportType = $("#supportType  option:selected").text();
		var supportDesc = $("#supportDesc").val();
		/* 三、建成后预计效果 */
		var addXssr = $("#addXssr").val();
		var addLr = $("#addLr").val();
		var addSs = $("#addSs").val();
		var addCkch = $("#addCkch").val();
		var addJyrs = $("#addJyrs").val();
		/* 四、HR信息 */
		var hrValue1 = $("#hrValue1").val();
		var hrValue2 = $("#hrValue2").val();
		var hrValue3 = $("#hrValue3").val();
		var hrValue4 = $("#hrValue4").val();
		var hrValue5 = $("#hrValue5").val();
		var hrValue6 = $("#hrValue6").val();
		var hrValue7 = $("#hrValue7").val();
		var hrValue8 = $("#hrValue8").val();
		/* 五、项目内容 */
		var content1 = $("#content1").val();
		var content2 = $("#content2").val();
		var content3 = $("#content3").val();
		var content4 = $("#content4").val();
		var content5 = $("#content5").val();
		
		if(employeesCount!="" && Number(hrValue1) + Number(hrValue2) + Number(hrValue3) + Number(hrValue4) + Number(hrValue5) > Number(employeesCount)){
			tips('HR职位人数之和不能大于企业总人数');
			return false;
		}
		if(employeesCount!="" && Number(hrValue6) + Number(hrValue7) + Number(hrValue8) > Number(employeesCount)){
			tips('HR学历人数之和不能大于企业总人数');
			return false;
		}
	}
	if(ajaxFlag==0){
		ajaxFlag = 1;
		$.ajax({
			url:"${urlPath}XOffice/interface/json/projectOnlineInfo/save",
			type:"post",
			data:{
				logId:$("#logId").val(),
				rootId: "${rootId}",
				accountId: "${accountId}",
				accountName: "${accountName}",
				declareId: "${declareId}",
				status: status,
				
				rootName: rootName,
				reportTime: reportTime,
				projectName: projectName,
				address: address,
				contactInfo: contactInfo,
				contactPhone: contactPhone,
				
				ownership: ownership,
				registerCapital: registerCapital,
				realCapital: realCapital,
				creditRating: creditRating,
				loanBalance: loanBalance,
				zcfzPercent: zcfzPercent,
				yftrPercent: yftrPercent,
				totalAssets: totalAssets,
				employeesCount: employeesCount,
				legalPerson: legalPerson,
				legalPhone: legalPhone,
				honor: honor,
				zyywsrValue1: zyywsrValue1,
				zyywsrPercent1: zyywsrPercent1,
				lrValue1: lrValue1,
				lrPercent1: lrPercent1,
				ssValue1: ssValue1,
				ssPercent1: ssPercent1,
				zyywsrValue2: zyywsrValue2,
				zyywsrPercent2: zyywsrPercent2,
				lrValue2: lrValue2,
				lrPercent2: lrPercent2,
				ssValue2: ssValue2,
				ssPercent2: ssPercent2,
				zyywsrValue3: zyywsrValue3,
				zyywsrPercent3: zyywsrPercent3,
				lrValue3: lrValue3,
				lrPercent3: lrPercent3,
				ssValue3: ssValue3,
				ssPercent3: ssPercent3,
				
				industry: industry,
				startMonth: startMonth,
				endMonth: endMonth,
				projectType: projectType,
				workStatus: workStatus,
				finishInvest: finishInvest,
				progress: progress,
				year: year,
				totalInvest: totalInvest,
				fixedInvest: fixedInvest,
				floorMoney: floorMoney,
				selfMoney: selfMoney,
				bankLoan: bankLoan,
				otherMoney: otherMoney,
				approvalNum: approvalNum,
				loanNum: loanNum,
				keyDirect: keyDirect,
				landNum: landNum,
				cityNum: cityNum,
				supportMoney: supportMoney,
				environmentNum: environmentNum,
				energyNum: energyNum,
				supportType: supportType,
				supportDesc: supportDesc,
				
				addXssr: addXssr,
				addLr: addLr,
				addSs: addSs,
				addCkch: addCkch,
				addJyrs: addJyrs,
				
				hrValue1: hrValue1,
				hrValue2: hrValue2,
				hrValue3: hrValue3,
				hrValue4: hrValue4,
				hrValue5: hrValue5,
				hrValue6: hrValue6,
				hrValue7: hrValue7,
				hrValue8: hrValue8,
				
				content1:content1,
				content2:content2,
				content3:content3,
				content4:content4,
				content5:content5,
			},
			dataType:"json",
			success:function(result){
				if(result.success){
					if(status==1){
						tips("提交成功");
						setTimeout(function(){
							window.location.href = "${ctx}/declare/list?entranceId="+${entranceId};
						}, 1500);
					}else{
						tips("保存成功");
						setTimeout(function(){
							//location.reload();
							window.location.href = "${ctx}/declare/list?entranceId="+${entranceId};
						}, 1500);
					}
				}else{
					ajaxFlag = 0;
					tips("保存失败！");
				}
			},
			error:function(){
				ajaxFlag = 0;
				tips("保存失败！");
			},
		});
	}
	
}
function isGetDraftInfo(){
	$.ajax({
		url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
		type:"post",
		data:{
			declareId: "${declareId}",
			rootId:"${rootId}"
		},
		dataType:"json",
		success:function(result){
			if(result.value != null && result.value != undefined){
				getdetails();
			}
		},
		error:function(){
			//tips("获取详情失败！");
		},
	})
}
function getdetails(){
	$.ajax({
		url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
		type:"post",
		data:{
			declareId: "${declareId}",
			rootId:"${rootId}"
		},
		dataType:"json",
		success:function(result){
			console.log(result);
			if(result.success){
				var info=result.value;
				$("#logId").val(info.logId);
				$("#rootName").val(info.rootName);
				$("#reportTime").val(dateToTimeStr(info.reportTime,'yyyy-MM-dd'));
				$("#projectName").val(info.projectName);
				$("#address").val(info.address);
				$("#contactInfo").val(info.contactInfo);
				$("#contactPhone").val(info.contactPhone);
				/* 一、企业基本情况 */
				$("#ownership").val(info.ownership);
				$("#registerCapital").val(info.registerCapital);
				$("#realCapital").val(info.realCapital);
				$("#creditRating").val(info.creditRating);
				$("#loanBalance").val(info.loanBalance);
				$("#zcfzPercent").val(info.zcfzPercent);
				$("#yftrPercent").val(info.yftrPercent);
				$("#totalAssets").val(info.totalAssets);
				$("#employeesCount").val(info.employeesCount);
				$("#legalPerson").val(info.legalPerson);
				$("#legalPhone").val(info.legalPhone);
				$("#honor").val(info.honor);
				$("#zyywsrValue1").val(info.zyywsrValue1);
				$("#zyywsrPercent1").val(info.zyywsrPercent1);
				$("#lrValue1").val(info.lrValue1);
				$("#lrPercent1").val(info.lrPercent1);
				$("#ssValue1").val(info.ssValue1);
				$("#ssPercent1").val(info.ssPercent1);
				$("#zyywsrValue2").val(info.zyywsrValue2);
				$("#zyywsrPercent2").val(info.zyywsrPercent2);
				$("#lrValue2").val(info.lrValue2);
				$("#lrPercent2").val(info.lrPercent2);
				$("#ssValue2").val(info.ssValue2);
				$("#ssPercent2").val(info.ssPercent2);
				$("#zyywsrValue3").val(info.zyywsrValue3);
				$("#zyywsrPercent3").val(info.zyywsrPercent3);
				$("#lrValue3").val(info.lrValue3);
				$("#lrPercent3").val(info.lrPercent3);
				$("#ssValue3").val(info.ssValue3);
				$("#ssPercent3").val(info.ssPercent3);
				/* 二、项目基本情况 */
				var industry=['节能环保','新能源','新材料','生物和新医药','航空产业','先进装备制造','新一代信息技术','锂电及电动汽车','绿色食品','其它']
				var workStatus=['新开-未开工','新开-已开工','新开-已完工','续建-在建','续建-部分投产','续建-完工投产'];
				var industryindex=industry.indexOf(info.industry);
				var workStatusindex=workStatus.indexOf(info.workStatus);
				var projectType=info.projectType=='新建'?0:1;
				$("#industrytype").val(industryindex);
				$("#startMonth").val(info.startMonth);
				$("#endMonth").val(info.endMonth);
				$("#projectType").val(projectType);
				$("#workStatus").val(workStatusindex);
				$("#finishInvest").val(info.finishInvest);
				$("#progress").val(info.progress);
				$("#thisYear").text(info.year+'年');
				$("#totalInvest").val(info.totalInvest);
				$("#fixedInvest").val(info.fixedInvest);
				$("#floorMoney").val(info.floorMoney);
				$("#selfMoney").val(info.selfMoney);
				$("#bankLoan").val(info.bankLoan);
				$("#otherMoney").val(info.otherMoney);
				$("#approvalNum").val(info.approvalNum);
				$("#loanNum").val(info.loanNum);
				$("#keyDirect").val(info.keyDirect);
				$("#landNum").val(info.landNum);
				$("#cityNum").val(info.cityNum);
				$("#supportMoney").val(info.supportMoney);
				$("#environmentNum").val(info.environmentNum);
				$("#energyNum").val(info.energyNum);
				var supportType=['委托贷款','信托贷款','可转债','商业保理','定向融资工具','与基金管理人及社会资本合作设立专项基金','符合法律法规及监管政策的其他运作方式']
				var supportTypeindex=supportType.indexOf(info.supportType);
				$("#supportType").val(supportTypeindex);
				$("#supportDesc").val(info.supportDesc);
				/* 三、建成后预计效果 */
				$("#addXssr").val(info.addXssr);
				$("#addLr").val(info.addLr);
				$("#addSs").val(info.addSs);
				$("#addCkch").val(info.addCkch);
				$("#addJyrs").val(info.addJyrs);
				/* 四、HR信息 */
				$("#hrValue1").val(info.hrValue1);
				$("#hrValue2").val(info.hrValue2);
				$("#hrValue3").val(info.hrValue3);
				$("#hrValue4").val(info.hrValue4);
				$("#hrValue5").val(info.hrValue5);
				$("#hrValue6").val(info.hrValue6);
				$("#hrValue7").val(info.hrValue7);
				$("#hrValue8").val(info.hrValue8);
				$("#peopleNum").text(info.employeesCount);
				/* 五、项目内容 */
				$("#content1").val(info.content1);
				$("#content2").val(info.content2);
				$("#content3").val(info.content3);
				$("#content4").val(info.content4);
				$("#content5").val(info.content5);
			}
		},
		error:function(){
			//tips("获取详情失败！");
		},
	});
}
</script>
</html>
