/**
 * 页内点击弹出新Tab
 */
var   addNewTab =null ;
$(function () {
    //计算元素集合的总宽度
    function calSumWidth(elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    //滚动到指定选项卡
    function scrollToCurrentTab(element) {
        var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs", window.parent.document).children().not(".J_menuTabs", window.parent.document));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs", window.parent.document).outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content", window.parent.document).outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content", window.parent.document).outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.page-tabs-content', window.parent.document).animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    
   //======================================== 
    addNewTab =function(title,url) {
        var dataUrl =  url ,
        dataIndex =  url,
        menuName =  title ,
        flag = true;
        if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;
       // 选项卡菜单已存在
        $('.J_menuTab', window.parent.document).each(function () {
           if ($(this).data('id') == dataUrl) {
               if (!$(this).hasClass('active')) {
                   $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                   scrollToCurrentTab(this);
                   // 显示tab对应的内容区
                   $('.J_mainContent .J_iframe', window.parent.document).each(function () {
                       if ($(this).data('id') == dataUrl) {
                           $(this).show().siblings('.J_iframe', window.parent.document).hide();
                           return false;
                       }
                   });
               }
               flag = false;
               return false;
           }
       });
       // 选项卡菜单不存在
       if (flag) {
           $('.J_menuTab', window.parent.document).removeClass('active');
           // 添加选项卡对应的iframe
           var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.J_mainContent', window.parent.document).find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);
           // 添加选项卡
           var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
           $('.J_menuTabs .page-tabs-content', window.parent.document).append(str);
           // 滚动到当前页
           try{
        	   scrollToCurrentTab($('.J_menuTab.active', window.parent.document));
           }catch(err){
        	  // alert(err.message );
           }
       }
       return false;
   };
    
});
