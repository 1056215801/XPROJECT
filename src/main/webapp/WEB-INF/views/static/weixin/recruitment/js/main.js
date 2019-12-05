var MainViewModel = function() {

	var self = this;
	self.isLoadding = false;
	self.list = ko.observableArray([]);
	self.pageIndex = 1;
	self.pageSize = 20;
	self.searchKey = ko.observable('');
	self.searchField_business = ko.observable('');
	self.searchField_area = ko.observable('');
	self.salary = ko.observableArray(salaryJson);
	self.searchField_salary = ko.observable('');

	self.workYear = ko.observableArray(workYearJson);
	self.searchField_workYear = ko.observable('');

	self.diploma = ko.observableArray(diplomaJson);
	self.searchField_diploma = ko.observable('');

	self.sex = ko.observableArray(sexJson);
	self.searchField_sex = ko.observable('');
	self.nodata = ko.observable(false);

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

		var back = Url.queryString("isBack");
		if(back == 'true') {
			console.log(back)
			$(".backBtn").show();
		}
		$("#field_business").businessPicker({
			onClose : function(d) {
				self.searchField_business(d.value[01]);
				$("#field_business").text(d.displayValue[1]);
				self.search();
			}
		});

		$('#field_city').hcdyCityPicker({
			onClose : function(d) {
				self.searchField_area(d.value[1]);
				$("#field_city").text(d.displayValue[1]);
				
				self.search();
			}
		});

		self.ssoLogin();
		
		$('#searchKey').on('search',function(){
			self.search();
		});
		
		var winHeight = 500;
		//获取窗口高度 
		if (window.innerHeight) {
			winHeight = window.innerHeight;
		} else if ((document.body) && (document.body.clientHeight)) {
			winHeight = document.body.clientHeight;
		}
		$('#searchField').css('height', winHeight);
	};

	self.searchAll = function() {
		self.searchField_area('');
		self.searchField_business('');
		self.searchField_sex('');
		self.searchField_diploma('');
		self.searchField_salary('');
		self.searchField_workYear('');
		self.searchKey('');
		$("#field_city").text('地点不限');
		$("#field_business").text('行业不限');
		self.search();
	};

	self.openSearchFieldPopup = function() {
		$('#searchField').popup();
	}

	self.salarySelected = function(row) {
		self.searchField_salary(row.code);
	}
	self.sexSelected = function(row) {
		self.searchField_sex(row.code);
	}
	self.diplomaSelected = function(row) {
		self.searchField_diploma(row.code);
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
						baseUrl + '/json/recruitment/hcdy/getResume',
						{
							page_index : self.pageIndex,
							page_size : self.pageSize,
							business : self.searchField_business,
							area : self.searchField_area,
							sex : self.searchField_sex,
							diploma : self.searchField_diploma,
							salary : self.searchField_salary,
							work_year : self.searchField_workYear,
							search_key : self.searchKey,
							age:''
						},
						function(result) {
							self.isLoadding = false;
							if (result.errorCode == 0) {
								var dataList = result.value.resumeList;
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
								console.log(self.nodata());
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
		location.href = "showResume?url=http://" + row.mobile_url;
		// location.href = "http://" + row.mobile_url;
	}

	self.ssoLogin = function() {
		$.ajax({
			url : baseUrl + "/json/recruitment/hcdy/hcdyLogin",
			type : "post",
			success : function(result) {
				if (result.errorCode == 0) {
					window.login.location.href = "http://"
							+ result.value.mobile_url;
				}
			},
			error : function() {
				// $.toast('加载完成', "text");
			}
		});
	}
}
