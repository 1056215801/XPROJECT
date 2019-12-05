<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<link  href="${ctx}/static/css/pagination/pagination.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/static/js/plugins/pagination/jquery.pagination.js"></script>


<script>
function showPagination(selector,total,callbackFun,type,pageSize){
	var ps=10;
	if(pageSize!=null && pageSize>0){
		ps=pageSize ;
	}
	$(selector).pagination({
		totalData: total,
	    showData: ps,
	    coping: true,
	    prevContent: '上页',
	    nextContent: '下页',
	    homePage: '首页',
	    endPage: '末页',
	    mode: 'fixed',
	    callback: function (api) {
	    	var cp = api.getCurrent();
	    	callbackFun(cp, ps, type);
	    }
	})
}
</script>