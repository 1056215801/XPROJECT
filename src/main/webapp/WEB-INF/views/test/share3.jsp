<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>我们有个活动，亲们都来看看哟 </title>
<style>
.img_sina_share{display:none; position:absolute; cursor:pointer;}
body{background:#a0b3d6; font-size:84%; margin:0; line-height:1.5; color:#333; font-family:Arial, sans-serif;}
a{color:#34538b; text-decoration:none;}a:hover{text-decoration:underline;}
a img { border: 0; }
input,select,textarea{font-size:100%;}
#header{height:60px; padding:0 0 0 40px;}
#header .logo{margin-top:12px; overflow:hidden; float:left;}
#main{width:100%; background:#beceeb; overflow:hidden;}
#main h1{line-height:40px; margin:0; text-align:center; font-size:18px; background:#c1d5eb; font-family:'kaiti','microsoft yahei'; text-shadow:0px 1px 0px #f2f2f2;}
#body{padding:0; overflow:hidden;}
#body .part{width:50%; min-height:500px; _height:500px; background:white;}
#code{float:left; margin-left:-1px; margin-bottom:-999em; padding-bottom:999em;}
#effect{float:right; margin-right:-1px; margin-bottom:-999em; padding-bottom:999em;}
#body h3{line-height:30px; margin:0; font-size:15px; background:#f0f3f9; padding-left:10px; border-bottom:1px solid #ededed; color:#4e4e4e; text-shadow:0px 1px 0px white;}
#footer{line-height:1.4; padding:15px 0; border-top:1px solid #486aaa; font-family:'Lucida Grande',Verdana, Sans-Serif; text-align:center; text-shadow:1px 1px #cad5eb;}
#footer:before{display:block; height:1px; content:''; background-color:#909BAF; color:#aaa; overflow:hidden; position:relative; top:-15px;}
#footer img{margin-bottom:-3px;}
.show{padding-bottom:20px;}
.show h5{font-size:13px; line-height:20px; padding:10px 0 2px 2px; margin:0 0 0 8px;}
.demo{padding:10px; *zoom:1;}
.demo:after{display:table; content:""; clear:both;}
pre{
  font:14px/1.3 Consolas, Monaco, monospace;
  padding:5px 10px;
  margin:0;
  white-space:pre-wrap;
  word-wrap:break-word;
}
#ad {width:468px; height:60px; margin:0 auto; color: #fff; }
.ad { height:60px; position: absolute; top: 0; right: 0; left: 250px; text-align:right; overflow:hidden; }
@media screen and (max-width: 700px) {
   .ad { display: none; }
}
.light{background:#f0f3f9;}
#content{min-height:500px; _height:500px; background:white; border:solid #cad5eb; border-width:0 2px; font-family:'Lucida Grande',Verdana;}
.article{font-family:Arial; padding:10px 0; font-size:12px; clear:both;}
.article_new{ margin:-31px 10px 0 0; line-height: 20px; font-family:Arial; padding:5px 0; font-size:12px; clear:both; text-align:right;}
.article_new a { display: inline-block; }
#back{margin-top:-25px; position:absolute; right:10px;}
</style>
</head>

<body>
<div id="header">
    	 
    </a>
</div>
<div id="main">
	<h1>页面选中文字分享到新浪微博实例页面</h1>
    <div id="body" class="light">
    	<div id="content" class="show">
        	<h3>展示</h3>
            <div class="article_new"><a href="javascript:;" onclick="shareTowb()"> 
             <img id="imgSinaShare"   title="分享到新浪微博" src="${ctx}/static/image/wb.gif" />
            </a>
            <a href="javascript:;" onclick="shareToQQ('qqFriend')">  
             <img id=""   title="分享给QQ好友" src="${ctx}/static/image/qq.jpg" />
            </a>
            <a href="javascript:;" onclick="shareToQQ('qqZone')">  
             <img id=""   title="分享到QQ空间" src="${ctx}/static/image/zone.jpg" />
            </a>
            </div>
            <div class="demo">
            	<div id="testContent" class="f14">
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    最近迷恋上了【宫锁心玉】这部电视剧，真的是特别好看，让我每晚都要睡到12点以后了，不过有个小小的发现，就是宫和流星花园好像，呵呵，完全可以说是古装版【流星花园】</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    1.先不说具体事情，人物上，一直与晴川作对欺负晴川的八阿哥就是古版道明寺，和九阿哥十阿哥是F3，四阿哥就扮演了那个花泽类的角色。还有一般小像的素VS那个杉菜的好朋友（忘了叫什么以下用L代替），小春VS清河，老欺负晴川的心莲和那个不知道叫什么的功宫女VS那两个拜金女、、、、</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr> 具体事件：</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    1.得罪了八阿哥的宫女被赶出宫VS得罪了F4的同学被赶出学校</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    2.晴川为素言得罪八阿哥VS杉菜为了她的朋友L得罪F4</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    3.得罪八阿哥后大家不敢同情晴川，晴川跪铁链素言也不敢上前，但是偷偷给晴川留馒头VS杉菜得罪了F4
                    L也不敢靠近他但是偷偷留言安慰</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    4.魔头们安排的强暴戏码，一个被四阿哥解救一个被花泽类解救，接着又都上演了怎么让眼泪不流出的戏码</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    5.四阿哥的琴声VS花泽类的琴声</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    6.在宫里晴川和小春被众太监追被四阿哥解救，四阿哥和八阿哥呛声，四福晋带晴川去梳洗VS杉菜和清河被追花泽类解救，类还跟道明寺呛了一下，藤堂静带杉菜去梳洗</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    7.听到晴川和四阿哥的谣言八阿哥生气找晴川并强吻了她见晴川哭了又反过来安慰她VS道明寺强吻杉菜</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    8.晴川为和八阿哥斗争训练自己的体力猛吃饭+跑步VS杉菜猛吃饭+跑步。并都出现"我不会屈服的"台词</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    9.四阿哥和道明寺都说过"一个好消息一个坏消息""耐力赢得了尊重""加倍对付你"</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    10.斗着斗着八阿哥爱上了晴川道明寺爱上了杉菜，而女主角还都不屑一顾，爱上的是别人；当然还都是在接触中爱上了对方</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    11.晴川在太子所过夜并换了衣服被误会VS杉菜和老外在酒店遭遇。时候均差点被伤害而又出现了"只要你说我就相信"的感人台词</p>
                    <p>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>&nbsp;<wbr></wbr>
                    呵呵，还有很多相似之处，太晚了脑子开始犯迷糊就不多说了，这当然不是诟病，因为本人确实很喜欢宫这布电视剧，只是无聊随便罗列一下，娱乐而已。</p>							
                </div>
                <img id="imgSinaShare" class="img_sina_share" title="将选中内容分享到新浪微博" src="http://simg.sinajs.cn/blog7style/images/common/share.gif" />
            </div>
        </div>       
    </div>
</div>
<div id="footer">
     
</div>
<script>
/*
var eleImgShare = document.getElementById("imgSinaShare");

var $sinaMiniBlogShare = function(eleShare, eleContainer) {
	var eleTitle = document.getElementsByTagName("title")[0];
	eleContainer = eleContainer || document;
	var funGetSelectTxt = function() {
		var txt = "";
		if(document.selection) {
			txt = document.selection.createRange().text;	// IE
		} else {
			txt = document.getSelection();
		}
		return txt.toString();
	};
	eleContainer.onmouseup = function(e) {
		e = e || window.event;
		var txt = funGetSelectTxt(), sh = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
		var left = (e.clientX - 40 < 0) ? e.clientX + 20 : e.clientX - 40, top = (e.clientY - 40 < 0) ? e.clientY + sh + 20 : e.clientY + sh - 40;
		if (txt) {
			eleShare.style.display = "inline";
			eleShare.style.left = left + "px";
			eleShare.style.top = top + "px";
		} else {
			eleShare.style.display = "none";
		}
	};
	eleShare.onclick = function() {
		var txt = funGetSelectTxt(), title = (eleTitle && eleTitle.innerHTML)? eleTitle.innerHTML : "未命名页面";
		if (txt) {
			window.open('http://v.t.sina.com.cn/share/share.php?title=' + txt + '→来自页面"' + title + '"的文字片段&url=' + window.location.href);	
		}
	};
}(eleImgShare);
*/
function shareTowb(){
	window.open('http://v.t.sina.com.cn/share/share.php?title=我们有个活动，亲们都来看看哟&url=' + window.location.href);	
}
function shareToQQ(site){
	//window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http%3A%2F%2Fbbs.cnmo.com%2Fthread-15468858-1-1.html&amp;desc=我的坚力量&mdash;&mdash;魅族MX6半月评&amp;pic=http%3A%2F%2Fbbsimg4.cnmo-img.com.cn%2Fthumb%2F11_230x230%2F10385%2F10384944_201608_21_110017un2abb2h5dsh5bnf.jpeg');

	//  window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?desc=我们有个活动，亲们都来看看哟&amp;url=' + window.location.href);	
	   
	    var _u = '';
	    var _url = encodeURI(document.location);//页面地址
	    var _title = encodeURI(document.title);//页面title
	    var _pic = encodeURI("");//图片：例如：var _pic='图片url1|图片url2|图片url3....
	    var _appkey = encodeURI(""); //你从腾讯获得的appkey
	    var _summary = encodeURIComponent("我要转播的内容摘要");//转播内容，特殊字符"#"="%23"
	    //QQ微博
	    if (site == "qqwb") {
	      var _t = _summary + encodeURI("地址：");
	        _u = 'http://v.t.qq.com/share/share.php?title=' + _t + '&url=' + _url + '&appkey=' + _appkey + '&pic=' + _pic;
	    };
	    //QQ空间
	    if (site == "qqZone") {
	    	_url='http://weixin.pj968969.cn/XProject/projectActivity/details/90020161010144632001001000000003' ;
	        _u = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + _url + '&desc=' + _title + '&pics=' + _pic + '&summary=' + _summary;
	    };
	    //QQ好友
	    if (site == "qqFriend") {
		      var _t = _summary + encodeURI("地址：");
		      _url='http://weixin.pj968969.cn/XProject/projectActivity/details/90020161010144632001001000000003' ;
		     _u ='http://connect.qq.com/widget/shareqq/index.html?url='+_url+'&title='+_title+'&desc=&summary=我的摘要不错哦，哈哈哈哈哈哈&site=';
		     //  _u ='http://connect.qq.com/widget/shareqq/index.html?title=' + _title + '&url=' + _url + '&desc=' + _summary + '&site=' +  '';
		    };
	    window.open(_u, '', 'width=700,height=680,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,location=yes,resizable=no,status=no');
}

</script>
</body>
</html>
