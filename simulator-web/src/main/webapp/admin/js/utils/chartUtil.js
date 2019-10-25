var chartUtil = {
		lineChart:function(option, div_id) {
			$('#' + div_id).highcharts({
				colors : option.colors,
				chart : option.chart,
				title : {text : option.title},
		        exporting : {enabled : false},
		        credits: {enabled: false},
		        legend : {
		        	enabled : 'true', layout : 'horizontal', align : 'center', vertivalAlign: 'top',
		        	itemStyle:{color:'#cacbce',fontSize:'10px'},
		            //小圆点
		            symbolHeight:8,
		            symbolWidth:6,
		            symbolRadius:6,
		            itemMarginTop:0 
		        },
				xAxis: {
		            categories: option.categories,
		            tickmarkPlacement: "on",
		            title: {enabled: false, style: {color: "#cacbce"}},
		            labels: {style: {color: "#b4dcf3"}}
		        },
		        yAxis: {
		        	title: {text: ""},
		            labels: {
		                style: {color: "#cacbce"}
		            },
		            lineWidth:2,
		            gridLineWidth: 0
		        },
		        tooltip: option.tooltip,
		        series:option.series
			});
		},
		columnChart:function(option, div_id) {
			$('#' + div_id).highcharts({
	            chart: {
	                type: "column",
	                backgroundColor: "none"
	            },
	            credits: {
	                enabled: !1
	            },
	            title: {
	                text: option.title,
	                style: {
	                    color: "#fff"
	                },
	                y: 20
	            },
	            subtitle: {
	                text: " "
	            },
	            xAxis: {
	                categories: option.categories,
	                labels: {
	                    style: {
	                        color: "#fff"
	                    }
	                },
	                crosshair: !0
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: " "
	                },
	                labels: {
	                    style: {
	                        color: "#fff"
	                    }
	                },
	                tickPixelInterval: 50
	            },
	            tooltip: option.tooltip,
	            plotOptions: {
	                column: {
	                    pointPadding: .2,
	                    borderWidth: 0,
	                    colorByPoint: !0,
	                    colors: ["#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"]
	                },
	                series: {
	                    showInLegend: !1
	                }
	            },
	            series: option.series
			});
		},
		barChart:function(option, div_id) {
			$('#' + div_id).highcharts({
		           chart: {
		                type: "bar",
		                backgroundColor: "none",
		                // marginTop: 100
		            },
		            credits: {
		                enabled: !1
		            },
		            title: {
		                text: "",//"影片票房排名",
		                style: {
		                    color: "#fff"
		                }
		            },
		            subtitle: {
		                text: " "
		            },
		            legend: {
		                enabled:false
		            },
		            xAxis: {
		                categories: option.categories,
		                labels: {
		                    style: {
		                        color: "#fff",
		                        fontSize: "12px"
		                    },
		                    rotation: 0,
		                    staggerLines: 1
		                },
		                crosshair: !0

		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: " "
		                },
		                labels: {
		                    style: {
		                        color: "#fff",
		                        fontSize:0
		                    }
		                },
		                tickPixelInterval: 50,
		                gridLineWidth: 0
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td><td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
		                footerFormat: "</table>",
		                shared: !0,
		                useHTML: !0
		            },
		            plotOptions: {
		                column: {
		                    pointPadding: .2,
		                    borderWidth: 0,
		                }
		            },
		            series: option.series
			});
		},
		pieChart:function(option, div_id) {
			$('#' + div_id).highcharts({
	            chart: {
	                type: "pie",
	                backgroundColor: "none",
	                options3d: {
	                    enabled: !0,
	                    alpha: 45
	                }
	            },
	            credits: {
	                enabled: !1
	            },
	            title: {
	                text: "",//"前日"+date+"影片票房排名",
	                style: {
	                    color: "#fff"
	                }
	            },
	            subtitle: {
	                text: ""
	            },
	            legend: {
	                layout: "vertical",
	                align: "left",
	                verticalAlign: "middle",
	                borderWidth: 0,
	                itemMarginBottom:10,
	                itemStyle: {
	                    color: "#c1cfdf"
	                },
	                itemHoverStyle: {
	                    color: "#fff"
	                },
	                squareSymbol:true,
	            },
	            plotOptions: {
	                pie: {
	                    innerSize: 100,
	                    depth: 45,
	                    allowPointSelect: !0,
	                    cursor: "pointer",
	                    dataLabels: {
	                        enabled: !0,
	                        padding: 0,
	                        borderWidth: 0,
	                        color: "#fff"
	                    },
	                    showInLegend: !0,
	                    innerSize: "50"
	                }
	            },
	            series: option.series
			});
		}
}

