var MyViewModel = function() {

	var self = this;
	self.list = ko.observableArray([]);
	self.status = ko.observable('');
	self.searchKey = ko.observable('');
	self.statusList = ko.observableArray([ {
		value : '',
		name : '全部'
	}, {
		value : '1',
		name : '已发布职位'
	}, {
		value : '0',
		name : '已下线职位'
	}, {
		value : '2',
		name : '草稿箱'
	} ]);
	self.searchField_business = ko.observable('');

	self.beforeBinding = function() {
		self.init();
		self.getList();
	}

	self.init = function() {
		self.isLoadding = false; // 状态标记
		$('#searchKey').on('search', function() {
			self.search();
		})
	};
	self.searchAll = function(row) {
		self.status(row.value);
		self.searchKey('');
		self.list.removeAll();
		self.getList();
	};
	
	self.search = function(row) {
		self.status('');
		self.list.removeAll();
		self.getList();
	};
	self.getList = function() {
		if (account == '') {
			$.toast('请先在PC端注册为企业', "text");
			return;
		}
		$.post(baseUrl + '/json/recruitment/hcdy/logList', {
			account : account,
			positionStatus : self.status(),
			positionName:self.searchKey()
		}, function(result) {
			self.isLoadding = false;
			if (result.code == 0) {
				var dataList = result.value;
				self.list.removeAll();
				for (var i = 0; i < dataList.length; i++) {
					if (!dataList[i].workAreaName) {
						dataList[i].workAreaName = '';
					}
					if (!dataList[i].workYearName) {
						dataList[i].workYearName = '';
					}
					if (!dataList[i].diplomaName) {
						dataList[i].diplomaName = '';
					}
					self.list.push(dataList[i]);
				}
			} else {
				$.toast(result.errorMsg, "text");
			}
		});
	};

	self.show = function(row) {
		location.href = "showPosition?id=" + row.id;
	}
}
