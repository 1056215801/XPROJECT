// jshint ignore: start
+function($) {

	$.rawCitiesData = [ {
		"code" : "",
		"name" : "地点不限",
		"sub" : [ {
			"code" : "",
			"name" : "地点不限"
		} ]
	}, {
		"code" : "13830000",
		"name" : "直辖市",
		"sub" : [ {
			"code" : "23840000",
			"name" : "北京市"
		}, {
			"code" : "23860000",
			"name" : "天津市"
		}, {
			"code" : "24640000",
			"name" : "上海市"
		}, {
			"code" : "26380000",
			"name" : "重庆市"
		} ]
	}, {
		"code" : "13870000",
		"name" : "河北省",
		"sub" : [ {
			"code" : "23880000",
			"name" : "石家庄市"
		}, {
			"code" : "23890000",
			"name" : "唐山市"
		}, {
			"code" : "23900000",
			"name" : "秦皇岛市"
		}, {
			"code" : "23910000",
			"name" : "邯郸市"
		}, {
			"code" : "23920000",
			"name" : "邢台市"
		}, {
			"code" : "23930000",
			"name" : "保定市"
		}, {
			"code" : "23940000",
			"name" : "张家口市"
		}, {
			"code" : "23950000",
			"name" : "承德市"
		}, {
			"code" : "23960000",
			"name" : "沧州市"
		}, {
			"code" : "23970000",
			"name" : "廊坊市"
		}, {
			"code" : "23980000",
			"name" : "衡水市"
		} ]
	}, {
		"code" : "13990000",
		"name" : "山西省",
		"sub" : [ {
			"code" : "24000000",
			"name" : "太原市"
		}, {
			"code" : "24010000",
			"name" : "大同市"
		}, {
			"code" : "24020000",
			"name" : "阳泉市"
		}, {
			"code" : "24030000",
			"name" : "长治市"
		}, {
			"code" : "24040000",
			"name" : "晋城市"
		}, {
			"code" : "24050000",
			"name" : "朔州市"
		}, {
			"code" : "24060000",
			"name" : "晋中市"
		}, {
			"code" : "24070000",
			"name" : "运城市"
		}, {
			"code" : "24080000",
			"name" : "忻州市"
		}, {
			"code" : "24090000",
			"name" : "临汾市"
		}, {
			"code" : "24100000",
			"name" : "吕梁市"
		} ]
	}, {
		"code" : "14110000",
		"name" : "内蒙古",
		"sub" : [ {
			"code" : "24120000",
			"name" : "呼和浩特市"
		}, {
			"code" : "24130000",
			"name" : "包头市"
		}, {
			"code" : "24140000",
			"name" : "乌海市"
		}, {
			"code" : "24150000",
			"name" : "赤峰市"
		}, {
			"code" : "24160000",
			"name" : "通辽市"
		}, {
			"code" : "24170000",
			"name" : "鄂尔多斯市"
		}, {
			"code" : "24180000",
			"name" : "呼伦贝尔市"
		}, {
			"code" : "24190000",
			"name" : "巴彦淖尔市"
		}, {
			"code" : "24200000",
			"name" : "乌兰察布市"
		}, {
			"code" : "24210000",
			"name" : "兴安盟"
		}, {
			"code" : "24220000",
			"name" : "锡林郭勒盟"
		}, {
			"code" : "24230000",
			"name" : "阿拉善盟"
		} ]
	}, {
		"code" : "14240000",
		"name" : "辽宁省",
		"sub" : [ {
			"code" : "24250000",
			"name" : "沈阳市"
		}, {
			"code" : "24260000",
			"name" : "大连市"
		}, {
			"code" : "24270000",
			"name" : "鞍山市"
		}, {
			"code" : "24280000",
			"name" : "抚顺市"
		}, {
			"code" : "24290000",
			"name" : "本溪市"
		}, {
			"code" : "24300000",
			"name" : "丹东市"
		}, {
			"code" : "24310000",
			"name" : "锦州市"
		}, {
			"code" : "24320000",
			"name" : "营口市"
		}, {
			"code" : "24330000",
			"name" : "阜新市"
		}, {
			"code" : "24340000",
			"name" : "辽阳市"
		}, {
			"code" : "24350000",
			"name" : "盘锦市"
		}, {
			"code" : "24360000",
			"name" : "铁岭市"
		}, {
			"code" : "24370000",
			"name" : "朝阳市"
		}, {
			"code" : "24380000",
			"name" : "葫芦岛市"
		} ]
	}, {
		"code" : "14390000",
		"name" : "吉林省",
		"sub" : [ {
			"code" : "24400000",
			"name" : "长春市"
		}, {
			"code" : "24410000",
			"name" : "吉林市"
		}, {
			"code" : "24420000",
			"name" : "四平市"
		}, {
			"code" : "24430000",
			"name" : "辽源市"
		}, {
			"code" : "24440000",
			"name" : "通化市"
		}, {
			"code" : "24450000",
			"name" : "白山市"
		}, {
			"code" : "24460000",
			"name" : "松原市"
		}, {
			"code" : "24470000",
			"name" : "白城市"
		}, {
			"code" : "24480000",
			"name" : "延边"
		} ]
	}, {
		"code" : "14490000",
		"name" : "黑龙江省",
		"sub" : [ {
			"code" : "24500000",
			"name" : "哈尔滨市"
		}, {
			"code" : "24510000",
			"name" : "齐齐哈尔市"
		}, {
			"code" : "24520000",
			"name" : "鸡西市"
		}, {
			"code" : "24530000",
			"name" : "鹤岗市"
		}, {
			"code" : "24540000",
			"name" : "双鸭山市"
		}, {
			"code" : "24550000",
			"name" : "大庆市"
		}, {
			"code" : "24560000",
			"name" : "伊春市"
		}, {
			"code" : "24570000",
			"name" : "佳木斯市"
		}, {
			"code" : "24580000",
			"name" : "七台河市"
		}, {
			"code" : "24590000",
			"name" : "牡丹江市"
		}, {
			"code" : "24600000",
			"name" : "黑河市"
		}, {
			"code" : "24610000",
			"name" : "绥化市"
		}, {
			"code" : "24620000",
			"name" : "大兴安岭"
		} ]
	}, {
		"code" : "14650000",
		"name" : "江苏省",
		"sub" : [ {
			"code" : "24660000",
			"name" : "南京市"
		}, {
			"code" : "24670000",
			"name" : "无锡市"
		}, {
			"code" : "24680000",
			"name" : "徐州市"
		}, {
			"code" : "24690000",
			"name" : "常州市"
		}, {
			"code" : "24700000",
			"name" : "苏州市"
		}, {
			"code" : "24710000",
			"name" : "南通市"
		}, {
			"code" : "24720000",
			"name" : "连云港市"
		}, {
			"code" : "24730000",
			"name" : "淮安市"
		}, {
			"code" : "24740000",
			"name" : "盐城市"
		}, {
			"code" : "24750000",
			"name" : "扬州市"
		}, {
			"code" : "24760000",
			"name" : "镇江市"
		}, {
			"code" : "24770000",
			"name" : "泰州市"
		}, {
			"code" : "24780000",
			"name" : "宿迁市"
		} ]
	}, {
		"code" : "14790000",
		"name" : "浙江省",
		"sub" : [ {
			"code" : "24800000",
			"name" : "杭州市"
		}, {
			"code" : "24810000",
			"name" : "宁波市"
		}, {
			"code" : "24820000",
			"name" : "温州市"
		}, {
			"code" : "24830000",
			"name" : "嘉兴市"
		}, {
			"code" : "24840000",
			"name" : "湖州市"
		}, {
			"code" : "24850000",
			"name" : "绍兴市"
		}, {
			"code" : "24860000",
			"name" : "金华市"
		}, {
			"code" : "24870000",
			"name" : "衢州市"
		}, {
			"code" : "24880000",
			"name" : "舟山市"
		}, {
			"code" : "24890000",
			"name" : "台州市"
		}, {
			"code" : "24900000",
			"name" : "丽水市"
		} ]
	}, {
		"code" : "14910000",
		"name" : "安徽省",
		"sub" : [ {
			"code" : "24920000",
			"name" : "合肥市"
		}, {
			"code" : "24930000",
			"name" : "芜湖市"
		}, {
			"code" : "24940000",
			"name" : "蚌埠市"
		}, {
			"code" : "24950000",
			"name" : "淮南市"
		}, {
			"code" : "24960000",
			"name" : "马鞍山市"
		}, {
			"code" : "24970000",
			"name" : "淮北市"
		}, {
			"code" : "24980000",
			"name" : "铜陵市"
		}, {
			"code" : "24990000",
			"name" : "安庆市"
		}, {
			"code" : "25000000",
			"name" : "黄山市"
		}, {
			"code" : "25010000",
			"name" : "滁州市"
		}, {
			"code" : "25020000",
			"name" : "阜阳市"
		}, {
			"code" : "25030000",
			"name" : "宿州市"
		}, {
			"code" : "25040000",
			"name" : "巢湖市"
		}, {
			"code" : "25050000",
			"name" : "六安市"
		}, {
			"code" : "25060000",
			"name" : "亳州市"
		}, {
			"code" : "25070000",
			"name" : "池州市"
		}, {
			"code" : "25080000",
			"name" : "宣城市"
		} ]
	}, {
		"code" : "15090000",
		"name" : "福建省",
		"sub" : [ {
			"code" : "25100000",
			"name" : "福州市"
		}, {
			"code" : "25110000",
			"name" : "厦门市"
		}, {
			"code" : "25120000",
			"name" : "莆田市"
		}, {
			"code" : "25130000",
			"name" : "三明市"
		}, {
			"code" : "25140000",
			"name" : "泉州市"
		}, {
			"code" : "25150000",
			"name" : "漳州市"
		}, {
			"code" : "25160000",
			"name" : "南平市"
		}, {
			"code" : "25170000",
			"name" : "龙岩市"
		}, {
			"code" : "25180000",
			"name" : "宁德市"
		} ]
	}, {
		"code" : "15190000",
		"name" : "江西省",
		"sub" : [ {
			"code" : "25200000",
			"name" : "南昌市"
		}, {
			"code" : "25210000",
			"name" : "景德镇市"
		}, {
			"code" : "25220000",
			"name" : "萍乡市"
		}, {
			"code" : "25230000",
			"name" : "九江市"
		}, {
			"code" : "25240000",
			"name" : "新余市"
		}, {
			"code" : "25250000",
			"name" : "鹰潭市"
		}, {
			"code" : "25260000",
			"name" : "赣州市"
		}, {
			"code" : "25270000",
			"name" : "吉安市"
		}, {
			"code" : "25280000",
			"name" : "宜春市"
		}, {
			"code" : "25290000",
			"name" : "抚州市"
		}, {
			"code" : "25300000",
			"name" : "上饶市"
		} ]
	}, {
		"code" : "15310000",
		"name" : "山东省",
		"sub" : [ {
			"code" : "25320000",
			"name" : "济南市"
		}, {
			"code" : "25330000",
			"name" : "青岛市"
		}, {
			"code" : "25340000",
			"name" : "淄博市"
		}, {
			"code" : "25350000",
			"name" : "枣庄市"
		}, {
			"code" : "25360000",
			"name" : "东营市"
		}, {
			"code" : "25370000",
			"name" : "烟台市"
		}, {
			"code" : "25380000",
			"name" : "潍坊市"
		}, {
			"code" : "25390000",
			"name" : "济宁市"
		}, {
			"code" : "25400000",
			"name" : "泰安市"
		}, {
			"code" : "25410000",
			"name" : "威海市"
		}, {
			"code" : "25420000",
			"name" : "日照市"
		}, {
			"code" : "25430000",
			"name" : "莱芜市"
		}, {
			"code" : "25440000",
			"name" : "临沂市"
		}, {
			"code" : "25450000",
			"name" : "德州市"
		}, {
			"code" : "25460000",
			"name" : "聊城市"
		}, {
			"code" : "25470000",
			"name" : "滨州市"
		}, {
			"code" : "25480000",
			"name" : "荷泽市"
		} ]
	}, {
		"code" : "15490000",
		"name" : "河南省",
		"sub" : [ {
			"code" : "25500000",
			"name" : "郑州市"
		}, {
			"code" : "25510000",
			"name" : "开封市"
		}, {
			"code" : "25520000",
			"name" : "洛阳市"
		}, {
			"code" : "25530000",
			"name" : "平顶山市"
		}, {
			"code" : "25540000",
			"name" : "安阳市"
		}, {
			"code" : "25550000",
			"name" : "鹤壁市"
		}, {
			"code" : "25560000",
			"name" : "新乡市"
		}, {
			"code" : "25570000",
			"name" : "焦作市"
		}, {
			"code" : "25580000",
			"name" : "濮阳市"
		}, {
			"code" : "25590000",
			"name" : "许昌市"
		}, {
			"code" : "25600000",
			"name" : "漯河市"
		}, {
			"code" : "25610000",
			"name" : "三门峡市"
		}, {
			"code" : "25620000",
			"name" : "南阳市"
		}, {
			"code" : "25630000",
			"name" : "商丘市"
		}, {
			"code" : "25640000",
			"name" : "信阳市"
		}, {
			"code" : "25650000",
			"name" : "周口市"
		}, {
			"code" : "25660000",
			"name" : "驻马店市"
		} ]
	}, {
		"code" : "15670000",
		"name" : "湖北省",
		"sub" : [ {
			"code" : "25680000",
			"name" : "武汉市"
		}, {
			"code" : "25690000",
			"name" : "黄石市"
		}, {
			"code" : "25700000",
			"name" : "十堰市"
		}, {
			"code" : "25710000",
			"name" : "宜昌市"
		}, {
			"code" : "25720000",
			"name" : "襄樊市"
		}, {
			"code" : "25730000",
			"name" : "鄂州市"
		}, {
			"code" : "25740000",
			"name" : "荆门市"
		}, {
			"code" : "25750000",
			"name" : "孝感市"
		}, {
			"code" : "25760000",
			"name" : "荆州市"
		}, {
			"code" : "25770000",
			"name" : "黄冈市"
		}, {
			"code" : "25780000",
			"name" : "咸宁市"
		}, {
			"code" : "25790000",
			"name" : "随州市"
		}, {
			"code" : "25800000",
			"name" : "恩施"
		}, {
			"code" : "25810000",
			"name" : "神农架"
		} ]
	}, {
		"code" : "15820000",
		"name" : "湖南省",
		"sub" : [ {
			"code" : "25830000",
			"name" : "长沙市"
		}, {
			"code" : "25840000",
			"name" : "株洲市"
		}, {
			"code" : "25850000",
			"name" : "湘潭市"
		}, {
			"code" : "25860000",
			"name" : "衡阳市"
		}, {
			"code" : "25870000",
			"name" : "邵阳市"
		}, {
			"code" : "25880000",
			"name" : "岳阳市"
		}, {
			"code" : "25890000",
			"name" : "常德市"
		}, {
			"code" : "25900000",
			"name" : "张家界市"
		}, {
			"code" : "25910000",
			"name" : "益阳市"
		}, {
			"code" : "25920000",
			"name" : "郴州市"
		}, {
			"code" : "25930000",
			"name" : "永州市"
		}, {
			"code" : "25940000",
			"name" : "怀化市"
		}, {
			"code" : "25950000",
			"name" : "娄底市"
		}, {
			"code" : "25960000",
			"name" : "湘西"
		} ]
	}, {
		"code" : "15970000",
		"name" : "广东省",
		"sub" : [ {
			"code" : "25980000",
			"name" : "广州市"
		}, {
			"code" : "25990000",
			"name" : "韶关市"
		}, {
			"code" : "26000000",
			"name" : "深圳市"
		}, {
			"code" : "26010000",
			"name" : "珠海市"
		}, {
			"code" : "26020000",
			"name" : "汕头市"
		}, {
			"code" : "26030000",
			"name" : "佛山市"
		}, {
			"code" : "26040000",
			"name" : "江门市"
		}, {
			"code" : "26050000",
			"name" : "湛江市"
		}, {
			"code" : "26060000",
			"name" : "茂名市"
		}, {
			"code" : "26070000",
			"name" : "肇庆市"
		}, {
			"code" : "26080000",
			"name" : "惠州市"
		}, {
			"code" : "26090000",
			"name" : "梅州市"
		}, {
			"code" : "26100000",
			"name" : "汕尾市"
		}, {
			"code" : "26110000",
			"name" : "河源市"
		}, {
			"code" : "26120000",
			"name" : "阳江市"
		}, {
			"code" : "26130000",
			"name" : "清远市"
		}, {
			"code" : "26140000",
			"name" : "东莞市"
		}, {
			"code" : "26150000",
			"name" : "中山市"
		}, {
			"code" : "26160000",
			"name" : "潮州市"
		}, {
			"code" : "26170000",
			"name" : "揭阳市"
		}, {
			"code" : "26180000",
			"name" : "云浮市"
		} ]
	}, {
		"code" : "16190000",
		"name" : "广西",
		"sub" : [ {
			"code" : "26200000",
			"name" : "南宁市"
		}, {
			"code" : "26210000",
			"name" : "柳州市"
		}, {
			"code" : "26220000",
			"name" : "桂林市"
		}, {
			"code" : "26230000",
			"name" : "梧州市"
		}, {
			"code" : "26240000",
			"name" : "北海市"
		}, {
			"code" : "26250000",
			"name" : "防城港市"
		}, {
			"code" : "26260000",
			"name" : "钦州市"
		}, {
			"code" : "26270000",
			"name" : "贵港市"
		}, {
			"code" : "26280000",
			"name" : "玉林市"
		}, {
			"code" : "26290000",
			"name" : "百色市"
		}, {
			"code" : "26300000",
			"name" : "贺州市"
		}, {
			"code" : "26310000",
			"name" : "河池市"
		}, {
			"code" : "26320000",
			"name" : "来宾市"
		}, {
			"code" : "26330000",
			"name" : "崇左市"
		} ]
	}, {
		"code" : "16340000",
		"name" : "海南省",
		"sub" : [ {
			"code" : "26350000",
			"name" : "海口市"
		}, {
			"code" : "26360000",
			"name" : "三亚市"
		} ]
	}, {
		"code" : "16390000",
		"name" : "四川省",
		"sub" : [ {
			"code" : "26400000",
			"name" : "成都市"
		}, {
			"code" : "26410000",
			"name" : "自贡市"
		}, {
			"code" : "26420000",
			"name" : "攀枝花市"
		}, {
			"code" : "26430000",
			"name" : "泸州市"
		}, {
			"code" : "26440000",
			"name" : "德阳市"
		}, {
			"code" : "26450000",
			"name" : "绵阳市"
		}, {
			"code" : "26460000",
			"name" : "广元市"
		}, {
			"code" : "26470000",
			"name" : "遂宁市"
		}, {
			"code" : "26480000",
			"name" : "内江市"
		}, {
			"code" : "26490000",
			"name" : "乐山市"
		}, {
			"code" : "26500000",
			"name" : "南充市"
		}, {
			"code" : "26510000",
			"name" : "眉山市"
		}, {
			"code" : "26520000",
			"name" : "宜宾市"
		}, {
			"code" : "26530000",
			"name" : "广安市"
		}, {
			"code" : "26540000",
			"name" : "达州市"
		}, {
			"code" : "26550000",
			"name" : "雅安市"
		}, {
			"code" : "26560000",
			"name" : "巴中市"
		}, {
			"code" : "26570000",
			"name" : "资阳市"
		}, {
			"code" : "26580000",
			"name" : "阿坝"
		}, {
			"code" : "26590000",
			"name" : "甘孜"
		}, {
			"code" : "26600000",
			"name" : "凉山"
		} ]
	}, {
		"code" : "16610000",
		"name" : "贵州省",
		"sub" : [ {
			"code" : "26620000",
			"name" : "贵阳市"
		}, {
			"code" : "26630000",
			"name" : "六盘水市"
		}, {
			"code" : "26640000",
			"name" : "遵义市"
		}, {
			"code" : "26650000",
			"name" : "安顺市"
		}, {
			"code" : "26660000",
			"name" : "铜仁"
		}, {
			"code" : "26670000",
			"name" : "黔西"
		}, {
			"code" : "26680000",
			"name" : "毕节"
		}, {
			"code" : "26690000",
			"name" : "黔东"
		}, {
			"code" : "26700000",
			"name" : "黔南"
		} ]
	}, {
		"code" : "16710000",
		"name" : "云南省",
		"sub" : [ {
			"code" : "26720000",
			"name" : "昆明市"
		}, {
			"code" : "26730000",
			"name" : "曲靖市"
		}, {
			"code" : "26740000",
			"name" : "玉溪市"
		}, {
			"code" : "26750000",
			"name" : "保山市"
		}, {
			"code" : "26760000",
			"name" : "昭通市"
		}, {
			"code" : "26770000",
			"name" : "丽江市"
		}, {
			"code" : "26780000",
			"name" : "思茅市"
		}, {
			"code" : "26790000",
			"name" : "临沧市"
		}, {
			"code" : "26800000",
			"name" : "楚雄"
		}, {
			"code" : "26810000",
			"name" : "红河"
		}, {
			"code" : "26820000",
			"name" : "文山"
		}, {
			"code" : "26830000",
			"name" : "西双版纳"
		}, {
			"code" : "26840000",
			"name" : "大理"
		}, {
			"code" : "26850000",
			"name" : "德宏"
		}, {
			"code" : "26860000",
			"name" : "怒江"
		}, {
			"code" : "26870000",
			"name" : "迪庆"
		} ]
	}, {
		"code" : "16880000",
		"name" : "西藏",
		"sub" : [ {
			"code" : "26890000",
			"name" : "拉萨市"
		}, {
			"code" : "26900000",
			"name" : "昌都"
		}, {
			"code" : "26910000",
			"name" : "山南"
		}, {
			"code" : "26920000",
			"name" : "日喀则"
		}, {
			"code" : "26930000",
			"name" : "那曲"
		}, {
			"code" : "26940000",
			"name" : "阿里"
		}, {
			"code" : "26950000",
			"name" : "林芝"
		} ]
	}, {
		"code" : "16960000",
		"name" : "陕西省",
		"sub" : [ {
			"code" : "26970000",
			"name" : "西安市"
		}, {
			"code" : "26980000",
			"name" : "铜川市"
		}, {
			"code" : "26990000",
			"name" : "宝鸡市"
		}, {
			"code" : "27000000",
			"name" : "咸阳市"
		}, {
			"code" : "27010000",
			"name" : "渭南市"
		}, {
			"code" : "27020000",
			"name" : "延安市"
		}, {
			"code" : "27030000",
			"name" : "汉中市"
		}, {
			"code" : "27040000",
			"name" : "榆林市"
		}, {
			"code" : "27050000",
			"name" : "安康市"
		}, {
			"code" : "27060000",
			"name" : "商洛市"
		} ]
	}, {
		"code" : "17070000",
		"name" : "甘肃省",
		"sub" : [ {
			"code" : "27080000",
			"name" : "兰州市"
		}, {
			"code" : "27090000",
			"name" : "嘉峪关市"
		}, {
			"code" : "27100000",
			"name" : "金昌市"
		}, {
			"code" : "27110000",
			"name" : "白银市"
		}, {
			"code" : "27120000",
			"name" : "天水市"
		}, {
			"code" : "27130000",
			"name" : "武威市"
		}, {
			"code" : "27140000",
			"name" : "张掖市"
		}, {
			"code" : "27150000",
			"name" : "平凉市"
		}, {
			"code" : "27160000",
			"name" : "酒泉市"
		}, {
			"code" : "27170000",
			"name" : "庆阳市"
		}, {
			"code" : "27180000",
			"name" : "定西市"
		}, {
			"code" : "27190000",
			"name" : "陇南市"
		}, {
			"code" : "27200000",
			"name" : "临夏"
		}, {
			"code" : "27210000",
			"name" : "甘南"
		} ]
	}, {
		"code" : "17220000",
		"name" : "青海省",
		"sub" : [ {
			"code" : "27230000",
			"name" : "西宁市"
		}, {
			"code" : "27240000",
			"name" : "海东"
		}, {
			"code" : "27250000",
			"name" : "海北"
		}, {
			"code" : "27260000",
			"name" : "黄南"
		}, {
			"code" : "27270000",
			"name" : "海南"
		}, {
			"code" : "27280000",
			"name" : "果洛"
		}, {
			"code" : "27290000",
			"name" : "玉树"
		}, {
			"code" : "27300000",
			"name" : "海西"
		} ]
	}, {
		"code" : "17310000",
		"name" : "宁夏",
		"sub" : [ {
			"code" : "27320000",
			"name" : "银川市"
		}, {
			"code" : "27330000",
			"name" : "石嘴山市"
		}, {
			"code" : "27340000",
			"name" : "吴忠市"
		}, {
			"code" : "27350000",
			"name" : "固原市"
		}, {
			"code" : "27360000",
			"name" : "中卫市"
		} ]
	}, {
		"code" : "17370000",
		"name" : "新疆",
		"sub" : [ {
			"code" : "27380000",
			"name" : "乌鲁木齐市"
		}, {
			"code" : "27390000",
			"name" : "克拉玛依市"
		}, {
			"code" : "27400000",
			"name" : "吐鲁番"
		}, {
			"code" : "27410000",
			"name" : "哈密"
		}, {
			"code" : "27420000",
			"name" : "昌吉"
		}, {
			"code" : "27430000",
			"name" : "博尔塔拉蒙古"
		}, {
			"code" : "27440000",
			"name" : "巴音郭楞蒙"
		}, {
			"code" : "27450000",
			"name" : "阿克苏"
		}, {
			"code" : "27460000",
			"name" : "克孜勒苏柯尔克孜"
		}, {
			"code" : "27470000",
			"name" : "喀什"
		}, {
			"code" : "27480000",
			"name" : "和田"
		}, {
			"code" : "27490000",
			"name" : "伊犁哈萨克"
		}, {
			"code" : "27500000",
			"name" : "塔城"
		}, {
			"code" : "27510000",
			"name" : "阿勒泰"
		}, {
			"code" : "27520000",
			"name" : "石河子市"
		}, {
			"code" : "27530000",
			"name" : "阿拉尔市"
		}, {
			"code" : "27540000",
			"name" : "图木舒克市"
		}, {
			"code" : "27550000",
			"name" : "五家渠市"
		} ]
	}, {
		"code" : "17560000",
		"name" : "港澳台",
		"sub" : [ {
			"code" : "27570000",
			"name" : "香港"
		}, {
			"code" : "27590000",
			"name" : "澳门"
		}, {
			"code" : "27610000",
			"name" : "台湾"
		} ]
	}, {
		"code" : "17620000",
		"name" : "其它",
		"sub" : [ {
			"code" : "27630000",
			"name" : "国外"
		} ]
	} ];
}($);
// jshint ignore: end

/* global $:true */
/* jshint unused:false */

+function($) {
	"use strict";

	var defaults;
	var raw = $.rawCitiesData;

	var format = function(data) {
		var result = [];
		for (var i = 0; i < data.length; i++) {
			var d = data[i];
			if (/^请选择|市辖区/.test(d.name))
				continue;
			result.push(d);
		}
		if (result.length)
			return result;
		return [];
	};

	var sub = function(data) {
		if (!data.sub)
			return [ {
				name : '',
				code : data.code
			} ]; // 有可能某些县级市没有区
		return format(data.sub);
	};

	var getCities = function(d) {
		for (var i = 0; i < raw.length; i++) {
			if (raw[i].code === d || raw[i].name === d)
				return sub(raw[i]);
		}
		return [];
	};

	var parseInitValue = function(val) {
		var p = raw[0], c, d;
		var tokens = val.split(' ');
		raw.map(function(t) {
			if (t.name === tokens[0])
				p = t;
		});

		p.sub.map(function(t) {
			if (t.name === tokens[1])
				c = t;
		})

		if (tokens[2]) {
			c.sub.map(function(t) {
				if (t.name === tokens[2])
					d = t;
			})
		}

		if (d)
			return [ p.code, c.code, d.code ];
		return [ p.code, c.code ];
	}

	$.fn.hcdyCityPicker = function(params) {
		params = $.extend({}, defaults, params);
		return this.each(function() {
			var self = this;

			var provincesName = raw.map(function(d) {
				return d.name;
			});
			var provincesCode = raw.map(function(d) {
				return d.code;
			});
			var initCities = sub(raw[0]);
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

				cssClass : "hcdycity-picker",
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
					// 如果最后一列是空的，那么取倒数第二列
					var len = (values[values.length - 1] ? values.length - 1
							: values.length - 2)
					$(self).attr('data-code', values[len]);
					$(self).attr('data-codes', values.join(','));
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
			// 计算value
			var val = $(this).val();
			if (!val)
				val = '地点不限 地点不限';
			currentProvince = val.split(" ")[0];
			currentCity = val.split(" ")[1];
			if (val) {
				p.value = parseInitValue(val);
				if (p.value[0]) {
					var cities = getCities(p.value[0]);
					p.cols[1].values = cities.map(function(c) {
						return c.code;
					});
					p.cols[1].displayValues = cities.map(function(c) {
						return c.name;
					});
				}
			}
			$(this).picker(p);
		});
	};

	defaults = $.fn.hcdyCityPicker.prototype.defaults = {};

}($);
