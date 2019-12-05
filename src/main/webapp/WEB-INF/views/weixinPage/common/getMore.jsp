<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- 手机端下拉加载更多 -->
<script>
	$(function() {
			/* 滚动显示小火箭 */
			var isloading = false;//防止重复发送ajax
			$(window).scroll(
				function() {
					if (!isloading && $(document).scrollTop() + $(window).height() > $(document).height() - 1
							&& !$('#getMore').is(":hidden")) {
						isloading = true;
						setTimeout(function() {
							$('#getMore').hide();
							getMore();
							isloading = false;
						}, 500);
					}
					if ($(document).scrollTop() > 0) {
						$('#tbox').show();
					} else {
						$('#tbox').hide();
					}
				});
		})
</script>
<div id="getMore" style="margin: 10px 1.6% 10px; display: none;">
	<a href="javascript:void(0);" class="renovate" style="text-decoration: none;";> <span
		class="renovateTitle" style="color: #120F0F;">下拉加载更多</span>
	</a>
</div>