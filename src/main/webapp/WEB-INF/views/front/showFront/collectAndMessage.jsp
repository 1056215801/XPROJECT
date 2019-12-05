<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div id="reportBar" style="display: none; padding: 14px 20px 10px;">
	<form action="" id="form" method="post">
		<input type="hidden"  name="${_csrf.parameterName}"	value="${_csrf.token}"/>
		<input type="hidden" id="type" name="type" value=""/>
		<input type="hidden" id="relatedId" name="relatedId" value=""/>
		<input type="hidden" id="relatedName" name="relatedName" value=""/>
		<input type="hidden" id="relatedCompanyId" name="relatedCompanyId" value=""/>
		<div style="margin-top: 5px;">
			<span>标题：<input type="text" style="width: 357px;border: 1px solid #ccc;padding: 5px;" id="title" name="title"></span>
			<br/>
			<br/>
			<span>内容：<textarea rows="4" style="width: 355px;border: 1px solid #ccc;padding: 5px;" id="content"
				name="content"></textarea></span>
		</div>
		<div style="padding: 10px 5px;">
			<input type="button" value="提交" onclick="sendBtn(this)" class="sendBtn" style="cursor: pointer;"> 
			<input type="button" value="关闭" onclick="returnBtn()" class="returnBtn" style="cursor: pointer;">
			<div style="clear: both;"></div>
		</div>
	</form>
</div>
<style type="text/css">

.returnBtn {
	width:100px;
	border:1px solid #E6E6E6;
	background-color:#F2F2F2;
	color:#000;
	padding:4px 0;
	margin-right:5px;
	float:right;
}
.sendBtn {
	width:100px;
	border:1px solid #F04444;
	background-color:#F04444;
	color:#fff;
	padding:4px 0;
	margin-right:15px;
	float:right;
}

</style>
<script type="text/javascript">

	function message(type, relatedId, relatedName, relatedCompanyId){
		$("#type").val(type);
		$("#relatedId").val(relatedId);
		$("#relatedName").val(relatedName);
		$("#relatedCompanyId").val(relatedCompanyId);
		
	 	layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			skin: 'reportBar',
			shade: [0],
			area:['450px','270px'],
			offset:['200px','600px'],
			closeBtn:0,
			content: $('#reportBar'),
		});
	 };
	 
	 function sendBtn(obj){
		
		$(obj).attr('disabled','disabled');
		var title = $("#title").val();
		if(title==null||title==""){
			layer.msg("标题不能为空！");
			return;
		}
		
		var content = $("#content").val();
		if(content==null||content==""){
			layer.msg("内容不能为空！");
			return;
		}
		 
		title = safeStr(title);
		content = safeStr(content);

		$.ajax({
			url:"${ctx}/interface/json/showProduct/message",
			type:"post",
			data:$("#form").serialize(),
			success:function(result){
				if(result.success){
					layer.msg("提交成功！");
					$(obj).attr('disabled','');
					setTimeout(function(){
						layer.closeAll();
					}, 1500);
				}else{
					layer.msg(result.errorMsg);
				}
			},
			error:function(){
				layer.msg("操作超时！");
			}
		});
		 
	 }
	 
	 function returnBtn(){
		 layer.closeAll();
	 }
	 
	 function collect(obj, type, relatedId, relatedName){
		 var isCollect = $(obj).attr("data");
		 if(isCollect==0){//收藏
			 $.ajax({
					url:"${ctx}/interface/json/showProduct/collect",
					type:"post",
					data:{"type":type, "relatedId":relatedId, "relatedName":relatedName},
					success:function(result){
						if(result.success){
							$(obj).find("img").first().attr("src", "${ctx}/static/image/product/alreadyCollect.png");
							$(obj).attr("data", "1");
						}
						layer.msg(result.errorMsg);
					},
					error:function(){
						layer.msg("操作超时！");
					}
			});
		 }else{//取消收藏
			 $.ajax({
					url:"${ctx}/interface/json/showProduct/cancelCollect",
					type:"post",
					data:{"relatedId":relatedId},
					success:function(result){
						if(result.success){
							$(obj).find("img").first().attr("src", "${ctx}/static/image/product/notCollected.png");
							$(obj).attr("data", "0");
						}
						layer.msg(result.errorMsg);
					},
					error:function(){
						layer.msg("操作超时！");
					}
			});
		 }
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
</script>
