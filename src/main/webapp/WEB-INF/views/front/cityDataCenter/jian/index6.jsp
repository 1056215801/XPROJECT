<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>吉安智慧园区大数据决策平台</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${ctx}/static/css/cityDataCenter/jianHomePage.css" rel="stylesheet">
	<style>
	/* .body-bg { overflow: hidden;} */
	.layer { display: block;}
	.layer .table>tbody>tr>td { font-size: 12px; word-break: break-word;}
	</style>
</head>
<body class="body-bg">
<div class="homePageBar">
	<div class="layer">
		<h1>吉安高新区2019年产业项目攻坚推进情况一览表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th rowspan="3">序号</th>
					<th rowspan="3">项目名称</th>
					<th rowspan="3">年度目标</th>
					<th id="t1" colspan="26">项目推进进展</th>
				</tr>
				<tr>
					<th id="t2" colspan="16">项目开工前工作</th>
					<th id="t3" colspan="10">项目开工后工作</th>
				</tr>
				<tr id="tr"></tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
	<div class="layer layer2">
		<h1>吉安高新区2019年基础设施及配套项目攻坚推进情况图表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th id="tt0" colspan="29" style="text-align: left;">【  道路工程  】</th>
				</tr>
				<tr>
					<th rowspan="2">序号</th>
					<th rowspan="2">项目名称</th>
					<th rowspan="2">项目性质</th>
					<th rowspan="2">项目内容</th>
					<th id="tt20" colspan="25">项目推进进展</th>
				</tr>
				<tr id="ttr0"></tr>
			</thead>
			<tbody id="ttbody0"></tbody>
		</table>
	</div>
	<div class="layer layer2">
		<h1>吉安高新区2019年基础设施及配套项目攻坚推进情况图表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th id="tt1" colspan="29" style="text-align: left;">【  道路工程  】</th>
				</tr>
				<tr>
					<th rowspan="2">序号</th>
					<th rowspan="2">项目名称</th>
					<th rowspan="2">项目性质</th>
					<th rowspan="2">项目内容</th>
					<th id="tt21" colspan="25">项目推进进展</th>
				</tr>
				<tr id="ttr1"></tr>
			</thead>
			<tbody id="ttbody1"></tbody>
		</table>
	</div>
	<div class="layer layer2">
		<h1>吉安高新区2019年基础设施及配套项目攻坚推进情况图表</h1>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th id="tt2" colspan="29" style="text-align: left;">【  道路工程  】</th>
				</tr>
				<tr>
					<th rowspan="2">序号</th>
					<th rowspan="2">项目名称</th>
					<th rowspan="2">项目性质</th>
					<th rowspan="2">项目内容</th>
					<th id="tt22" colspan="25">项目推进进展</th>
				</tr>
				<tr id="ttr2"></tr>
			</thead>
			<tbody id="ttbody2"></tbody>
		</table>
	</div>
</div>
<script src="${ctx}/static/js/dataCenter/th.js" type="text/javascript"></script>	
<script>
	var loop = '';
	var num = 0;
	var length = 0;
	var h1 = 0;
    $(function () {
    	getTable1(0)
    	getTable2('道路工程,土方工程,配套工程')
    })
    function getTable1(id){
    	$.ajax({
    		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyPreviewList",
    		type : "post",
    		data : {
    			id: id
    		},
    		success : function(result) {
    			if (result.success) {
    				var t1 = result.mapNode["项目开工前工作"].length
    				var t2 = result.mapNode["项目开工后工作"].length
    				$("#t1").attr("colspan",t1+t2)
    				$("#t2").attr("colspan",t1)
    				$("#t3").attr("colspan",t2)
    				var th = ""
    				var items = result.mapNode["项目开工前工作"].concat(result.mapNode["项目开工后工作"])
    				for(var i=0;i<items.length;i++){
    					th += "<th>"+items[i]+"</th>"
    				}
    				$("#tr").html(th)
    				
    				var tds = ''
    				for(var x=0;x<result.endList.length;x++){
    					var info3 = result.endList[x]
    					var td = ""
    					for(var y=0;y<items.length;y++){
    						var content = info3[items[y]] === "0" ? "▲" : info3[items[y]] === "1" ? "√" : info3[items[y]] ? info3[items[y]] : ''
    						td += "<td>"+content+"</td>"
    					}
    					tds += "<tr>"
    					tds += "<td>"+(x+1)+"</td>"
    					tds += "<td>"+(info3["项目名称"] ? info3["项目名称"] : "")+"</td>"
    					tds += "<td>"+(info3["年度目标"] ? info3["年度目标"] : "")+"</td>"
    					tds += td
    					tds += "</tr>"
    				}
    				if(result.endList.length == 0) {
    					tds = "<tr><td colspan="+(t1+t2+3)+" style='text-align: center;'>暂无数据！</td></tr>"
    				}
    				$("#tbody").html(tds)
    			}
    		},
    		error : function() {
    			layer.msg("数据获取异常！");
    		}
    	})
    }
    function getTable2(nam){
    	var names = nam.split(",")
    	$.ajax({
    		url : "${OfficeUrl}XOffice/interface/json/ycDataCenter/propomCompanyPreviewBasicsList",
    		type : "post",
    		data : { },
    		success : function(result) {
    			if (result.success) {
    				for(var z=0;z<names.length;z++){
        				var tds = ''
    					var name = names[z]
        				var items = result.bassicName[name]
        				if(items){
            		    	$("#tt"+z).text('【  '+name+'  】')
            				var leng = items.length == 0 ? 1 : items.length
            				$("#tt"+z).attr("colspan",leng + 4)
            				$("#tt2"+z).attr("colspan",leng)
            				var th = ""
            				for(var i=0;i<items.length;i++){
            					th += "<th>"+items[i]+"</th>"
            				}
            				$("#ttr"+z).html(th)
            				for(var x=0;x<result.bassicInfo[name].length;x++){
            					var info3 = result.bassicInfo[name][x]
            					var td = ""
            					for(var y=0;y<items.length;y++){
            						var content = info3[items[y]] === "0" ? "▲" : info3[items[y]] === "1" ? "√" : info3[items[y]] ? info3[items[y]] : ""
            						td += "<td>"+content+"</td>"
            					}
            					tds += "<tr>"
            					tds += "<td>"+(x+1)+"</td>"
            					tds += "<td>"+(info3["项目名称"] ? info3["项目名称"] : "")+"</td>"
            					tds += "<td>"+(info3["项目性质"] ? info3["项目性质"] : "")+"</td>"
            					tds += "<td>"+(info3["项目内容"] ? info3["项目内容"] : "")+"</td>"
            					tds += td
            					tds += "</tr>"
            				}
            				if(result.bassicInfo[name].length == 0) {
            					tds = "<tr><td colspan="+(items.length + 4)+" style='text-align: center;'>暂无数据！</td></tr>"
            				}
        				} else { tds = "<tr><td colspan="+(items.length + 4)+" style='text-align: center;'>未配置模板！</td></tr>"}
        				$("#ttbody"+z).html(tds)
    				}
    			}
    		},
    		error : function() {
    			layer.msg("数据获取异常！");
    		}
    	})
    }
    function loopStart(){
    	if(length > 8){
    		loop = setInterval(function(){
    			if(num < length){
    				num++;
    			} else {
    				num = 1;
    				$("#companyList").css({top: "0px"})
    			}
    			$("#companyList").animate({top: "-"+h1*num+"px"});
    		},10000)
    	}
    }
    function loopPause(){
    	clearInterval(loop);
    }
    function loopChoose(e){
    	num = $(e).index();
    	if(length > 8){
    		if(num >= length){
    			num = num - length;
    			$("#companyList").css({top: "0px"});
    		}
    		$("#companyList").animate({top: "-"+h1*num+"px"});
    	}
    }
</script>
</body>
</html>