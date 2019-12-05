package com.chinatelecom.jx.zone.management.bean.formInput;

import java.util.List;

/***
 *** 表单录入项详情表
****/
public class FormInputExampleBean{
	/**
	 * 控件列表
	 */
	private List<FormInputBean> inputList;
	
	private String tagNames;
	
	private int size;

	public FormInputExampleBean(){
		
	}

	public FormInputExampleBean(
		List<FormInputBean> inputList
	){
		this.inputList = inputList;
	}

	public List<FormInputBean> getInputList() {
		return inputList;
	}

	public void setInputList(List<FormInputBean> inputList) {
		this.inputList = inputList;
	}

	public String getTagNames() {
		return tagNames;
	}

	public void setTagNames(String tagNames) {
		this.tagNames = tagNames;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
}

