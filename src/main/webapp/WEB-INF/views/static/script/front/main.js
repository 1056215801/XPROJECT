/**
 * 
 */


 $(function () { 
     $.post(ctx + "/account/headImage", {'ajax': 1}, function (data) {
     //data = JSON.parse(data);
    	 if (data.headImage == '') {
         	$('#nologin').show();
             $('#head_image').hide();
             // $('#login_info').html('<li><a class="welcome-message color-orange" href="' + basePath + 'user/account" style="color:#f89406">[' + data.name + ']</a></li><li class="notification-tips"><a rel="tooltip" title="站内信" style="color:#f89406" href="' + basePath + 'user/notifications">' + (data.notice == 1 ? '<i class="notification-lighter"></i>' : '') + '<i class="fa fa-bell-o"></i></a></li><li><a class="welcome-message" href="' + basePath + 'logout">退出</a></li>');
         }else{
              $('#nologin').hide();
              $('#head_image').attr("src",data.headImage);
              $('#head_image').show();
         }
     }); 
         
     $("#head_image").mouseover(function(){		
    	 $("#dropdown").slideDown("fast");
     });
     $("#head_image").mouseout(function(){
    	 $("#dropdown").hide();
     });
     $("#dropdown").mouseover(function(){
    	 $("#dropdown").show();
     });
     $("#dropdown").mouseout(function(){
    	 $("#dropdown").hide();
     });   
     
     $(".header_WeChat").click(function(){		
     	var div = $(".WeChatQRcode"); 
 		if(div.css("display")=="none"){ 
 	  		div.slideDown("fast"); 
 		}else{ 
 	  		div.slideUp("fast"); 
 		} 
     });
 });
 
 function tohomepage(){
	 location.href=ctx+"/";
 }
 
 function logout(){
	 $.post(ctx + "/session/logout", {'ajax': 1}, function (data) {
	     //  if (data. == true) {
	        	 $('#nologin').show();
	             $('#head_image').hide();
	       // }
	             
	     }); 
	 $("#dropdown").hide();
	// window.location.href=ctx+"/expShare/main";
 }
 
 function maintenance(){
	 layer.msg('正在建设中，敬请期待...');
 }
 
 function office(){
	 window.open(ctx+"/login/singleSignin/json/getOaUrl");
 }