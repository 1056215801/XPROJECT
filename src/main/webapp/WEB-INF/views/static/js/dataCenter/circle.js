//数据


var data = {
    "children": [{
            "name": "健康档案数量",
            "children": [{
                "name": "建材业", 
                "size": 10.8,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "机电业",
                "size": 15.7,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "锂电产业",
                "size": 17.6,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "食品业",
                "size": 12.3,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "纺织服装业",
                "size": 9.9,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            },{
                "name": "化工", 
                "size": 7,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "医药业",
                "size": 9.7,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "有色冶炼",
                "size": 5,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "橡胶塑料制品",
                "size": 14.7,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }, {
                "name": "金属制品",
                "size": 8,
                "add": "11", //本月新增数
                "rate": "13%" //月增长率
            }],
            "size": 100,
            "add": "11", //本月新增数
            "rate": "13%" //月增长率
        }
    ]
};
//配色
var getFillColor = function(nodeName, isLeaf) {
    var fill = {};
    var recordArray = ["健康档案数量","建材业","机电业","锂电产业","食品业","纺织服装业","化工","医药业","有色冶炼","橡胶塑料制品","金属制品"]
    if (isLeaf) {
        fill.fillColor = {
            type: "radial",
            x: 0.5,
            y: 0.5,
            r: 0.5,
            colorStops: [{
                offset: 0,
                color: "#034e61" // 0% 处的颜色
            }, {
                offset: 0.7,
                color: "#086b87" // 70% 处的颜色
            }, {
                offset: 1,
                color: "#068ca3" // 100% 处的颜色
            }],
            globalCoord: false // 缺省为 false
        };
        fill.borderColor = "#03a1b3";
        fill.borderWidth = 2;
        fill.emphasisFillColor = {
            type: "radial",
            x: 0.5,
            y: 0.5,
            r: 0.5,
            colorStops: [{
                offset: 0,
                color: "#0a7998" // 0% 处的颜色
            }, {
                offset: 0.7,
                color: "#0b9ec8" //70% 处的颜色
            }, {
                offset: 1,
                color: "#09c2f6" // 100% 处的颜色
            }],
            globalCoord: false // 缺省为 false
        };
        fill.emphasisBorderColor = "#09c2f6";
        fill.emphasisborderWidth = 1;
    } else {
        fill.fillColor = "rgba(0, 252, 255, 0.1)";
        fill.borderColor = "rgba(11, 72, 115, 1)";
        fill.borderWidth = 1;
        fill.emphasisFillColor = "rgba(0, 252, 255, 0.1)";
        fill.emphasisBorderColor = "rgba(11, 72, 115, 1)";
        fill.emphasisborderWidth = 3;
    }
    return fill;
};

//渲染函数
var renderItem = function(params, api) {
    var fillObj = getFillColor(api.value(2), api.value(9));
    var textPosition = "inside";
    if (!api.value(9)) {
        if (api.value(1) == 1) {
            if (api.value(6) > api.getWidth() / 2) {
                textPosition = "right";
            } else {
                textPosition = "left";
            }
        } else {
            textPosition = "top";
        }
    }
    return {
        type: "circle",
        shape: {
            cx: api.value(6),
            cy: api.value(7),
            r: api.value(8)
        },
        z2: api.value(1) * 2,
        style: api.style({
            stroke: fillObj.borderColor,
            fill: fillObj.fillColor,
            textPosition: textPosition,
            lineWidth: fillObj.borderWidth
                //text: nodeName,
                // textFont: textFont,
                // textDistance : itemLayout.r,
        }),
        styleEmphasis: api.style({
            textPosition: textPosition,
            stroke: fillObj.emphasisBorderColor,
            fill: fillObj.emphasisFillColor,
            lineWidth: fillObj.emphasisborderWidth
        })
    };
};

var root = d3.hierarchy(data)
    .sum(function(d) {
        return d.size;
    })
    .sort(function(a, b) {
        return b.value - a.value;
    });
d3.pack()
    .size([420  , 300])
    .padding(0.5)(root);
var maxDepth = 0;
var nodeAll = root.descendants();
var nodes = nodeAll.filter(function(it) {
    return it.parent;
});

//获取各圆相关数据
var seriesData = nodes.map(function(node) {
    maxDepth = Math.max(maxDepth, node.depth);
    var color = "#ffffff";
    node.isLeaf = !node.children || !node.children.length;
    if (node.depth == 1) {
    	color = "rgba(14, 149, 156, 1)";
        return {
            value: [
                node.value,
                node.depth,
                node.data.name,
                node.data.size,
                node.data.add,
                node.data.rate,
                node.x,
                node.y,
                node.r,
                node.isLeaf
            ],
            label: {
                normal: {
                    show: true,
                    color: color,
                    formatter: function(params) {
                        return "{type|" + params.value[2] + "}\n{numAll|" + params.value[3] + "}\n{add|本月新增：" + params.value[4] + "}";
                    },
                    rich: {
                        type: {
                            fontSize: 14,
                            color: color
                        },
                        numAll: {
                            fontSize: 28,
                            padding: [5, 0, 5, 0],
                            color: color
                        },
                        add: {
                            fontSize: 14,
                            color: color
                        }
                    }
                }
            }
        }
    } else {
        if (node.data.name == "家庭医生签约" || node.data.name == "慢性病人管理数") {
            color = "rgba(222, 0, 155,1)";
        }
        return {
            value: [
                node.value,
                node.depth,
                node.data.name,
                node.data.size,
                node.data.add,
                node.data.rate,
                node.x,
                node.y,
                node.r,
                node.isLeaf
            ],
            label: {
                normal: {
                    show: true,
                    color: color,
                    position: "inside",
                    formatter: function(params) {
                        var result = "";
                        var nodeName = params.value[2];
                        if (params.value[9]) {
                            if (params.value[8] > 10) {
                                var trunText = echarts.format.truncateText(nodeName, 2 * params.value[8], {
                                    fontSize: 14,
                                    fontFamily: "微软雅黑"
                                }, '.');
                                if (trunText.indexOf(".") > 0) {
                                    var strindex1 = nodeName.indexOf("患者");
                                    var strindex2 = nodeName.indexOf("管理数");
                                    if (strindex1 > 0) {
                                        result += "{type|" + nodeName.substring(0, strindex1) + "}";
                                    } else {
                                        result += "{type|" + nodeName.substring(0, strindex2) + "}";
                                    }
                                } else {
                                    result += "{type|" + nodeName + "}";
                                }
                                if (params.value[8] > 45) {
                                    result += "\n{num|" + params.value[3] + "}";
                                }
                            }
                        } else {
                            result += "{type|" + params.value[2] + "}";
                        }
                        return result;
                    },
                    rich: {
                        type: {
                            fontSize: 12,
                            padding: [5, 0, 5, 0],
                            color: color
                        },
                        num: {
                            fontSize: 16,
                            color: color
                        }
                    }
                }
            }
        }
    }
});

//echarts 配置
var circle = {
	grid: {
    	bottom:'5%',
    	width:'90%',
    	left:'5%',
    	rigth:'5%',
        containLabel: true
    },
    xAxis: {
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            show: false
        },
        splitLine: {
            show: false
        }
    },
    yAxis: {
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        axisLabel: {
            show: false
        },
        splitLine: {
            show: false
        }
    },
    tooltip: {
        backgroundColor: "rgba(50,50,50,0.95)",
        formatter: function(params) {
            var size = ("" + params.value[3]).replace(/\d{1,3}(?=(\d{3})+$)/g, "$&,");
            var add = ("" + params.value[4]).replace(/\d{1,3}(?=(\d{3})+$)/g, "$&,");
            var result = "<span>" + params.value[2] + "</span><br>" +
                "<span style = 'line-height:30px;font-size : 25px; font-weight:bold;'>" + size + "</span></br>" +
                "<div>" +
                "<div style = 'float : left; padding-right:20px; border-right: solid 1px #4c4a4a;'>" +
                "<span >本月新增</span></br>" +
                "<span style = 'color : red; '>" + add + "</span>" +
                "</div>" +
                "<div style = 'float : right; margin-left:20px;'>" +
                "<span style = 'width : 100px;'>月增长率</span></br>";
            if (params.value[5] > 0) {
                result += "<span style = 'color : red;  width : 100px;'>+" + params.value[5] + "</span>"
            } else {
                result += "<span style = 'color : red;  width : 100px;'>" + params.value[5] + "</span>"
            }
            result += "</div>" +
                "</div>";
            return result;
        }
    },
    series: {
        type: "custom",
        renderItem: renderItem,
        data: seriesData
    }
};