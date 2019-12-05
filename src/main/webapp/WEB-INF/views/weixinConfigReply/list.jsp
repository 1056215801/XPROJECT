<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>列表</title>
<script type="text/javascript">
function add(){
	$('#form').attr("action", "${ctx}/weixinConfigReply/add").submit();
}
function edit(id){
	$('#form').attr("action", "${ctx}/weixinConfigReply/edit/"+id).submit();
}
function view(id){
	$('#form').attr("action", "${ctx}/weixinConfigReply/view/"+id).submit();
}
function del(id){
	layerConfirm('确认删除？', function(){
		$('#form').attr("action", "${ctx}/weixinConfigReply/delete/"+id).submit();
		},function(){});
}
$(function () {	
  //初始化
}); 
</script>
</head>

<body class="">
	 
	<form id="form" name="listform" role="form" class="form-horizontal" action="${ctx}/weixinConfigReply/list" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<div class="col-sm-12">
					<div class="">
						<!-- <h4 class="example-title">列表</h4> -->
						<div class="">
							<div class="btn-group hidden-xs" id="infoTableToolbars" role="group" style="width: 100%;">
								<button type="button" class="btn btn-outline btn-default" onclick="add()" title="新增">
									<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
								</button>
								<!-- <button type="button" class="btn btn-outline btn-default" onclick="del()" title="删除">
									<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
								</button> -->
							</div>
							<div style="float: right; margin-top: 10px; width: 30%;">
								<div class="input-group m-b">
									<input type="text" class="form-control" name="searchKey" value="${searchKey}"> 
									<span class="input-group-btn">
										<button type="submit" class="btn btn-primary">搜索</button>
									</span>
								</div>
							</div>

							<table id="infoTable" data-mobile-responsive="true">
								<thead>
									<tr><!-- 
										<th><input type="checkbox"   onclick="checkToAll(this)"/></th> -->
														<th>															 
															标题
														</th>
														<th>															 
															输入语 
														</th>
														<th>															 
															类型 
														</th>
														<th>															 
															排序
														</th>
														<th>															 
															关注时是否显示
														</th>
														<th>	
															状态
														</th>
													<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page}" var="obj" varStatus="k"> 
									<tr><!-- 
									<td> <input type="checkbox" name="items" value="" /></td> -->
									<td >${obj.title}</td>
										 	<td >${obj.inputWord}</td>
										 	<td >${obj.type}</td>
										 	<td >${obj.showSubscribeOrder}</td>
										 	<td >
										 		<c:if test="${obj.showSubscribe==1}">是</c:if>
												<c:if test="${obj.showSubscribe==0}">否</c:if>
										 	<td >
										 	    <c:if test="${obj.status==1}">有效</c:if>
												<c:if test="${obj.status==0}">无效</c:if>
										 	</td>
									<td>
										<img alt="" src="${ctx}/static/img/edit.png" title="编辑" style="width: 25px;height: 25px;cursor: pointer;" onclick="edit('${obj.replyId}')" />
										<!-- 
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" onclick="view('${obj.replyId}')"/>
										 -->
										 <img alt="" src="${ctx}/static/image/del.png" title="删除" style="width: 22px;height: 22px;cursor: pointer;" onclick="del('${obj.replyId}')"/>
									</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 分页 -->
					<div style="height: 95px; width: 100%;">
						<c:if test="${pageTotal>0}">
							<table width="100%" align="left" style="background: #f5f5f5;">
								<tr>
									<td align="left"><span class="pagetip">共检索到${pageTotal} 条数据，每页${pageSize}条</span></td>
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
