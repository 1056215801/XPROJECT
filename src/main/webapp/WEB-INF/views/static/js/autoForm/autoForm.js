/**
 * 根据类型获取控件实际显示html   变量i 在选项中用到
 */
 function getInputShowHtml(type){
	var htmlStr = "";
	//根据拖动的标签类型，来显示不同的控件
	htmlStr += "<div class=\"form-group clearfix\">";
	if(type == "text"){//单行文本
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">文本框</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"text\" name=\"\" class=\"form-control\" placeholder=\"请输入文本\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "textarea"){//多行文本
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">多行文本</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<textarea class=\"form-control\" name=\"\" placeholder=\"请输入文本\"></textarea>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "number"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">数字</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"text\" class=\"form-control\" name=\"number\" placeholder=\"请输入数值\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "password"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">密码框</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"请输入密码\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "richtext"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">富文本</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<script id=\"item"+divIndex+"_editor\" type=\"text\/plain\" class=\"editorsSzc\"></script>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "radio"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">单选按钮组</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"radio i-checks\">";
		htmlStr += "<label id=\"item"+divIndex+"_rdoItem1_lab\"><input type=\"radio\" value=\"选项1\" name=\"rdobox\"> <i></i> <font>选项1</font></label>";
		htmlStr += "<label id=\"item"+divIndex+"_rdoItem2_lab\"><input type=\"radio\" value=\"选项2\" name=\"rdobox\"> <i></i> <font>选项2</font></label>";
		htmlStr += "<label id=\"item"+divIndex+"_rdoItem3_lab\"><input type=\"radio\" value=\"选项3\" name=\"rdobox\"> <i></i> <font>选项3</font></label>";
		htmlStr += "</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "checkbox"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">复选按钮组</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"checkbox i-checks\">";
		htmlStr += "<label id=\"item"+divIndex+"_ckbItem1_lab\"><input type=\"checkbox\" value=\"选项1\" name=\"ckbox\"> <i></i> <font>选项1</font></label>";
		htmlStr += "<label id=\"item"+divIndex+"_ckbItem2_lab\"><input type=\"checkbox\" value=\"选项2\" name=\"ckbox\"> <i></i> <font>选项2</font></label>";
		htmlStr += "<label id=\"item"+divIndex+"_ckbItem3_lab\"><input type=\"checkbox\" value=\"选项3\" name=\"ckbox\"> <i></i> <font>选项3</font></label>";
		htmlStr += "</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "select"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">下拉列表</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<select class=\"form-control\" name=\"slt\">";
		htmlStr += "<option id=\"item"+divIndex+"_slcItem1_opt\">选项1</option>";
		htmlStr += "<option id=\"item"+divIndex+"_slcItem2_opt\">选项2</option>";
		htmlStr += "<option id=\"item"+divIndex+"_slcItem3_opt\">选项3</option>";
		htmlStr += "</select>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "selectmore"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">下拉复选列表</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<select class=\"form-control\" multiple=\"\">";
		htmlStr += "<option id=\"item"+divIndex+"_slmItem1_opt\">选项1</option>";
		htmlStr += "<option id=\"item"+divIndex+"_slmItem2_opt\">选项2</option>";
		htmlStr += "<option id=\"item"+divIndex+"_slmItem3_opt\">选项3</option>";
		htmlStr += "</select>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "date"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">日期时间</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input class=\"form-control layer-date laydate-icon\" placeholder=\"单击选择时间\" onclick=\"laydate({istime: true, format: \'YYYY-MM-DD hh:mm:ss\'})\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "hidden"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">隐藏域</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"hidden\" name=\"hidden\" />";
	}else if(type == "file"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">文件上传</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"file\" name=\"file\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "subform"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">子表单</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">休息.休息.休息一会儿</div>";
	}else if(type == "user"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">人员单选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseOne\">点击设置人员</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "usergroup"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">人员多选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">点击设置人员</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "dept"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">部门单选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseOne\">点击设置部门</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "deptgroup"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">部门多选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">点击设置部门</div>";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
	}else if(type == "line"){
		//htmlStr += "<label class=\"col-sm-3 control-label line\">分割线</label>";
		htmlStr += "<div class=\"col-sm-12 line\">";
		htmlStr += "<span class=\"help-block m-b-none\"></span>";
		htmlStr += "<div class=\"hr-line-dashed\" id=\"line\"></div>";
	}
	htmlStr += "</div>";
	htmlStr += "</div>";
	//增加移除按钮
	htmlStr += "<p class=\"tools col-sm-12 col-sm-offset-3\"><a class=\"remove-link\" onclick=\"removeLink('item"+divIndex+"','"+type+"')\">移除</a></p>";
	return htmlStr;
 }
 

 /* 创建控件属性信息 */
 function createProperties(id,type,sortNum){
	var propertyId = id + "_prop";//创建属性div 的id名
	var htmlStr = "<div class=\"propPane\" id=\""+propertyId+"\" style=\"display:none;\">";
	//根据type封装不同的属性div
	if(type == 'text'){//文本框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">单行文本</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"文本框\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
    	htmlStr += "<div class=\"splitLine\"></div>";
    	
    	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
    	htmlStr += "<div class=\"splitLine\"></div>";
		
    	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">格式</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('txtFormat',\'"+id+"\')\">";
	    	htmlStr += "<option value=\"\">无</option>";
	    	htmlStr += "<option value=\"email\">邮箱</option>";
	    	htmlStr += "<option value=\"phone\">手机号码</option>";
	    	htmlStr += "<option value=\"tel\">固定电话</option>";
	    	htmlStr += "<option value=\"code\">邮政编码</option>";
	    	htmlStr += "</select>";
    	htmlStr += "</div>";
    	htmlStr += "<div class=\"splitLine\"></div>";
    	
    	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
       	htmlStr += "</div>";
	}else if(type == 'password'){//密码输入框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">密码文本</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"密码框\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
       	htmlStr += "</div>";
	}else if(type == 'number'){//数值
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">数字</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"数字\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">最小值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_min\">";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">最大值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_max\">"
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">小数点后几位</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_pre\" id=\""+propertyId+"_pre\" onblur=\"updateValue(\'precision\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'precision\',\'"+id+"\')\">";
       	htmlStr += "</div>";
	}else if(type == 'textarea'){//多行文本
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">多行文本</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"多行文本\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'areadfValue\',\'"+id+"\')\">";
    	htmlStr += "</div>";
	}else if(type == 'richtext'){//富文本
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">富文本</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"富文本\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'richvalue\',\'"+id+"\')\">";
    	htmlStr += "</div>";
	}else if(type == 'radio'){//单选按钮组
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">单选按钮组</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"单选按钮组\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_rdoItemIndex\" value=\"3\">";//标识选项个数 用于编号
	    	htmlStr += "<div id=\""+propertyId+"_rdoDiv\">";
	    	//-------选项1
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem1_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" id=\""+propertyId+"_rdoItem1\" name=\""+propertyId+"_rdoItem\" value=\"选项1\">";
		    	htmlStr += "<i></i><font>";
		    	//注释备忘 onclick事件多余 单击会自动触发radiobox的点击事件
		    	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem1\" value=\"选项1\" id=\""+propertyId+"_rdoItem1\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_1\')\">";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\"选项1\" id=\""+propertyId+"_rdoItem1_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem1\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "</div>";
	    	//------选项2
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem2_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" id=\""+propertyId+"_rdoItem2\" name=\""+propertyId+"_rdoItem\" value=\"选项2\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\"选项2\" id=\""+propertyId+"_rdoItem2_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem2\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem2_div\',\'2\',\'radio\')\" title=\"移除\">";
		    	htmlStr += "</div>";
	    	//------选项3
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem3_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" id=\""+propertyId+"_rdoItem3\" name=\""+propertyId+"_rdoItem\" value=\"选项3\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\"选项3\" id=\""+propertyId+"_rdoItem3_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem3\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem3_div\',\'3\',\'radio\')\" title=\"移除\">";
		    	htmlStr += "</div>";
	    	//------end
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'radio\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'rdoOther\')\">添加其他选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_rdoDiv\',\'radio\')\">批量编辑</div>";
	    	htmlStr += "</div>";
    	htmlStr += "</div>";
	}else if(type == 'checkbox'){//复选框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">复选按钮组</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"复选按钮组\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
	  	//-----以下为选项
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_ckbItemIndex\" value=\"3\">";//标识选项个数 用于编号
	    	htmlStr += "<div id=\""+propertyId+"_ckbDiv\">";
	    	//-------选项1
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem1_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckbItem\" id=\""+propertyId+"_ckbItem1\" value=\"选项1\">";
		    	htmlStr += "<i></i><font>";
		    	//注释备忘 onclick事件多余 单击会自动触发checkbox的点击事件
		    	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem1\" value=\"选项1\" id=\""+propertyId+"_ckbItem1\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_1\')\">";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\"选项1\" id=\""+propertyId+"_ckbItem1_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem1\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "</div>";
    	//-------选项2
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem2_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckbItem\" id=\""+propertyId+"_ckbItem2\" value=\"选项2\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\"选项2\" id=\""+propertyId+"_ckbItem2_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem2\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem2_div\',\'2\',\'checkbox\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//-------选项3
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem3_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckbItem\" id=\""+propertyId+"_ckbItem3\" value=\"选项3\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\"选项3\" id=\""+propertyId+"_ckbItem3_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem3\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem3_div\',\'3\',\'checkbox\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//-------end
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'checkbox\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'ckbOther\')\">添加其他选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_ckbDiv\',\'checkbox\')\">批量编辑</div>";
	    	htmlStr += "</div>";
    	htmlStr += "</div>";
	}else if(type == 'select'){//下拉列表
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">下拉列表</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"下拉列表\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_slcItemIndex\" value=\"3\">";//标识选项个数 用于编号
    		htmlStr += "<div id=\""+propertyId+"_slcDiv\">";
    	//-------选项1
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem1_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem1\" value=\"选项1\">";
		    	htmlStr += "<i></i><font>";
		    	//注释备忘 onclick事件多余 单击会自动触发radiobox的点击事件
		    	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem1\" value=\"选项1\" id=\""+propertyId+"_slcItem1\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_1\')\">";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\"选项1\" id=\""+propertyId+"_slcItem1_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_:"+propertyId+"_slcItem1\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "</div>";
    	//------选项2
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem2_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem2\" value=\"选项2\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\"选项2\" id=\""+propertyId+"_slcItem2_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_:"+propertyId+"_slcItem2\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem2_div\',\'2\',\'select\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//------选项3
		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem3_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem3\" value=\"选项3\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\"选项3\" id=\""+propertyId+"_slcItem3_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_:"+propertyId+"_slcItem3\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem3_div\',\'3\',\'select\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//------end
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'select\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slcDiv\',\'select\')\">批量编辑</div>";
	    	htmlStr += "</div>";
    	htmlStr += "</div>";
	}else if(type == 'selectmore'){//下拉复选列表
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">下拉复选列表</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"下拉复选列表\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_slmItemIndex\" value=\"3\">";//标识选项个数 用于编号
    		htmlStr += "<div id=\""+propertyId+"_slmDiv\">";
    	//-------选项1
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem1_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem1\" value=\"选项1\">";
		    	htmlStr += "<i></i><font>";
		    	//注释备忘 onclick事件多余 单击会自动触发radiobox的点击事件
		    	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem1\" value=\"选项1\" id=\""+propertyId+"_slmItem1\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_1\')\">";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\"选项1\" id=\""+propertyId+"_slmItem1_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_:"+propertyId+"_slmItem1\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "</div>";
    	//-------选项2
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem2_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem2\" value=\"选项2\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\"选项2\" id=\""+propertyId+"_slmItem2_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_:"+propertyId+"_slmItem2\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem2_div\',\'2\',\'selectmore\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//-------选项3
		    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem3_div\">";
		    	htmlStr += "<label>";
		    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem3\" value=\"选项3\">";
		    	htmlStr += "<i></i><font>";
		    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\"选项3\" id=\""+propertyId+"_slmItem3_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_:"+propertyId+"_slmItem3\')\">";
		    	htmlStr += "</font>";
		    	htmlStr += "</label>";
		    	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem3_div\',\'3\',\'selectmore\')\" title=\"移除\">";
		    	htmlStr += "</div>";
    	//-------end
    		htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'selectmore\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slmDiv\',\'selectmore\')\">批量编辑</div>";
	    	htmlStr += "</div>";
    	htmlStr += "</div>";
	}else if(type == 'date'){//日期时间
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">日期时间</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"日期时间\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('dateFormat',\'"+id+"\')\">";
		    	htmlStr += "<option value=\"ymdhms\">年-月-日 时:分:秒</option>";
		    	htmlStr += "<option value=\"ymdhm\">年-月-日 时:分</option>";
		    	htmlStr += "<option value=\"ymd\">年-月-日</option>";
		    	htmlStr += "<option value=\"ym\">年-月</option>";
		    	htmlStr += "<option value=\"hms\">时:分:秒</option>";
		    	htmlStr += "<option value=\"hm\">时:分</option>";
	    	htmlStr += "</select>";
    	htmlStr += "</div>";
    	htmlStr += "<div class=\"splitLine\"></div>";
    	
    	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
    	htmlStr += "</div>";
	}else if(type == 'hidden'){//隐藏域
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
		   	htmlStr += "<div class=\"titleTip\">隐藏域</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\">";
    	htmlStr += "</div>";
	}else if(type == 'file'){//文本域
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">文件上传</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"文件上传\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	   	htmlStr += "</div>";
	   	htmlStr += "<div class=\"splitLine\"></div>";
	   	
	   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\">";
		    	htmlStr += "<option value=\"upload\">附件(包含上传按钮)</option>";
		    	htmlStr += "<option value=\"down\">附件(只能下载)</option>";
	    	htmlStr += "</select>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	   	
	   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
		   	htmlStr += "</div>";
		   	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
	}else if(type == 'subform'){//子表单
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">子表单</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<span>待开发...</span>"
	   	htmlStr += "</div>";
	}else if(type == "user"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">人员单选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"人员单选\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "usergroup"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">人员多选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"人员多选\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "dept"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">部门单选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"部门单选\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "deptgroup"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">部门多选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\"部门多选\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == 'line'){//分隔符
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
		   	htmlStr += "<div class=\"titleTip\">分隔符</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<select class=\"inputWidth\" id=\""+propertyId+"_format\" name=\""+propertyId+"_format\" onchange=\"updateValue(\'lineType\',\'"+id+"\')\">";
	    	htmlStr += "<option value=\"dashed\">虚线</option>";
	    	htmlStr += "<option value=\"solid\">实线</option>";
	    	htmlStr += "</select>";
	   	htmlStr += "</div>";
	   	
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
		   	htmlStr += "</div>";
		   	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
    	htmlStr += "</div>";
	}
	//str += '说明文字:<br/><input type="text" name="'+propertyId+'_des" id="'+propertyId+'_des" onblur="updateValue(\'des\',\''+id+'\')"><br/>';
	if(type != 'line'){
		htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">校验</span>";
	    	htmlStr += "</div>";
	    	//----------checkbox
	    	htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label>";
	    	htmlStr += "<input type=\"checkbox\" value=\"1\" name=\""+propertyId+"_check\">";
	    	htmlStr += "<i></i><font>必填</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>";
	    	//-----------
		htmlStr += "</div>";
		
		htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">列表可见</span>";
	    	htmlStr += "</div>";
	    	//----------checkbox
	    	htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label>";
	    	htmlStr += "<input type=\"checkbox\" value=\"show\" name=\""+propertyId+"_show\">";
	    	htmlStr += "<i></i><font>可见</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>";
	    	//-----------
		htmlStr += "</div>";
		
		//----begin
    /* 	htmlStr += "<div class=\"checkbox i-checks\">";
    	htmlStr += "<label>";
    	htmlStr += "<input type=\"checkbox\" value=\"unique\" name=\""+propertyId+"_whrite\">";
    	htmlStr += "<i></i><font>不允许重复值</font>";
    	htmlStr += "</label>";
    	htmlStr += "</div>"; */
    	//-----------
    	//----end
    	/* htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">操作权限</span>";
	    	htmlStr += "</div>";
    	//--------begin
    	/* htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label id=\"item1_lab3\">";
	    	htmlStr += "<input type=\"checkbox\" value=\"show\" name=\""+propertyId+"_show\" checked>";
	    	htmlStr += "<i></i><font>可见</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>"; 
    	*/
    	//--------
    	/* htmlStr += "<div class=\"checkbox i-checks\">";
    	htmlStr += "<label id=\"item2_lab2\">";
    	htmlStr += "<input type=\"checkbox\" value=\"edit\" name=\""+propertyId+"_edit\" checked>";
    	htmlStr += "<i></i><font>可编辑</font>";
    	htmlStr += "</label>";
    	htmlStr += "</div>"; */
    	//--------
    	/* htmlStr += "</div>"; */
    	//----end
	}
	
    //str += '排序:<br/><input type="text" readOnly name="'+propertyId+'_sort" id="'+propertyId+'_sort" value="'+(i)+'"></div>';
    htmlStr += "<div class=\"splitLine\"></div>";
    htmlStr += "<div class=\"survey_contRightBar\">";
		htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">排序</span>";
		htmlStr += "</div>";
   		htmlStr += "<input class=\"inputWidth\" readOnly name=\""+propertyId+"_sort\" id=\""+propertyId+"_sort\" type=\"text\" value=\""+sortNum+"\">";
   	htmlStr += "</div>";
   	//--------
    htmlStr += "</div>";
    return htmlStr;
}
 
//修改控件属性,联动修改拖拽的控件显示
 function updateValue(type,id){
 	if(type=='title'){
     	$("#"+id+" label.control-label").html($("#"+id+"_prop_title").val());
 	}else if(type=='txtFormat'){
 		var v = $("#"+id+"_prop_format").val();
 		if(v == 'email'){
 			$("#"+id+" input.form-control").attr("placeholder","请输入邮箱格式文本");
 		}else if(v == 'phone'){
 			$("#"+id+" input.form-control").attr("placeholder","请输入手机号码格式文本");
 		}else if(v == 'tel'){
 			$("#"+id+" input.form-control").attr("placeholder","请输入固定电话格式文本");
 		}else if(v == 'code'){
 			$("#"+id+" input.form-control").attr("placeholder","请输入邮编格式文本");
 		}else{
 			$("#"+id+" input.form-control").attr("placeholder","请输入文本");
 		}
 	}else if(type=='precision'){
 		var pre = $("#"+id+"_prop_pre").val();
 		var df = $("#"+id+"_prop_default").val();
 		if(pre == ''){
 			pre = 0;
 		}
 		if(df == ''){
 			df = 0;
 		}
 		$("#"+id+" input.form-control").val(Number(df).toFixed(pre));
 	}else if(type=='dfValue'){//默认值
 		$("#"+id+" input.form-control").val($("#"+id+"_prop_default").val());
 	}else if(type=='areadfValue'){//多行文本默认值
 		$("#"+id+" textarea.form-control").val($("#"+id+"_prop_default").val());
 	}else if(type=='rdoTitle'){//选项名称 --单选按钮组
 		var array = id.split("_:");
 		var title = $("#"+array[1]+"_input").val();
 		$("#"+array[1].replace("_prop","")+"_lab font").html(title);
 		$("#"+array[1]).val(title);
 	}else if(type=='isCheckRdo'){//选中事件 -单选按钮组
 		var array = id.split("_:");
 		//重置所有单选选项勾选状态
 		$("#"+array[0]+" .iradio_square-green").each(function(){
 			$(this).attr("class","iradio_square-green");
 		});
 		//关联勾选状态
 		$("#"+array[1].replace("_prop","")+"_lab .iradio_square-green").prop("class","iradio_square-green checked");
 	}else if(type=='ckbTitle'){//选项名称 -复选按钮组
 		var array = id.split("_:");
 		var title = $("#"+array[1]+"_input").val();
 		$("#"+array[1].replace("_prop","")+"_lab font").html(title);
 		$("#"+array[1]).val(title);
 	}else if(type=='isCheckCkb'){//选中事件 -复选按钮组
 		var array = id.split("_:")
 		//重置所有单选选项勾选状态
 		if($("#"+array[1]).is(':checked')){
     		//关联勾选状态
     		$("#"+array[1].replace("_prop","")+"_lab .icheckbox_square-green").attr("class","icheckbox_square-green checked");
 		}else{
 			$("#"+array[1].replace("_prop","")+"_lab .icheckbox_square-green").attr("class","icheckbox_square-green");
 		}
 	}else if(type=='isCheckCkbInput'){//选中事件 -复选按钮组 单击内容input
 		var array = id.split("_");
 		//重置所有单选选项勾选状态
 		if($("#"+array[1]).is(':checked')){//由于执行顺序关系,单击文本框事件在前,关联勾选复选框在后,所以此处要写反
 			$("#"+array[1].replace("_prop","")+"_lab .icheckbox_square-green").attr("class","icheckbox_square-green");
 		}else{
     		//关联勾选状态
     		$("#"+array[1].replace("_prop","")+"_lab .icheckbox_square-green").attr("class","icheckbox_square-green checked");
 		}
 	}else if(type=='slcTitle'){//选项名称 -下拉列表选项
 		var array = id.split("_:");
 		var title = $("#"+array[1]+"_input").val();
 		$("#"+array[1].replace("_prop","")+"_opt").html(title);
 		$("#"+array[1]).val(title);
 	}else if(type=='isCheckSlc'){//选中事件 -下拉列表选项
 		var array = id.split("_:");
 		//重置所有选项选中状态
 		$("#"+array[0]+" option").removeAttr('selected');
 		//关联勾选状态
 		$("#"+array[1].replace("_prop","")+"_opt").attr('selected',true);
 		$("#"+array[1].replace("_prop","")+"_opt").prop('selected',true);
 	}else if(type=='slmTitle'){//选项名称 -下拉复选列表选项
 		var array = id.split("_:");
 		var title = $("#"+array[1]+"_input").val();
 		$("#"+array[1].replace("_prop","")+"_opt").html(title);
 		$("#"+array[1]).val(title);
 	}else if(type=='isCheckSlm'){//选中事件 -下拉复选列表选项
 		var array = id.split("_:");
 		//重置所有选项选中状态
 		if($("#"+array[1]).is(':checked')){
     		$("#"+array[1].replace("_prop","")+"_opt").attr('selected',true);
     		$("#"+array[1].replace("_prop","")+"_opt").prop('selected',true);
 		}else{
     		//关联勾选状态
 			$("#"+array[1].replace("_prop","")+"_opt").removeAttr('selected');
 		}
 	}else if(type=='isCheckSlmInput'){//选中事件 -下拉复选列表选项 单击文本框 此处同isCheckCkbInput原理一致
 		var array = id.split("_:");
 		//重置所有选项选中状态
 		if($("#"+array[1]).is(':checked')){
     		//关联勾选状态
 			$("#"+array[0]+"_slmItem"+array[1]+"_opt").removeAttr('selected');
 		}else{
     		$("#"+array[1].replace("_prop","")+"_opt").attr('selected',true);
     		$("#"+array[1].replace("_prop","")+"_opt").prop('selected',true);
 		}
 	}else if(type=='dateFormat'){
 		var dateFormat = $("#"+id+"_prop_format").val();
 		if(dateFormat == 'ymdhms'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})");
 		}else if(dateFormat == 'ymdhm'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'YYYY-MM-DD hh:mm'})");
 		}else if(dateFormat == 'ymd'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: false, format: 'YYYY-MM-DD'})");
 		}else if(dateFormat == 'ym'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: false, format: 'YYYY-MM'})");
 		}else if(dateFormat == 'hms'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'hh:mm:ss'})");
 		}else if(dateFormat == 'hm'){
 			$("#"+id+" input.layer-date").attr("onclick","laydate({istime: true, format: 'hh:mm'})");
 		}
 	}else if(type=='des'){//说明文字
 		var desContent = $("#"+id+"_prop_des").val();
 		$("#"+id+" span.help-block.m-b-none").html(desContent);
 	}else if(type=='lineType'){//分割线类型
 		var lineType = $("#"+id+"_prop_format").val();
 		if(lineType == 'dashed'){
 			$("#"+id+" div#line").attr("class","hr-line-dashed");
 		}else if(lineType == 'solid'){
 			$("#"+id+" div#line").attr("class","hr-line-solid");
 		}
 	}
 }
 
 /**
  * 获取增加的选项的html formLayout：z纵排 h横排
  */
 function addItemOptionHtml(id,type,formLayout){
	  var htmlStr = "";
	  var propertyId = id + "_prop";
	  if(type=="radio"){
	 	//拖放显示:增加选项
	 	if(formLayout == "z"){
	 		htmlStr += '<br/>';
	 	}
	 	//获取编码
	 	var rdoIndex = Number($("#"+propertyId+"_rdoItemIndex").val())+1;//获取选项数量 用于编号
	 	$("#"+propertyId+"_rdoItemIndex").val(rdoIndex);
	 	
	 	htmlStr += '<label id="'+id+'_rdoItem'+rdoIndex+'_lab"><div style="position: relative;" class="iradio_square-green">';
	 	htmlStr += '<input style="position: absolute; opacity: 0;" type="radio" value="选项" name="'+id+'_rdobox">';
	 	htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	 	htmlStr += '<i></i> <font>选项</font></label>';
	 	$(htmlStr).appendTo($("#"+id+" div.radio.i-checks"));
	 	//属性栏:增加选项
	 	htmlStr = "";
	 	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_div\">";
	  	htmlStr += "<label>";
	  	htmlStr += "<input type=\"radio\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" name=\""+propertyId+"_rdoItem\" value=\"选项\">";
	  	htmlStr += "<i></i><font>";
	  	//注释备忘
	  	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\"选项\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
	  	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\"选项\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem"+rdoIndex+"\')\">";
	  	htmlStr += "</font>";
	  	htmlStr += "</label>";
	  	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+rdoIndex+"_div\',\'"+rdoIndex+"\',\'radio\')\" title=\"移除\">";
	  	htmlStr += "</div>";
	 	$(htmlStr).appendTo($("#"+propertyId+"_rdoDiv"));
	  }else if(type=="rdoOther"){//单选按钮组 其他可输入
	 	//拖放显示:增加选项
	 	 if(formLayout == "z"){
	  		htmlStr += '<br/>';
	  	 }
	 	 //获取编码
	 	 var rdoIndex = Number($("#"+propertyId+"_rdoItemIndex").val())+1;//获取选项数量 用于编号
	 	 $("#"+propertyId+"_rdoItemIndex").val(rdoIndex);
	 	 
	 	 htmlStr += '<label id="'+id+'_rdoItem'+rdoIndex+'_lab"><div style="position: relative;" class="iradio_square-green">';
	 	 htmlStr += '<input style="position: absolute; opacity: 0;" type="radio" value="其他" name="'+id+'_rdobox">';
	 	 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	 	 htmlStr += '<i></i> <font>其他</font>&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></label>';
	 	 $(htmlStr).appendTo($("#"+id+" div.radio.i-checks"));
	 	//属性栏:增加选项
	 	 htmlStr = "";
	 	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+rdoIndex+"_div\">";
	  	 htmlStr += "<label>";
	  	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdoItem\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\"其他\">";
	  	 htmlStr += "<i></i><font>";
	  	//注释备忘
	  	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\"其他\" readOnly id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
	   	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\"其他\" readOnly id=\""+propertyId+"_rdoItem"+rdoIndex+"_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem"+rdoIndex+"\')\">";
	   	 htmlStr += "</font>";
	  	 htmlStr += "</label>";
	  	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+rdoIndex+"_div\',\'"+rdoIndex+"\',\'radio\')\" title=\"移除\">";
	  	 htmlStr += "</div>";
	  	$(htmlStr).appendTo($("#"+propertyId+"_rdoDiv"));
	  }else if(type=="checkbox"){
	 	//拖放显示:增加选项
	 	 if(formLayout == "z"){
	   		htmlStr += '<br/>';
	   	 }
	 	 //获取编码
	 	 var ckbIndex = Number($("#"+propertyId+"_ckbItemIndex").val())+1;//获取选项数量 用于编号
	 	 $("#"+propertyId+"_ckbItemIndex").val(ckbIndex);
	 	 
	 	 htmlStr += '<label id="'+id+'_ckbItem'+ckbIndex+'_lab"><div style="position: relative;" class="icheckbox_square-green">';
	 	 htmlStr += '<input style="position: absolute; opacity: 0;" value="选项" name="'+id+'_ckbox" type="checkbox">';
	 	 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	 	 htmlStr += '<i></i> <font>选项</font></label>';
	 	 $(htmlStr).appendTo($("#"+id+" div.checkbox.i-checks"));
	 	//属性栏:增加选项
	 	 htmlStr = "";
	 	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_div\">";
	  	 htmlStr += "<label>";
	  	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" name=\""+propertyId+"_ckbItem\" value=\"选项\">";
	  	 htmlStr += "<i></i><font>";
	  	//注释备忘
	  	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\"选项\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
	  	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\"选项\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem"+ckbIndex+"\')\">";
	  	 htmlStr += "</font>";
	  	 htmlStr += "</label>";
	  	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+ckbIndex+"_div\',\'"+ckbIndex+"\',\'checkbox\')\" title=\"移除\">";
	  	 htmlStr += "</div>";
	  	$(htmlStr).appendTo($("#"+propertyId+"_ckbDiv"));
	  }else if(type=="ckbOther"){
	 	//拖放显示:增加选项
	 	 if(formLayout == "z"){
	   		htmlStr += '<br/>';
	   	 }
	 	 //获取编码
	 	 var ckbIndex = Number($("#"+propertyId+"_ckbItemIndex").val())+1;//获取选项数量 用于编号
	 	 $("#"+propertyId+"_ckbItemIndex").val(ckbIndex);
	 	 
	 	 htmlStr += '<label id="'+id+'_ckbItem'+ckbIndex+'_lab"><div style="position: relative;" class="icheckbox_square-green">';
	 	 htmlStr += '<input style="position: absolute; opacity: 0;" value="其他" name="'+id+'_ckbox" type="checkbox">';
	 	 htmlStr += '<ins style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>';
	 	 htmlStr += '<i></i> <font>其他</font>&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;"></label>';
	 	 $(htmlStr).appendTo($("#"+id+" div.checkbox.i-checks"));
	 	//属性栏:增加选项
	 	 htmlStr = "";
	 	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+ckbIndex+"_div\">";
	  	 htmlStr += "<label>";
	  	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckbItem\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\"其他\">";
	  	 htmlStr += "<i></i><font>";
	  	//注释备忘
	  	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\"其他\" readOnly id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
	  	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\"其他\" readOnly id=\""+propertyId+"_ckbItem"+ckbIndex+"_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem"+ckbIndex+"\')\">";
	  	 htmlStr += "</font>";
	  	 htmlStr += "</label>";
	  	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+ckbIndex+"_div\',\'"+ckbIndex+"\',\'checkbox\')\" title=\"移除\">";
	  	 htmlStr += "</div>";
	  	 $(htmlStr).appendTo($("#"+propertyId+"_ckbDiv"));
	  }else if(type=="select"){
	 	 //获取编码
	 	 var slcIndex = Number($("#"+propertyId+"_slcItemIndex").val())+1;//获取选项数量 用于编号
	 	 $("#"+propertyId+"_slcItemIndex").val(slcIndex);
	 	 
	 	//拖放显示:增加选项
	 	 htmlStr = '<option id="'+id+'_slcItem'+slcIndex+'_opt">选项</option>';
	 	 $(htmlStr).appendTo($("#"+id+" select"));
	 	//属性栏:增加选项
	 	 htmlStr = "";
	 	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem"+slcIndex+"_div\">";
	  	 htmlStr += "<label>";
	  	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem"+slcIndex+"\" value=\"选项\">";
	  	 htmlStr += "<i></i><font>";
	  	//注释备忘
	  	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem"+slcIndex+"\" value=\"选项\" id=\""+propertyId+"_slcItem"+slcIndex+"\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_"+slcIndex+"\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_"+slcIndex+"\')\">";
	  	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\"选项\" id=\""+propertyId+"_slcItem"+slcIndex+"_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_:"+propertyId+"_slcItem"+slcIndex+"\')\">";
	  	 htmlStr += "</font>";
	  	 htmlStr += "</label>";
	  	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem"+slcIndex+"_div\',\'"+slcIndex+"\',\'select\')\" title=\"移除\">";
	  	 htmlStr += "</div>";
	  	 $(htmlStr).appendTo($("#"+propertyId+"_slcDiv"));
	  }else if(type=="selectmore"){
	 	 //获取编码
	 	 var slmIndex = Number($("#"+propertyId+"_slmItemIndex").val())+1;//获取选项数量 用于编号
	 	 $("#"+propertyId+"_slmItemIndex").val(slmIndex); 
		 
	 	//拖放显示:增加选项
	 	 htmlStr = '<option id="'+id+'_slmItem'+slmIndex+'_opt">选项</option>';
	 	 $(htmlStr).appendTo($("#"+id+" select"));
	 	//属性栏:增加选项
	 	 htmlStr = "";
	 	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem"+slmIndex+"_div\">";
	  	 htmlStr += "<label>";
	  	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem"+slmIndex+"\" value=\"选项\">";
	  	 htmlStr += "<i></i><font>";
	  	//注释备忘
	  	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem"+slmIndex+"\" value=\"选项\" id=\""+propertyId+"_slmItem"+slmIndex+"\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_"+slmIndex+"\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_"+slmIndex+"\')\">";
	  	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\"选项\" id=\""+propertyId+"_slmItem"+slmIndex+"_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_:"+propertyId+"_slmItem"+slmIndex+"\')\">";
	  	 htmlStr += "</font>";
	  	 htmlStr += "</label>";
	  	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem"+slmIndex+"_div\',\'"+slmIndex+"\',\'selectmore\')\" title=\"移除\">";
	  	 htmlStr += "</div>";
	  	 $(htmlStr).appendTo($("#"+propertyId+"_slmDiv"));
	  }
 }
 
//增加选项
function addItem(id,type){
	var formLayout = $("#formLayout").val();//页面布局
	addItemOptionHtml(id,type,formLayout);//添加选项的html代码
	//执行一下
	$(".i-checks:not(:has(ins))").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
	//绑定单选框/复选框事件
	bindClickForBox(type,id);
}

//移除选项
function removeItem(id,propertyId,index,type){
	if(type=="radio"){
		$("#"+propertyId).remove();
		$("#"+id+"_rdoItem"+index+"_lab").prev("br").remove();
		$("#"+id+"_rdoItem"+index+"_lab").remove();
	}else if(type=="checkbox"){
		$("#"+propertyId).remove();
		$("#"+id+"_ckbItem"+index+"_lab").prev("br").remove();
		$("#"+id+"_ckbItem"+index+"_lab").remove();
	}else if(type=="select"){
		$("#"+propertyId).remove();
		$("#"+id+"_slcItem"+index+"_opt").remove();
	}else if(type=="selectmore"){
		$("#"+propertyId).remove();
		$("#"+id+"_slmItem"+index+"_opt").remove();
	}
}

//批量编辑弹出框
function batchEditItems(id,divId,type){
	//获取已有选项
	var str = "";
	$("#"+divId+" input[type='text']").each(function(){
		str += "\n";
		str += $(this).val();
	});//'每行对应一个选项'
  	layer.prompt(
	{
		title: '批量编辑',
		value: str,
		shade: [0.5, '#393D49'],//遮盖层
	  	formType: 2
	}, 
	function(value,index,obj){
		if(value != ""){
			var items = value.split("\n");//replace(/[\r\n]/g,""));
			batchEditChangeItems(id,divId,items,type);
		}
		layer.close(index);
  	}
  );
}
 
//执行修改操作
 function batchEditChangeItems(id,divId,items,type){
 	var propertyId = id + "_prop";
 	var checksDivId = "";
 	//1、清空原来的选项
 	$("#"+divId).html("");
 	if(type=="radio"){
 		checksDivId = id+" div.radio.i-checks";
 		$("#"+checksDivId).html("");
 	 }else if(type=="checkbox"){
 		 checksDivId = id+" div.checkbox.i-checks";
 		 $("#"+checksDivId).html("");
 	 }else if(type=="select" || type=="selectmore"){
 		 checksDivId = id+" select";
 		 $("#"+checksDivId).html("");
 	 }
 	//2、更新选项值
 	//存放编码
 	if(type=="radio"){
 		$("#"+propertyId+"_rdoItemIndex").val(items.length);
 	}else if(type=="checkbox"){
 		$("#"+propertyId+"_ckbItemIndex").val(items.length);
 	}else if(type=="select"){
 		$("#"+propertyId+"_slcItemIndex").val(items.length);
 	}else if(type=="selectmore"){
 		$("#"+propertyId+"_slmItemIndex").val(items.length);
 	}
 	
 	for(var i = 0; i < items.length; i++){
 		 if(items[i] != ""){
 			 var htmlStr = "";
 	    	 if(type=="radio"){
 		    	//拖放显示:增加选项
 		    	htmlStr += "<label id=\""+id+"_rdoItem"+(i+1)+"_lab\">";
 		    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_dropped_rdo\" value=\""+items[i]+"\">";
 		    	htmlStr += "<i></i> <font>"+items[i]+"</font>";
 		    	if(items[i] == '其他'){
 		    		htmlStr += '&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;">';
 		    	}
 		    	htmlStr += "</label>";
 		    	$(htmlStr).appendTo($("#"+checksDivId));
 		    	//属性栏:增加选项
 		    	htmlStr = "";
 		    	htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+(i+1)+"_div\">";
 	         	htmlStr += "<label>";
 	         	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdoItem\" id=\""+propertyId+"_rdoItem"+(i+1)+"\" value=\""+items[i]+"\">";
 	         	htmlStr += "<i></i><font>";
 	         	//注释备忘
 	         	//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem"+rdoIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_rdoItem"+rdoIndex+"\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+rdoIndex+"\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_"+rdoIndex+"\')\">";
 	         	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\""+items[i]+"\" id=\""+propertyId+"_rdoItem"+(i+1)+"_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_:"+propertyId+"_rdoItem"+(i+1)+"\')\"";
 	         	if(items[i] == '其他'){
 	         		htmlStr += " readOnly ";
 	         	}
 	         	htmlStr += ">";
 	         	
 	         	htmlStr += "</font>";
 	         	htmlStr += "</label>";
 	         	if(i > 0){
 	         		htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+(i+1)+"_div\',\'"+(i+1)+"\',\'radio\')\" title=\"移除\">";
 	         	}
 	         	htmlStr += "</div>";
 		    	$(htmlStr).appendTo($("#"+divId));
 	    	 }else if(type=="checkbox"){
 		    	//拖放显示:增加选项
 		    	 htmlStr = "<label id=\""+id+"_ckbItem"+(i+1)+"_lab\">";
 		    	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_dropped_ckb"+(i+1)+"\" name=\""+propertyId+"_dropped_ckb\" value=\""+items[i]+"\">";
 		    	 htmlStr += "<i></i> <font>"+items[i]+"</font>";
 		    	 if(items[i] == '其他'){
 			     	htmlStr += '&nbsp;<input type="text" style="box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;">';
 			     }
 		    	 htmlStr += "</label>";
 		    	 $(htmlStr).appendTo($("#"+checksDivId));
 		    	//属性栏:增加选项
 		    	 htmlStr = "";
 		    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+(i+1)+"_div\">";
 	         	 htmlStr += "<label>";
 	         	 htmlStr += "<input type=\"checkbox\" id=\""+propertyId+"_ckbItem"+(i+1)+"\" name=\""+propertyId+"_ckbItem\" value=\""+items[i]+"\">";
 	         	 htmlStr += "<i></i><font>";
 	         	//注释备忘
 	         	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem"+ckbIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_ckbItem"+ckbIndex+"\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+ckbIndex+"\')\" onclick=\"updateValue(\'isCheckCkbInput\',\'"+id+"_"+ckbIndex+"\')\">";
 	         	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\""+items[i]+"\" id=\""+propertyId+"_ckbItem"+(i+1)+"_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_:"+propertyId+"_ckbItem"+(i+1)+"\')\"";
 	         	 if(items[i] == '其他'){
 	         		htmlStr += " readOnly ";
 	         	 }
 	         	 htmlStr += ">";
 	         	
 	         	 htmlStr += "</font>";
 	         	 htmlStr += "</label>";
 	         	 if(i > 0){
 	         	 	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+(i+1)+"_div\',\'"+(i+1)+"\',\'checkbox\')\" title=\"移除\">";
 	         	 }
 	         	 htmlStr += "</div>";
 	         	$(htmlStr).appendTo($("#"+divId));
 	    	 }else if(type=="select"){
 		    	//拖放显示:增加选项
 		    	 htmlStr = "<option id=\""+id+"_slcItem"+(i+1)+"_opt\">"+items[i]+"</option>";
 		    	 $(htmlStr).appendTo($("#"+checksDivId));
 		    	//属性栏:增加选项
 		    	 htmlStr = "";
 		    	 htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem"+(i+1)+"_div\">";
 	         	 htmlStr += "<label>";
 	         	 htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem"+(i+1)+"\" value=\""+items[i]+"\">";
 	         	 htmlStr += "<i></i><font>";
 	         	//注释备忘
 	         	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem"+slcIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_slcItem"+slcIndex+"\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_"+slcIndex+"\')\" onclick=\"updateValue(\'isCheckSlc\',\'"+id+"_"+slcIndex+"\')\">";
 	         	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\""+items[i]+"\" id=\""+propertyId+"_slcItem"+(i+1)+"_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_:"+propertyId+"_slcItem"+(i+1)+"\')\">";
 	         	 htmlStr += "</font>";
 	         	 htmlStr += "</label>";
 	         	 if(i > 0){
 	         	 	htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem"+(i+1)+"_div\',\'"+(i+1)+"\',\'select\')\" title=\"移除\">";
 	         	 }
 	         	 htmlStr += "</div>";
 	         	 $(htmlStr).appendTo($("#"+divId));
 	    	 }else if(type=="selectmore"){
 	    		//拖放显示:增加选项
 	    		 htmlStr = "<option id=\""+id+"_slmItem"+(i+1)+"_opt\">"+items[i]+"</option>";
 		    	 $(htmlStr).appendTo($("#"+checksDivId));
 		    	//属性栏:增加选项
 		    	 htmlStr = "";
 		    	 htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem"+(i+1)+"_div\">";
 	         	 htmlStr += "<label>";
 	         	 htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem"+(i+1)+"\" value=\""+items[i]+"\">";
 	         	 htmlStr += "<i></i><font>";
 	         	//注释备忘
 	         	 //htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem"+slmIndex+"\" value=\""+items[i]+"\" id=\""+propertyId+"_slmItem"+slmIndex+"\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_"+slmIndex+"\')\" onclick=\"updateValue(\'isCheckSlmInput\',\'"+id+"_"+slmIndex+"\')\">";
 	         	 htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\""+items[i]+"\" id=\""+propertyId+"_slmItem"+(i+1)+"_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_:"+propertyId+"_slmItem"+(i+1)+"\')\">";
 	         	 htmlStr += "</font>";
 	         	 htmlStr += "</label>";
 	         	 if(i > 0){
 		         	 htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem"+(i+1)+"_div\',\'"+(i+1)+"\',\'selectmore\')\" title=\"移除\">";
 	         	 }
 	         	 htmlStr += "</div>";
 	         	 $(htmlStr).appendTo($("#"+divId));
 	    	 }
 		 }
 	}
 	
 	//执行一下
 	 $("#"+checksDivId).iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
 	 $("#"+divId+" .i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});
 	//根据布局 增加回车换行符
 	 if($("#formLayout").val() == "z"){
		$("div.dropSpan #"+checksDivId+" label").after("<br/>");//排除已经是纵排布局的标签
		//删除最后一个选项后的br标签
		$("div.dropSpan #"+checksDivId+" br:last").remove();//删除最后一个多余的br标签
 	}
 	 
 	//绑定单选框/复选框事件
 	bindClickForBox(type,id);
 }
 
 //绑定事件 单选 复选 下拉 下拉复选
 function bindClickForBox(type,id){
	 var propertyId = id + "_prop";
	 if(type == 'radio' || type == 'rdoOther'){
 		$("#"+propertyId+"_rdoDiv label").each(function(){
	  		var rdoId = $(this).find("input[type='radio']").attr("id");
	  		//对外围label增加事件
 			$(this).bind("click",function(){
     			updateValue('isCheckRdo',id+"_:"+rdoId);
     	    });
 			//对ins(勾选框)增加事件
 			$(this).find("ins").bind("click",function(){
 				updateValue('isCheckRdo',id+"_:"+rdoId);
 	    	});
 		});
 	}else if(type == 'checkbox' || type == 'ckbOther'){
 		$("#"+propertyId+"_ckbDiv label").each(function(){
	  		var ckbId = $(this).find("input[type='checkbox']").attr("id");
	  		//对外围label增加事件
 			$(this).bind("click",function(){
     			updateValue('isCheckCkb',id+"_:"+ckbId);
     	    });
 			//对ins(勾选框)增加事件
 			$(this).find("ins").bind("click",function(){
 				updateValue('isCheckCkb',id+"_:"+ckbId);
 	    	});
 		});
 	}else if(type == 'select'){
 		$("#"+propertyId+"_slcDiv label").each(function(){
	  		var slcId = $(this).find("input[type='radio']").attr("id");
	  		//对外围label增加事件
 			$(this).bind("click",function(){
     			updateValue('isCheckSlc',id+"_:"+slcId);
     	    });
 			//对ins(勾选框)增加事件
 			$(this).find("ins").bind("click",function(){
 				updateValue('isCheckSlc',id+"_:"+slcId);
 	    	});
 		});
 	}else if(type == 'selectmore'){
 		$("#"+propertyId+"_slmDiv label").each(function(){
	  		var slmId = $(this).find("input[type='checkbox']").attr("id");
	  		//对外围label增加事件
 			$(this).bind("click",function(){
     			updateValue('isCheckSlm',id+"_:"+slmId);
     	    });
 			//对ins(勾选框)增加事件
 			$(this).find("ins").bind("click",function(){
 				updateValue('isCheckSlm',id+"_:"+slmId);
 	    	});
 		});
 	}
 }
 
 /**
 *切换布局模式 纵排、横排
 */
 function changeLayout(v){
	 if(v == 'h'){//横排
		$("div.dropSpan .col-sm-12.common").attr("class","col-sm-9 common");
		$("div.dropSpan .col-sm-3.commlab").attr("class","col-sm-3 control-label commlab");
		$("div.dropSpan .i-checks br").remove(); 
	 }else if(v == 'z'){
		$("div.dropSpan .col-sm-3.commlab").attr("class","col-sm-3 survey_subject commlab");
		$("div.dropSpan .col-sm-9.common").attr("class","col-sm-12 common");
		$("div.dropSpan .i-checks label").after("<br/>");
		//删除最后一个选项后的br标签
		$("div.dropSpan .i-checks").each(function (){
			$(this).find("br:last").remove();//删除最后一个多余的br标签
		});
	 }else{
		 alert("切换模式异常:"+v);
	 }
 }
 
 /* 移除控件 */
 function removeLink(id,type){
 	confirm("温馨提示：确定执行移除操作吗？",function(){
 		//先移除相对应的属性DIV
 		$("#"+id+"_prop").remove();
 		//如果为富文本，则先删除此控件
 		if($("#"+id).attr("xtype") == 'richtext'){
 			delRichEditor(id+"_editor");
 		}
 		//再移除元素
 		$("#"+id).remove();
 		
 		//移除创建标签信息
 		var v = $("#tagNames").val();
 		var tag = ";" + id + "_" + type;
 		v = v.replace(tag,"");
 		$("#tagNames").val(v);
 		return false;
 	},function(){//取消
 		return false;
 	});
 }
 
//选中div 背景色加亮
 function changeBgColor(obj){
 	$(".elementSpanMove.clickBg").removeClass("clickBg");//清空所有拖拽过来的元素背景色
 	$(obj).removeClass("overBg");//去除悬浮样式
 	$(obj).addClass("clickBg");//给选中的元素增加背景色加深
 }
 
 //选中div显示所属属性div，并隐藏其他
 function showHidePropDiv(obj){
 	$("#propDiv .propPane").each(function(){//隐藏所有的存放属性的div
		$(this).hide();
	});
 	$(obj).show();//显示选中的元素 所关联的属性div
 }
//切换控件面板区域和表单区域
function changePane(v){
	$("#"+v).trigger("click");
}

function getEditInputShowHtml(type,item){
	var inputTitle = "";//标题
	if(item.inputTitle != undefined){
		inputTitle = item.inputTitle;
	}
	var dataFormat = "";//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
	if(item.dataFormat != undefined){
		dataFormat = item.dataFormat;
	}
	
	var defaultValue = "";//默认值
	if(item.defaultValue != undefined){
		defaultValue = item.defaultValue;
	}
	
	var precision = "";//小数点后几位 数值文本框特有属性
	if(item.precision != undefined){
		precision = item.precision;
	}
	
	var options = "";//选项 手动输入
	if(item.options != undefined){
		options = item.options;
	}
	
	var promptMsg = "";//描述
	if(item.promptMsg != undefined){
		promptMsg = item.promptMsg;
	}
	
	var htmlStr = "";
	//根据拖动的标签类型，来显示不同的控件
	htmlStr += "<div class=\"form-group clearfix\">";
	if(type == "text"){//单行文本
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"text\" name=\"\" class=\"form-control\" value=\""+defaultValue+"\" placeholder=\"请输入";
		if(dataFormat=='email'){
    		htmlStr += "邮箱";
    	}
    	if(dataFormat=='phone'){
    		htmlStr += "手机号码";
    	}
    	if(dataFormat=='tel'){
    		htmlStr += "固定电话";
    	}
    	if(dataFormat=='code'){
    		htmlStr += "邮政编码";
    	}
		htmlStr += "格式文本\">";
		
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "textarea"){//多行文本
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<textarea class=\"form-control\" name=\"\" placeholder=\"请输入文本\">"+defaultValue+"</textarea>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "number"){
		if(defaultValue == ""){
			defaultValue = "0";
		}
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"text\" class=\"form-control\" name=\"number\" placeholder=\"请输入数值\" value=\"";
		var n = Number(defaultValue);
		if(precision == ""){
			precision = "0";
		}
		n =n.toFixed(Number(precision));
		htmlStr += n;
		htmlStr += "\">";
		
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "password"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"请输入密码\" value=\""+defaultValue+"\">";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "richtext"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<script id=\"item"+divIndex+"_editor\" type=\"text\/plain\" class=\"editorsSzc\"></script>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "radio"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"radio i-checks\">";
		//选项
		var optionArray = options.split("_:");
    	for(var t = 0; t < optionArray.length; t++){
    		if(optionArray[t] != ""){//过滤空字符数据
    			htmlStr += "<label id=\"item"+divIndex+"_rdoItem"+(t+1)+"_lab\"><input type=\"radio\" value=\""+optionArray[t]+"\" name=\"rdobox_item"+divIndex+"\"";
    			if(defaultValue.indexOf(optionArray[t]) > -1){
    				htmlStr += " checked ";
    			}
    			htmlStr += "> <i></i> <font>"+optionArray[t]+"</font>";
    			if(optionArray[t] == "其他"){
    				htmlStr += "&nbsp;<input type=\"text\" style=\"box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;\">";
    			}
    			htmlStr += "</label>";
    		}
    	}
		htmlStr += "</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "checkbox"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"checkbox i-checks\">";
		//选项
		var optionArray = options.split("_:");
    	for(var t = 0; t < optionArray.length; t++){
    		if(optionArray[t] != ""){//过滤空字符数据
    			htmlStr += "<label id=\"item"+divIndex+"ckbItem"+(t+1)+"_lab\"><input type=\"checkbox\" value=\""+optionArray[t]+"\" name=\"ckbox_item"+divIndex+"\"";
    			if(defaultValue.indexOf(optionArray[t]) > -1){
    				htmlStr += " checked ";
    			}
    			htmlStr += "> <i></i> <font>"+optionArray[t]+"</font></label>";
    			if(optionArray[t] == "其他"){
    				htmlStr += "&nbsp;<input type=\"text\" style=\"box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0) inset; border-radius: 0px;border:0px;border-bottom:solid 1px;background-color:transparent;width:120px;\">";
    			}
    			htmlStr += "</label>";
    		}
    	}
		htmlStr += "</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "select"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<select class=\"form-control\" name=\"slt\">";
		//选项
		var optionArray = options.split("_:");
    	for(var t = 0; t < optionArray.length; t++){
    		if(optionArray[t] != ""){//过滤空字符数据
    			htmlStr += "<option id=\"item"+divIndex+"slcItem"+(t+1)+"_opt\"";
    			if(defaultValue.indexOf(optionArray[t]) > -1){
    				htmlStr += " selected ";
    			}
    			htmlStr += ">"+optionArray[t]+"</option>";
    		}
    	}
		htmlStr += "</select>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "selectmore"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<select class=\"form-control\" multiple=\"\">";
		//选项
		var optionArray = options.split("_:");
    	for(var t = 0; t < optionArray.length; t++){
    		if(optionArray[t] != ""){//过滤空字符数据
    			htmlStr += "<option id=\"item"+divIndex+"slmItem"+(t+1)+"_opt\"";
    			if(defaultValue.indexOf(optionArray[t]) > -1){
    				htmlStr += " selected ";
    			}
    			htmlStr += ">"+optionArray[t]+"</option>";
    		}
    	}
		htmlStr += "</select>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "date"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input class=\"form-control layer-date laydate-icon\" placeholder=\"单击选择时间\" onclick=\"laydate({istime: true, format: \'";
		if(dataFormat=='ymdhms'){
    		htmlStr += "YYYY-MM-DD hh:mm:ss";
    	}else if(dataFormat=='ymdhm'){
    		htmlStr += "YYYY-MM-DD hh:mm";
    	}else if(dataFormat=='ymd'){
    		htmlStr += "YYYY-MM-DD";
    	}else if(dataFormat=='ym'){
    		htmlStr += "YYYY-MM";
    	}else{
    		htmlStr += "YYYY-MM-DD hh:mm:ss";
    	}
    	htmlStr += "\'})\">";
		
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "hidden"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">隐藏域</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"hidden\" name=\"hidden\" />";
	}else if(type == "file"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">"+inputTitle+"</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<input type=\"file\" name=\"\">";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "subform"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">子表单</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">休息.休息.休息一会儿</div>";
	}else if(type == "user"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">人员单选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseOne\">点击设置人员</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "usergroup"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">人员多选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">点击设置人员</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "dept"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">部门单选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseOne\">点击设置部门</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "deptgroup"){
		htmlStr += "<label class=\"col-sm-3 control-label commlab\">部门多选</label>";
		htmlStr += "<div class=\"col-sm-9 common\">";
		htmlStr += "<div class=\"chooseMore\">点击设置部门</div>";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
	}else if(type == "line"){
		//htmlStr += "<label class=\"col-sm-3 control-label line\">分割线</label>";
		htmlStr += "<div class=\"col-sm-12 line\">";
		htmlStr += "<span class=\"help-block m-b-none\">"+promptMsg+"</span>";
		htmlStr += "<div class=\"";
		if(dataFormat=='dashed'){
			htmlStr += "hr-line-dashed";
		}else{
			htmlStr += "hr-line-solid";
		}
		htmlStr += "\" id=\"line\"></div>";
	}
	htmlStr += "</div>";
	htmlStr += "</div>";
	//增加移除按钮
	htmlStr += "<p class=\"tools col-sm-12 col-sm-offset-3\"><a class=\"remove-link\" onclick=\"removeLink('item"+divIndex+"','"+type+"')\">移除</a></p>";
	return htmlStr;
 }

/* 获取控件属性面板信息 编辑时使用*/
function getEditPropHtml(id,type,item){
	var inputTitle = "";//标题
	if(item.inputTitle != undefined){
		inputTitle = item.inputTitle;
	}
	var dataFormat = "";//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
	if(item.dataFormat != undefined){
		dataFormat = item.dataFormat;
	}
	
	var defaultValue = "";//默认值
	if(item.defaultValue != undefined){
		defaultValue = item.defaultValue;
	}
	
	var checkType = "";//校验 0:否; 1:是;    非必填、必填
	if(item.checkType != undefined){
		checkType = item.checkType;
	}
	
	var funcPermission = "";//是否在列表中可见
	if(item.funcPermission != undefined){
		funcPermission = item.funcPermission;
	}
	
	var funcPermission = "";//权限 查看只读(read)、编辑(edit)、可见(show)、隐藏(hidden)
	if(item.funcPermission != undefined){
		funcPermission = item.funcPermission;
	}
	
	var sortGrade = "";//序号
	if(item.sortGrade != undefined){
		sortGrade = item.sortGrade;
	}
	
	var minValue = "";//最小值 数值文本框特有属性
	if(item.minValue != undefined){
		minValue = item.minValue;
	}
	
	var maxValue = "";//最大值 数值文本框特有属性
	if(item.maxValue != undefined){
		maxValue = item.maxValue;
	}
	
	var precision = "";//小数点后几位 数值文本框特有属性
	if(item.precision != undefined){
		precision = item.precision;
	}
	
	var options = "";//选项 手动输入
	if(item.options != undefined){
		options = item.options;
	}
	
	var promptMsg = "";//描述
	if(item.promptMsg != undefined){
		promptMsg = item.promptMsg;
	}
	
	var propertyId = id + "_prop";//创建属性div 的id名
	var htmlStr = "<div class=\"propPane\" id=\""+propertyId+"\" style=\"display:none;\">";
	//根据type封装不同的属性div
	if(type == 'text'){//文本框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">单行文本</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
   	htmlStr += "<div class=\"splitLine\"></div>";
   	
   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
   	htmlStr += "</div>";
   	htmlStr += "<div class=\"splitLine\"></div>";
		
   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">格式</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('txtFormat',\'"+id+"\')\">";
	    	htmlStr += "<option value=\"\">无</option>";
	    	htmlStr += "<option value=\"email\"";
	    	if(dataFormat=='email'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">邮箱</option>";
	    	
	    	htmlStr += "<option value=\"phone\"";
	    	if(dataFormat=='phone'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">手机号码</option>";
	    	
	    	htmlStr += "<option value=\"tel\"";
	    	if(dataFormat=='tel'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">固定电话</option>";
	    	
	    	htmlStr += "<option value=\"code\"";
	    	if(dataFormat=='code'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">邮政编码</option>";
	    	
	    	htmlStr += "</select>";
   	htmlStr += "</div>";
   	htmlStr += "<div class=\"splitLine\"></div>";
   	
   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
      	htmlStr += "</div>";
	}else if(type == 'password'){//密码输入框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">密码文本</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
      	htmlStr += "</div>";
	}else if(type == 'number'){//数值
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
	    	htmlStr += "<div class=\"titleTip\">数字</div>";
	    	htmlStr += "</div>";
	    	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
	    	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">最小值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_min\" value=\""+minValue+"\">";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">最大值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_max\" value=\""+maxValue+"\">"
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">小数点后几位</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_pre\" id=\""+propertyId+"_pre\" onblur=\"updateValue(\'precision\',\'"+id+"\')\" value=\""+precision+"\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'precision\',\'"+id+"\')\" value=\""+defaultValue+"\">";
      	htmlStr += "</div>";
	}else if(type == 'textarea'){//多行文本
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">多行文本</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'areadfValue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
   	htmlStr += "</div>";
	}else if(type == 'richtext'){//富文本
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">富文本</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'richvalue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
   	htmlStr += "</div>";
	}else if(type == 'radio'){//单选按钮组
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">单选按钮组</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			var optionArray = options.split("_:");
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_rdoItemIndex\" value=\""+optionArray.length+"\">";//标识选项个数 用于编号
	    	htmlStr += "<div id=\""+propertyId+"_rdoDiv\">";
	    	
	    	for(var t = 0; t < optionArray.length; t++){
	    		if(optionArray[t] != ""){//过滤空字符数据
	    			htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_rdoItem"+(t+1)+"_div\">";
	    			htmlStr += "<label>";
	    			htmlStr += "<input type=\"radio\" name=\""+propertyId+"_rdoItem\" id=\""+propertyId+"_rdoItem"+(t+1)+"\" value=\""+optionArray[t]+"\"";
	    			if(defaultValue.indexOf(optionArray[t]) > -1){
	    				htmlStr += " checked ";
	    			}
	    			htmlStr += ">";
	    			
	    			htmlStr += "<i></i><font>";
	    			//注释备忘 onclick事件多余 单击会自动触发radiobox的点击事件
	    			//htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem1\" value=\"选项1\" id=\""+propertyId+"_rdoItem1\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_1\')\" onclick=\"updateValue(\'isCheckRdo\',\'"+id+"_1\')\">";
	    			htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_rdoItem_input\" value=\""+optionArray[t]+"\" id=\""+propertyId+"_rdoItem"+(t+1)+"_input\" onblur=\"updateValue(\'rdoTitle\',\'"+id+"_"+(t+1)+"\')\">";
	    			htmlStr += "</font>";
	    			htmlStr += "</label>";
	    			if(t > 0){
	    				htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_rdoItem"+(t+1)+"_div\',\'"+(t+1)+"\',\'radio\')\" title=\"移除\">";
	    			}
	    			htmlStr += "</div>";
	    		}
	    	}
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'radio\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'rdoOther\')\">添加其他选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_rdoDiv\',\'radio\')\">批量编辑</div>";
	    	htmlStr += "</div>";
   	htmlStr += "</div>";
	}else if(type == 'checkbox'){//复选框
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">复选按钮组</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
	  	//-----以下为选项
			var optionArray = options.split("_:");
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_ckbItemIndex\" value=\""+optionArray.length+"\">";//标识选项个数 用于编号
	    	htmlStr += "<div id=\""+propertyId+"_ckbDiv\">";
	    	//以下遍历增加选项
	    	for(var t = 0; t < optionArray.length; t++){
	    		if(optionArray[t] != ""){//过滤空字符数据
	    			htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_ckbItem"+(t+1)+"_div\">";
			    	htmlStr += "<label>";
			    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_ckbItem\" id=\""+propertyId+"_ckbItem"+(t+1)+"\" value=\""+optionArray[t]+"\"";
	    			if(defaultValue.indexOf(optionArray[t]) > -1){
	    				htmlStr += " checked ";
	    			}
	    			htmlStr += ">";
	    			
			    	htmlStr += "<i></i><font>";
			    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_ckbItem_input\" value=\""+optionArray[t]+"\" id=\""+propertyId+"_ckbItem"+(t+1)+"_input\" onblur=\"updateValue(\'ckbTitle\',\'"+id+"_"+(t+1)+"\')\">";
			    	htmlStr += "</font>";
			    	htmlStr += "</label>";
			    	if(t > 0){
			    		htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_ckbItem"+(t+1)+"_div\',\'"+(t+1)+"\',\'checkbox\')\" title=\"移除\">";
			    	}
			    	htmlStr += "</div>";
	    		}
	    	}
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'checkbox\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item add_other\" onclick=\"addItem(\'"+id+"\',\'ckbOther\')\">添加其他选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_ckbDiv\',\'checkbox\')\">批量编辑</div>";
	    	htmlStr += "</div>";
   	htmlStr += "</div>";
	}else if(type == 'select'){//下拉列表
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">下拉列表</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
				htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			var optionArray = options.split("_:");
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_slcItemIndex\" value=\""+optionArray.length+"\">";//标识选项个数 用于编号
	   		htmlStr += "<div id=\""+propertyId+"_slcDiv\">";
	   		//循环增加选项
	    	for(var t = 0; t < optionArray.length; t++){
	    		if(optionArray[t] != ""){//过滤空字符数据
	    			htmlStr += "<div class=\"radio i-checks\" id=\""+propertyId+"_slcItem"+(t+1)+"_div\">";
			    	htmlStr += "<label>";
			    	htmlStr += "<input type=\"radio\" name=\""+propertyId+"_slcItem\" id=\""+propertyId+"_slcItem"+(t+1)+"\" value=\""+optionArray[t]+"\"";
			    	if(defaultValue.indexOf(optionArray[t]) > -1){
	    				htmlStr += " checked ";
	    			}
			    	htmlStr += ">";
			    	
			    	htmlStr += "<i></i><font>";
			    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slcItem_input\" value=\""+optionArray[t]+"\" id=\""+propertyId+"_slcItem"+(t+1)+"_input\" onblur=\"updateValue(\'slcTitle\',\'"+id+"_"+(t+1)+"\')\">";
			    	htmlStr += "</font>";
			    	htmlStr += "</label>";
			    	if(t > 0){
			    		htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slcItem"+(t+1)+"_div\',\'"+(t+1)+"\',\'select\')\" title=\"移除\">";
			    	}
			    	htmlStr += "</div>";
	    		}
	    	}
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'select\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slcDiv\',\'select\')\">批量编辑</div>";
	    	htmlStr += "</div>";
   	htmlStr += "</div>";
	}else if(type == 'selectmore'){//下拉复选列表
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">下拉复选列表</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\"></textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
				htmlStr += "<span class=\"survey_contRightTitle\">选项</span>";
			htmlStr += "</div>";
			
			var optionArray = options.split("_:");
			htmlStr += "<input type=\"hidden\" id=\""+propertyId+"_slmItemIndex\" value=\""+optionArray.length+"\">";//标识选项个数 用于编号
	   		htmlStr += "<div id=\""+propertyId+"_slmDiv\">";
	   		//循环增加选项
	    	for(var t = 0; t < optionArray.length; t++){
	    		if(optionArray[t] != ""){//过滤空字符数据
			    	htmlStr += "<div class=\"checkbox i-checks\" id=\""+propertyId+"_slmItem"+(t+1)+"_div\">";
			    	htmlStr += "<label>";
			    	htmlStr += "<input type=\"checkbox\" name=\""+propertyId+"_slmItem\" id=\""+propertyId+"_slmItem"+(t+1)+"\" value=\""+optionArray[t]+"\"";
			    	if(defaultValue.indexOf(optionArray[t]) > -1){
	    				htmlStr += " checked ";
	    			}
			    	htmlStr += ">";
			    	
			    	htmlStr += "<i></i><font>";
			    	htmlStr += "&nbsp;<input type=\"text\" class=\"optionInputWidth\" name=\""+propertyId+"_slmItem_input\" value=\""+optionArray[t]+"\" id=\""+propertyId+"_slmItem"+(t+1)+"_input\" onblur=\"updateValue(\'slmTitle\',\'"+id+"_"+(t+1)+"\')\">";
			    	htmlStr += "</font>";
			    	htmlStr += "</label>";
			    	if(t > 0){
			    		htmlStr += "&nbsp;<img src=\""+ctx+"/static/image/del.png\" width=\"15\" height=\"15\" style=\"cursor:pointer;\" onclick=\"removeItem(\'"+id+"\',\'"+propertyId+"_slmItem"+(t+1)+"_div\',\'"+(t+1)+"\',\'selectmore\')\" title=\"移除\">";
			    	}
			    	htmlStr += "</div>";
	    		}
	    	}
	    	htmlStr += "</div>";
	    	htmlStr += "<div class=\"add_btn_group\">";
		    	htmlStr += "<div class=\"add_item\" onclick=\"addItem(\'"+id+"\',\'selectmore\')\">添加选项</div>";
		    	htmlStr += "<div class=\"add_item multi-edit\" onclick=\"batchEditItems(\'"+id+"\',\'"+id+"_prop_slmDiv\',\'selectmore\')\">批量编辑</div>";
	    	htmlStr += "</div>";
   	htmlStr += "</div>";
	}else if(type == 'date'){//日期时间
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">日期时间</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
   	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\" onchange=\"updateValue('dateFormat',\'"+id+"\')\">";
		    	htmlStr += "<option value=\"ymdhms\"";
		    	if(dataFormat=='ymdhms'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">年-月-日 时:分:秒</option>";
		    	
		    	htmlStr += "<option value=\"ymdhm\"";
		    	if(dataFormat=='ymdhm'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">年-月-日 时:分</option>";
		    	
		    	htmlStr += "<option value=\"ymd\"";
		    	if(dataFormat=='ymd'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">年-月-日</option>";
		    	
		    	htmlStr += "<option value=\"ym\"";
		    	if(dataFormat=='ym'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">年-月</option>";
		    	
		    	htmlStr += "<option value=\"hms\"";
		    	if(dataFormat=='hms'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">时:分:秒</option>";
		    	
		    	htmlStr += "<option value=\"hm\"";
		    	if(dataFormat=='hm'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">时:分</option>";
		    	
	    	htmlStr += "</select>";
   	htmlStr += "</div>";
   	htmlStr += "<div class=\"splitLine\"></div>";
   	
   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
			htmlStr += "</div>";
			htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
   	htmlStr += "</div>";
	}else if(type == 'hidden'){//隐藏域
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">默认值</span>";
		   	htmlStr += "<div class=\"titleTip\">隐藏域</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" type=\"text\" name=\""+propertyId+"_default\" id=\""+propertyId+"_default\" onblur=\"updateValue(\'dfValue\',\'"+id+"\')\" value=\""+defaultValue+"\">";
   	htmlStr += "</div>";
	}else if(type == 'file'){//文本域
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">文件上传</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	   	htmlStr += "</div>";
	   	htmlStr += "<div class=\"splitLine\"></div>";
	   	
	   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
			htmlStr += "</div>";
	    	htmlStr += "<select class=\"inputWidth\" name=\""+propertyId+"_format\" id=\""+propertyId+"_format\">";
		    	htmlStr += "<option value=\"upload\"";
		    	if(dataFormat=='upload'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">附件(包含上传按钮)</option>";
		    	
		    	htmlStr += "<option value=\"down\"";
		    	if(dataFormat=='down'){
		    		htmlStr += " selected ";
		    	}
		    	htmlStr += ">附件(只能下载)</option>";
	    	htmlStr += "</select>";
		htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	   	
	   	htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
		   	htmlStr += "</div>";
		   	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
   	htmlStr += "</div>";
	}else if(type == 'subform'){//子表单
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">子表单</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<span>待开发...</span>"
	   	htmlStr += "</div>";
	}else if(type == "user"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">人员单选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "usergroup"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">人员多选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "dept"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">部门单选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == "deptgroup"){
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">标题</span>";
		   	htmlStr += "<div class=\"titleTip\">部门多选</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<input class=\"inputWidth\" name=\""+propertyId+"_title\" id=\""+propertyId+"_title\" type=\"text\" value=\""+inputTitle+"\" onblur=\"updateValue(\'title\',\'"+id+"\')\">";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
		
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
			htmlStr += "</div>";
			htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	  	htmlStr += "</div>";
		htmlStr += "<div class=\"splitLine\"></div>";
	}else if(type == 'line'){//分隔符
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">类型</span>";
		   	htmlStr += "<div class=\"titleTip\">分隔符</div>";
		   	htmlStr += "</div>";
		   	htmlStr += "<select class=\"inputWidth\" id=\""+propertyId+"_format\" name=\""+propertyId+"_format\" onchange=\"updateValue(\'lineType\',\'"+id+"\')\">";
	    	htmlStr += "<option value=\"dashed\"";
	    	if(dataFormat=='dashed'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">虚线</option>";
	    	
	    	htmlStr += "<option value=\"solid\"";
	    	if(dataFormat=='solid'){
	    		htmlStr += " selected ";
	    	}
	    	htmlStr += ">实线</option>";
	    	
	    	htmlStr += "</select>";
	   	htmlStr += "</div>";
	   	
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
		   	htmlStr += "<span class=\"survey_contRightTitle\">描述信息</span>";
		   	htmlStr += "</div>";
		   	htmlStr += "<textarea class=\"inputWidth\" name=\""+propertyId+"_des\" id=\""+propertyId+"_des\" onblur=\"updateValue(\'des\',\'"+id+"\')\">"+promptMsg+"</textarea>";
	   	htmlStr += "</div>";
	}
	//str += '说明文字:<br/><input type="text" name="'+propertyId+'_des" id="'+propertyId+'_des" onblur="updateValue(\'des\',\''+id+'\')"><br/>';
	if(type != 'line'){
		htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">校验</span>";
	    	htmlStr += "</div>";
	    	//----------checkbox
	    	htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label>";
	    	htmlStr += "<input type=\"checkbox\" value=\"1\" name=\""+propertyId+"_check\"";
	    	if(checkType=="1"){
	    		htmlStr += " checked ";
	    	}
	    	htmlStr += ">";
	    	
	    	htmlStr += "<i></i><font>必填</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>";
	    	//-----------
		htmlStr += "</div>";
		
		htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">列表可见</span>";
	    	htmlStr += "</div>";
	    	//----------checkbox
	    	htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label>";
	    	htmlStr += "<input type=\"checkbox\" value=\"show\" name=\""+propertyId+"_show\"";
	    	if(funcPermission.indexOf("show") > -1){
	    		htmlStr += " checked ";
	    	}
	    	htmlStr += ">";
	    	htmlStr += "<i></i><font>可见</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>";
	    	//-----------
		htmlStr += "</div>";
		
		//----begin
   /* 	htmlStr += "<div class=\"checkbox i-checks\">";
   	htmlStr += "<label>";
   	htmlStr += "<input type=\"checkbox\" value=\"unique\" name=\""+propertyId+"_whrite\">";
   	htmlStr += "<i></i><font>不允许重复值</font>";
   	htmlStr += "</label>";
   	htmlStr += "</div>"; */
   	//-----------
   	//----end
   	/* htmlStr += "<div class=\"splitLine\"></div>";
		htmlStr += "<div class=\"survey_contRightBar\">";
			htmlStr += "<div class=\"survey_contRightTitleBar\">";
	    		htmlStr += "<span class=\"survey_contRightTitle\">操作权限</span>";
	    	htmlStr += "</div>";
   	//--------begin
   	/* htmlStr += "<div class=\"checkbox i-checks\">";
	    	htmlStr += "<label id=\"item1_lab3\">";
	    	htmlStr += "<input type=\"checkbox\" value=\"show\" name=\""+propertyId+"_show\" checked>";
	    	htmlStr += "<i></i><font>可见</font>";
	    	htmlStr += "</label>";
	    	htmlStr += "</div>"; 
   	*/
   	//--------
   	/* htmlStr += "<div class=\"checkbox i-checks\">";
   	htmlStr += "<label id=\"item2_lab2\">";
   	htmlStr += "<input type=\"checkbox\" value=\"edit\" name=\""+propertyId+"_edit\" checked>";
   	htmlStr += "<i></i><font>可编辑</font>";
   	htmlStr += "</label>";
   	htmlStr += "</div>"; */
   	//--------
   	/* htmlStr += "</div>"; */
   	//----end
	}
	
   htmlStr += "<div class=\"splitLine\"></div>";
   htmlStr += "<div class=\"survey_contRightBar\">";
		htmlStr += "<div class=\"survey_contRightTitleBar\">";
			htmlStr += "<span class=\"survey_contRightTitle\">排序</span>";
		htmlStr += "</div>";
  		htmlStr += "<input class=\"inputWidth\" readOnly name=\""+propertyId+"_sort\" id=\""+propertyId+"_sort\" type=\"text\" value=\""+sortGrade+"\">";
  	htmlStr += "</div>";
  	//--------
   htmlStr += "</div>";
   return htmlStr;
}