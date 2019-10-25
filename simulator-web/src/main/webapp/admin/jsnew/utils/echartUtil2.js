var echartUtil = {
		chart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption={
					title:{
						text: '设备访问次数趋势',
				        x : 'center'
					},
					grid:{
						x:40,
						y:60,
						x2:50,
						y2:50,
						containLabel:true,//全部显示y轴标签
						borderWidth:1	
					},
					 xAxis: {
					     type: 'category',
						 title: {
							enabled: false, 
							style: {color: "#300"}
					     },
				         axisLabel:{
				        	textStyle:{
				        		color:'#000'
				        	} 
				         },
				         data: option.categories
				    },
				     tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: ''//shadow这个是显示为柱形状 悬浮
				        }
				    },            
				    yAxis: {
				        type: 'value',				         
				        splitLine: {
				             show: false//分割线
				         },
			            axisLabel : {
			                formatter: function(value,index){
//			                	if(value>=1000){
//			                		value=value/1000+'k';
//			                	}
//			                	if(value.length>2){
//			                		value=value.substring(0,2)+"...";
//			                	}
			                	
			                	return value;
			                }
			            }

				    },
				    legend: {
							icon : 'roundRect',//icon为圆角矩形
							x: 'center',
							y: 'bottom',
							textStyle:{//图例文字的样式
								color:'#fff',
								fontSize:16
							}
						},
						
				    color: option.colors,
				    series: option.series
			}
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
		barChart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption={
					title:{
						text: '设备访问次数趋势',
				        x : 'center'
					},
					grid:{
						x:40,
						y:60,
						x2:50,
						y2:50,
						containLabel:true,//全部显示y轴标签,
						borderWidth:1	
					},
					 xAxis: {
				        type: 'value'
				    },
				     tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: ''//shadow这个是显示为柱形状 悬浮
				        }
				    },            
				    yAxis: {
				        type: 'category',
				        data: option.categories
				    },
				    legend: {
							icon : 'roundRect',//icon为圆角矩形
							x: 'center',
							y: 'bottom',
							textStyle:{//图例文字的样式
								color:'#fff',
								fontSize:16
							}
						},
						
				    color: option.colors,
				    series: option.series
			}
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
		pieChart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption= {
					title : option.title,
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
					legend : {
						orient : 'vertical',
						x : 'left'
					},
					calculable : true,
					series : option.series,
					itemStyle: { normal: { borderColor: "#FFFFFF", borderWidth: 1 }}
					,color: option.color
				};
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
}
