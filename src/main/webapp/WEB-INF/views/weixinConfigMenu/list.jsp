<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="UTF-8">
<title>微信菜单设置</title>
<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6">
<link rel="stylesheet" href="${ctx}/static/css/weixin/pagebase.css" />
<link rel="stylesheet" href="${ctx}/static/css/weixin/style.css" />
<!-- 
<script type="text/javascript" src="${ctx}/static/script/customMenu.js"></script>
 -->
<style>
/*页面默认设置*/
body {
font-family: "ff-tisa-web-pro-1", "ff-tisa-web-pro-2", "Lucida Grande",
	"Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB",
	"Hiragino Sans GB W3", "WenQuanYi Micro Hei", sans-serif;
}
/*解决win8 IE10 兼容  s*/
@
-webkit-viewport {
width: device-width;
}
@
-moz-viewport {
width: device-width;
}
@
-ms-viewport {
width: device-width;
}
@
-o-viewport {
width: device-width;
}
@
viewport {
width: device-width;
}
/*三大模块 共用样式*/
body, html {
height: 100%;
font-family: "Microsoft YaHei";
}
.tishi {
background-color: #F9EDBE;
border: 1px solid #F0C36D;
padding: 7px;
box-shadow: 0 0 3px #000;
}
.huise_btn {
background-color: #F3F3F3;
}
.caidan_tab {
}
.biaotou {
background-color: #EEEEEE;
border-bottom: none;
}
.kuandu {
width:80px;
}
.kuandu2 {
width:400px;
}
</style>

</head>
<body class="">
 
<div class="container">
	<div class="tit"><br>
	<!--	<h1>自定义微信菜单</h1>
		<hr style="border-color: #ADADAD;" />-->
	</div> 
	<div class="tishi">
		<p>注意：1级菜单最多只能开启3个，2级子菜单最多开启5个!</p>
		<p>只有保存主菜单后才可以添加子菜单</p>
		<p>生成自定义菜单,必须在已经保存的基础上进行,临时勾选启用点击生成是无效的! 第一步必须先【保存】！第二步点击【同步到微信】!</p>
		<p>当您为自定义菜单填写链接地址时请填写以"http://"开头，这样可以保证用户手机浏览的兼容性更好</p>
	</div>
	<br />
	 <div class="zhucaidan">
			<input type="button" class="btn btn-default huise_btn" value="+添加主菜单" onclick="addMain()">
		</div> 
	<br />
	<div class="edit_caidan">
	<form name="dataForm" id="dataForm"  method="post"  action="${ctx}/weixinConfigMenu/save" >
 		<table class="table table-hover caidan_tab" id="tab">
			<thead class="biaotou" id="tr_head">
				<th>显示顺序</th>
				<th>菜单名称</th>
				<th>触发动作</th>
				<th>跳转地址</th>
				 
				<th>操作</th>
			</thead>
		 <c:forEach items="${parentList}" var="mainMenu" varStatus="mainStatus"  >
			<tr id="tr_${mainMenu.menuId}" style="">
				<td><input type="tel" class="kuandu"  value="${mainMenu.orderNum}"    name="orderNum"   /></td>
				<td>主：<input type="text"  value="${mainMenu.menuName}" name="menuName" />&nbsp; 
				<input type="button" onclick="addSub('${mainMenu.menuId}')"
					value="+" class="btn btn-primary btn-xs" title="添加子菜单" id="" />
				</td>
				<td><select onchange="changeView(this)" id="${mainMenu.menuId}" name="menuType" class="mainMenu">
						<option value=" ">显示子菜单</option>
						<option value="view"  <c:if test="${mainMenu.menuType=='view'}">selected</c:if>   >跳转超链接</option>
				</select></td>
				<td>  <input type="text" id="url_${mainMenu.menuId}" style="display:none" class="kuandu2"
					 placeholder="请输入链接地址"  value="${mainMenu.saveValue}"   name="saveValue"  />
				</td>
				<td><input type="hidden"  value="${mainMenu.parentMenuId}" name="parentMenuId" class="css_root" /> 
				<input type="hidden"  value="0" name="isDelete" id="del_tr_${mainMenu.menuId}" /> 
				<input type="hidden" value="${mainMenu.menuId}" name="ids"   />  
				 <a onclick="hideRow(this);" href="javascript:;">删除</a></td>
			</tr>
			
		  <c:forEach items="${childrenList}" var="subMenu" varStatus="subStatus" >
		   <c:if test="${subMenu.parentMenuId==mainMenu.menuId}">
			<tr id="tr_${subMenu.menuId}" style="" class="zi1">
				<td><input type="tel" value="${subMenu.orderNum}"  name="orderNum"  class="kuandu" /></td>
				<td>——子：<input type="text" value="${subMenu.menuName}" name="menuName"  />
				</td>
				<td><select onchange="changeView(this)" id="${subMenu.menuId}" name="menuType"  class="subMenu" >
						<option value="view">跳转超链接</option>
				</select></td>
				<td> <input type="text" id="url_${subMenu.menuId}" style="display:block"  class="kuandu2"
					  placeholder="请输入链接地址"  value="${subMenu.saveValue}"  name="saveValue" /></td>
				<td><input type="hidden"  value="${subMenu.parentMenuId}" name="parentMenuId" class="css_${subMenu.parentMenuId}" /> 
				<input type="hidden" value="0" name="isDelete" id="del_tr_${subMenu.menuId}" /> 
				<input type="hidden" value="${subMenu.menuId}" name="ids"   />  
				<a onclick="hideRow(this);" href="javascript:;">删除</a></td>
			</tr>
			</c:if>
		  </c:forEach> 
		  
		 </c:forEach>
		</table>
		</form>
	</div>
	<div class="chuli">
		<input type="button" class="btn btn-primary" value="保存"  onclick="saveData()"/>
		&emsp;<input type="button" class="btn btn-success"  onclick="saveAndSyn()"
			value="更新到微信" /> &emsp;&emsp;&emsp;
			 
			 <!-- 
			 <input type="button" onclick="testTemp()"
			  class="btn btn-default huise_btn" value="测试模板消息" />
			   -->
	</div>
</div>

<script type="text/javascript">
var a=0;
var b=0;
window.onload=function(){    
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		tips(msg);
		msg=null;
	}
	$(".mainMenu").each(function(index){
	    if($(this).val()=='view'){
	    	$(this).change();
	    } ;
	  });
};
function changeView(obj){
	var tr=$(obj).parent().parent();
	//var id= $(tr).attr('id');
	//$(tr).hide(); //隐藏
	var id=obj.id ;
	if(obj.value==' '){
		$("#url_"+id).hide();
	}else{
		$("#url_"+id).show();
	}
}
function add_main(obj){
	var tr=$(obj).parent().parent();
	//var id= $(tr).attr('id');
	$(tr).hide(); //隐藏
	
	//ajax
}
function hideRow(obj){
	var s=confirm('确定删除？',function(){
		var tr=$(obj).parent().parent();
		var id= $(tr).attr('id');
		$("#del_"+id).val("1");
		$("#del_"+id).show();
		$(tr).hide(); //隐藏
	})
	
}
function saveData(){
	//页面校验
	$('#dataForm').submit();
}
function addSub(menuId){
	a++ ;
	var ss=  $('.css_'+menuId).parent().parent()  ;  
	var l= 0;
	$(ss).each(function(index){
		if($(this).is(":visible")==true){
			l++ ;
		}
	  });
	//alert(l);
	var id="tempSub"+ a; 
	var s='<tr id="tr_'+id+'" style="" class="zi1">' ;
	s=s+'<td><input type="tel" value="'+a+'"  name="orderNum" class="kuandu" /></td>' ;
	s=s+'<td>——子：<input type="text" value="子菜单_'+a+'" name="menuName"  /></td>' ;
	s=s+'<td><select onchange="changeView(this)" id="'+id+'" name="menuType" class="subMenu" >' ;
	s=s+'		<option value="view">跳转超链接</option>' ;
	s=s+'</select></td>' ;
	s=s+'<td> <input type="text" id="url_'+id+'" style="display:block" class="kuandu2" ' ;
	s=s+'	  placeholder="请输入链接地址"  value=""  name="saveValue" /></td>' ;
	s=s+'<td><input type="hidden"  value="'+menuId+'" name="parentMenuId" class="css_'+menuId+'" /> ' ;
	s=s+'<input type="hidden" value="0" name="isDelete" id="del_tr_'+id+'" /> ' ;
	s=s+'<input type="hidden" value="'+id+'" name="ids"   /> ' ;
	s=s+'<a onclick="hideRow(this);" href="javascript:;">删除</a></td></tr>' ;
	 
	if(l==0){
		$('#tr_'+menuId).after(s);
	}else if(l<5){
		$(ss).last().after(s);
	} else{
		a--;
		alert('最多5个子菜单');
	}
}
function addMain(){
	b++ ;
	var l= 0;
	$('.css_root').parent().parent().each(function(index){
		if($(this).is(":visible")==true){
			l++ ;
		}
	  });
	var id="tempMain"+ b; 
	var s='<tr id="tr_'+id+'" style="" class="zi1">' ;
	s=s+'<td><input type="tel" value="'+b+'"  name="orderNum" class="kuandu" /></td>' ;
	s=s+'<td>主：<input type="text" value="主菜单_'+b+'" name="menuName"  />&nbsp;&nbsp;' ;
	s=s+'<input type="button" onclick="addSub(\''+id+'\')"' ;
	s=s+'	value="+" class="btn btn-primary btn-xs" title="添加子菜单" id="" /></td>' ;
	s=s+'<td><select onchange="changeView(this)" id="'+id+'" name="menuType" class="mainMenu" >' ;
	s=s+'<option value=" ">显示子菜单</option><option value="view">跳转超链接</option>' ;
	s=s+'</select></td>' ;                                                                                                                                                                                                                                                                                                                                   
	s=s+'<td> <input type="text" id="url_'+id+'" style="display:none" class="kuandu2" ' ;
	s=s+'	  placeholder="请输入链接地址"  value=""  name="saveValue" /></td>' ;
	s=s+'<td><input type="hidden"  value="-1" name="parentMenuId" class="css_root" /> ' ;
	s=s+'<input type="hidden" value="0" name="isDelete" id="del_tr_'+id+'" /> ' ;
	s=s+'<input type="hidden" value="'+id+'" name="ids"   /> ' ;
	s=s+'<a onclick="hideRow(this);" href="javascript:;">删除</a></td></tr>' ;
	
	if(l==0){
		$('#tr_head').after(s);
	}else if(l<3){
		//$('#tab tr:last').after(s);
		$('#tab').append(s);
	} else{
		b--;
		alert('最多3个主菜单');
	}
}
function saveAndSyn(){
	$.ajax({
		type : 'POST',
		url : "${ctx}/weixinConfigMenu/json/syn",
		dataType : "json",
		success : function(data) {
				tips(data);
		}
	});
	
}
function testTemp(){
	$.ajax({
		type : 'POST',
		url : "${ctx}/weixinConfigMenu/json/testTemp",
		dataType : "json",
		success : function(data) {
			tips(data);
		}
	});
}
</script>
</body>
</html>
 