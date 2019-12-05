<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>jQuery移动端触屏滑动日期控件  </title>
<%@ include file="../common/datetimePage_mobile.jsp"%>
   
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            font-family: arial, verdana, sans-serif;
            font-size: 12px;
            background: #ddd;
        }
        input, select {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
            border: 1px solid #aaa;
            box-sizing: border-box;
            border-radius: 5px;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -webkit-border-radius: 5px;
        }
        .header {
            border: 1px solid #333;
            background: #111;
            color: white;
            font-weight: bold;
            text-shadow: 0 -1px 1px black;
            background-image: linear-gradient(#3C3C3C,#111);
            background-image: -webkit-gradient(linear,left top,left bottom,from(#3C3C3C),to(#111));
            background-image: -moz-linear-gradient(#3C3C3C,#111);
        }
        .header h1 {
            text-align: center;
            font-size: 16px;
            margin: .6em 0;
            padding: 0;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
        .content {
            padding: 15px;
            background: #fff;
        }
       
    </style>
</head>

<body><h3> 页面：test4.jsp <br></h3>
    <div class="header">
        <h1>Mobiscroll</h1>
    </div>

    <div class="content">
		<div class="demos">
			<label for="appDateTime">日期时间</label>
			<input value="2015-05-01 15:42:02" class="" readonly="readonly" name="appDateTime" id="appDateTime" type="text">
		</div>
		<div class="demos">
			<label for="appDate">日期</label>
			<input value="" class="" readonly="readonly" name="appDate" id="appDate" type="text">
		</div>
		<div class="demos">
			<label for="appTime">时间</label>
			<input value="16:43" class="" readonly="readonly" name="appTime" id="appTime" type="text">
		</div>
	</div>
	<script type="text/javascript">

        $(function () {
			//初始化 
		  	$("#appDate").mobiscroll($.extend(opt['date'], opt['default']));
		  	$("#appDate")[0].value = new Date().Format("yyyy-MM-dd");
		  	
		  	var optDateTime = $.extend(opt['datetime'], opt['default']);
		  	var optTime = $.extend(opt['time'], opt['default']);
		  	
		    //初始化 
		    $("#appTime").mobiscroll(optTime).time(optTime);
		    $("#appTime")[0].value = new Date().Format("hh:mm");
		    
		    //初始化 
		    $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
            $("#appDateTime")[0].value = new Date().Format("yyyy-MM-dd hh:mm:ss");

        });
    </script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
 
</div>
</body>
</html>