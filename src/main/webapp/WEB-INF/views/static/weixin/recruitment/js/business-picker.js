+function($) {
	"use strict";

	var defaults;
	var raw = [ {
		"name" : "行业不限",
		"code" : "",
		"children" : [ {
			"name" : "行业不限",
			"code" : ""
		} ]
	} ];
	for (var i = 0; i < industryJson.industryList.length; i++) {
		raw.push(industryJson.industryList[i]);
	}
	var getCities = function(d) {
		for (var i = 0; i < raw.length; i++) {
			if (raw[i].code === d || raw[i].name === d)
				return raw[i].children;
		}
		return [];
	};

	$.fn.businessPicker = function(params) {
		params = $.extend({}, defaults, params);
		return this.each(function() {
			var self = this;

			var provincesName = raw.map(function(d) {
				return d.name;
			});
			var provincesCode = raw.map(function(d) {
				return d.code;
			});
			var initCities = raw[0].children;
			console.log(initCities);
			var initCitiesName = initCities.map(function(c) {
				return c.name;
			});
			var initCitiesCode = initCities.map(function(c) {
				return c.code;
			});

			var currentProvince = provincesName[0];
			var currentCity = initCitiesName[0];

			var cols = [ {
				displayValues : provincesName,
				values : provincesCode,
				cssClass : "col-province"
			}, {
				displayValues : initCitiesName,
				values : initCitiesCode,
				cssClass : "col-city"
			} ];

			var config = {

				cssClass : "business-picker",
				rotateEffect : false, // 为了性能
				formatValue : function(p, values, displayValues) {
					return displayValues.join(' ');
				},
				onChange : function(picker, values, displayValues) {
					var newProvince = picker.cols[0].displayValue;
					var newCity;
					if (newProvince !== currentProvince) {
						var newCities = getCities(newProvince);
						newCity = newCities[0].name;
						picker.cols[1].replaceValues(newCities.map(function(c) {
							return c.code;
						}), newCities.map(function(c) {
							return c.name;
						}));

						currentProvince = newProvince;
						currentCity = newCity;
						picker.updateValue();
						return false; // 因为数据未更新完，所以这里不进行后序的值的处理
					}
					if (params.onChange) {
						params.onChange.call(self, picker, values,
								displayValues);
					}

				},
				cols : cols
			};

			if (!this)
				return;
			var p = $.extend({}, params, config);
			$(this).picker(p);
		});
	};

	defaults = $.fn.businessPicker.prototype.defaults = {};

}($);
