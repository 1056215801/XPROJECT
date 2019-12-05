<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>已审核列表</title>
<script type="text/javascript">
	//详情
     function view(id) {
	 window.location.href="${ctx}/projectSuggestInfo/suggestView?suggestId="+id;
     }
	
	//删除
	function del(url){
	var ids = getSelectedItems(); //获取选中的
	if(ids==''){
		alert('请至少选择一项');
		return false ;
	}else{
	   layer.confirm("确认删除？",function(){
		   window.location.href="${ctx}/projectSuggestInfo/delete?id="+ids;
	   },function(){return false;});
    }
   }
</script>
</head>

<body class="">
	<form id="listform" name="listform" role="form" class="form-horizontal"
		action="${ctx}/projectSuggestInfo/myYesList" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}" />
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<div class="col-sm-12">
					<div class="">
						<div class="">
							<div class="btn-group hidden-xs" id="infoTableToolbars"
								role="group" style="width: 100%;">
							<button type="button" class="btn btn-outline btn-default" onclick="del()">
								<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
							</button>
							</div>
							<div style="float: right; margin-top: 10px; width: 30%;">
								<div class="input-group m-b">
									<input type="text" class="form-control" name="searchText"
										value="${searchText}"> <span class="input-group-btn">
										<button type="submit" class="btn btn-primary">搜索</button>
									</span>
								</div>
							</div>

							<table id="infoTable" data-mobile-responsive="true">
								<thead>
									<tr>
						                <th><input  id="checkAll" type="checkbox" onclick="checkToAll(this)"/></th>
										<th>建议主题</th>
										<th>建议人姓名</th>
										<th>建议人联系电话</th>
										<th >状态</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${page}" var="info">
								<tr>
                            <td><input type="checkbox" name="items" value="${info.suggestId}" /></td>
								<td>${info.suggestTitle}</td>
							    <td>${info.accountName}</td>
							     <td>${info.accountTel}</td>
								<c:choose>
								<c:when test="${info.status==2}">
								<td>审核中</td>
								</c:when>
								<c:otherwise>
								<td>${info.status==1?"已采纳":"未采纳"}</td>
								</c:otherwise>
							    </c:choose>
		 <td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
		                        <td width="20%"> 
		 <img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px; height: 22px; cursor: pointer;" onclick="view('${info.suggestId}')" />
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
