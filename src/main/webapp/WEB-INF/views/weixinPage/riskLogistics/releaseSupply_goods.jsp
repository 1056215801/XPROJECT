<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../../common/commonPage.jsp"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>发布货源-货物</title>
<link href="css/logisticsService.css" rel="stylesheet" />
<link href="css/navigationBar.css" rel="stylesheet" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/layer-v2.4/layer.js" type="text/javascript"></script>
<style>
body .layui-layer-tl_green .layui-layer-title {
	background-color: #00A85A;
	color: #fff;
	border: none;
}

body .layui-layer-bg_gray .layui-layer-content {
	background-color: #ebebeb;
}

body .layui-layer-bg_gray .layui-layer-btn0 {
	background-color: #00A85A;
	color: #FFF;
	text-align: center;
	padding: 5px 0;
	width: 100%;
	margin: 0;
}
</style>
<script>
	$(function() {
		$(".moreInfo").click(function() {
			var div = $(".release_moreContent");
			if (div.css("display") == "none") {
				div.slideDown("fast");
				$(".moreInfo").text("收起-");
			} else {
				div.slideUp("fast");
				$(".moreInfo").text("点击填写更多信息+");
			}
		});
		$("#searchOptions .optionBtn").click(function() {
			if ($(this).hasClass("selected")) {
				$(this).removeClass("selected");
			} else {
				$(this).addClass("selected");
			}
		});
	});
	function searchOptions() {
		layer.open({
			type : 1,
			title : false,
			skin : 'layui-layer-bg_gray',
			shadeClose : true,
			shade : [ 0 ],
			area : [ '100%', '100%' ],
			shift : 2,
			closeBtn : 0,
			content : $('#searchOptions'),
			btn : '确定选择'
		});
	};
	function releaseComplete() {
		layer.open({
			type : 1,
			title : '提示',
			skin : 'layui-layer-tl_green',
			shadeClose : true,
			area : [ '250px', '150px' ],
			time : '3000',
			content : $('#releaseComplete'),
			end : function() {
				location.reload();
			}
		});
	};
</script>
</head>
<body>
	<div class="logistics_main">
		<div class="fixed_top">
			<img src="images/createSupply.png" width="20" height="20"> <span>我申报的</span>
		</div>

		<div class="logistics_content">
			<div style="margin-top: 70px;"></div>
			<div class="caption_top">
				<div class="caption_title">基本信息</div>
			</div>
			<div class="releaseCont">
				<table>
					<tr>
						<td colspan="1" class="release_attribute">发货地</td>
						<td colspan="1" class="release_table28"><select>
								<option>不限</option>
						</select> <font class="redStar">*</font></td>
						<td colspan="1" class="release_attribute">目的地</td>
						<td colspan="1" class="release_table28"><select>
								<option>不限</option>
						</select> <font class="redStar">*</font></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">车长要求</td>
						<td colspan="3" class="release_table78" style="padding-right: 10px;"><input type="text" onClick="searchOptions();"
							style="width: 100%;" placeholder="最多选三项，不选则为不限" /></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">货物类型</td>
						<td colspan="1" class="release_table28"><select>
								<option>重货</option>
						</select></td>
						<td colspan="2" class="release_table50" style="padding-left: 0;"><select style="width: 95%;">
								<option></option>
						</select> <font class="redStar">*</font></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">货物数量</td>
						<td colspan="3" class="release_table78"><input type="text" placeholder="最小值" style="width: 29%;"> <input
							type="text" placeholder="最大值" style="width: 29%; margin-left: 3px;"> <select style="width: 30%; margin-left: 3px;">
								<option>吨</option>
						</select> <font class="redStar">*</font></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">联系人</td>
						<td colspan="3" class="release_table50"><input type="text" style="width: 50%;"> <font class="redStar"
							style="float: none; top: 2px;">*</font></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">联系电话</td>
						<td colspan="3" class="release_table78"><input type="text" style="width: 78%;"> <font class="redStar"
							style="float: none; top: 2px;">*</font></td>
					</tr>
				</table>
			</div>
			<div class="caption_top">
				<div class="caption_title">扩展信息</div>
			</div>
			<div class="release_more">
				<div class="moreInfo">点击填写更多信息+</div>
				<div style="clear: both;"></div>
			</div>
			<div class="release_moreContent">
				<table>
					<tr>
						<td colspan="1" class="release_attribute">自动重发</td>
						<td colspan="2" class="release_table78"><select style="width: 47%;">
								<option>不重发</option>
						</select> <select style="width: 47%; margin-left: 3px;">
								<option>----</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">报价方式</td>
						<td colspan="2" class="release_table78"><select style="width: 47%;">
								<option>无限制</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">车型要求</td>
						<td colspan="2" class="release_table78"><select style="width: 47%;">
								<option>请选择车型</option>
						</select> <select style="width: 47%; margin-left: 3px;">
								<option>请选择载行</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">车辆数量</td>
						<td colspan="2" class="release_table78"><input type="text" style="width: 55%;">辆</td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute">备用电话</td>
						<td colspan="2" class="release_table78"><input type="text" style="width: 85%;" placeholder="请输入备用联系电话"></td>
					</tr>
					<tr>
						<td colspan="1" class="release_attribute" style="position: relative; top: -35px;">备注</td>
						<td colspan="2" rowspan="2" class="release_table78"><textarea type="text" style="width: 96%;"></textarea></td>
					</tr>
				</table>
			</div>
			<div style="margin: 10px 5px;">
				<input type="button" class="releaseBtn" value="确认发布" onClick="releaseComplete();">
			</div>
		</div>

		<div id="searchOptions" style="display: none;">
			<div style="font-size: 16px; padding: 6px 10px;">车长</div>
			<div style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected_goods">车长不限</div>
				<div class="optionBtn">3米</div>
				<div class="optionBtn">3.8米</div>
				<div class="optionBtn">4.2米</div>
				<div class="optionBtn">4.5米</div>
				<div class="optionBtn">5米</div>
				<div class="optionBtn">6.2米</div>
				<div class="optionBtn">6.8米</div>
				<div class="optionBtn">7.2米</div>
				<div class="optionBtn">7.6米</div>
				<div class="optionBtn">8.6米</div>
				<div class="optionBtn">8.8米</div>
				<div class="optionBtn">9.6米</div>
				<div class="optionBtn">13米</div>
				<div class="optionBtn">14.6米</div>
				<div class="optionBtn">15米</div>
				<div class="optionBtn">16米</div>
				<div class="optionBtn">17.6米</div>
				<div class="optionBtn">19米</div>
				<div class="optionBtn">21米</div>
				<div class="optionBtn">25米</div>
				<div style="clear: both;"></div>
			</div>
			<div style="font-size: 16px; padding: 6px 10px;">车型</div>
			<div style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected_goods">车型不限</div>
				<div class="optionBtn">小车</div>
				<div class="optionBtn">单桥</div>
				<div class="optionBtn">后八轮</div>
				<div class="optionBtn">单桥</div>
				<div class="optionBtn">前四后四</div>
				<div class="optionBtn">前四后六</div>
				<div class="optionBtn">前四后八</div>
				<div class="optionBtn">前四后十</div>
				<div class="optionBtn">五桥</div>
				<div class="optionBtn">六桥</div>
				<div class="optionBtn">半挂</div>
				<div class="optionBtn">一拖二</div>
				<div class="optionBtn">二拖二</div>
				<div class="optionBtn">二拖三</div>
				<div class="optionBtn">冷藏</div>
				<div class="optionBtn">保温</div>
				<div class="optionBtn">危货</div>
				<div class="optionBtn">油罐</div>
				<div class="optionBtn">自卸</div>
				<div class="optionBtn">工程</div>
				<div class="optionBtn">特种拖</div>
				<div style="clear: both;"></div>
			</div>
			<div style="font-size: 16px; padding: 6px 10px;">装载类型</div>
			<div style="background-color: #FFF; padding: 5px 12px;">
				<div class="optionBtn selected_goods">装载类型不限</div>
				<div class="optionBtn">普通</div>
				<div class="optionBtn">平板</div>
				<div class="optionBtn">高低平板</div>
				<div class="optionBtn">低栏</div>
				<div class="optionBtn">高栏</div>
				<div class="optionBtn">花栏</div>
				<div class="optionBtn">半封闭</div>
				<div class="optionBtn">普通</div>
				<div class="optionBtn">平板</div>
				<div class="optionBtn">集装箱</div>
				<div class="optionBtn">开顶箱</div>
				<div style="clear: both;"></div>
			</div>
		</div>

		<div id="releaseComplete" style="display: none; text-align: center; padding: 20px 0; font-size: 14px;">
			<div>货源已发布</div>
			<div>
				请到“<span style="color: #FF6707;">我的货源</span>”进行查看
			</div>
			<div>3秒后自动关闭</div>
		</div>

		<!-- 底部工具栏和发布货源弹窗 -->
		<%@ include file="common/createSupplyLayer.jsp"%>
		<!-- 改变工具栏第1个图标 -->
		<script type="text/javascript">
			img_green(1);
		</script>
	</div>
</body>
</html>