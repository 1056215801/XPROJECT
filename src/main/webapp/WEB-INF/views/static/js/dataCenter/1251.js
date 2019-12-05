var indexData = {// 首页数据
    "logo": "/XProject/static/image/cityDataCenter/common/logo_th.png",// 页面上的标题
    "title": "泰和大数据",// 页面上的标题
    "infor": {// 园区统计信息
        "parkName": "泰和工业园",// 工业园名称
        "ghmj": "12000",// 规划面积
        "qyzs": "315",// 企业总数
        "zczj": "182.48",// 资产总计
        "gyxscz": "264.64",// 工业销售产值
        "zyywsr": "274.57",// 主营业务收入
        "lrze": "19.0"// 利润总额
    },
    "chart1": {// 产业主营收入饼图
        "total": 337.4,// 总投资
        "list": [// 数据，可随意增减
            {
                "name": "投产项目",// 分类名称
                "value": 161.2// 该分类的投资金额
            },
            {
                "name": "停产、半停产项目",
                "value": 16.7
            },
            {
                "name": "在建项目",
                "value": 94.1
            },
            {
                "name": "停建项目",
                "value": 19.4
            },
            {
                "name": "待建项目",
                "value": 29.5
            },
            {
                "name": "拟退出项目",
                "value": 16.5
            }
        ]
    },
    "list": [// 产业体系，可随意增减
        {
            "name": "电子信息",// 名称
            "image": "/XProject/static/image/cityDataCenter/common/tech1.png",// 图标，需要在image文件夹加对应图片
            "size": "b01",// 圆圈大小，有4个选择01-04
            "color": "co01"// 圆圈颜色，有7个选择01-07
        },
        { "name": "", "image": "", "size": "b03", "color": "co01" },// 没有数据的小圆圈
        { "name": "", "image": "", "size": "b04", "color": "co06" },
        {
            "name": "绿色食品",
            "image": "/XProject/static/image/cityDataCenter/common/tech2.png",
            "size": "b02",
            "color": "co05"
        },
        { "name": "", "image": "", "size": "b03", "color": "co04" },
        { "name": "", "image": "", "size": "b04", "color": "co05" },
        {
            "name": "装备制造",
            "image": "/XProject/static/image/cityDataCenter/common/tech3.png",
            "size": "b02",
            "color": "co06"
        },
        { "name": "", "image": "", "size": "b03", "color": "co07" },
        { "name": "", "image": "", "size": "b04", "color": "co05" },
        {
            "name": "其他",
            "image": "/XProject/static/image/cityDataCenter/common/tech4.png",
            "size": "b02",
            "color": "co04"
        },
        { "name": "", "image": "", "size": "b03", "color": "co04" },
        { "name": "", "image": "", "size": "b04", "color": "co07" }
    ],
    "companyList": [// 可选的规上企业，可随意增减
        {
            "qymc": "江西合力泰科技有限公司",// 企业名称
            "sshy": "电子信息技术",// 所属行业
            "qyxz": "有限责任公司",// 企业性质
            "zczb": "121660"// 注册资本
        },
        {
            "qymc": "江西融合科技有限公司",
            "sshy": "电子信息技术",
            "qyxz": "有限责任公司",
            "zczb": "1660"
        }
    ]
}
var gytzData = {// 工业投资
    "waterData": {// 投资总额水滴图
        "value": 0.5,// 波浪占圆圈比重0-1
        "name": "亿元",// 单位
        "val": 244.1// 值
    },
    "pieData": [// 投资占比饼图，可随意增减
        {
            "name": "在线",// 名称
            "value": 29.8,// 数值
            "unit": "亿元"// 单位
        },
        {
            "name": "投产",
            "value": 105,
            "unit": "亿元"
        }
    ],
    "barData": {// 各行业项目数量对比柱状图，可随意增减
        "label": ["电子信息","绿色食品","装备制造","其他"],// 行业类别
        "legend": ["今年","去年"],// 需要对比的柱子分类
        "data": [
            [79,58,59,45],// 行业项目数量，必须和行业顺序一一对应
            [64,40,47,42]
        ]
    },
    "ringData": {// 项目进度环形图，可随意增减
        "total": 70,// 总数，黄色字体显示
        "title": "项目总数（个）",// 二级标题，蓝色字体显示
        "data": [
            {
                "name": "投产",// 项目分类
                "value": 23,// 项目数量
                "unit": "个"// 单位
            },
            {
                "name": "开工",
                "value": 22,
                "unit": "个"
            },
            {
                "name": "签约",
                "value": 25,
                "unit": "个"
            }
        ]
    },
    "xmyjList": [// 项目预警，可随意增减，但至少6个！
        {
            "name": "【年产1000套环保装备生产项目】",// 项目名称
            "status": "已延期",// 状态描述
            "color": "#FF2424" // 状态描述的颜色，红色：#FF2424，绿色：#2EFFB8，其他自己加
        },
        {
            "name": "【年产24000万件背光模组项目】",
            "status": "已超期未开工",
            "color": "#FF2424"
        },
        {
            "name": "【年产3600万平方米偏光片】",
            "status": "有节点即将到完工时间",
            "color": "#2EFFB8"
        },
        {
            "name": "【年产5000万片导电玻璃功能片】",
            "status": "有节点已延期",
            "color": "#FF2424"
        },
        {
            "name": "【年产6240万片生物识别模组项目】",
            "status": "已延期",
            "color": "#FF2424"
        },
        {
            "name": "【8条日本精密涂布生产线项目】",
            "status": "已超期未开工",
            "color": "#FF2424"
        },
        {
            "name": "【年产散热器1000万件生产能力】",
            "status": "有节点即将到完工时间",
            "color": "#2EFFB8"
        }
    ],
    "ssdtList": [// 工程项目实时动态，可随意增减，但最少4个
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",// 项目名称
            "time": "2019-02-12"// 时间
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        },
        {
            "name": "年产散热器1000万件生产能力 发起一条诉求",
            "time": "2019-02-12"
        }
    ]
}
var yyglData = {// 运营管理
    "xsczData": {// 工业销售产值线图
        "xData": ["","1~3月","1~6月","1~9月","1~12月",""],
        "data": [5, 8.5, 6.4, 7, 9.5, 6] // 顺序和上面的一一对应，改中间四个，其他为线的起始高度和结束高度
    },
    "zyywsrData": { // 主营业务收入柱状图
        "xData": ["1~3月","1~6月","1~9月","1~12月"],
        "data": [46, 99, 176, 274] // 顺序和上面的一一对应
    },
    "lrData": { // 利润总额
        "xData": ["1~3月","1~6月","1~9月","1~12月"],
        "data": [2.9, 7.2, 10.2, 19] // 顺序和上面的一一对应
    },
    "qyfbData": { // 企业分布环形图，可随意增减
        "total": 337.4, // 总数
        "list": [
            {
                "name": "投产项目", // 分类名称
                "value": 161.2 // 分类数值
            },
            {
                "name": "停产、半停产项目",
                "value": 16.7
            },
            {
                "name": "在建项目",
                "value": 94.1
            },
            {
                "name": "停建项目",
                "value": 19.4
            },
            {
                "name": "待建项目",
                "value": 29.5
            },
            {
                "name": "拟退出项目",
                "value": 16.5
            }
        ]
    },
    "economic": [ // 页面正上方的四项数据
        {
            "title": "工业销售产值",
            "num": 264.6,
            "unit": "亿元", // 单位，可以是%
            "decimal": true // 有小数为true，没小数为false！
        },
        {
            "title": "主营业务收入",
            "num": 274.6,
            "unit": "亿元",
            "decimal": true // 有小数为true，没小数为false！
        },
        {
            "title": "利润总额",
            "num": 19,
            "unit": "亿元",
            "decimal": false // 有小数为true，没小数为false！
        },
        {
            "title": "出口交货值",
            "num": 21.6,
            "unit": "亿元",
            "decimal": true // 有小数为true，没小数为false！
        }
    ],
    "qytjData": [ // 企业统计
        {
            "title": "企业总数",
            "num": 315
        },
        {
            "title": "规上企业",
            "num": 89
        },
        {
            "title": "上市企业",
            "num": 2
        },
        {
            "title": "自建企业",
            "num": 142
        },
        {
            "title": "投产企业",
            "num": 261
        }
    ],
    "xmsbData": [ // 项目申报
        {
            "title": "已获批（个）",
            "num": 263
        },
        {
            "title": "获批资金（亿元）",
            "num": 3.77
        },
        {
            "title": "申请中（个）",
            "num": 40
        }
    ],
    "bzcfData": [ // 标准厂房
        {
            "title": "全年计划",
            "num": 263
        },
        {
            "title": "主体竣工",
            "num": 109.1
        },
        {
            "title": "在建",
            "num": 109.1
        }
    ],
    "circleData": { // 页面中间的图形，只能编辑，不能增减！！！！
        "park": "泰和工业园", // 前面的不要动，只改后面的中文就可以了
        "industry1": "其他产业",
        "industry2": "电子信息产业",
        "industry3": "绿色食品产业",
        "industry4": "装备制造产业"
    },
    "electricData": { // 用电负荷
        "charData": { // 折线图数据，可随意增减
            "today": [10,20,30,40,50,60], // 今日用电数据，和时间顺序一一对应
            "xAxis": ["10:00","10:30","11:00","11:30","12:00","12:30"], // 用电数据对应的时间
            "yesterday": [15,25,35,45,55,65] // 昨日用电数据，和时间顺序一一对应
        },
        "maxData": { // 右侧最大负荷数据
            "today": 14.5, // 今日最大负荷
            "todayTime": "11:30", // 今日最大负荷所处时间
            "yesterday": 24.5, // 昨日最大负荷
            "yesterdayTime": "11:30", // 昨日最大负荷所处时间
        }
    }
}
var qyhxData = { // 企业画像
    "yxzlList": [ // 经济运行总览
        {
            "title": "从业人员", // 分类名称，白色字体
            "value": 120, // 分类数值，黄色字体
            "unit": "个" // 单位，蓝色字体
        },
        {
            "title": "主营业务收入",
            "value": 120,
            "unit": "亿元"
        },
        {
            "title": "纳税总额",
            "value": 120,
            "unit": "亿元"
        },
        {
            "title": "利润率",
            "value": 120,
            "unit": "%"
        }
    ],
    "nhData": { // 企业单位生产总值能耗情况
        "xData": ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
        "data": [5, 8.5, 6.4, 7, 9.5, 6, 5, 6, 5, 6, 5, 6] // 和月份按顺序一一对应
    },
    "sclData": { // 全员劳动生产率
        "xData": ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
        "data": [5, 8.5, 6.4, 7, 9.5, 6, 5, 6, 5, 6, 5, 6] // 和月份按顺序一一对应
    },
    "zscqList": [ // 企业知识产权，可随意增减，排列顺序自己修改
        {
            "title": "商标", // 名称
            "value": 12 // 值
        }, // 修改顺序不要忘了逗号
        {
            "title": "专利",
            "value": 32
        },
        {
            "title": "证书资质",
            "value": 4
        },
        {
            "title": "作品著作",
            "value": 24
        },
        {
            "title": "软件著作",
            "value": 45
        },
        {
            "title": "网站域名",
            "value": 45
        }
    ],
    "qyfxData": { // 企业风险，可随意增减
        "xData": [ // 企业风险的分类，以及他的最大值
            {max: 10, name: "经营异常"},
            {max: 10, name: "清算信息"},
            {max: 10, name: "行政处罚"},
            {max: 10, name: "环保处罚"},
            {max: 10, name: "严重违法"},
            {max: 10, name: "抵押风险"},
            {max: 10, name: "公示催告"},
            {max: 10, name: "简易注销"},
            {max: 10, name: "税收风险"}
        ],
        "data": [ // 企业列表，如果要多个企业进行对比就下面花括号内容复制粘贴就可以，逗号隔开
            {
                "value": [5, 8, 6.4, 7, 9.5, 6, 5, 6, 5], // 某企业各项数值，和上面风险分类按顺序一一对应
                "name": 'xxx企业' // 企业名称，一般和下面comgpany里面的companyName一样
            } // 新增不要忘了逗号
        ]
    },
    "company": { // 企业名称
        "addressLatitude": "27.88", // 企业纬度，页面中间报读地图要用
        "addressLongitude": "114.3967", // 企业经度，页面中间报读地图要用
        "companyName": "宜春市袁州区市场和质量监督管理局", // 企业名称
        "logoUrl": "https://www.jx968969.com/resources/2018/06/04/90020180604134908808002000002635.png", // 企业logo图片，本地路径是：/XProject/static/image/cityDataCenter/common/ + 图片名称
        "ssqy": false, // 是否有上市企业证书，是为 true，不是为 false
        "lhrh": false, // 是否有两化融合证书
        "gxjs": false, // 是否有高新技术证书
        "zjtx": false, // 是否有上市企业证书
        "list": [ // 企业各项数据
            { "name": "企业税务信用", "value": "A"},
            { "name": "进出口信用", "value": "2"},
            { "name": "对外投资", "value": "3"},
            { "name": "绝对控股企业", "value": "4"},
            { "name": "行政许可", "value": "5"},
            { "name": "法律诉讼", "value": "6"},
            { "name": "招标股", "value": "7"},
            { "name": "地块公示", "value": "8"},
            { "name": "购地信息", "value": "9"},
            { "name": "土地转让", "value": "2"},
            { "name": "抽查检查", "value": "3"},
            { "name": "债券信息", "value": "4"},
            { "name": "新闻舆情", "value": "5"},
            { "name": "企业年报", "value": "6"}
        ]
    },
    "qycpList": [ // 企业产品，可随意增减
        {
            "title": "xxx企业",  // 鼠标移上去显示的名称
            "url": "/XProject/static/image/cityDataCenter/common/default.png" // 图片路径，记得在本地添加
        },
        {
            "title": "xxx企业",
            "url": "/XProject/static/image/cityDataCenter/common/default.png"
        },
        {
            "title": "xxx企业",
            "url": "/XProject/static/image/cityDataCenter/common/default.png"
        },
        {
            "title": "xxx企业",
            "url": "/XProject/static/image/cityDataCenter/common/default.png"
        }
    ],
    "ygzpList": [ // 用工招聘，可随意增减，但最少3个
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        },
        {
            "title": "普工、检修工",
            "num": 5,
            "time": "2019-05-12",
            "desc": "20-45岁，男女不限，能吃苦耐劳，身体健康，工资待遇：3000元以上；"
        }
    ],
    "qyglData": { // 企业关联图谱，不能增加，可以减少！！！！
        "point": [ // 图里的点
            { "title": '江西康舒陶瓷有限公司', "value": '江西康舒陶瓷\n有限公司'},// value是要显示的名称， 分行用 \n
            { "title": '江西嘉信瓷业有限公司', "value": '江西嘉信瓷业\n有限公司'},
            { "title": '陈国彬', "value": '陈国彬'},
            { "title": '张日平', "value": '张日平'},
            { "title": '江健群', "value": '江健群'}
        ],
        "line": [ // 图里连接点的线
            {
                "from": '江西嘉信瓷业有限公司', // 一般只需要修改这个，从哪里开始连接
                "to": '江西康舒陶瓷有限公司', // 议案都是指向当前企业，和comgpany里面的compangName一样
                "label": '股东' // 线上的文字
            },
            {
                "from": '陈国彬',
                "to": '江西康舒陶瓷有限公司',
                "label": '股东'
            },
            {
                "from": '张日平',
                "to": '江西康舒陶瓷有限公司',
                "label": '股东'
            },
            {
                "from": '江健群',
                "to": '江西康舒陶瓷有限公司',
                "label": '股东'
            }
        ]
    }
}