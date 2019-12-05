var HeadhuntViewModel = function() {
	var self = this;
	self.isLoadding = false;
	self.list = ko.observableArray([]);
	self.pageIndex = 1;
	self.pageSize = 20;
	self.searchField_business = '';
	self.searchField_area = '';
	self.workYear = ko.observableArray(workYearJson);
	self.searchField_workYear = ko.observable('');
	self.nodata = ko.observable(false);
	self.searchKey = ko.observable('');

	self.beforeBinding = function() {
		self.init();
		self.getList();
	}

	self.init = function() {
		self.isLoadding = false; // 状态标记
		$(document.body).infinite().on("infinite", function() {
			if (self.isLoadding)
				return;
			self.isLoadding = true;
			self.pageIndex++;
			self.getList();
		});
		$(window).scroll(function() {
			if ($(document).scrollTop() > 0) {
				$('#tbox').show();
			} else {
				$('#tbox').hide();
			}
		});

		$("#field_business").businessPicker({
			onClose : function(d) {
				self.searchField_business = d.value[01];
				$("#field_business").text(d.displayValue[1]);
				self.search();
			}
		});

		$('#field_city').hcdyCityPicker({
			onClose : function(d) {
				self.searchField_area = d.value[1];
				$("#field_city").text(d.displayValue[1]);
				self.search();
			}
		});

		$("#searchField_workYear").select({
			title : "选择工作经验",
			items : [{
				value : '',
				title : '不限'
			}, {
				value : '12050000',
				title : '应届生'
			}, {
				value : '12051000',
				title : '1年'
			}, {
				value : '12052000',
				title : '1-3年'
			}, {
				value : '12053000',
				title : '3-5年'
			}, {
				value : '12054000',
				title : '5-10年'
			}, {
				value : '21770000',
				natitleme : '10年以上'
			} ],
			onChange:function(d){
				$("#searchField_workYear").text(d.titles);
				self.searchField_workYear(d.values);
				self.search();
			}
		});

		$('#searchKey').on('search', function() {
			self.search();
		});
	};

	self.searchAll = function() {
		self.searchField_area = '';
		self.searchField_business = '';
		self.searchField_workYear('');
		self.searchKey('');
		$("#field_city").text('所在地');
		$("#field_business").text('服务项目');
		$("#searchField_workYear").text('工作经验');
		
		self.search();
	};

	self.openSearchFieldPopup = function() {
		$('#searchField').popup();
	}

	self.workYearSelected = function(row) {

		self.searchField_workYear(row.code);
	}

	self.closeFieldSearch = function() {
		$.closePopup();
		self.search();
	}

	self.search = function() {
		self.nodata(false);
		self.pageIndex = 1;
		self.list.removeAll();
		self.getList();
	}

	self.getList = function() {
		$('.weui-loadmore').show();
		$
				.post(
						baseUrl + '/json/recruitment/hcdy/getHeadHunt',
						{
							page_index : self.pageIndex,
							page_size : self.pageSize,
							business : self.searchField_business,
							area : self.searchField_area,
							work_year : self.searchField_workYear,
							search_key : self.searchKey
						},
						function(result) {
							self.isLoadding = false;
							if (result.errorCode == 0) {

								var dataList = result.value.headhuntList;
								for (var i = 0; i < dataList.length; i++) {
									if (dataList[i].head_portrait == '') {
										dataList[i].head_portrait = baseUrl
												+ '/static/weixin/recruitment/images/headPortrait.png';
									} else {
										dataList[i].head_portrait = "http://"
												+ dataList[i].head_portrait;
									}
									self.list.push(dataList[i]);
								}
								if (dataList.length == 0 && self.pageIndex > 1) {
									$.toast('加载完成', "text");
								}
								if (dataList.length == 0 && self.pageIndex == 1) {
									self.nodata(true);
								} else {
									self.nodata(false);
								}
								if (result.value.pageTotal <= self.pageIndex) {
									$('.weui-loadmore').hide();

								} else {
									$('.weui-loadmore').show();
								}
							} else {
								$.toast(result.errorMsg, "text");
								$('.weui-loadmore').hide();
							}
						});
	};

	self.showResume = function(row) {
		location.href = "showHeadhunt?url=http://" + row.mobile_url;
	}
}
