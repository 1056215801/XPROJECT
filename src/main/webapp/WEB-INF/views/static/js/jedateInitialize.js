//jedate初始化方法
//基础样式:jedateInput、max(不超过当前日期)  日期限制样式:jedateGroup  图标样式:wicon
//属性:fmt 日期格式
function initJedate(){
	$(".jedateInput").each(function(index){
		$(this).attr("readonly",true);
		$(this).jeDate({
			format: $(this).attr("fmt"),
			maxDate: ($(this).hasClass("max")?$.nowDate(0):""),
			minDate: ($(this).hasClass("min")?$.nowDate(0):""),
			choosefun:function(elem, val) {
				//自定义触发方法
		        try{
		        	if(afterChoose && typeof(afterChoose) == "function"){
		        		afterChoose();
		        	}
		        }catch(e){};
			}
		});
	});
	var groupArr = [];
	$(".jedateGroup").each(function(index){
		$(this).attr("readonly",true);
		var fmt = $(this).attr("fmt");
		var fmtStr = fmt=="YYYY-MM-DD"?" 00:00:00":fmt=="YYYY-MM"?"-01 00:00:00":fmt=="YYYY"?"-01-01 00:00:00":"";
		groupArr[index] = {
			format: $(this).attr("fmt"),
			maxDate: ($(this).hasClass("max")?$.nowDate(0):""),
			formatStr: fmtStr,//用于范围时间格式调整
			choosefun: function(elem,datas){
				if(index%2==0){
					groupArr[index+1].minDate = datas+groupArr[index+1].formatStr;
				}else{
					groupArr[index-1].maxDate = datas+groupArr[index-1].formatStr;
				}
			}
		};
		$(this).jeDate(groupArr[index]);
	});
	
	var groupDiyArr = [];
	$(".jedateGroupDiy").each(function(index){
		$(this).attr("readonly",true);
		var fmt = $(this).attr("fmt");
		var fmtStr = fmt=="YYYY-MM-DD"?" 00:00:00":fmt=="YYYY-MM"?"-01 00:00:00":fmt=="YYYY"?"-01-01 00:00:00":"";
		
		//获取自定义的最小、最大日期
		var minTime = $(this).attr("minDate");
		if(minTime == undefined || minTime == ""){
			minTime = $.nowDate(0);
		}
		var maxTime = $(this).attr("maxDate");
		if(maxTime == undefined || maxTime == ""){
			maxTime = $.nowDate(0);
		}
		
		groupDiyArr[index] = {
			format: $(this).attr("fmt"),
			maxDate: ($(this).hasClass("max")?maxTime:""),
			minDate: ($(this).hasClass("min")?minTime:""),
			formatStr: fmtStr,//用于范围时间格式调整
			choosefun: function(elem,datas){
				if(index%2==0){
					groupDiyArr[index+1].minDate = datas+groupDiyArr[index+1].formatStr;
				}else{
					groupDiyArr[index-1].maxDate = datas+groupDiyArr[index-1].formatStr;
				}
			}
		};
		$(this).jeDate(groupDiyArr[index]);
	});
	
	$(".input-group-addon").each(function(){
		$(this).click(function(){
			$("#"+$(this).attr("input-id")).click();
		});
	});
}