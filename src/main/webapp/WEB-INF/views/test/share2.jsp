<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>Javen微信开发指南</title>
<link rel="stylesheet" href="${ctx}/static/weui/lib/weui.css" />
<link rel="stylesheet" href="${ctx}/static/weui/css/jquery-weui.css"/>
<link rel="stylesheet" href="${ctx}/static/weui/css/index.css" />
</head>
<body>
	<div class="container js_container"></div>
	<div class="page">

		<div class="hd">

			<h1 class="page_title">
				 <img alt="" width="80px" height="80px"
					src="${ctx}/static/image/logo.png">
			</h1>
			<p class="page_desc">Javen极速开发微信公众号</p>
		</div>

		<div class="bd">
			<div class="weui_cells_title">微信支付</div>
			<div class="weui_cells">
				<div class="weui_cell">
					<div class="weui_cell_hd">
						<label class="weui_label">金额(￥)</label>
					</div>
					<div class="weui_cell_bd weui_cell_primary">
						<input class="weui_input" type="number" id="count" placeholder="请输入数字金额,单位元">
					</div>
				</div>
				<div class="weui_btn_area">
					<input type="button"  onclick="wxpay();" class="weui_btn weui_btn_primary"   value="提交"/>
				</div>
			</div>
		</div>

	</div>
	<script type='text/javascript' src="${ctx}/static/weui/js/jquery-weui.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
	<script type="text/javascript">
	var openId="gh_61bb939c6d14";
	/* 微信支付 */
	function wxpay(){
		$.showLoading("正在加载...");
		var total_fee=$("#count").val();
		$.post("${ctx}/pay",
		    {
		      openId:openId,
		      total_fee:total_fee,
		    },
		    function(res){
		    	$.hideLoading();
		    	if (res.code == 0) {
		    		var data=$.parseJSON(res.data);
		    		
		    		if (typeof WeixinJSBridge == "undefined"){
		    			if( document.addEventListener ){
		    				document.addEventListener('WeixinJSBridgeReady', onBridgeReady(data), false);
		    			}else if (document.attachEvent){
		    				document.attachEvent('WeixinJSBridgeReady', onBridgeReady(data)); 
		    				document.attachEvent('onWeixinJSBridgeReady', onBridgeReady(data));
		    			}
		    		}else{
		    			onBridgeReady(data);
		    		}
		    	}else{
		    		if (res.code == 2) {
		    			layer.alert(res.message) ;
		    		}else{
		    			layer.msg("参数错误："+res.message, {shift: 6});
		    		}
		    	}
		    }); 
		
	}

	function onBridgeReady(json){
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest', 
			json,
			function(res){
				// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
				if(res.err_msg == "get_brand_wcpay_request:ok" ) {
					layer.msg("支付成功", {shift: 6});
					
					self.location="${ctx}/course/getOrderCourseById?id=&openId=";
					
				}else{
					layer.msg("支付失败", {shift: 6});
				}
			}
		); 
	}
	
	
	/* 微信分享 Controller或者其中的方法添加JSSDK签名验证拦截器（ShareInterceptor） */
    var shareData = typeof(shareData) === 'undefined' ? {
        title: 'Javen微信开发',
        desc: '极速开发微信公众号',
        link: '${ctx}/toOauth',
        imgUrl: '${ctx}/images/logo.png'
		} : shareData;

		wx.config({
			debug: true,
			appId : '${appId}',
			timestamp : '${timestamp}',
			nonceStr : '${nonceStr }',
			signature : '${signature}',
			jsApiList : [ 'onMenuShareTimeline', 'onMenuShareAppMessage',
					'onMenuShareQQ', ]
		});
		wx.ready(function() {
			/* 发送给朋友 */
			wx.onMenuShareAppMessage({
				 	title: 'Javen微信开发',
			        desc: '极速开发微信公众号',
			        link: '${ctx}/toOauth',
			        imgUrl: '${ctx}/static/images/logo.png',
			      trigger: function (res) {
			        alert('用户点击发送给朋友');
			      },
			      success: function (res) {
			        alert('已分享');
			        addjifen(1);
			      },
			      cancel: function (res) {
			        alert('已取消');
			      },
			      fail: function (res) {
			        alert(JSON.stringify(res));
			      }
			    });
			/* 分享到朋友圈 */
			wx.onMenuShareTimeline(shareData);
			/* 分享到QQ */
			wx.onMenuShareQQ(shareData);
		});
		
		
		
		/* 分享成功添加积分 */
		function addjifen( type){
			$.post("${ctx}/ajax/jifen",
			    {
			      openId:openId,
			      type:type,
			    },
			    function(res){
			    	if (res.code == 0) {
			    		layer.msg("积分添加成功", {shift: 6});
			    	}else{
			    		layer.msg(res.message, {shift: 6});
			    	}
			    }); 
			
		}
	</script>
</body>
</html>