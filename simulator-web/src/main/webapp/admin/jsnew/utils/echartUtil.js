var echartUtil = {
		
//chart：适用lineChart,areaLineChart,columnChart柱形图
		chart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption={
					title:{
						text: option.title,
					       x : 'center'
					},
					tooltip: {
					       trigger: 'axis',
					       axisPointer: {
					           type: ''//shadow这个是显示为柱形状 悬浮
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
					calculable: true,
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
					yAxis: {
					     type: 'value',				         
					     splitLine: {
					          show: false//分割线
					      },
					      axisLabel : {
					          formatter: function(value,index){
					          	return value;
					          }
					      }
					},
					series: option.series,
					color: option.colors,
					grid:{
						x:40,
						y:60,
						x2:50,
						y2:50,
						containLabel:true,//全部显示y轴标签
						borderWidth:1	
					 }
			};
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
		
//barChart：适用barChart条形图
		barChart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption={
					title:{
						text: option.title,
					       x : 'center'
					},
					tooltip: {
					    trigger: 'axis',
					    axisPointer: {
					        type: ''//shadow这个是显示为柱形状 悬浮
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
					calculable: true,
					xAxis: {
						type: 'value'
					},
					yAxis: {
					    type: 'category',
					    data: option.categories
					},
					series: option.series,
					color: option.colors,
					grid:{
						x:40,
						y:60,
						x2:50,
						y2:50,
						containLabel:true,//全部显示y轴标签,
						borderWidth:1	
					}
			};
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
		
//pieChart：适用pieChart饼图
		pieChart:function(option, div_id) {
			var myChar=echarts.init(document.getElementById(div_id));
			var myOption= {
					title :{
						text: option.title,
					    x : 'center'
					},
					tooltip : {
					    trigger: 'item',
					    formatter: "{a} <br/>{b} : {c} ({d}%)"
					},
					legend : {
						orient : 'vertical',
						x : 'left'
					},
					calculable: true,
					series: option.series,
					color: option.color,
					itemStyle: { 
						normal: { borderColor: "#FFFFFF", borderWidth: 1 }
					}
			};
			myChar.setOption(myOption);
			myChar.on('click',option.click);
		},
}