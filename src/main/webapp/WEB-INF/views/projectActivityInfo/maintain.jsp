<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>活动列表</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/jquery.searchableSelect.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.searchableSelect.js"></script>
<script type="text/javascript">
	$(function(){
		//初始化
		initPage();
		/*
		var create1 = {
				elem : '#create1',
				format : 'YYYY-MM-DD hh:mm',
				event : "focus",
			//	min : laydate.now(),
				max : '2099-06-16 23:59',
				istime : true,
				start : laydate.now(0, "YYYY-MM-DD hh:mm"),
				choose : function(datas) {
					start.max = datas; //结束日选好后，重置开始日的最大日期
				}
		};
		var create2 = {
				elem : '#create2',
				format : 'YYYY-MM-DD hh:mm',
				event : "focus",
			//	min : laydate.now(),
				max : '2099-06-16 23:59',
				istime : true,
				start : laydate.now(0, "YYYY-MM-DD hh:mm"),
				choose : function(datas) {
					start.max = datas; //结束日选好后，重置开始日的最大日期
				}
		};
		
		laydate(create1);
		laydate(create2);
		*/
		
		var start = {
			    format: 'YYYY-MM-DD hh:mm',
			    minDate: '2015-06-16 23:59:59', //设定最小日期为当前日期
			    //isinitVal:true,
			    maxDate: $.nowDate(0), //最大日期
			    choosefun: function(elem,datas){
			        
			    }
			};
		 var end = {
				    format: 'YYYY-MM-DD hh:mm',
				   // minDate: $.nowDate(0), //设定最小日期为当前日期
				    //isinitVal:true,
				    maxDate: '2019-06-16 23:59:59', //最大日期
				    choosefun: function(elem,datas){
				         
				    }
				};
		
		 $("#create1").jeDate(start);
		 $("#create2").jeDate(end);
		 
		$("#accountId1").change(function(){
			/* $("#randomId1").val($("#accountId1").val());
			$("#randomName1").val($("#accountId1 option:selected").text()); */
		});
		$("#accountId2").change(function(){
			alert(2);
			$("#randomId2").val($("#accountId2").val());
			$("#randomName2").val($("#accountId2 option:selected").text());
		});
	});
	function add(){
		window.location.href="${ctx}/projectActivityInfo/add";
	}
	
	function enter(activityId){
		$("#activityId").val(activityId);
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			shade: [0],
			area:['400px','300px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#enter'),
		});
	}
	
	function comment(activityId){
		$("#activityId").val(activityId);
		layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			shade: [0],
			area:['400px','300px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#comment'),
		});
	}
	
	function enterSave(){
		var activityId = $("#activityId").val();
		var accountId1 = "";
		var enterUser = "";
		
		if($('#select1').is(':checked')){
			accountId1=$("#accountId1").val();
			enterUser = $("#accountId1 option:selected").text();
		}else{
			accountId1=$("#randomId1").val();
			enterUser = $("#randomName1").val();
		}

		if(accountId1==""||accountId1 ==null){
			layer.msg("请选择账号"); 
			return;
		}
		var create1 = $("#create1").val();
		$.ajax({
			url:"${ctx}/projectActivity/json/enterSave",
			type:"post",
			data:{
					"activityId":activityId,
					"enterAccount":accountId1,
					"enterUser":enterUser,
					"create":create1,
					'${_csrf.parameterName}':'${_csrf.token}'
				},
			dataType:"json",
			success:function(result){
				layer.msg(result.msg);
				var num = Math.round(Math.random()*800);
				$("#randomId1").val($("#a"+num).val());
				$("#randomName1").val($("#a"+num).text());
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},
		});
	}
	
	function commentSave(){
		var commentContent = $("#commentContent").val();
		if(commentContent == null ||commentContent == ""){
			layer.msg("评论内容不能为空");
			return;
		}
		
		var accountId2 = "";
		var commentUser = "";
		
		if($('#select2').is(':checked')){
			accountId2=$("#accountId2").val();
			commentUser = $("#accountId2 option:selected").text();
		}else{
			accountId2=$("#randomId2").val();
			commentUser = $("#randomName2").val();
		}
		
		if(accountId2==""||accountId2 ==null){
			layer.msg("请选择账号"); 
			return;
		}
		
		var replyId = null;
		var activityId = $("#activityId").val();
		var create2 = $("#create2").val(); 
		$.ajax({
			url:"${ctx}/projectActivity/json/commentSave",
			type:"post",
			data:{
					"commentContent":commentContent,
					"replyId":replyId,
					"activityId":activityId,
					"commentAccount":accountId2,
					"commentUser":commentUser,
					"create":create2,
					"kind":201,
					'${_csrf.parameterName}':'${_csrf.token}'
				},
			dataType:"json",
			headers:{"token":'${pageContext.session.id}'},
			success:function(result){
				if(result.code==1){
					layer.msg(result.msg);
					var num = Math.round(Math.random()*800);
					$("#randomId2").val($("#b"+num).val());
					$("#randomName2").val($("#b"+num).text());
				}else{
					layer.alert(result.msg);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			},
		});
		
	}
	
	function detail(activityId){
		window.open("${ctx}/projectActivity/details/"+activityId);
	}
	
	//页面初始化
	function initPage(){
		  $("#accountId1").val('${info.accountId}');
		  $("#accountId1").searchableSelect();
		  $("#accountId2").val('${info.accountId}');
		  $("#accountId2").searchableSelect();
	}
	function returnBtn(){
		layer.closeAll();
	}
	
	function search(){
		var activityName = $("#activityName").val();
		window.location.href="${ctx}/projectActivityInfo/maintain?activityName="+activityName;
	}
</script>
</head>

<body class="">
	<input type="hidden" id="activityId" name="activityId">
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectActivityInfo/maintain" method="post">
	 <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
		  
	 <div class="wrapper wrapper-content animated fadeInRight"> 
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=""> <!-- 
					<h4 class="example-title">列表</h4> -->
					<div class="">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group" style="width:100%;">
						    <button type="button" class="btn btn-outline btn-default" onclick="add()" title="增加">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
						</div>
						<div style="float: right; margin-top: 10px; width:30%;">
							<div class="input-group m-b">
                                <input type="text" class="form-control" id="activityName" value="${searchText}">
                             	<span class="input-group-btn">
                                    <button type="button" class="btn btn-primary" onclick="search()">搜索</button>
								</span>
                            </div>
						</div>
                           
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox"   onclick="checkToAll(this)"/></th>
									<th >活动名称</th>
									<th >创建人姓名</th>
									<th >持续时间</th>
									<th >发布时间</th>
									<th >状态</th>
									<th >报名人数</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									 
									<td> <input type="checkbox" name="items" value="${info.activityId}" /></td>
									<td>${info.activityName}</td>
									<td>${info.createUser}</td>
									<td>
										<fmt:formatDate value="${info.startTime}" pattern="yyyy-MM-dd HH:mm"/>至
										<fmt:formatDate value="${info.endTime}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td>
										<fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm"/>
									</td>
									<td>${info.status==1?"报名中":"已结束"}</td>
									<td>${info.enterCount}</td>
									<td>
										<button class="btn btn-primary " type="button" onclick="enter('${info.activityId}')"><i class="fa fa-check"></i>报名</button>
										<button class="btn btn-info " type="button" onclick="comment('${info.activityId}')"><i class="fa fa-paste"></i>评论</button>
										<button class="btn btn-info " type="button" onclick="detail('${info.activityId}')"><i class="fa fa-paste"></i>详情</button>
									</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				
				<div style="height: 95px; width: 100%;">
					<c:if test="${totalPages>0}">
						<table width="100%" align="left" style="background: #f5f5f5;">
							<tr>
								<td align="left"><span class="pagetip">共检索到${pageTotal}条数据，每页${pageSize}条</span></td>
								<td align="right"><%@ include file="../common/page.jsp"%></td>
							</tr>
						</table>
					</c:if>
				</div>
				 
			</div>
		</div>
		
	</div>
	</form>
	
	<div id="enter" style="display:none; padding:10px 20px;">
		<select class="form-control m-b" id="accountId1" >
            <% int n=0; %>
			<c:if test="${accountInfoList!=null}">
				<c:forEach items="${accountInfoList}" var="account">
					<option id="a<%=n++%>" value='${account.accountId}'>${account.accountName}</option>
				</c:forEach>
			</c:if>
        </select>
        <input type="checkbox" id="select1" name="select1"/>
       <div class="col-sm-6">
			<span>账号：</span>
			<input id="randomId1" type="hidden" value="${accountInfoRandom.accountId}" />
			<input id="randomName1" class="laydate-icon form-control layer-date" value="${accountInfoRandom.accountName}" />
		</div>
        <div class="col-sm-6">
			<span>时间：</span><input id="create1" class="laydate-icon form-control layer-date" name="create" />
		</div>
		 <br>
		<div style="padding:10px 5px;">
			<input type="button" value="提交" onclick="enterSave()" class="sendBtn" style="cursor:pointer;">
			<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor:pointer;">
			<div style="clear:both;"></div>
		</div>
	</div>
	<div id="comment" style="display:none; padding:10px 20px;">
		<div style="margin-top:5px;">
			<textarea rows="4" style="width:100%;" id="commentContent" name="commentContent"></textarea>
		</div>
		<select class="form-control m-b" id="accountId2">
		 	<% int m=0; %>
            <option value=''>=请选择账号=</option>
			<c:if test="${accountInfoList!=null}">
				<c:forEach items="${accountInfoList}" var="account">
					<option id="b<%=m++%>" value='${account.accountId}'>${account.accountName}</option>
				</c:forEach>
			</c:if>
        </select>
        <input type="checkbox" id="select2" name="select2"/>
         <div class="col-sm-6">
			<span>账号：</span>
			<input id="randomId2" type="hidden" value="${accountInfoRandom.accountId}" />
			<input id="randomName2" class="laydate-icon form-control layer-date" value="${accountInfoRandom.accountName}" />
		</div>
        <div class="col-sm-6">
			<span>时间：</span><input id="create2" class="laydate-icon form-control layer-date" name="create" />
		</div>
		<br>
		<div style="padding:10px 5px;">
			<input type="button" value="提交" onclick="commentSave()" class="sendBtn" style="cursor:pointer;">
			<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor:pointer;">
			<div style="clear:both;"></div>
		</div>
	</div>
</body>
 
</html>
