var MyViewModel = function() {

	var self = this;
	self.id = $.query.get("id");
	self.list = ko.observableArray([]);
	self.position = ko.observable();
	self.beforeBinding = function() {
		self.init();
		self.getPosition();
	}

	self.init = function() {
		self.isLoadding = false; // 状态标记

	};

	self.getPosition = function() {
		$.post(baseUrl + '/json/recruitment/hcdy/getPosition?id=' + self.id,
				{}, function(result) {
					self.isLoadding = false;
					if (result.errorCode == 0) {
						result.value.createTimeName = self
								.getTime(result.value.createTime)
						self.position(result.value);
						self.getList(result.value.positionId)
					} else {
						$.toast(result.errorMsg, "text");
					}
				});
	}

	self.getList = function(positionId) {
		if(account==''){
			$.toast('请先在PC端注册为企业', "text");
			return;
		}
		if (typeof (positionId) == 'undefined' || positionId == '') {
			return;
		}
		$
				.post(
						baseUrl + '/json/recruitment/hcdy/getAjInfo',
						{
							account : account,
							positionID : positionId
						},
						function(result) {
							self.isLoadding = false;
							if (result.errorCode == 0) {

								var dataList = result.value.ajList;
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
							} else {
								$.toast(result.errorMsg, "text");
							}
						});
	};

	self.showResume = function(row) {
		location.href = "showResume?url=http://" + row.mobile_url;
		// location.href = "http://" + row.mobile_url;
	}
	// long类型时间转换
	self.getTime = function(time) {
		var date = new Date(time);
		Y = date.getFullYear() + '-';
		M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
				.getMonth() + 1)
				+ '-';
		D = (date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate())
				+ ' ';
		h = (date.getHours() < 10 ? ('0' + date.getHours()) : date.getHours())
				+ ':';
		m = (date.getMinutes() < 10 ? ('0' + date.getMinutes()) : date
				.getMinutes());
		/*
		 * s = (date.getSeconds() < 10 ?( '0' + date.getSeconds() ) :
		 * date.getSeconds() );
		 */
		return (Y + M + D + h + m);
	}

}
