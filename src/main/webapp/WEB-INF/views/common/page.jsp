<style type="text/css">
li {list-style: none;}
</style>
<Script Language="JavaScript" src="${ctx}/static/js/pagelist.js"></Script>
<Script Language="JavaScript">
	var PageInation=new PageHTMLBar("PageInation",${totalPages} ,${pageNum},"../${pageUrl}",${pageSize});
	document.write(PageInation);
</Script>
