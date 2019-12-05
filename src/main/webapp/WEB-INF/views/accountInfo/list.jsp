<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户列表</title>

<script type="text/javascript">
	
	function edit(url,activityId){
		$("#activityId").val(activityId);
		$('#form').attr("action", url).submit();
	}
	
	function view(activityId){
		window.open("${ctx}/projectActivity/details/"+activityId);
	}
	
	function del(url){
		var ids = getSelectedItems();
		if(ids==''){
			alert('请至少选择一项');
			return false ;
		}else{
		   alert(ids);
//			$("#activityId").val(ids);
			//	$('#form').attr("action", url).submit();
	 }
	}
 $(function () {	
	/*   
	$("#checkAll").click(function(){
		  var v=$(this).val();
		  alert(v);
		  $("input[name='checkboxIds']").each(function(){
		      $(this).attr("checked",v);              
		     });
	});  */
	
	  
  });  
</script>
</head>

<body class="">
	<form action="" id="form" method="post">
		<input type="hidden" id="activityId" name="activityId" value=""/>
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/accountInfo/list" method="post">
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
									<th >账号ID</th>
									<th >登录名称</th>
									<th >账号名称</th>
									<th >状态</th>
									<th >登录时间</th>
									<th >操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td>${info.accountId}</td>
									<td>${info.accountCode}</td>
									<td>
										${info.accountName} 
									</td>
									<td>${info.status==1?"在用":"锁定"}</td>
									<td> 
									<fmt:formatDate value="${info.loginTime}" pattern="yyyy-MM-dd HH:mm"/> 
									</td>
									<td> 
										<img alt="" src="${ctx}/static/img/edit.png" title="编辑" style="width: 25px;height: 25px;cursor: pointer;"   />
										<img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;"  />
									  </td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				<!--  -->
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
