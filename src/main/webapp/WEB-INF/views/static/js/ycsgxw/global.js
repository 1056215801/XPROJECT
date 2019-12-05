$(function(){
	 /*$("#industry").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
		 $(this).toggleClass("act");
		 $("#companys").removeClass("act");
		 $("#secondMenu").slideToggle("fast").siblings(".second-menu").slideUp("fast");
	 });
	 $("#companys").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
		 $(this).toggleClass("act");
		 $("#industry").removeClass("act");
		 $("#thirdMenu").slideToggle("fast").siblings(".second-menu").slideUp("fast");
	 });
	 $(document).on("click",function(){         //二级菜单效果
		 $("#industry").removeClass("act");
		 $("#companys").removeClass("act");
		 $("#secondMenu").slideUp("fast");
		 $("#thirdMenu").slideUp("fast");
	 })
	 $(".second-menu ul").on("click",function(e){           //二级菜单效果
		 e.stopPropagation();
	 })*/
	$(".reports .tab-link li").on("click",function(){         //对接月报的tab切换
		var $ind = $(this).index() + 1;
		$(this).addClass("on").siblings().removeClass("on");
		$("#tab-"+$ind).siblings().fadeOut("fast");
		setTimeout(function(){$("#tab-"+$ind).fadeIn("fast");},200)
	})
})

