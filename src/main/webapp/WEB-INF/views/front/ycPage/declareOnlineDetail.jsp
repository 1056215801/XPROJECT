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
    margin: 10px auto 20px;
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
.tac {text-align: center;}
.dataTitle {
	color: #333;
    font-weight: bold;
    text-align: center;
}
.form-content .input-content{
    border: 1px solid #A9A9A9;
	border: none;
    outline: none;
    margin-left: 10px;
    padding-left: 5px;
    height: 30px;
    width: 84%;
    color: #333;
    text-align: center;
}
.form-content .area-content {
	border: 1px solid #A9A9A9;
	border: none;
    outline: none;
	resize: none;
    margin-left: 10px;
    text-indent: 7px;
    width: 96%;
    color: #333;
    text-align: left;
    overflow: hidden;
}
.form-content .area-sqfc{
	height: 49px;
    width: 93%;
    resize: none;
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

#applyRecord.table-striped > tr:nth-of-type(2n+1) {background-color: #f9f9f9;}
#applyRecord.table-striped > tr:hover {background: rgba(230,230,230,0.5);}
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
											<div class="form-content">
												<form id="cloudForm">
													<input type="hidden" name="applyId" value=""/>
													<div class="tableTip clearfix">
														<div class="tableTipLeft">类型：市产业促进引导资金项目</div>
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr>
															<td class="td15 dataName" colspan="2"><span>填报单位</span></td>
															<td class="td35 dataValue" colspan="2">
																<input id="rootName" type="text" class="input-content" name="rootName" value="" maxlength="64" readonly>
															</td>
															<td class="td15 dataName" colspan="2"><span>填报时间</span></td>
															<td class="td35 dataValue" colspan="2">
																<!-- <input id="reportTime" class="form-control layer-date input-content" name="reportTime" readonly/> -->
																<input class="input-content" id="reportTime" name="reportTime" readonly>
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="2">项目名称</td>
															<td class="td35 dataValue" colspan="2">
																<input id="projectName" type="text" class="input-content" name="projectName" maxlength="128" readonly>
															</td>
															<td class="td15 dataName" colspan="2">建设地点</td>
															<td class="td35 dataValue" colspan="2">
																<input id="address" type="text" class="input-content" name="address" maxlength="128" readonly>
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="2">联系人姓名及职务</td>
															<td class="td35 dataValue" colspan="2">
																<input id="contactInfo" type="text" class="input-content" name="contactInfo" maxlength="64" readonly>
															</td>
															<td class="td15 dataName" colspan="2">联系人电话</td>
															<td class="td35 dataValue" colspan="2">
																<input id="contactPhone" type="text" class="input-content" name="contactPhone" maxlength="64" readonly>
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
																<input id="ownership" type="text" class="input-content" name="ownership" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">注册资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="registerCapital" type="text" class="input-content" name="registerCapital" maxlength="12" precision="2" readonly >
															</td>
															<td class="td10 dataName" colspan="1">实缴注册资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="realCapital" type="text" class="input-content" name="realCapital" maxlength="12" precision="2" readonly >
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">银行信用等级</td>
															<td class="td23 dataValue" colspan="1">
																<input id="creditRating" type="text" class="input-content" name="creditRating" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">长期贷款余额</td>
															<td class="td23 dataValue" colspan="1">
																<input id="loanBalance" type="text" class="input-content" name="loanBalance" maxlength="12" precision="2" readonly >
															</td>
															<td class="td10 dataName" colspan="1">资产负债率(%)</td>
															<td class="td23 dataValue" colspan="1">
																<input id="zcfzPercent" type="text" class="input-content" name="zcfzPercent" maxlength="12" precision="2" readonly >
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">研发投入比(%)</td>
															<td class="td23 dataValue" colspan="1">
																<input id="yftrPercent" type="text" class="input-content" name="yftrPercent" maxlength="12" precision="2" readonly >
															</td>
															<td class="td10 dataName" colspan="1">企业总资产</td>
															<td class="td23 dataValue" colspan="1">
																<input id="totalAssets" type="text" class="input-content" name="totalAssets" maxlength="12" precision="2" readonly >
															</td>
															<td class="td10 dataName" colspan="1">企业员工总数</td>
															<td class="td23 dataValue" colspan="1">
																<input id="employeesCount" type="text" class="input-content" name="employeesCount" maxlength="10" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">法人代表</td>
															<td class="td23 dataValue" colspan="1">
																<input id="legalPerson" type="text" class="input-content" name="legalPerson" maxlength="32" readonly>
															</td>
															<td class="td10 dataName" colspan="1">法人联系方式</td>
															<td class="td23 dataValue" colspan="1">
																<input id="legalPhone" type="text" class="input-content" name="legalPhone" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1"></td>
															<td class="td23 dataValue" colspan="1"></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">获得各方面的主要荣誉</td>
															<td class="td90 dataValue" colspan="5">
																<textarea id="honor" class="area-content" rows="3" name="honor" maxlength="2000" readonly></textarea >
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
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue1" type="text" class="input-content" name="zyywsrValue1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent1" type="text" class="input-content" name="zyywsrPercent1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue2" type="text" class="input-content" name="zyywsrValue2" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent2" type="text" class="input-content" name="zyywsrPercent2" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrValue3" type="text" class="input-content" name="zyywsrValue3" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="zyywsrPercent3" type="text" class="input-content" name="zyywsrPercent3" maxlength="12" precision="2" readonly ></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">利润</td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue1" type="text" class="input-content" name="lrValue1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent1" type="text" class="input-content" name="lrPercent1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue2" type="text" class="input-content" name="lrValue2" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent2" type="text" class="input-content" name="lrPercent2" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="lrValue3" type="text" class="input-content" name="lrValue3" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="lrPercent3" type="text" class="input-content" name="lrPercent3" maxlength="12" precision="2" readonly ></td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">税收</td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue1" type="text" class="input-content" name="ssValue1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent1" type="text" class="input-content" name="ssPercent1" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue2" type="text" class="input-content" name="ssValue2" maxlength="12" precision="2" readonly ></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent2" type="text" class="input-content" name="ssPercent2" maxlength="12" precision="2" readonly></td>
															<td class="td15 dataValue" colspan="1"><input id="ssValue3" type="text" class="input-content" name="ssValue3" maxlength="12" precision="2" readonly></td>
															<td class="td15 dataValue" colspan="1"><input id="ssPercent3" type="text" class="input-content" name="ssPercent3" maxlength="12" precision="2" readonly></td>
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
																<input id="industrytype" class="input-content" name="industrytype" readonly>
															</td>
															<td class="td10 dataName" colspan="1">项目建设起止年月</td>
															<td class="td23 dataValue" colspan="1">
																<!-- <input id="startMonth" class="form-control layer-date input-content" style="display: inline-block; width: 70%; margin-left: 0;" name="startMonth" readonly/> -->
																<span>起：</span><input class="input-content" style="display: inline-block; width: 70%; margin-left: 0;" id="startMonth" name="startMonth" fmt="YYYY-MM" readonly>
																<!-- <input id="endMonth" class="form-control layer-date input-content" style="display: inline-block; width: 70%; margin-left: 0;" name="endMonth" readonly/> -->
																<span>止：</span><input class="input-content" style="display: inline-block; width: 70%; margin-left: 0;" id="endMonth" name="endMonth" fmt="YYYY-MM" readonly>
															</td>
															<td class="td10 dataName" colspan="1">项目性质</td>
															<td class="td23 dataValue" colspan="1">
																<input type="text" id="projectType" class="input-content" name="projectType" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">开工状态</td>
															<td class="td23 dataValue tac" colspan="1">
																<span id="workStatus"></span>
															</td>
															<td class="td10 dataName" colspan="1">项目形象进度</td>
															<td class="td23 dataValue" colspan="1">
																<span>完成投资</span><input id="finishInvest" type="text" class="input-content" name="finishInvest" style="width: calc(84% - 80px); margin: 0 5px;" maxlength="12" precision="2" readonly><span>万元</span>
																<span>形象进度</span><input id="progress" type="text" class="input-content" name="progress" style="width: calc(84% - 80px); margin: 0 5px;" maxlength="12" precision="2" readonly><span>(%)</span>
															</td>
															<td class="td10 dataName" colspan="1">资金申请年度</td>
															<td class="td23 dataValue tac" colspan="1">
																<span id="thisYear"></span>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">总投资</td>
															<td class="td23 dataValue" colspan="1">
																<input id="totalInvest" type="text" class="input-content" name="totalInvest" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">固定资产投资</td>
															<td class="td23 dataValue" colspan="1">
																<input id="fixedInvest" type="text" class="input-content" name="fixedInvest" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">铺底流动资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="floorMoney" type="text" class="input-content" name="floorMoney" maxlength="12" precision="2" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">自有资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="selfMoney" type="text" class="input-content" name="selfMoney" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">银行贷款</td>
															<td class="td23 dataValue" colspan="1">
																<input id="bankLoan" type="text" class="input-content" name="bankLoan" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">其他资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="otherMoney" type="text" class="input-content" name="otherMoney" maxlength="12" precision="2" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">项目核准/备案文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="approvalNum" type="text" class="input-content" name="approvalNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">银行贷款落实文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="loanNum" type="text" class="input-content" name="loanNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">符合的重点方向</td>
															<td class="td23 dataValue" colspan="1">
																<input id="keyDirect" type="text" class="input-content" name="keyDirect" maxlength="64" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">土地审批文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="landNum" type="text" class="input-content" name="landNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">城市规划文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="cityNum" type="text" class="input-content" name="cityNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">申请扶持资金</td>
															<td class="td23 dataValue" colspan="1">
																<input id="supportMoney" type="text" class="input-content" name="supportMoney" maxlength="12" precision="2" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">环评审批文号</td>
															<td class="td23 dataValue" colspan="1">
																<input id="environmentNum" type="text" class="input-content" name="environmentNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">节能评估报告</td>
															<td class="td23 dataValue" colspan="1">
																<input id="energyNum" type="text" class="input-content" name="energyNum" maxlength="64" readonly>
															</td>
															<td class="td10 dataName" colspan="1">申请扶持方式</td>
															<td class="td23 dataValue tac" colspan="1">
																<span  id="supportType"></span>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">近三年获市级财政性资金支持情况</td>
															<td class="td90 dataValue" colspan="5">
																<textarea id="supportDesc" class="area-content" rows="3" name="supportDesc" maxlength="2000" readonly></textarea >
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
																<input id="addXssr" type="text" class="input-content" name="addXssr" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">新增利润</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addLr" type="text" class="input-content" name="addLr" maxlength="12" precision="2" readonly>
															</td>
															<td class="td10 dataName" colspan="1">新增税收</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addSs" type="text" class="input-content" name="addSs" maxlength="12" precision="2" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">新增出口创汇</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addCkch" type="text" class="input-content" name="addCkch" maxlength="12" precision="4" readonly>
															</td>
															<td class="td10 dataName" colspan="1">新增就业人数</td>
															<td class="td23 dataValue" colspan="1">
																<input id="addJyrs" type="text" class="input-content" name="addJyrs" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1"></td>
															<td class="td23 dataValue" colspan="1"></td>
														</tr>
													</table>
													<div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr><td class="td100 dataTitle" colspan="6">四、HR信息</td></tr>
														<tr>
															<td class="td10 dataName" colspan="1">管理人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue1" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1">销售人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue2" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1">工程师以上总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue3" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">技术研发人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue4" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1">生产人员总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue5" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1">大专学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue6" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
														</tr>
														<tr>
															<td class="td10 dataName" colspan="1">本科学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue7" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td10 dataName" colspan="1">硕士及以上学历总数</td>
															<td class="td23 dataValue totalNum" colspan="1">
																<input id="hrValue8" type="text" class="input-content" name="" oninput="value=value.replace(/[^\d]/g,'')" maxlength="10" readonly>
															</td>
															<td class="td33 dataValue tac" colspan="2">
																<span>企业总人数：</span><span id="peopleNum">0</span><span>人</span>
															</td>
														</tr>
													</table>
													<div class="tableTip clearfix">
														<div class="tableTipRight">单位：万元</div>
													</div>
													<table>
														<tr><td class="td100 dataTitle" colspan="6">五、项目内容</td></tr>
														<tr>
															<td class="td15 dataName" colspan="1">企业主营业务、主要产品和销售规模、主营业务收入在国内和省内行业排名</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content1" class="area-content" rows="4" name="content1" maxlength="2000" readonly></textarea >
															</td>
															<td class="td15 dataName" colspan="1">项目采用主要技术及来源，技术的产业化程度</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content2" class="area-content" rows="4" name="content2" maxlength="2000" readonly></textarea >
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="1">项目主要产品及规模</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content3" class="area-content" rows="4" name="content3" maxlength="2000" readonly></textarea >
															</td>
															<td class="td15 dataName" colspan="1">企业现有研发平台，企业主要研发技术及专利</td>
															<td class="td35 dataValue" colspan="1">
																<textarea id="content4" class="area-content" rows="4" name="content4" maxlength="2000" readonly></textarea >
															</td>
														</tr>
														<tr>
															<td class="td15 dataName" colspan="1">项目主要建设内容</td>
															<td class="td85 dataValue" colspan="3">
																<textarea id="content5" class="area-content" rows="4" name="content5" maxlength="2000" readonly></textarea >
															</td>
														</tr>
													</table>
													<table id="applyRecord" class="table table-striped table-bordered table-hover" style="text-align: center; margin-top: 20px;">
														<%-- <tr>
															<th colspan="4" style="text-align: left; padding-top: 15px;">
																<h3 style="font-weight: bold;">审核记录</h3>
															</th>
														</tr>
														<tr>
															<th style="text-align: center;">审核时间</th>
															<th style="text-align: center;">审核人</th>
															<th style="text-align: center;">审核状态</th>
															<th style="text-align: center;">审核意见</th>
														</tr>
														<c:forEach items="${recordList}" var="obj">
															<tr>
																<td>
																	<fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm" />
																</td>
																<td>${obj.rootName}(${obj.accountName})</td>
																<td>${obj.status eq 1?'通过':'不通过'}</td>
																<td>${obj.content}</td>
															</tr>
														</c:forEach> --%>
													</table>
												</form>
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
	getdetails();
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
	
	//动态加载HR信息企业总人数
	$("#employeesCount").change(function(){
		$("#peopleNum").text($("#employeesCount").val());
	});
	
	
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
function getdetails(){
	var rootId="${rootId}";
	var str=location.href;
	var start=str.indexOf("rootId=");
	if(start>0){
		var rootId_url=str.substr(start+7);
		if(rootId_url!="${rootId}"){
			rootId=rootId_url
		}
		console.log(rootId_url);
	}
	$.ajax({
		url:"${urlPath}XOffice/interface/json/projectOnlineInfo/detailProject",
		type:"post",
		data:{
			// rootId:"90020180314182233800039000001655"
			declareId:"${declareId}",
			rootId:rootId
		},
		dataType:"json",
		success:function(result){
			console.log(result);
			if(result.success){
				if(result.value!=null &&result.value!='' &&result.value!=undefined){
					var info=result.value;
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
					$("#industrytype").val(info.industry);
					$("#startMonth").val(info.startMonth);
					$("#endMonth").val(info.endMonth);
					$("#projectType").val(info.projectType);
					$("#workStatus").text(info.workStatus);
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
					$("#supportType").text(info.supportType);
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
				if(result.recordList!='' && result.recordList!=undefined){
					$("#applyRecord").show();
					$("#applyRecord").empty();
					var _div = "";
						_div+= "	<tr>";
						_div+= "		<td colspan=\"4\" class=\"\" style=\"text-align: left; font-weight: bold; padding-left: 15px;\">";
						_div+= "			审核记录";
						_div+= "		</td>";
						_div+= "	</tr>";
						_div+= "	<tr>";
						_div+= "		<td style=\"text-align: center;\">审核时间</td>";
						_div+= "		<td style=\"text-align: center;\">审核人</td>";
						_div+= "		<td style=\"text-align: center;\">审核状态</td>";
						_div+= "		<td style=\"text-align: center;\">审核意见</td>";
						_div+= "	</tr>";
					for(var i=0;i<result.recordList.length;i++){
						var list = result.recordList[i];
						_div+= "<tr>";
						_div+= "	<td>";
						if(list.createTime != "" && list.createTime != undefined){
							_div+= nvlDate(list.createTime,"yyyy-MM-dd hh:mm");
						}
						_div+= "	</td>";
						_div+= "	<td>"+list.rootName+""+list.accountName+"</td>";
						if(list.status == 1){
							_div+= "	<td>通过</td>";
						}else{
							_div+= "	<td>不通过</td>";
						}
						if(list.content != "" && list.content != undefined){
							_div+= "	<td>"+list.content+"</td>";
						}else{
							_div+= "	<td></td>";
						}
						_div+= "</tr>";
					}
					$("#applyRecord").append(_div);
				}else{
					$("#applyRecord").hide();
				}
			}
		},
		error:function(){
			//tips("获取详情失败！");
		},
	});
}
function nvlDate(d,fmt){
	if(d==null || d==undefined){
		return "";
	}
	return formatCSTDate(d,fmt);;
}
</script>
</html>
