<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>井开区智慧园区大数据决策平台</title>
</head>
<style>
 html,body {
   height: 100%;
   width:  100%;
   margin: 0;
   font-size: 0;
 }
 .layui-layer-btn .layui-layer-btn0{
 font-size: 14px;
 }
.index{
  height: 100%;
  width:  100%;
  background: url(${ctx}/static/image/cityDataCenter/jgs/bg1.png) no-repeat center;
  background-size: 100% 100%;
  position: relative;
}
.gray-bg {
    background-size: 100% 100%;
}
.tab {
    position: relative;
    height: 90px;
    font-size: 0;
    width: 65%;
    margin-left: 34%;
}
.head-a {
	position: relative;
    margin: 30px 6px;
    width: 140px;
    height: 44px;
    display: inline-block;
    color: #fff;
    text-decoration: none;
    font-size: 18px;
    line-height: 44px;
    text-align: center;
    font-weight: bold;
    opacity: 0;
    cursor: pointer;
}
</style>
<body class="gray-bg">
<div class="index">
   <div class="tab">
   	    <a  class="head-a" onclick="goIndex(1)" href="javascript:;">首页</a>
        <a  class="head-a" onclick="goIndex(2)" href="javascript:;">企业画像</a>
		<a  class="head-a" onclick="goIndex(3)" href="javascript:;">运营管理</a>
		<a  class="head-a" onclick="goIndex(4)" href="javascript:;">工业投资</a>
		<a  class="head-a" onclick="goIndex(5)" href="javascript:;">生产监测</a>
		<a  class="head-a" onclick="goIndex(6)" href="javascript:;">基础设施</a>
		<a  class="head-a" onclick="goIndex(7)" href="javascript:;">应急指挥</a>
   </div>
</div>
</body>
<script type="text/javascript">
$(function(){
	var tabIndex = '${tabIndex}';
	console.log(tabIndex);
	if(tabIndex==1){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg1.png)');
	}else if(tabIndex==3){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg3.png)');
	}else{
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg1.png)');
	}
})
function goIndex(index){
	if(index==1){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg1.png)');
	}else if(index==2){
		window.location.href= '${ctx}/front/cityDataCenter/jgsIndex/2?companyId=2016052609383280800263';
	}else if(index==3){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg3.png)');
	}else if (index==4){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg4.png)');
	}else if(index==5){
		layer.msg('内容建设中...');
	}else if (index==6){
		layer.msg('内容建设中...');
	}else if(index==7){
		$('.index').css('background-image','url(${ctx}/static/image/cityDataCenter/jgs/bg7.png)');
	}
	
}

</script>
</html>
