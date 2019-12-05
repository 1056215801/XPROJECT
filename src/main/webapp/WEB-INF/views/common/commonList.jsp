<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ include file="commonPage.jsp"%>
<link href="${ctx}/static/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/static/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<link href="${ctx}/static/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="${ctx}/static/css/page.css" type="text/css" rel="stylesheet" />

<script src="${ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${ctx}/static/js/content.min.js?v=1.0.0"></script>
<script src="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/static/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx}/static/script/bootstrap-table-init.js"></script>

<script type="text/javascript">
jQuery(function() {
	//设置单击一行，自动勾选/取消复选框
	$("#exampleTableToolbar tr").slice(1).each(function(){  
	    var p = this;  
	    $(this).children().slice(1).click(function(){  
	        $($(p).children()[0]).children().each(function(){  
	            if(this.type=="checkbox"){ 
	            	if (this.disabled == true) {
	                    POSStockHeadTable.datagrid('unselectRow', index - 1);
	                }
	                if(!this.checked){  
	                    this.checked = true;  
	                }else{  
	                    this.checked = false;  
	                }  
	            } 
	        });
	        $($($(p).children()[0]).children()[0]).children().each(function(){  
	            if(this.type=="checkbox"){  
	            	if (this.disabled == true) {
	                    POSStockHeadTable.datagrid('unselectRow', index - 1);
	                }
	                if(!this.checked){  
	                    this.checked = true;  
	                }else{  
	                    this.checked = false;  
	                }  
	            } 
	        }); 
	        
	    });  
	});  
	
	var msg = '${message}';
	if(msg!=null&&msg!=""){
		layer.alert(msg);
		msg=null;
	}
});

function batchDelete(url,name,form){
	var con = false;
	$('input[name="'+name+'"]:checked').each(function(){
		con = true;
		return false;
	});
	if(!con){
		alert("没有任何选择项！");
		return false;
	}
	confirm("是否确定删除？",function(){
		form.attr("action",url).submit();
	},function(){//取消
		return false;
	});
}
</script>