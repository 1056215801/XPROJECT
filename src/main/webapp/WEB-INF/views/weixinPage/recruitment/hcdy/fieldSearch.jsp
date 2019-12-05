<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<div id="searchField" class="weui-popup__container" style="overflow-y:auto;">
	<div class="weui-popup__overlay"></div>
	<div class="weui-popup__modal">
		<div class="toolbar">
			<div class="toolbar-inner">
				<a href="javascript:;" class="picker-button" data-bind="click:closeFieldSearch">完成</a>
				<h1 class="title">更多筛选</h1>
			</div>
		</div>
		<div class="employment_content" style="margin-top: 50px;">
			<div class="field_search_title">性别</div>
			<div class="field_search_content">
				<!-- ko foreach:sex -->
				<div class="optionBtn"
					data-bind="text:name,css:{selected:$parent.searchField_sex()==code},click:$parent.sexSelected">普通</div>
				<!-- /ko -->
				<div style="clear: both;"></div>
			</div>
			<div class="field_search_title">薪资要求</div>
			<div class="field_search_content">
				<!-- ko foreach:salary -->
				<div class="optionBtn"
					data-bind="text:name,css:{selected:$parent.searchField_salary()==code},click:$parent.salarySelected">普通</div>
				<!-- /ko -->
				<div style="clear: both;"></div>
			</div>
			<div class="field_search_title">工作经验</div>
			<div class="field_search_content">
				<!-- ko foreach:workYear -->
				<div class="optionBtn"
					data-bind="text:name,css:{selected:$parent.searchField_workYear()==code},click:$parent.workYearSelected">普通</div>
				<!-- /ko -->
				<div style="clear: both;"></div>
			</div>
			<div class="field_search_title">学历</div>
			<div class="field_search_content">
				<!-- ko foreach:diploma -->
				<div class="optionBtn"
					data-bind="text:name,css:{selected:$parent.searchField_diploma()==code},click:$parent.diplomaSelected">普通</div>
				<!-- /ko -->
				<div style="clear: both;"></div>
			</div>
		</div>

	</div>
</div>