<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/easyui/easyui.css">
<title>通用</title>
<!-- 通用左右结构视图 左侧树 右侧列表 -->
<style type="text/css">
.panel-body {
	padding: 0px;
}

.layout-body {
	background: #f3f3f4 none repeat scroll 0 0;
}

.layout-split-west {
	border-right: 3px solid #d2e0f2;
}

.easyui-region-west {
	width: 260px; padding: 0;
}
</style>
</head>
<body class="easyui-layout" style="">
	<div id="west" region="west" split="true" class="easyui-region-west">
		<iframe id="lFrame" name="lFrame" src="" frameborder="0" style="width: 100%;"></iframe>
	</div>
	<div id="center" region="center">
		<iframe id="cFrame" name="cFrame" src="" frameborder="0" style="width: 100%;"></iframe>
	</div>
</body>
<script type="text/javascript" src="${ctx}/static/plugins/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	/* 子窗口加载url */
	function leftFrameLoad(url){
		$("#lFrame").attr("height", "99%");
		$("#lFrame").attr("src", url);
	}
	function rightFrameLoad(url){
		$("#cFrame").attr("height", "99%");
		$("#cFrame").attr("src", url);
	}
	/* 刷新子窗口 */
	function frameRefresh(index){//index 0:left 1:right  isAutoRefresh:是否触发loadComplete方法
		if (index == 0) {
			$("#lFrame").attr("src", $("#lFrame").attr("src"));
		} else if (index == 1) {
			$("#cFrame").attr("src", $("#cFrame").attr("src"));
		}
	}
</script>
</html>