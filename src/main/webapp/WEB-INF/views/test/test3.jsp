<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>弹出测试</title>
<head>
<meta charset="UTF-8">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="${ctx}/static/js/contabs-tab.js"></script> 
<style>
</style>
<script>
 function  test1(){
	  tips('2秒提示');
 }
 function  test2(){
	 alert('警告提示');
 }
 function  test3(){
	 // del  点击确认时要执行的动作
	  //  nodel  点击取消时要执行的动作，如果不填默认不执行任何操作
	  confirm('确认删除？', del, nodel);
}
 function del(){
	 tips('=====删除成功=====');
 }
 function nodel(){
	 tips('=====没删除=====');
 }
 function test(){
	// layer.tips('只想提示地精准些', '#test');
	 layer.tips('在上面', '#test', {
		  //tips: 1 // 上右下左四个方向，通过1,2,3,4
		  tips:[1, '#c90'] // 指定颜色
		});
 }
 function showNew(){
		alertNew('输入框得到焦点',function(){
			 layer.closeAll();//点击确认后，关闭弹框；
			 $('#mytext').focus();
		}) ;
	}
 function showPage(){
	 layer.open({
			type: 2,
			title:'弹出的页面',
			shadeClose: true,
			shade:  0 ,
			area:['700px','390px'],
			closeBtn:1,
			btn: ['确定', '取消'],
	  		 btn1: function(index, layero){
		      //按钮【按钮一】的回调
		         var body = layer.getChildFrame('body', index);
		         var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		      // body.find('input').val('Hi，我是从父页来的')
		         tips(iframeWin.findContent());
		     },btn2: function(index, layero){
		       //按钮【按钮二】的回调
		    	 tips('【按了取消按钮】');
			 },cancel: function(){ 
			    //右上角关闭回调
				  tips('【按了右上角关闭】');
			 },
			content: "${ctx}/test/main"
		}); 
	}
 function showTab(){
	 //弹出新页签  addNewTab(title,url) {
	 addNewTab("我的页签-省市县","${ctx}/test/test6") ;
 }
 function showPage2(){
	 layer.open({
			type: 1,
			title:false,
			shadeClose: true,
			shade: 0 ,
			area:['250px','300px'],
			content: $('#testt')
		}); 
  }
</script>
</head>
<body class=" "> <h3> 页面：test3.jsp <br></h3>

<h2> 
首先在页面头部引入  "../common/commonPage.jsp"  <br>
</h2>
    <a href="javascript:;" onClick="test1();"  >2秒提示【用于操作成功等场景的提示】用法： tips('2秒提示');</a>
  <br>   <a href="javascript:;" onClick="test2();"  >警告提示【用于提示用户等场景】用法： alert('警告提示');</a>
   <br>  <a href="javascript:;" onClick="test3();"  >确认提示【用于确认操作】用法：confirm('确认删除？', del, nodel);</a>
   <br>  <a href="javascript:;" onClick="test();"  > 可以定位的弹出</a>
   <br>  <a  href="javascript:;"  onclick="showNew()"  >带回调函数的弹出</a>
   <br> <input type="text"  id="mytext" value='输入框' />
    <br>  <a  href="javascript:;"  onclick="showTab()"  > 弹出页签</a> 
   <br>  <a  href="javascript:;"  onclick="showPage()"  > 弹出页面(点确定得到弹出页上的内容)</a>
     <br>  <a  href="javascript:;"  onclick="showPage2()"  > 弹出二维码</a>
<br><br>
								<div class="form-group">
                                    <label class="font-noraml">Bootstrap弹层</label>
                                    <div class="well">
                                        <button id="test" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">显示</button>
                                    </div>
                                </div>
 <br>
  
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">选择</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group  ">
                     aaa   <input type="text" value="" class="form-control" />
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                       <button type="button" class="btn  " data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>    
     <!-- 模态框   
			<div class="modal fade"  tabindex="300"  id="myModal" aria-hidden="true"  data-backdrop="static"> </div>
	    模态框-->                             
				<div style="display:none" id="testt">     
					<img src=''  width="250px;" height="250px;"/>
				  	  <br>&nbsp;&nbsp;打开微信，点击底部的“发现”
					  <br>&nbsp;&nbsp;使用“扫一扫”即可将网页分享至朋友圈。
                </div>
</body>
</html>
 