<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<%@ include file="../common/commonPage.jsp"%>
<title>ztree</title>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="${ctx}/static/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet">
<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script src="${ctx}/static/js/plugins/ztree/jquery.ztree.all.min.js"></script>
<script src="${ctx}/static/js/plugins/ztree/jquery.ztree.core.js"></script>
<script src="${ctx}/static/js/plugins/ztree/jquery.ztree.excheck.js"></script>
<script src="${ctx}/static/js/plugins/ztree/jquery.ztree.exedit.js"></script>
<script src="${ctx}/static/plugins/jquery.query/jquery.query.js"></script>
<script type="text/javascript">
	var ctx = '${ctx}';
	var zNodes = ${treeData};
	var idField = '';
	var nameField = '';
	var orgIdField = '';
	var orgNameField = '';
	$(document).ready(function(){
		if ($.query.get('idField')) {
			idField = $.query.get('idField');
		}
		if ($.query.get('nameField')) {
			nameField = $.query.get('nameField');
		}
		if ($.query.get('orgIdField')) {
			orgIdField = $.query.get('orgIdField');
		}
		if ($.query.get('orgNameField')) {
			orgNameField = $.query.get('orgNameField');
		}
		//初始化树
		$.fn.zTree.init($("#tree"), setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		// 默认展开第一个节点
		var nodes = zTree.getNodes();
		zTree.expandNode(nodes[0], true);
		initTree();
		parent.zTreeOnClick(nodes[0]);
		var searchKey = $("#searchKey").val();
		$("#searchKey").keyup(function(){
			if ($(this).val() != searchKey) {//进行搜索
				searchKey = $(this).val();
				$.fn.zTree.init($("#tree"), setting, zNodes);
				searchNode();
			}
		});
	});
	var setting = {
		check : {
			enable : false,
			chkStyle : "radio",
			radioType : "all"
		},
		view : {
			dblClickExpand : false,
			nameIsHTML : true
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : ""
			}
		},
		callback : {
			beforeCheck : zTreeBeforeCheck,
			//	beforeExpand: zTreeBeforeExpand,
			onClick : onClickNode,
			onCheck : onCheckNode
		}
	};
	//选中节点样式
	function reSetFontCss(treeId, treeNode){
		return (!treeNode.click) ? {
			color : "#000000",
			"font-weight" : "normal"
		} : {};
	}
	function setFontCss(treeId, treeNode){
		return (!!treeNode.highlight) ? {
			color : "#A60000",
			"font-weight" : "bold",
			"font-size" : "14px"
		} : {
			color : "#333",
			"font-weight" : "normal"
		};
	}
	//将已经选过的人员，设置为勾选状态
	function initTree(){
		if(idField!=undefined && idField!=""){
			var id = $(window.parent.document).find("#" + idField).val();
			if (id == undefined || id == "") {
				return false;
			}
			//根据选中人员id、和部门id定位节点
			var idArray = id.split(",");
			var zTree = $.fn.zTree.getZTreeObj("tree");
			for (var i = 0; i < idArray.length; i++) {
				if (idArray[i] != "") {
					var treeNode = zTree.getNodeByParam("id", idArray[i]);
					if (treeNode != null) {//能获取到节点，再进行操作
						zTree.checkNode(treeNode, true, true, false);//勾选状态
						zTree.selectNode(treeNode, true, true);
					}
				}
			}
		}
	}
	//节点点击事件
	function onClickNode(e, treeId, treeNode){
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.checkNode(treeNode, !treeNode.checked, true);
		//	zTree.expandNode(treeNode,true,true,false,false);
		var views = zTree.setting.view;
		views["fontCss"] = reSetFontCss;
		parent.zTreeOnClick(treeNode);
	}
	//节点选择事件
	function onCheckNode(e, treeId, treeNode){
		$.fn.zTree.getZTreeObj("tree").getCheckedNodes(true);
	}
	//节点勾选或取消勾选之前的事件回调函数
	function zTreeBeforeCheck(treeId, treeNode, isExpand){
		if (treeNode.checked == false || isExpand == true) {//点击前状态为非选中 表示当前操作为选中操作
			$.fn.zTree.getZTreeObj("tree").expandNode(treeNode, true, true, false, false);
		}
	}
	//父节点展开回调，异步树使用
	function zTreeBeforeExpand(treeId, treeNode){}
	//搜索
	var nodeList = [];
	function searchNode(){
		var searchKey = $("#searchKey").val();
		if ($.trim(searchKey) === "") {
			updateTree(false);
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("tree");
		/* var nodes = zTree.getNodes(); //异步树先展开所有节点
		zTreeBeforeCheck(nodes[0].id, nodes[0]); */
		//查询匹配节点并更新树
		nodeList = zTree.getNodesByParamFuzzy("name", searchKey);
		if (nodeList == null || nodeList == '') {
			var nodes = zTree.getNodes();
			zTree.expandNode(nodes[0], true);
		} else {
			updateTree(true);
		}
		//勾选搜索前已选节点
		initTree();
	}
	//搜索后更新树
	function updateTree(highlight){
		var zTree = $.fn.zTree.getZTreeObj("tree");
		var pNodeId = "";
		for (var i = 0; i < nodeList.length; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
			if (nodeList[i].kind == "park") {
				var views = zTree.setting.view;
				views["fontCss"] = setFontCss;
			}
			if (highlight) {
				//判断该节点是否父节点  由于expandNode只能对父节点的展开有效
				if (nodeList[i].isParent) {
					zTree.expandNode(nodeList[i], true, true, false, false);
					if ($("#isFilter").is(":checked")) {//过滤
						zTree.moveNode(zTree.getNodes()[0], nodeList[i], "prev");
						pNodeId += "," + nodeList[i].id + ",";
					}
				} else {
					zTree.expandNode(nodeList[i].getParentNode(), true, true, false, false);//展开该子节点的父节点
					if ($("#isFilter").is(":checked")) {//过滤
						if (nodeList[i].level < 3) {
							if (pNodeId.indexOf("," + nodeList[i].getParentNode().id + ",") == -1) {//防止父节点和子节点同时前移，导致父子关系破裂
								zTree.moveNode(zTree.getNodes()[0], nodeList[i], "prev");
							}
						} else {
							if (pNodeId.indexOf("," + nodeList[i].getParentNode().id + ",") == -1) {
								zTree.moveNode(zTree.getNodes()[0], nodeList[i].getParentNode(), "prev");
							}
						}
					}
				}
			}
		}
	}
	/**
	 * 获取人员相关信息
	 */
	function getAccountInfo(){
		var ckAccountIds = "";
		var ckAccountNames = "";
		var ckOrgIds = "";
		var ckOrgNames = "";
		if (idField == "") {
			layerTips("提示：idField参数不能为空，请联系管理员！");
			return false;
		} else {
			if ($(window.parent.document).find("#" + idField).val() == undefined) {
				layerTips("提示：ID为" + idField + "的控件必须存在，否则影响显示勾选状态，请联系管理员！");
				return false;
			}
		}
		//获取选中人员节点信息
		var zTree = $.fn.zTree.getZTreeObj("tree");
		var nodes = zTree.getCheckedNodes(true);
		for (var i = 0; i < nodes.length; i++) {
			var kind = nodes[i].kind;
			if (kind == "park") {
				// 重复数据数据时，不增加
				if (ckAccountIds.indexOf(nodes[i].id) == -1) {
					if (nodes[i].pId == -1 || nodes[i].pId == '' || nodes[i].pId == null) {
						ckAccountIds += "," + nvlStr(nodes[i].id);
						ckAccountNames += "," + nvlStr(nodes[i].name);
					} else {
						var parentOrgNodeList = zTree.getNodesByParam("id", nodes[i].pId);
						var parentOrgNode = parentOrgNodeList[0];
						ckAccountIds += "," + nvlStr(nodes[i].id);
						ckAccountNames += "," + nvlStr(nodes[i].name);
						ckOrgIds += "," + nvlStr(parentOrgNode.id);
						ckOrgNames += "," + nvlStr(parentOrgNode.name);
					}
				}
			}
		}
		//封装数据
		var existAccountIds = $(window.parent.document).find("#" + idField).val();// 获取已选中的人员信息
		if (ckAccountIds != "") {
			existAccountIds = ckAccountIds.substring(1);
		}
		$(window.parent.document).find("#" + idField).val(existAccountIds);
		if (nameField != "") {
			var existAccountNames = $(window.parent.document).find("#" + nameField).text();// 获取已选中的人员信息
			if (ckAccountNames != "") {
				existAccountNames = ckAccountNames.substring(1);
			}
			$(window.parent.document).find("#" + nameField).val(existAccountNames);
		}
		if (orgIdField != "") {
			var existOrgIds = $(window.parent.document).find("#" + orgIdField).text();// 获取已选中的人员信息
			if (ckOrgIds != "") {
				existOrgIds = ckOrgIds.substring(1);
			}
			$(window.parent.document).find("#" + orgIdField).val(existOrgIds);
		}
		if (orgNameField != "") {
			var existOrgNames = $(window.parent.document).find("#" + orgNameField).text();// 获取已选中的人员信息
			if (ckOrgNames != "") {
				existOrgNames = ckOrgNames.substring(1);
			}
			$(window.parent.document).find("#" + orgNameField).val(existOrgNames);
		}
	}
</script>
</head>
<body style="height: 94%; background-color: #f3f3f4; overflow-x: auto;">
	<div class="wrapper wrapper-content" style="padding: 20px 20px 0;">
		<div>
			<font color=red style="font-size: 13px; cursor: pointer;"> <i class="fa fa-search"></i>搜索：
			</font>
			<input type="text" id="searchKey" name="searchKey" style="border: 0px; border-bottom: 1px solid red; width: 50%; background: rgba(0, 0, 0, 0);" />
			<input type="checkbox" id="isFilter" name="isFilter" value="1" checked="checked">
			<font color=blue style="font-size: 13px;">结果置前</font>
			<div class="zTreeDemoBackground" style="margin-top: 10px;">
				<ul id="treeContent" class="ztree" style="width: 50%; padding: 5px;"></ul>
			</div>
		</div>
		<div class="box-content">
			<ul id="tree" class="ztree" style="width: 100%"></ul>
		</div>
	</div>
</body>
</html>
