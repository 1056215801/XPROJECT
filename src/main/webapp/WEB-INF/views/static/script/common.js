/**
 * 提示弹出框
 * @param title
 * @param content
 */
function simpleDialog(title, content){
	var d = dialog({
	    title: title,
	    content: content
	});
	d.showModal();
}

/**
 * 公共ajax函数
 * @param url
 * @param data
 * @param callback
 * @returns {String}
 */
function ajaxFunc(url, data, callback){
	var result = "";
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(ctx + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(response){
			result = response;
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		}
	});
	return result;
}

/**
 * ajax提交form替换content
 * @param divId 返回替换div
 * @param formId 提交formid
 * @param callback 回调
 */
function ajaxForm(divId, formId, callback){
	$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$("#" + formId).ajaxSubmit({
		cache: false,
	    success:  function (data) {
	    	if(data != ""){
	    		$("#" + divId).html(data);
	    	}
			//扩展回调函数
			if( callback != null ){
				callback();
			}
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
	    }
	});
}

/**
 * ajax请求url替换指定div
 * @param shade 是否开启遮罩层
 * @param divId 返回替换div
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxDiv(shade, divId, url, data, callback){
	if(shade){
		$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	}
	
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(ctx + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$("#" + divId).html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert("请求出现错误！");
        },
        complete: function(XMLHttpRequest, textStatus) { 
        	if(shade){
        		$('#loading').remove();
    			$('#content').fadeIn();
    			docReady();
        	}
        }
	});
}
/**
 * ajax请求url替换div content
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxContentPage(url, searchFormId, callback){
	$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(ctx + url)),
		data : $('#'+searchFormId).serialize(),
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$("#content").html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			// 这个方法有三个参数：XMLHttpRequest 对象，错误信息，（可能）捕获的错误对象。
			// 通常情况下textStatus和errorThown只有其中一个有值
              alert(XMLHttpRequest.status);
              alert(XMLHttpRequest.readyState);
              alert(textStatus);
			  alert("请求出现错误！");
        },
        complete: function(XMLHttpRequest, textStatus) { 
        	// 请求完成后回调函数 (请求成功或失败时均调用)。参数： XMLHttpRequest 对象，成功信息字符串。
            // 调用本次AJAX请求时传递的options参数
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
        }
	});
}
/**
 * ajax请求url替换div content
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxContent(url, data, callback){
	$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(ctx + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$("#content").empty();
		 	$("#content").html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			// 这个方法有三个参数：XMLHttpRequest 对象，错误信息，（可能）捕获的错误对象。
			// 通常情况下textStatus和errorThown只有其中一个有值
              alert(XMLHttpRequest.status);
              alert(XMLHttpRequest.readyState);
              alert(textStatus);
			  alert("请求出现错误！");
        },
        complete: function(XMLHttpRequest, textStatus) { 
        	// 请求完成后回调函数 (请求成功或失败时均调用)。参数： XMLHttpRequest 对象，成功信息字符串。
            // 调用本次AJAX请求时传递的options参数
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
        }
	});
}

/**
 * ajax请求url替换div content
 * @param url 请求URL
 * @param data 请求参数数据
 * @param callback 回调
 */
function ajaxContentConfirm(url, data, callback){
	/*
	var d = dialog({
	    title: '操作提示',
	     width: 260,
	    content: "确定要这样操作吗？",
	    button: [
	             {
	                 value: '确定',
	                 callback: function () {
	                	 ajaxContent(url, data, callback);
	         	         return true;
	                 },
	                 autofocus: true
	             },
	             {
	                 value: '取消',
	                 callback: function () {
	                	 return true ; 
	                 }
	             }]
	});
	d.show();
	*/
	
	layer.confirm('确定要删除吗？', {
		icon: 3,
	    shade: false //不显示遮罩
		}, function(index){
		    layer.close(index);
		  //  layer.msg('的确很帅', {icon: 6});
		    ajaxContent(url, data, callback);
		});

	
	
}

/**
 * ajax请求url替换DiaLog
 * @param url 请求地址
 * @param data 参数
 * @param callback 回调
 */
function ajaxDiaLog(url, data, callback){
	$('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
	$.ajax({
		type : "post",
		url : encodeURI(encodeURI(ctx + url)),
		data : data,
		dataType : "html",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		async: false,
		cache: false,
		success:function(returnData){
			$('#myModal').html(returnData);
			//扩展回调函数
			if( callback != null ){
				callback();
			}
			$('#myModal').modal('show');
	    	$('#loading').remove();
			$('#content').fadeIn();
			docReady();
		}
	});
}

/**
 * 提示信息
 */
function showSuccessMsg(msg,time){
	 var m=msg||'操作成功！' ;
	 var t=time|| 1000 ;
	 layer.msg(m, {icon: 6,time: t});
}

function gotoUrl(url){
	 window.open( url);
}
$(function() {
	// 皮肤初始化
	 layer.config({
	    extend: ['skin/moon/style.css'], //加载新皮肤
	    skin: 'layer-ext-moon' //一旦设定，所有弹层风格都采用此主题。
	});
	  
});
  

$(function() {
	$('a.ajax-link').click(function (e) {
		   //     if (msie) e.which = 1;
		   //    if (e.which != 1 || !$('#is-ajax').prop('checked') || $(this).parent().hasClass('active')) return;
		        e.preventDefault();
		        if($('.btn-navbar').is(':visible'))
				{
					$('.btn-navbar').click();
				}
		   //     $('.sidebar-nav').removeClass('active');
		   //     $('.navbar-toggle').removeClass('active');
		        $('#loading').remove();
		        $('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
		        var $clink = $(this);
		      //  History.pushState(null, null, $clink.attr('href'));
		        $('ul.main-menu li.active').removeClass('active');
		        $clink.parent('li').addClass('active');
		        $.ajax({
					url : this.href,
					success : function(msg){
						$('#content').html(msg);
						$('#loading').remove();
						$('#content').fadeIn();
						docReady();
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){
						$('#content').html('<div id="" class="center">加载异常，请联系管理员<div class="center"></div></div>');
						$('#loading').remove();
						$('#content').fadeIn();
					}
				});
		    });
});

