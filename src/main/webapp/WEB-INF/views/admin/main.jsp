<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">   
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>园区2.0后台管理系统</title>
    <link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script type="text/javascript">
    	$(function(){
    		$("#front").click(function(){
    			window.open("${ctx}/projectActivity/main");
    		});
    		$("#personalInfo").click(function(){
    			window.open("${ctx}/personalCenter/personalInfoEdit");
    		});
    		$("#personalMain").click(function(){
    			window.open("${ctx}/personalCenter/main");
    		});
    		$("#frontPro").click(function(){
    			window.open("${ctx}/projectDeclare/main");
    		});
    		$("#frontInvestigation").click(function(){
    			window.open("${ctx}/investigation/main");
    		});
    	});
    	function dataCenter(type){
    		if(type==1){
    			window.open("${ctx}/front/dataCenter/organizationCount");
    		}else if(type==2){
    			window.open("${ctx}/front/dataCenter/economicCount");
    		}else if(type==3){
    			window.open("${ctx}/front/dataCenter/industryCount");
    		}
    	}
    </script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element" style="text-align:center;">
                            <span><img alt="image" class="img-circle" style=" width:80px;" src="${ctx}/static/img/head.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">admin</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <!-- <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li> -->
                                <li><a class="J_menuItem" href="javaScript:;" id="personalInfo">个人资料</a>
                                </li>
                               <!--  <li><a class="J_menuItem" href="javaScript:;" id="personalMain">个人中心首页</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li> -->
                                <li class="divider"></li>                                
                                <li>
                                  <c:url var="logoutUrl" value="/session/logout"></c:url>
                                  <a href="${logoutUrl}">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">〇
                        </div>
                    </li>
                   <!--  
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">范例</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                             <li>
                                <a class="J_menuItem" href="${ctx}/test/test0"  >移动端附件上传</a>
                            </li>
							<li>
                                <a class="J_menuItem" href="${ctx}/test/test1"  >PC端附件上传</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/test/test2"  >ZTree</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/test/test3"  >各种弹出</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/test/test4"  >移动端日期控件</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/test/test5" >富文本编辑器-simditor</a>
                            </li>
                           <li>
                                <a class="J_menuItem" href="${ctx}/test/test6"  >省市县</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/test/test7"  >瀑布流</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/test/test8"  >富文本编辑器-tinymce</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/test/share3"  >分享到微博</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/test/404"  >404页面</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/test/buttons"  >各种按钮</a>
                            </li>
                            
                        </ul>
                    </li>  
                   
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">微信号设置</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${ctx}/weixinConfigInfo/setup"  >基本设置</a>
                            </li>
                            <%--  <li>
                                <a class="J_menuItem" href="${ctx}/weixinConfigMenu/list"  >自定义菜单</a>
                            </li> --%>
                            <li>
                                <a class="J_menuItem" href="${ctx}/weixinConfigAccount/list"  >已关注的用户</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/weixinReceivedMsg/list" >收到的消息</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/weixinConfigReply/list"  >自动回复</a>
                            </li>
                        </ul>
                    </li>
                     -->  
                    <li>
                    	<a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">活动</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
						    <li>
                                <a class="J_menuItem" href="${ctx}/projectActivityInfo/list" data-index="0">所有活动</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${ctx}/projectActivityTag/list" data-index="0">标签管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectActivityComplain/list" data-index="0">举报审核</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" data-index="0" id="front">前台首页跳转</a>
                            </li>
                        	<li>
                                <a class="J_menuItem" href="${ctx}/projectActivityInfo/maintain" data-index="0">运维使用</a>
                            </li> 
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">项目申报</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                             <%-- <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareInfo/add">项目发布</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareInfo/mylist">我的已发项目</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareInfo/list">所有项目</a>
                            </li> --%>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareUpgrade/list">政府用户升级审核列表</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareInfo/operationList">运维列表</a>
                            </li>
                          
                            <li>
                                <a class="javascript:void(0)" id="frontPro">前端首页</a>
                            </li>
                            <%-- <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclarePublicity/list">结果公示查看</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareApply/mylist">我的申报</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${ctx}/projectDeclareApply/list?admin=yes">项目申报管理</a>
                            </li> --%>
                            
                        </ul>
                    </li>
					
                    
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">问卷调查</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                         <!--   <li><a class="J_menuItem" href="${ctx}/investigationInfoMain/add">新增调查</a>
                            </li>-->
                            <li><a class="J_menuItem" href="${ctx}/investigationInfoMain/myList">调查管理列表</a>
                            </li> 
                            <li><a class="J_menuItem" href="${ctx}/investigationInfoMain/mainList">所有调查列表</a>
                            </li>
                            <li>
                                <a class="javascript:void(0)" id="frontInvestigation">前端首页</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">数据中心</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                         	<li><a class="J_menuItem" href="" onclick="dataCenter(1)">数据中心1</a>
                            </li>
                            <li><a class="J_menuItem" href="" onclick="dataCenter(2)">数据中心2</a>
                            </li> 
                            <li><a class="J_menuItem" href="" onclick="dataCenter(3)">数据中心3</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                            <li><a class="J_menuItem" href="${ctx}/accountInfo/list">用户列表</a>
                            </li>
                             
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">工具</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${ctx}/formTemplate/list">表单生成器</a>
                            </li>
                            
                            <li><a class="J_menuItem" href="${ctx}/drawTableInfo/list">表格绘制器</a></li>
                            
                             <li><a class="J_menuItem" href="${ctx}/drawModuleInfo/list">动态表单引擎(正)</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">意见反馈</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${ctx}/projectSuggestInfo/list">意见反馈列表</a>
                            <li><a class="J_menuItem" href="${ctx}/projectSuggestInfo/myYesList">已审核列表</a>
                            <li><a class="J_menuItem" href="${ctx}/projectSuggestInfo/myNoList">待审核列表</a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="http://www.zi-han.net/theme/hplus/search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${ctx}/static/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="${ctx}/static/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!--
                        <li class="hidden-xs">
                            <a href="index_v1.html" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a>
                        </li>
                          -->
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="test/test">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/session/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
            <!-- 数据展示区 -->
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/test/main" frameborder="0" data-id="test/test" seamless></iframe>
           
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="#" target="_blank"><!-- 中国电信 --></a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                        <!-- 
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                             -->
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>


                    </div>
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
    </div>
    
    
   
    <script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${ctx}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!--  
    
    -->
    <script src="${ctx}/static/js/hplus.min.js?v=4.1.0"></script>
    <script src="${ctx}/static/js/contabs.js" type="text/javascript"></script>
    
    <script src="${ctx}/static/js/plugins/pace/pace.min.js"></script>
</body>


</html>
 