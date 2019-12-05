package com.chinatelecom.jx.zone.management.service.formInput;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chinatelecom.jx.zone.bean.SeqIdType;
import com.chinatelecom.jx.zone.management.bean.drawTable.DrawTableInfoBean;
import  com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formTemplate.FormTemplateBean;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.drawTable.DrawTableInfoMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formInput.FormInputMapper;
import com.chinatelecom.jx.zone.management.dao.mybatis.mapper.formTemplate.FormTemplateMapper;

import com.chinatelecom.jx.zone.management.util.StringUtil;
@Service
@Transactional
public class FormInputServiceImpl implements IFormInputService {

	@Autowired
	private FormInputMapper forminputMapper;
	@Autowired
	private FormTemplateMapper formTemplateMapper;
	@Autowired
	private DrawTableInfoMapper tableInfoMapper;
	
	@Override
	@Transactional(readOnly = false)
	public int insert(FormInputBean record) {
		return forminputMapper.insertSelective(record);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int saveInputItems(FormInputBean formInput,BigDecimal templateId,String tagNames,ServletRequest request,SeqIdType seq){
		int result = 1;//默认成功
		try {
			//先删除
			this.deleteByTemplateId(templateId);
			if(StringUtil.checkNotNull(tagNames)){
				//后保存
				tagNames = tagNames.substring(1);
				String[] tagArray = tagNames.split(";");
				String[] tag = null;
				String maxIndexStr = request.getParameter("maxIndex");
				int maxIndex = 1;
				if(StringUtil.checkNotNull(maxIndexStr)){
					maxIndex = Integer.valueOf(maxIndexStr);
				}
				
				//录入值
				String inputTitle = "";//标题
				String filedName = "";//字段名
				String minValue = "";//最小值
				String maxValue = "";//最大值
				String precision = "";//小数点几位
				String defaultValue = "";//默认值
				String format = "";//格式
				String options = "";//选项
				String checkedOpt = "";//选中项
				String[] checkedOpts = null;//多个选中项
				String des = "";//说明文字
				String checkType = "";//校验
				String permissionEdit = "";//权限 编辑
				String permissionShow = "";//权限 显示
				String sortGrade = "";//排序
				Timestamp currentTime = new java.sql.Timestamp(new Date().getTime());
				for(String str : tagArray){
					tag = str.split("_");
					//根据标签类型获取录入值
					inputTitle = request.getParameter(tag[0]+"_prop_title");
					filedName = request.getParameter(tag[0]+"_prop_filedName");
					format = request.getParameter(tag[0]+"_prop_format");
					defaultValue = request.getParameter(tag[0]+"_prop_default");
					minValue = request.getParameter(tag[0]+"_prop_min");
					maxValue = request.getParameter(tag[0]+"_prop_max");
					precision = request.getParameter(tag[0]+"_prop_pre");
					des = request.getParameter(tag[0]+"_prop_des");
					checkType = request.getParameter(tag[0]+"_prop_check");//是否必填
					if(!StringUtil.checkNotNull(checkType)){//为空时 非必填 0   1为必填
						checkType = "0";
					}
					permissionEdit = request.getParameter(tag[0]+"_prop_edit");
					if(!StringUtil.checkNotNull(permissionEdit)){
						permissionEdit = "read";//只读
					}
					permissionShow = request.getParameter(tag[0]+"_prop_show");
					if(!StringUtil.checkNotNull(permissionShow)){
						permissionShow = "hidden";//隐藏
					}
					sortGrade = request.getParameter(tag[0]+"_prop_sort");
					
					String itemName = "";
					String mark = "";//用于标识 单选或多选 1为单选 2为多选
					checkedOpt = "";
					checkedOpts = null;
					if("select".equals(tag[1])){
						itemName = tag[0]+"_prop_slcItem";
						checkedOpt = request.getParameter(tag[0]+"_prop_slc");
						mark = "1";
					}else if("selectmore".equals(tag[1])){
						itemName = tag[0]+"_prop_slmItem";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_slm");
						mark = "2";
					}else if("radio".equals(tag[1])){
						itemName = tag[0]+"_prop_rdoItem";
						checkedOpt = request.getParameter(tag[0]+"_prop_rdo");
						mark = "1";
					}else if("checkbox".equals(tag[1])){
						itemName = tag[0]+"_prop_ckbItem";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_ckb");
						mark = "2";
					}
					
					Map<String,String> itemMap = new HashMap<String,String>();
					options = "";//选项
					if(StringUtil.checkNotNull(itemName)){
						String v = "";
						for(int i = 1; i < maxIndex; i++){
							v = request.getParameter(itemName+i);
							if(StringUtil.checkNotNull(v)){
								options += v + "_:";
								itemMap.put(i+"", v);
							}
						}
					}
					
					if("1".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpt)){
							defaultValue = itemMap.get(checkedOpt) + "_:";
						}
					}else if("2".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpts)){
							String v = "";
							for(String opt : checkedOpts){
								v += itemMap.get(opt)+"_:";
							}
							defaultValue = v;
						}
					}
					
					formInput.setId(seq.getNextSeqIdToBigDecimal());//录入项ID
					formInput.setFormId(templateId);//模板表单ID
					formInput.setInputType(tag[1]);//录入项类型
					formInput.setInputTitle(inputTitle);//录入项标题
					formInput.setFiledName(filedName);//录入项字段名
					formInput.setDataFormat(format);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
					formInput.setDefaultValue(defaultValue);//默认值
					formInput.setCheckType(checkType);//校验 0:否; 1:是;    非必填、必填
					formInput.setFuncPermission(permissionEdit+"_:"+permissionShow);//权限   查看只读(read)、编辑(edit)、可见(view)、隐藏(hidden)
					formInput.setSortGrade(sortGrade);//排序 越小越靠前
					formInput.setMinValue(minValue);//最小值 数值文本框特有属性
					formInput.setMaxValue(maxValue);//最大值 数值文本框特有属性
					formInput.setPrecision(precision);//小数点后几位 数值文本框特有属性
					formInput.setOptions(options);//选项 手动输入，或数据源
					formInput.setFormId(templateId);//表单模板ID 所属模板（表单）ID 
					formInput.setPromptMsg(des);//提示说明性文字
					formInput.setCreateTime(currentTime);
					forminputMapper.insertSelective(formInput);
//				if("text".equals(tag[1])){
//					format = request.getParameter(tag[0]+"_prop_format");
//					defaultValue = request.getParameter(tag[0]+"_prop_default");
//				}else if("password".equals(tag[1])){
//					defaultValue = request.getParameter(tag[0]+"_prop_default");
//				}else if("number".equals(tag[1])){
//					minValue = request.getParameter(tag[0]+"_prop_min");
//					maxValue = request.getParameter(tag[0]+"_prop_max");
//					defaultValue = request.getParameter(tag[0]+"_prop_default");
//					precision = request.getParameter(tag[0]+"_prop_pre");
//				}else if("textarea".equals(tag[1])){
//					defaultValue = request.getParameter(tag[0]+"_prop_default");
//				}else if("richtext".equals(tag[1])){
//					defaultValue = request.getParameter(tag[0]+"_prop_default");
//				}else if("radio".equals(tag[1])){
//				}else if("checkbox".equals(tag[1])){
//				}else if("select".equals(tag[1])){
//				}else if("selectmore".equals(tag[1])){
//				}else if("date".equals(tag[1])){
//				}else if("hidden".equals(tag[1])){
//				}else if("file".equals(tag[1])){
//				}else if("subform".equals(tag[1])){
//				}else if("line".equals(tag[1])){
//				}
				}
			}
		} catch (Exception e) {
			result = -1;
		}
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int saveInputItemsNew(FormInputBean formInput,BigDecimal templateId,String tagNames,ServletRequest request,SeqIdType seq){
		int result = 1;//默认成功
		try {
			//模板表单信息更改
			String formLayout = request.getParameter("formLayout");//模板表单布局 h横排 z纵排
			String templateName = request.getParameter("templateName");//模板表单名称
			String templateDes = request.getParameter("templateDes");//模板表单描述
			FormTemplateBean formTemplateBean = new FormTemplateBean();
			formTemplateBean.setId(templateId);
			formTemplateBean.setFormDesc(templateDes);
			formTemplateBean.setFormName(templateName);
			formTemplateBean.setFormLayout(formLayout);
			formTemplateMapper.updateByPrimaryKeySelective(formTemplateBean);
			
			//先删除 模板对应录入项
			this.deleteByTemplateId(templateId);
			if(StringUtil.checkNotNull(tagNames)){
				//后保存
				tagNames = tagNames.substring(1);
				String[] tagArray = tagNames.split(";");
				String[] tag = null;
				String maxIndexStr = request.getParameter("maxIndex");
				int maxIndex = 1;
				if(StringUtil.checkNotNull(maxIndexStr)){
					maxIndex = Integer.valueOf(maxIndexStr);
				}
				
				//录入值
				String inputTitle = "";//标题
				String filedName = "";//字段名
				String minValue = "";//最小值
				String maxValue = "";//最大值
				String precision = "";//小数点几位
				String defaultValue = "";//默认值
				String format = "";//格式
				String options = "";//选项
				String checkedOpt = "";//选中项
				String[] checkedOpts = null;//多个选中项
				String des = "";//说明文字
				String checkType = "";//校验
				String permissionEdit = "";//权限 编辑
				String permissionShow = "";//权限 显示
				String sortGrade = "";//排序
				Timestamp currentTime = new java.sql.Timestamp(new Date().getTime());
				SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmssSSS");//精确到毫秒,用于生成字段名称,保证唯一
				int r = 0;
				for(String str : tagArray){
					r++;
					tag = str.split("_");
					//根据标签类型获取录入值
					inputTitle = request.getParameter(tag[0]+"_prop_title");
					filedName = "name"+sf.format(new Date()) + r + "" +  (int)Math.floor(Math.random()*100 + 1) + "";//100的随机数 增加唯一性保证
					format = request.getParameter(tag[0]+"_prop_format");
					defaultValue = request.getParameter(tag[0]+"_prop_default");
					minValue = request.getParameter(tag[0]+"_prop_min");
					maxValue = request.getParameter(tag[0]+"_prop_max");
					precision = request.getParameter(tag[0]+"_prop_pre");
					des = request.getParameter(tag[0]+"_prop_des");
					checkType = request.getParameter(tag[0]+"_prop_check");//是否必填
					if(!StringUtil.checkNotNull(checkType)){//为空时 非必填 0   1为必填
						checkType = "0";
					}
					permissionEdit = request.getParameter(tag[0]+"_prop_edit");
					if(!StringUtil.checkNotNull(permissionEdit)){
//						permissionEdit = "read";//只读
						permissionEdit = "edit";//此属性隐藏/暂时不用,默认为可编辑
					}
					permissionShow = request.getParameter(tag[0]+"_prop_show");
					if(!StringUtil.checkNotNull(permissionShow)){
//						permissionShow = "hidden";//隐藏
						permissionShow = "show";//此属性隐藏/暂时不用,默认为显示
					}
					sortGrade = request.getParameter(tag[0]+"_prop_sort");
					
					String itemName = "";
					String mark = "";//用于标识 单选或多选 1为单选 2为多选
					checkedOpt = "";
					checkedOpts = null;
					if("select".equals(tag[1])){
						itemName = tag[0]+"_prop_slcItem";
						checkedOpt = request.getParameter(tag[0]+"_prop_slc");
						mark = "1";
					}else if("selectmore".equals(tag[1])){
						itemName = tag[0]+"_prop_slmItem";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_slm");
						mark = "2";
					}else if("radio".equals(tag[1])){
						itemName = tag[0]+"_prop_rdoItem";
						checkedOpt = request.getParameter(tag[0]+"_prop_rdo");
						mark = "1";
					}else if("checkbox".equals(tag[1])){
						itemName = tag[0]+"_prop_ckbItem";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_ckb");
						mark = "2";
					}
					
					Map<String,String> itemMap = new HashMap<String,String>();
					options = "";//选项
					if(StringUtil.checkNotNull(itemName)){
						String v = "";
						for(int i = 1; i < maxIndex; i++){
							v = request.getParameter(itemName+i);
							if(StringUtil.checkNotNull(v)){
								options += v + "_:";
								itemMap.put(i+"", v);
							}
						}
					}
					
					if("1".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpt)){
							defaultValue = itemMap.get(checkedOpt) + "_:";
						}
					}else if("2".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpts)){
							String v = "";
							for(String opt : checkedOpts){
								v += itemMap.get(opt)+"_:";
							}
							defaultValue = v;
						}
					}
					formInput.setId(seq.getNextSeqIdToBigDecimal());//录入项ID
					formInput.setFormId(templateId);//模板表单ID
					formInput.setInputType(tag[1]);//录入项类型
					formInput.setInputTitle(inputTitle);//录入项标题
					formInput.setFiledName(filedName);//录入项字段名
					formInput.setDataFormat(format);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
					formInput.setDefaultValue(defaultValue);//默认值
					formInput.setCheckType(checkType);//校验 0:否; 1:是;    非必填、必填
					formInput.setFuncPermission(permissionEdit+"_:"+permissionShow);//权限   查看只读(read)、编辑(edit)、可见(show)、隐藏(hidden)
					formInput.setSortGrade(sortGrade);//排序 越小越靠前
					formInput.setMinValue(minValue);//最小值 数值文本框特有属性
					formInput.setMaxValue(maxValue);//最大值 数值文本框特有属性
					formInput.setPrecision(precision);//小数点后几位 数值文本框特有属性
					formInput.setOptions(options);//选项 手动输入，或数据源
					formInput.setPromptMsg(des);//提示说明性文字
					formInput.setCreateTime(currentTime);
					forminputMapper.insertSelective(formInput);
				}
			}
		} catch (Exception e) {
			result = -1;
		}
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public int saveInputForForm(FormInputBean formInput,BigDecimal templateId,String tagNames,ServletRequest request,SeqIdType seq){
		int result = 1;//默认成功
		try {
			//模板表单信息更改
			String formLayout = request.getParameter("formLayout");//模板表单布局 h横排 z纵排
			String templateName = request.getParameter("templateName");//模板表单名称
			String templateDes = request.getParameter("templateDes");//模板表单描述
			FormTemplateBean formTemplateBean = new FormTemplateBean();
			formTemplateBean.setId(templateId);
			formTemplateBean.setFormDesc(templateDes);
			formTemplateBean.setFormName(templateName);
			formTemplateBean.setFormLayout(formLayout);
			formTemplateMapper.updateByPrimaryKeySelective(formTemplateBean);
			
			//先删除 模板对应录入项
			this.deleteByTemplateId(templateId);
			if(StringUtil.checkNotNull(tagNames)){
				//后保存
				tagNames = tagNames.substring(1);
				String[] tagArray = tagNames.split(";");
				String[] tag = null;
				String maxIndexStr = request.getParameter("maxIndex");
				int maxIndex = 1;
				if(StringUtil.checkNotNull(maxIndexStr)){
					maxIndex = Integer.valueOf(maxIndexStr);
				}
				
				//录入值
				String inputTitle = "";//标题
				String filedName = "";//字段名
				String minValue = "";//最小值
				String maxValue = "";//最大值
				String precision = "";//小数点几位
				String defaultValue = "";//默认值
				String format = "";//格式
				String options = "";//选项
				String checkedOpt = "";//选中项
				String[] checkedOpts = null;//多个选中项
				String des = "";//说明文字
				String checkType = "";//校验
				String permissionEdit = "";//权限 编辑
				String permissionShow = "";//权限 显示
				String sortGrade = "";//排序
				Timestamp currentTime = new java.sql.Timestamp(new Date().getTime());
				SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmssSSS");//精确到毫秒,用于生成字段名称,保证唯一
				int r = 0;
				for(String str : tagArray){
					r++;
					tag = str.split("_");
					//根据标签类型获取录入值
					inputTitle = request.getParameter(tag[0]+"_prop_title");
					filedName = "name"+sf.format(new Date()) + r + "" +  (int)Math.floor(Math.random()*100 + 1) + "";//100的随机数 增加唯一性保证
					format = request.getParameter(tag[0]+"_prop_format");
					defaultValue = request.getParameter(tag[0]+"_prop_default");
					minValue = request.getParameter(tag[0]+"_prop_min");
					maxValue = request.getParameter(tag[0]+"_prop_max");
					precision = request.getParameter(tag[0]+"_prop_pre");
					des = request.getParameter(tag[0]+"_prop_des");
					checkType = request.getParameter(tag[0]+"_prop_check");//是否必填
					if(!StringUtil.checkNotNull(checkType)){//为空时 非必填 0   1为必填
						checkType = "0";
					}
					permissionEdit = request.getParameter(tag[0]+"_prop_edit");
					if(!StringUtil.checkNotNull(permissionEdit)){
//						permissionEdit = "read";//只读
						permissionEdit = "edit";//此属性隐藏/暂时不用,默认为可编辑
					}
					permissionShow = request.getParameter(tag[0]+"_prop_show");
					if(!StringUtil.checkNotNull(permissionShow)){
//						permissionShow = "hidden";//隐藏
						permissionShow = "show";//此属性隐藏/暂时不用,默认为显示
					}
					sortGrade = request.getParameter(tag[0]+"_prop_sort");
					
					String itemName = "";
					String mark = "";//用于标识 单选或多选 1为单选 2为多选
					checkedOpt = "";
					checkedOpts = null;
					
					if("select".equals(tag[1])){
						itemName = tag[0]+"_prop_slcItem_input";
						checkedOpt = request.getParameter(tag[0]+"_prop_slcItem");
						options = join(request.getParameterValues(itemName),"_:");//获取所有选项值
						mark = "1";
					}else if("selectmore".equals(tag[1])){
						itemName = tag[0]+"_prop_slmItem_input";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_slmItem");
						options = join(request.getParameterValues(itemName),"_:");//获取所有选项值
						mark = "2";
					}else if("radio".equals(tag[1])){
						itemName = tag[0]+"_prop_rdoItem_input";
						checkedOpt = request.getParameter(tag[0]+"_prop_rdoItem");//获取选项中选中的值
						options = join(request.getParameterValues(itemName),"_:");//获取所有选项值
						mark = "1";
					}else if("checkbox".equals(tag[1])){
						itemName = tag[0]+"_prop_ckbItem_input";
						checkedOpts = request.getParameterValues(tag[0]+"_prop_ckbItem");
						options = join(request.getParameterValues(itemName),"_:");//获取所有选项值
						mark = "2";
					}
					
					if("1".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpt)){
							defaultValue = checkedOpt + "_:";
						}
					}else if("2".equals(mark)){
						if(StringUtil.checkNotNull(checkedOpts)){
							String v = "";
							for(String opt : checkedOpts){
								v += opt+"_:";
							}
							defaultValue = v;
						}
					}
					formInput.setId(seq.getNextSeqIdToBigDecimal());//录入项ID
					formInput.setFormId(templateId);//模板表单ID
					formInput.setInputType(tag[1]);//录入项类型
					formInput.setInputTitle(inputTitle);//录入项标题
					formInput.setFiledName(filedName);//录入项字段名
					formInput.setDataFormat(format);//录入数据格式 有的元素有此属性，格式参考元素设计，日期格式
					formInput.setDefaultValue(defaultValue);//默认值
					formInput.setCheckType(checkType);//校验 0:否; 1:是;    非必填、必填
					formInput.setFuncPermission(permissionEdit+"_:"+permissionShow);//权限   查看只读(read)、编辑(edit)、可见(show)、隐藏(hidden)
					formInput.setSortGrade(sortGrade);//排序 越小越靠前
					formInput.setMinValue(minValue);//最小值 数值文本框特有属性
					formInput.setMaxValue(maxValue);//最大值 数值文本框特有属性
					formInput.setPrecision(precision);//小数点后几位 数值文本框特有属性
					formInput.setOptions(options);//选项 手动输入，或数据源
					formInput.setPromptMsg(des);//提示说明性文字
					formInput.setCreateTime(currentTime);
					forminputMapper.insertSelective(formInput);
				}
			}
		} catch (Exception e) {
			result = -1;
		}
		return result;
	}
	 
	@Override
	@Transactional(readOnly = false)
	public int deleteById(BigDecimal id) {
		return forminputMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int deleteByTemplateId(BigDecimal templateId) {
		return forminputMapper.deleteByTemplateId(templateId);
	}
	
	@Override
	@Transactional(readOnly = false)
	public int batchDelete(String[] ids) {
		if(ids != null){
			for(int i = 0; i < ids.length; i++){
				forminputMapper.deleteByPrimaryKey(new BigDecimal(ids[i]));
			}
			return ids.length;
		}else{
			return 0;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public int updateById(FormInputBean record) {
		return forminputMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public FormInputBean selectById(BigDecimal id) {
		return forminputMapper.selectByPrimaryKey(id);
	}
 
	@Override
	public List<FormInputBean> queryByCond(FormInputBean record) {
		return forminputMapper.queryByCond(record);
	}
	
	/**
	 * 数组转换成字符串 str为用以拼接的字符串
	 */
	private String join(String[] array,String str){
		String result = "";
		if(array != null && array.length > 0){
			for(int i = 0; i < array.length; i++){
				result += str + array[i];
			}
			result = result.substring(str.length());
		}
		return result;
	}
}
