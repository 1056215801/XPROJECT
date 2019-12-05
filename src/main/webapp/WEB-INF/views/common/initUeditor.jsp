<%@ page language="java"   pageEncoding="UTF-8"%>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.js" charset="utf-8"></script>
<script type="text/javascript">
//富文本编辑器初始化
$(document).ready(function() {
		   var ue = null;
			UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
			UE.Editor.prototype.getActionUrl = function(action) {
				if (action == 'uploadvideo' || action == 'uploadscrawl'
						|| action == 'uploadimage') {
					return '${ctx}/uploadimage';
				} else {
					return this._bkGetActionUrl.call(this, action);
				}
			};
			ue = UE.getEditor('editor' ,{ 
			//	initialFrameWidth:860  
			//	initialFrameHeight:860  
				 autoHeightEnabled:false
			});
			ue.addListener("ready", function() {
				//ue.setContent(content); 
			});
			
});

/*
 *  场景一：页面上只有一个富文本编辑器，指定其ID为editor，则无需调用下面的方法
 *  场景二：页面上有超过2个富文本编辑器，则使用此方法初始化，参数1：className,参数2：是否禁用(默认false)
 *
 */
function initRichTextEditor(className,disabled){
	 $("."+className).each(function(){
	   var ue = UE.getEditor($(this).attr("id"));
	   ue.addListener("ready", function () {
		   if(disabled){
			   ue.setDisabled();
		   }
	   });
	 });
}
</script>