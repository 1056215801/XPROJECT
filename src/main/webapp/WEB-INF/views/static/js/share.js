//社交分享
var _title,_source,_sourceUrl,_pic,_showcount,_desc,_summary,_site,
	_width = 600,
	_height = 600,
	_top = (screen.height-_height)/2,
	_left = (screen.width-_width)/2,
	_url = '';//'http://traveliceland.lofter.com/post/352b58_579d8e7',
	_pic = '';//'http://m3.img.srcdd.com/farm4/d/2015/0113/11/6AE3FEBE500857BF82CA97E8F03DD6A8_B500_900_500_411.jpeg';
 
//分享到微博    
function shareToWb(event){
	event.preventDefault();
	var _shareUrl = 'http://v.t.sina.com.cn/share/share.php?&appkey=895033136';     //真实的appkey，必选参数 
	_shareUrl += '&url='+ encodeURIComponent(_url||document.location);     //参数url设置分享的内容链接|默认当前页location，可选参数
	_shareUrl += '&title=' + encodeURIComponent(_title||document.title);    //参数title设置分享的标题|默认当前页标题，可选参数
	_shareUrl += '&source=' + encodeURIComponent(_source||'');
	_shareUrl += '&sourceUrl=' + encodeURIComponent(_sourceUrl||'');
	_shareUrl += '&content=' + 'utf-8';   //参数content设置页面编码gb2312|utf-8，可选参数
	_shareUrl += '&pic=' + encodeURIComponent(_pic||'');  //参数pic设置图片链接|默认为空，可选参数
	window.open(_shareUrl,'_blank','width='+_width+',height='+_height+',top='+_top+',left='+_left+',toolbar=no,menubar=no,scrollbars=no, resizable=1,location=no,status=0');
}    
//分享到QQ空间
function shareToQzone(event){
	event.preventDefault();
	var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
	_shareUrl += 'url=' + encodeURIComponent(_url||document.location);   //参数url设置分享的内容链接|默认当前页location
	_shareUrl += '&showcount=' + _showcount||0;      //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
	_shareUrl += '&desc=' + encodeURIComponent(_desc||'分享的描述');    //参数desc设置分享的描述，可选参数
	_shareUrl += '&summary=' + encodeURIComponent(_summary||'分享摘要');    //参数summary设置分享摘要，可选参数
	_shareUrl += '&title=' + encodeURIComponent(_title||document.title);    //参数title设置分享标题，可选参数
	_shareUrl += '&site=' + encodeURIComponent(_site||'');   //参数site设置分享来源，可选参数
	_shareUrl += '&pics=' + encodeURIComponent(_pic||'');   //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数
	window.open(_shareUrl,'_blank','width=600,height=600,top='+_top+',left='+_left+',toolbar=no,menubar=no,scrollbars=no,resizable=1,location=no,status=0');
}
//分享到QQ好友
function shareToQQFriend(event,title){
	event.preventDefault();
	var _summary =  encodeURI("这个"+title+"不错哦，快来参加");
	var _url = encodeURIComponent(_url||document.location);//页面地址
	var _title = encodeURI(document.title);//页面title
		 
	// _url='http://weixin.pj968969.cn/XProject/projectActivity/details/90020161010144632001001000000003' ;
	var _shareUrl ='http://connect.qq.com/widget/shareqq/index.html?url='+_url+'&title='+_title+'&desc=&summary='+_summary+'&site=';
	//  _u ='http://connect.qq.com/widget/shareqq/index.html?title=' + _title + '&url=' + _url + '&desc=' + _summary + '&site=' +  '';
	window.open(_shareUrl,'_blank','width=710,height=600,top='+_top+',left='+_left+',toolbar=no,menubar=no,scrollbars=no, resizable=1,location=no,status=0');
}
//分享到微信
function  shareToWx(event){
	//显示二维码
	layer.open({
		type: 1,
		title:false,
		shadeClose: true,
		shade: 0 ,
		area:['250px','300px'],
		content: $('#qrcode')
	}); 
}
 
$(function(){ 
	$('#copyTo').zclip({ 
	    path: ctx+'/static/plugins/jquery-zclip/ZeroClipboard.swf', 
	    copy: function(){//复制内容 
	        return  encodeURI(document.location); 
	    }, 
	    afterCopy: function(){//复制成功 
	       tips('复制成功!'); 
	    } 
	}); 
}); 