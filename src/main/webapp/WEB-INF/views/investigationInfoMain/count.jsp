<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>统计</title>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${ctx}/static/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link href="${ctx}/static/css/page.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	$(function() {
		$("#cancelBtn").click(function() {
			window.history.go(-1);
		});
	});
	function getContent(filedName, formId, obj) {
		$.ajax({
			url : "${ctx}/investigationInfoMain/json/getContent",
			type : "get",
			data : {
				"filedName" : filedName,
				"formId" : formId
			},
			dataType : "json",
			success : function(result) {
				$(obj).next().children(":last").empty();
				var list = result.value;
				for (var i = 0; i < list.length; i++) {
					var info = list[i];
					var _div = '<tr><td>' + getTime(info.createTime) + '</td>'
							+ '<td>' + info.ipAddress + '</td>' + '<td>'
							+ info.inputValue + '</td></tr>';
					$(obj).next().children(":last").append(_div);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
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
		m = (date.getMinutes() < 10 ?( '0' + date.getMinutes() ) : date.getMinutes() ) + ':';
		s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) : date.getSeconds() );
		return (Y + M + D + h + m + s);
	}

	function showCount(id, options, quantity, percentage) {
		var quantitys = quantity.split(",");
		var percentages = percentage.split(",");
		var myChart = echarts.init(document.getElementById(id));
		//指定图表的配置项和数据
		var option = {
				color: ['#3398DB'],
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : ['中国', '日本', '中日'],
			            axisTick: {
			                alignWithLabel: true
			            }
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'数据量',
			            type:'bar',
			            barWidth: '60%',
			            data:[2,0,0]
			        }
			    ]
		};
		//使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
</script>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class="example-wrap">
					<div class="example">
						<table id="exampleTableToolbar" data-mobile-responsive="true">
							<thead>
								<tr>
									<th>调查名称</th>
									<th>数据量</th>
									<th>浏览量</th>
									<th>填写率</th>
									<th>截止时间</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${investigationInfoMainBean.investigationName}</td>
									<td>${fill}</td>
									<td>${browse}</td>
									<td>${fillrate}</td>
									<c:choose>
										<c:when test="${investigationInfoMainBean.endTime!=null}">
											<td><fmt:formatDate
													value="${investigationInfoMainBean.endTime}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
										</c:when>
										<c:otherwise>
											--
										</c:otherwise>
									</c:choose>

								</tr>
							</tbody>
						</table>
					</div>

					<c:forEach items="${formInputBeansList}" var="info">
						<h3>${info.inputTitle}</h3>
						<c:choose>
							<c:when
								test="${info.inputType=='radio'||info.inputType=='checkbox'}">
								<div id="${info.id}" style="width: 600px; height: 400px;"
									onclick="showCount('${info.id}','${info.options}','${info.quantity}','${info.percentage}')">统计图</div>

								<table id="exampleTableToolbar" data-mobile-responsive="true">
									<thead>
										<tr>
											<th>选项</th>
											<th>数据量</th>
											<th>百分比</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${info.count}" var="index">
											<tr>
												<td>${index[0]}</td>
												<td>${index[1]}</td>
												<td>${index[2]}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<input type="button"
									onclick="getContent('${info.filedName}','${info.formId}',this)"
									value="show" />
								<table id="exampleTableToolbar" data-mobile-responsive="true">
									<thead>
										<tr>
											<th>填写时间</th>
											<th>ip地址</th>
											<th>内容</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</c:otherwise>
						</c:choose>
						<hr style="border: 1px solid #CCC;">
					</c:forEach>

					<button class="btn btn-white" id="cancelBtn">返回</button>
				</div>
			</div>
		</div>

	</div>

</body>

<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script
	src="${ctx}/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script
	src="${ctx}/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script
	src="${ctx}/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx}/static/js/demo/bootstrap-table-demo.js"></script>

</html>
