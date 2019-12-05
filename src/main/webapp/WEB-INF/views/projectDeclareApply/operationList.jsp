<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonList.jsp"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目查看</title>

 <script type="text/javascript" src="${ctx}/static/js/plugins/layer/layer.min.js"></script>
<script type="text/javascript"
		src="${ctx}/static/js/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		var timeNow1 = {
				elem : '#laydate', //选择ID为START的input
				event : "focus",
				format : 'YYYY-MM-DD', //自动生成的时间格式
				//min : laydate.now(), //设定最小日期为当前日期
				max : '2099-06-16 23:59:59', //最大日期
				istoday : true, //是否是当天
				start : laydate.now(0, "YYYY-MM-DD"), //设置开始时间为当前时间
			};
			laydate(timeNow1);
		
		$('#checkAll').click(function() {
			jQuery("[name='ids']:enabled").attr("checked", this.checked);
		});
		$('#back').click(function() {
			window.location.href="${ctx}/projectDeclareInfo/operationList";
		});
		$('#search').click(function(){
			var companyName = $('#companyName').val();
			window.location.href="${ctx}/projectDeclareApply/operationList?companyName="+companyName;
		});
		
		var msg = '${message}';
		if(msg!=null&&msg!=""){
			tips(msg);
			msg=null;
		}
		
		$('#open').click(function(){
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
	
	
	
	function audit(type){
		var str = "";
		var createDate = $('#laydate').val();
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
				url:"${ctx}/projectDeclareApply/operationAudit",
				type:"get",
				data:{
						"type":type,
						"ids":str,
						"createDate":createDate
					 },
				dataType:"json",
				success:function(result){
					tips(result);
					window.location.href="${ctx}/projectDeclareApply/operationList?declareId=${declareId}";
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
							<input type="button" class="btn btn-outline btn-default" id="open" value="审核">
							<input type="button" class="btn btn-outline btn-default" id="back" value="返回">
						</div>
						<div style="float: right; margin-top: 10px; width:30%;">
							<div class="input-group m-b">
                                <input type="text" class="form-control" id="companyName" value="">
                             	<span class="input-group-btn">
                                    <button type="button" class="btn btn-primary" id="search">搜索</button>
								</span>
                            </div>
						</div>
						<table id="infoTable" data-mobile-responsive="true">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"/> 全选</th>
									<th>企业名称</th>
									<th>联系人</th>
									<th>联系电话</th>
									<th>附件</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="info">
									<tr>
									<td width="10%"><input type="checkbox" name="ids" value="${info.applyId }"/></td>
									<td width="40%">
											${info.companyName }</td>
									<td width="10%">${info.accountName }</td>
									<td width="20%">${info.accountTel }</td>
									<td width="20%">
									<c:if test="${info.atIdList!=null}">
									<span class="spanOper">[<a class="aOper" href="${ctx}/projectDeclare/batchDownload?atIdList=${info.atIdList }">下载</a>]</span>
									</c:if>
									<c:if test="${info.atIdList==null}">
									无
									</c:if>
									</td>
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
				<input type="button" value="通过" onclick="audit(1);"/>
				<input type="button" value="不通过" onclick="audit(0);"/>
			</div>
			<div class="form-group">
								<label class="col-sm-2 control-label">填写创建时间</label>
								<div class="col-sm-10">
									<input id="laydate"
										class="laydate-icon form-control layer-date laydateContral"
										style="width: 40%" name="createDate"/>
								</div>
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
