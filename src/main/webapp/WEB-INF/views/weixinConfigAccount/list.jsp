<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>已关注的用户列表</title>

<script type="text/javascript">
	function add(url){
		$('#form').attr("action", url).submit();
	}
	
	function edit(id){
		$('#form').attr("action", url).submit();
	}
	
	function view(id){
		$('#form').attr("action", url).submit();
	}
	
	function del(url){
		var ids = getIds();
		$('#form').attr("action", url).submit();
	}
	
	$(function(){
		if(msg!=null&&msg!=""){
			var msg = '${message}';
			layer.alert(msg);
		}
	});
</script>
</head>

<body class="">
	<form action="" id="form" method="post">
	<input type="hidden" id="bindId" name="bindId" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/weixinConfigAccount/list" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=""> <!-- 
					<h4 class="example-title">列表</h4> -->
					 <div class="">
					<!--
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group" style="width:100%;">
						    <button type="button" class="btn btn-outline btn-default" onclick="add()" title="增加">
								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
							</button>
							<button type="button" class="btn btn-outline btn-default" onclick="del()" title="删除">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
						</div>  -->
						<div style="float: right; margin-top: 10px; width:30%;">
							<div class="input-group m-b">
                                <input type="text" class="form-control" name="searchText" value="${searchText}">
                             	<span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary" >搜索</button>
								</span>
                            </div>
						</div>
						 
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th >openid</th>
									<th >头像</th>
									<th >昵称</th>
									<th >性别</th>
									<th >省</th>
									<th >市</th>
									<th >关注时间</th>
									<th >语言</th>
									<th >备注</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									 
									<td>${info.openId}</td>
									<td>  
									   <c:if test="${info.headImgurl!=null}">
									    <img  width="40px" height="40px" src="${info.headImgurl}" />
										 </c:if>
									</td>
									<td>${info.nickName}</td>
									<td><c:if test="${info.sex==0 }">未知</c:if>
										<c:if test="${info.sex==1 }">男</c:if>
										<c:if test="${info.sex==2 }">女</c:if>
									</td>
									<td>${info.province}</td>
									<td>${info.city}</td>
									<td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${info.language}</td>
									<td>${info.remark}</td>
									<td>
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="view('${ctx}/projectActivityAccount/view','${info.bindId}')"/>
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

</body>
</html>
