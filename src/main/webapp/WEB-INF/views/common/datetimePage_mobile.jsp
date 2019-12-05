<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 移动端的日期控件 -->
    <script src="${ctx}/static/plugins/mobiscroll/js/mobiscroll_002.js" type="text/javascript"></script>
	<link href="${ctx}/static/plugins/mobiscroll/css/mobiscroll_002.css" rel="stylesheet" type="text/css">
 
	<link href="${ctx}/static/plugins/mobiscroll/css/mobiscroll.css" rel="stylesheet" type="text/css">
	<script src="${ctx}/static/plugins/mobiscroll/js/mobiscroll.js" type="text/javascript"></script>
	
	<script src="${ctx}/static/plugins/mobiscroll/js/mobiscroll_0035.js" type="text/javascript"></script>
	<link href="${ctx}/static/plugins/mobiscroll/css/mobiscroll_003.css" rel="stylesheet" type="text/css">
	
<script type="text/javascript">
 Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) 
    	fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
   for (var k in o){
    if (new RegExp("(" + k + ")").test(fmt)) 
    	fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    }
    return fmt;
}
var opt={};
    $(function () {
		var currYear = (new Date()).getFullYear();	
		opt.date = {preset : 'date'};
		opt.datetime = {preset : 'datetime'};
		opt.time = {preset : 'time'};
		opt.default = {
			theme: 'android-ics light', //皮肤样式
	        display: 'modal', //显示方式 
	        mode: 'scroller', //日期选择模式
			dateFormat: 'yyyy-mm-dd',
			lang: 'zh',
			showNow: true,
	        startYear: currYear -1 , //开始年份
	        endYear: currYear + 1  //结束年份
		};

    });
</script>