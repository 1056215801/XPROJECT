<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>详情</title>

<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6"rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0"rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0"rel="stylesheet">
	
</head>
<body class="gray-bg">
	<div class="row">
		<div class="col-sm-9">
			<div class="wrapper wrapper-content animated fadeInUp">
				<div class="ibox">
					<div class="ibox-content" style="border: solid; 1 px; color: grey;">
						<div class="row">
							<div class="col-sm-12">
								<div>
									<img style="width: 100%; height: 400px;"
										src="${projectActivityInfo.activityImage}">
								</div>
							</div>
						</div>
						<br />
						<hr />
						<div class="row">
							<div class="col-sm-7">
								<p style="font-size: 24px; font-weight: bold;">${projectActivityInfo.activityName}</p>
							</div>
							<div class="col-sm-5" id="cluster_info">
								<c:if test="${projectActivityInfo.status==1}">
									<a class="btn btn-success" id="enter" 
									style="position: absolute; right: 10px; top: -5px;"> <i
									class="fa fa-plus"> </i>&nbsp;我要报名
								</a>

								<a class="btn btn-success" id="cancelEnter" 
									style="position: absolute; right: 10px; top: -5px;"> <i
									class="fa fa-minus"> </i>&nbsp;取消报名
								</a>
								</c:if>
								<c:if test="${projectActivityInfo.status!=1}">
									<a class="btn btn-success" id="cancelEnter" 
									style="position: absolute; right: 10px; top: -5px;"> <i
									class="fa fa-minus"> </i>&nbsp;活动以结束
								</a>
								</c:if>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<p>
									<i class="fa fa-clock-o"></i>&nbsp;

									<fmt:formatDate value="${projectActivityInfo.startTime}"
										pattern="yyyy-MM-dd" />
									至
									<fmt:formatDate value="${projectActivityInfo.endTime}"
										pattern="yyyy-MM-dd" />
								</p>
								<p>
									<i class="fa fa-map-marker"></i>&nbsp;
									${projectActivityInfo.activityLocation}
								</p>
								<p>
									<i class="fa fa-user-md"></i>&nbsp;已报名人数:
									${projectActivityInfo.enterCount}
								</p>
							</div>
						</div>
						<br />
						<hr />
						<div class="row">
							<div class="col-sm-12">
								<p style="font-size: 20px; font-weight: grey;">活动介绍</p>
							</div>
							<div class="col-sm-12">
								<textarea
									style="border: 0px; width: 100%; height: 250px; background-color: #FFF;"
									disabled="disabled">
                       				${projectActivityInfo.activityDescription}
                       			</textarea>
							</div>
						</div>
						<br />
						<hr />
						<div class="row">
							<p style="font-size: 20px; font-weight: grey;">已报名${projectActivityInfo.enterCount}人</p>
							<div class="col-sm-12">
								<%-- <c:forEach items="${userList}" var="info">
                       				<div>
                       					<p><img style="width: 50px;height: 50px;" src="${info.url}"></p>
                       					<p>${info.name}</p>
                       				</div>
                       			</c:forEach> --%>
								<button class="btn btn-primary btn-block m">
									<i class="fa fa-arrow-down"></i> 显示更多
								</button>
							</div>
						</div>

					</div>
					<br />
					<div class="ibox-content" style="border: solid; 1 px; color: grey; height: 600px;">
						<iframe src="${ctx}/projectActivityComment/list?activityId=${projectActivityInfo.activityId}" style="width: 100%;height: 100%;"></iframe>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
	<script>
		$(document).ready(function() {
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
			$("#viewTable1").click();
			if('${projectActivityEnter}'==null||'${projectActivityEnter}'==""){
				$("#enter").show();
				$("#cancelEnter").hide();
			}else{
				$("#enter").hide();
				$("#cancelEnter").show();
			}
			
			//活动报名或取消报名
			$("#enter").click(function(){
				$.ajax({
					url:"${ctx}/projectActivityEnter/json/save",
					type:"get",
					data:{"activityId":'${projectActivityInfo.activityId}',
						"startTime":'${projectActivityInfo.startTime}'},
					success:function(result){
						if(result==1){
							layer.alert("报名成功！");
							$("#enter").hide();
							$("#cancelEnter").show();
						}else{
							layer.alert("报名失败，请稍后重试！");
						}
					},
					error:function(){
						layer.alert("系统异常，请稍后重试！");
					}
				});
			});
			$("#cancelEnter").click(function(){
				$.ajax({
					url:"${ctx}/projectActivityEnter/json/save",
					type:"get",
					data:{"activityId":'${projectActivityInfo.activityId}',
						"startTime":'${projectActivityInfo.startTime}'},
					success:function(result){
						if(result==1){
							layer.alert("取消报名成功！");
							$("#enter").show();
							$("#cancelEnter").hide();
						}else{
							layer.alert("取消报名失败，请稍后重试！");
						}
					},
					error:function(){
						layer.alert("系统异常，请稍后重试！");
					}
				});
			});
			
		});
		
		function simpleLoad(btn, state) {
			if (state) {
				btn.children().addClass("fa-spin");
				btn.contents().last().replaceWith(" Loading")
			} else {
				setTimeout(function() {
					btn.children().removeClass("fa-spin");
					btn.contents().last().replaceWith(" Refresh")
				}, 2000)
			}
		};
	</script>
</body>
</html>
