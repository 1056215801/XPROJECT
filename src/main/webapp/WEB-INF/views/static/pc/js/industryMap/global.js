/*判断接口地址*/
var product = "";
var project = "";
var office = "";
var path = "/XWeixin";
changeUrls();

function changeUrls(){
	$.ajax({
		url : path + "/interface/json/getCurrentDomain",
		type : "post",
		data : {},
		dataType : "json",
		async: false,
		success : function(result) {
			var prefix = result.value;
			product = prefix + "XProduction";
			project = prefix + "XProject";
			office = prefix + "XOffice";
			//根据前缀判断能力码参数ablt
			if(prefix.indexOf("test") == -1){
				ablt = "www";
			}else{
				ablt = "test";
			}
		},
		error : function() {
			layer.alert("系统异常");
		}
	})
}

/* 非空字符串 */
function nvlStr(str){
	if(str==null || str==undefined){
		return "";
	}
	return str;
}

/* 非空日期 */
function nvlDate(d){
	if(d==null || d==undefined){
		return "";
	}
	return formatCSTDate(d,"yyyy-MM-dd");
}
function nvlDate(d,fmt){
	if(d==null || d==undefined){
		return "";
	}
	return formatCSTDate(d,fmt);
}

//格式化CST日期的字串
function formatCSTDate(strDate, format) {
	return formatDate(new Date(strDate), format);
}

// 格式化日期,
function formatDate(date, format) {
	var paddNum = function(num) {
		num += "";
		return num.replace(/^(\d)$/, "0$1");
	}
	// 指定格式字符
	var cfg = {
		yyyy : date.getFullYear(), // 年 : 4位
		yy : date.getFullYear().toString().substring(2),// 年 : 2位
		M : date.getMonth() + 1, // 月 : 如果1位的时候不补0
		MM : paddNum(date.getMonth() + 1), // 月 : 如果1位的时候补0
		d : date.getDate(), // 日 : 如果1位的时候不补0
		dd : paddNum(date.getDate()),// 日 : 如果1位的时候补0
		hh : paddNum(date.getHours()), // 时
		mm : paddNum(date.getMinutes()), // 分
		ss : paddNum(date.getSeconds())
	// 秒
	}
	format || (format = "yyyy-MM-dd hh:mm:ss");
	return format.replace(/([a-z])(\1)*/ig, function(m) {
		return cfg[m];
	});
}

//判断字符串以什么结尾，用于获取附件格式
String.prototype.endWith=function(s){
	if(s==null||s==""||this.length==0||s.length>this.length)
		return false;
	if(this.substring(this.length-s.length)==s)
		return true;
	else
		return false;
	return true;
}

/*语音输入*/
function WeinxinSpeechInput(data,id){
    wx.config({
	 	debug: true,
	    appId: data.appId,
	    timestamp: data.timestamp,
	    nonceStr: data.nonceStr,
	    signature: data.signature,
	    jsApiList: [
	      'checkJsApi',
	      'onMenuShareTimeline',
	      'onMenuShareAppMessage',
	      'onMenuShareQQ',
	      'onMenuShareWeibo',
	      'hideMenuItems',
	      'showMenuItems',
	      'hideAllNonBaseMenuItem',
	      'showAllNonBaseMenuItem',
	      'translateVoice',
	      'startRecord',
	      'stopRecord',
	      'onRecordEnd',
	      'playVoice',
	      'pauseVoice',
	      'stopVoice',
	      'uploadVoice',
	      'downloadVoice',
	      'chooseImage',
	      'previewImage',
	      'uploadImage',
	      'downloadImage',
	      'getNetworkType',
	      'openLocation',
	      'getLocation',
	      'hideOptionMenu',
	      'showOptionMenu',
	      'closeWindow',
	      'scanQRCode',
	      'chooseWXPay',
	      'openProductSpecificView',
	      'addCard',
	      'chooseCard',
	      'openCard'
	    ]
	});
    wx.ready(function(){
		var voice = { localId: '', serverId: '' };
		function translateVoice(localId){
			if (localId == '') {
		      $.alert('请先使用 startRecord 接口录制一段声音','提示！');
		      return;
			}
		    wx.translateVoice({
		      localId: localId,
		      complete: function (res) {
		        if (res.hasOwnProperty('translateResult')) {
		        	//var text  = detail.targetItem.val();
		        	var text  = $("#"+id).val();
		        	var n = res.translateResult.toString();
		        	var text2 = n.substring(0,n.length-1);
		        	text += text2;
		        	//detail.targetItem.val(text);
		        	$("#"+id).val(text);
		        } else {
		        	$.alert('无法识别','提示！');
		        }
		      }
		    });
		  };
		$('#touchArea').on('touchstart', function(event){
		    event.preventDefault();
		    START = new Date().getTime();
		    recordTimer = setTimeout(function(){
		        wx.startRecord({
		            success: function(){
		                localStorage.rainAllowRecord = 'true';
		            },
		            cancel: function () {
		            	$.alert('用户拒绝授权录音',"提示！");
		            }
		        });
		    },300);
		});
		$('#touchArea').on('touchend', function(event){
		    event.preventDefault();
		    END = new Date().getTime();
		    if((END - START) < 300){
		        END = 0;
		        START = 0;
		        $.alert("时间太短了 ，什么都没听到！","提示！");
		        clearTimeout(recordTimer);
		    }else{
		        wx.stopRecord({
		          success: function (res) {
		            voice.localId = res.localId;
		            translateVoice(voice.localId);
		          },
		          fail: function (res) {
		        	$.alert(res,'提示！');
		          }
		        });
		    }
		});
	});
}