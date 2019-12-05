<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>政府用户申请列表</title>

  <script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	$(function(){
		var msg = '${message}';
		if(msg!=null&&msg!=""){
			tips(msg);
			msg=null;
		}
		
		$('#search').click(function(){
			var searchKey = $('#accountName').val();
			window.location.href="${ctx}/projectDeclareUpgrade/list?searchKey="+searchKey;
		});
		
		$('#checkAll').click(function() {
			jQuery("[name='ids']:enabled").attr("checked", this.checked);
		});
		
		$('#audit').click(function(){
			layer.open({
				type: 1,
				title:false,
				shadeClose: true,
				shade: [0],
				area:['500px','280px'],
				closeBtn:0,
				content: $('#auditOper')
			});
		});
	});
	
	
	function audited(type){
		var str = "";
		jQuery("input[name='ids']:checkbox:checked").each(function() {
			str += jQuery(this).val() + ",";
		});
		if (str == "") {
			alert("请选择要操作的对象!");
			return;
		} else {
			str = str.substr(0, str.length - 1);
		}
		 $.ajax({
				url:"${ctx}/projectDeclareUpgrade/audit",
				type:"get",
				data:{
						"type":type,
						"ids":str
					 },
				dataType:"json",
				success:function(result){
					tips(result);
					window.location.href="${ctx}/projectDeclareUpgrade/list";
				},
				error:function(){
					tips("审核失败！");
					},
				});
	    
	}
</script>
</head>

<body class=" ">
	<form action="" id="form" method="post">
	</form>
	<form id="listform" name="listform" role="form" class="form-horizontal" action="${ctx}/projectDeclareInfo/mylist" method="post">
		  <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="col-sm-12">
				<div class=" ">
					 
					<div class=" ">
						<div class="btn-group hidden-xs" id="infoTableToolbars" role="group">
							<input type="button" class="btn btn-outline btn-default" id="audit" value="批量审核">
						</div>
							<div style="float: right; margin-top: 10px; width:30%;">
							<div class="input-group m-b">
                                <input type="text" class="form-control" id="accountName" value="${searchKey }">
                             	<span class="input-group-btn">
                                    <button type="button" class="btn btn-primary" id="search" >搜索</button>
								</span>
                            </div>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"/> 全选</th>
									<th>申请人</th>
									<th>发布日期</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td width="10%"><input type="checkbox" name="ids" value="${info.upgradeId }"/></td>
									<td width="60%">${info.accountName}</td>
									<td width="10%"><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd"/></td>
									<td width="20%"><a href='${ctx}/projectDeclareUpgrade/view?upgradeId=${info.upgradeId}'
												title='详细' ><img alt="" src="${ctx}/static/img/detail.png" title="详情" style="width: 22px;height: 22px;cursor: pointer;" /></a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				 <div id="auditOper" style="display:none;">
		<div style="padding:30px 20px;">
			<div style="border-bottom:1px solid #ccc;">
				<div >选择审核结果</div>
			</div>
			<div >
				<input type="button" value="通过" onclick="audited('1');"/>
				<input type="button" value="不通过" onclick="audited('0');"/>
			</div>
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
