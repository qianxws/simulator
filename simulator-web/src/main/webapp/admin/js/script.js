/**
 * Created by Useristrator on 2017/2/7.
 */

var navs;
var pages;

var top="<div class='ks-top col-md-12 column ui-sortable'><span class='area_name'>top</span></div>";
var left='<div class="ks-left col-md-4 column ui-sortable"><span class="area_name">left</span></div>';
var left6='<div class="ks-left col-md-6 column ui-sortable"><span class="area_name">left</span></div>';
var left8='<div class="ks-left col-md-8 column ui-sortable"><span class="area_name">left</span></div>';
var left12='<div class="ks-left col-md-12 column ui-sortable"><span class="area_name">left</span></div>';
var center='<div class="ks-center col-md-4 column ui-sortable"><span class="area_name">center</span></div>';
var center6='<div class="ks-center col-md-6 column ui-sortable"><span class="area_name">center</span></div>';
var center8='<div class="ks-center col-md-8 column ui-sortable"><span class="area_name">center</span></div>';
var center12='<div class="ks-center col-md-12 column ui-sortable"><span class="area_name">center</span></div>';
var right='<div class="ks-right col-md-4 column ui-sortable"><span class="area_name">right</span></div>';
var right6='<div class="ks-right col-md-6 column ui-sortable"><span class="area_name">right</span></div>';
var right8='<div class="ks-right col-md-8 column ui-sortable"><span class="area_name">right</span></div>';
var right12='<div class="ks-right col-md-12 column ui-sortable"><span class="area_name">right</span></div>';
var bottom="<div class='ks-bottom col-md-12 column ui-sortable'><span class='area_name'>bottom</span></div>";

function removeElm() {
    $(".demo").delegate(".remove", "click",
        function(e) {
            e.preventDefault();
            $(this).parent().remove();
            if (!$(".demo .lyrow").length > 0) {
                clearDemo();
            }
        });
}
function clearDemo() {
    $(".demo").empty();
}


function cleanHtml(e) {
    $(e).parent().append($(e).children().html());
}

function drag(ev)
{
	var target_e = ev.target || ev.srcElement;
	//获取元数据字段以及对应的元数据库，格式:元数据字段【元数据库】
	var datadb = $(target_e).parent().parent().prev("li").text();
    ev.dataTransfer.setData("Text",$(target_e).text()+'【'+datadb+'】');
}

function dragover(ev)
{
	if(ev && ev.preventDefault ){ 
	    ev.preventDefault();
    } else { 
    	window.event.returnValue = false;
    } 
}

function drop(ev)
{
	if(ev && ev.preventDefault ){ 
	    ev.preventDefault();
    } else { 
    	window.event.returnValue = false;
    } 
	
    var datavalue = ev.dataTransfer.getData("Text");
    ev.target.value = datavalue;
    
    return false;
}

//保存模版配置
function saveModule(){
	var moduleArr = {top:[],
			left:[],
			center:[],
			right:[],
			bottom:[]};
	 
	$(".demo").find(".area_name").each(function(){
		//获取区域信息
		 var area_name = $(this).text();
		 
		 $(this).parent().find(".box").each(function(){
			 var mssobj = {};
			 mssobj.id= $(this).find(".preview").text();
			 $(this).find(".column-content").children().each(function(){
					 $(this).children().each(function(){
						 if($(this).val() && $(this).val()!=''){
							 var attrname = $(this).attr('name');
							 mssobj[attrname] = $(this).val();
						 }
				});
				
			 });
			 
			 moduleArr[area_name].push(mssobj);
		 });
		
	});
	
	//保存配置信息JSON--》moduleArr
	 alert(JSON.stringify(moduleArr));
}

//从数据库获取JSON并初始化页面布局
function initLayout(jsonarr,navs,arrs){
	jsonarr = '{"top":[],"left":[],"center":[{"id":"分面","fieldType":"0","mssField":"keywords【network_asked】","c_name":"if_public【network_asked】","showLable":"T"},{"id":"分面图片","bbb":"answer_time【network_asked】","field":"question_time【network_asked】"}],"right":[],"bottom":[]}';
	var json_layout = eval("("+jsonarr+")");
	//获取布局
	for(var laykey in json_layout){
		if(eval(json_layout[laykey]).length>0){
			
			for(var i=0;i<eval(json_layout[laykey]).length;i++){
				
				var layobj = eval(json_layout[laykey])[i];
				
				var code_rep = '';
				
				//获取ID
				var moduleid = layobj.id;
				
				for(var n=0;n<navs.length;n++){
					if(navs[n].id==moduleid){
						var layout = navs[n].code;
						
					    code_rep += "<div class='box zj-"+n+" ui-draggable' style='position: relative; opacity: 1; width: 100%;'>\
        			    <a href='#close' class='remove label label-danger'>\
        			        <i class='glyphicon glyphicon-remove'></i>\
        			        删除\
        			        </a>\
        			        <span class='drag label label-default'>\
        			        <i class='glyphicon glyphicon-move'></i>\
        			        拖动\
        			        </span>\
        			        <div class='preview'>"+navs[n].id+"</div>\
        			        <div class='view'>\
        			        <div class='row1 clearfix'>\
        			        <div class='col-md-12 column-content'>"+layout+"\
        			        </div>\
        			        </div>\
        			        </div>\
        			        </div>";
					}
				}
					
				//初始化参数值
				$(".area_name").each(function(){
					if($(this).text()==laykey){
						if(code_rep!=''){
							$(this).parent().append(code_rep);
							
							for(var okey in layobj){
								if(okey!='id'){
									$(this).parent().last(".column-content").find("[name='"+okey+"']").val(layobj[okey]);
								}
							}
						}
					}
				});
			}
			
		}
	}
}

//切换模版
function chagesection(obj){
    var arr=[];
    if(pages[$(obj).val()]){
    	 for(var key in pages[$(obj).val()].layout){
    	        arr.push(key);
    	    }
    }
    var vrr=[];
    if(pages[$(".select-mb").val()]){
    	 for(var key in pages[$(".select-mb").val()].layout){
    		 vrr.push(pages[$(".select-mb").val()].layout[key]);
         };
    }
    //获取各区域中的文本信息
    layoutElement(vrr);
    
    pageLayout(arr);
    
    var jsonarr = '';
    //初始化拖拽的内容信息
    initLayout(jsonarr,navs,arr);
    
    alltuo();
}

function alltuo(){
    $(".sidebar-nav .box").draggable({
        connectToSortable: ".column",
        helper: "clone",
        handle: ".drag",
        opacity: 0.35,
        drag: function(e, t) {
            t.helper.width("100%");
        },
        stop: function() {
        	var moduleid = $(event.target).parent().find(".preview").text();
        	var area = $(event.target).parent().parent().find("span.area_name").text();
        	
        	//如果当前位置不为当前拖动元素的可用区域，则允许拖入
        	if(eval(pages[$(".select-mb").val()].layout)[area].indexOf(moduleid)==-1){
        		//删除当前的拖拽条目,触发删除方法
        		
        		 
        	}
        }
    });
    $(".demo .column").sortable({
        connectWith: ".column",
        opacity: 1,
        handle: ".drag"
    });
}

function pageLayout(arr){
	var cstr="";
    if(arr.indexOf('top')>-1){
    	cstr=top;
        $('.shang').html(cstr);
    }else{
        $('.shang').html('');
    }
    if(arr.indexOf('left')>-1&&arr.indexOf('center')>-1&&arr.indexOf('right')>-1){
        cstr=left+ center+ right;
        $('.zhong').html(cstr);
    }else if(arr.indexOf('left')>-1&&arr.indexOf('center')>-1){
        cstr=left6+center6;
        $('.zhong').html(cstr);
    }else if(arr.indexOf('center')>-1&&arr.indexOf('right')>-1){
        cstr=center6+right6;
        $('.zhong').html(cstr);
    }else if(arr.indexOf('left')>-1&&arr.indexOf('right')>-1){
        cstr=left6+right6;
        $('.zhong').html(cstr);
    }else if(arr.indexOf('left')>-1){
        $('.zhong').html(left12);
    }else if(arr.indexOf('center')>-1){
        $('.zhong').html(center12);
    }else if(arr.indexOf('right')>-1){
        $('.zhong').html(right12);
    }else{
        $('.zhong').html('');
    }
    
    if(arr.indexOf('bottom')>-1){
        $('.xia').html(bottom);
    }else{
        $('.xia').html('');
    }
}

Array.prototype.contains = function (element) { 
	for (var i = 0; i < this.length; i++) { 
		if (this[i] == element) { 
		return true; 
		} 
	} 
	return false; 
} 

function layoutElement(arr){
	var zj="";
    var zimianarr=[];
    for(var i=0;i<arr.length;i++){
    	for(var j=0;j<arr[i].length;j++){
    		for(var k=0;k<navs.length;k++){
    			if(arr[i][j]==navs[k].id){
    				//去重
    				if(!zimianarr.contains(navs[k].id)){
    					zj +="<div class='box zj-"+k+"'>\
        			    <a href='#close' class='remove label label-danger'>\
        			        <i class='glyphicon glyphicon-remove'></i>\
        			        删除\
        			        </a>\
        			        <span class='drag label label-default'>\
        			        <i class='glyphicon glyphicon-move'></i>\
        			        拖动\
        			        </span>\
        			        <div class='preview'>"+navs[k].id+"</div>\
        			        <div class='view'>\
        			        <div class='row1 clearfix'>\
        			        <div class='col-md-12 column-content'>"+navs[k].code+"\
        			        </div>\
        			        </div>\
        			        </div>\
        			        </div>";
        			        zimianarr.push(navs[k].id);
    				}
    			}
    		}
    	}
    }
    $("#elmComponents").html(zj);
}

function getConfigXml(sitename){
	$.get("template/"+sitename+"/config.xml",function(data){
		navs=xmlToJson(data).models;
        
        pages=xmlToJson(data).pages;
        
        var arr=[];
        if(pages[$(".select-mb").val()]){
        	 for(var key in pages[$(".select-mb").val()].layout){
                 arr.push(key);
             };
        }
        //获取位置区域
        pageLayout(arr);
        
        var vrr=[];
        if(pages[$(".select-mb").val()]){
        	 for(var key in pages[$(".select-mb").val()].layout){
        		 vrr.push(pages[$(".select-mb").val()].layout[key]);
             };
        }
        //获取各区域中的文本信息
        layoutElement(vrr);
        
        var jsonarr='';
        //初始化拖拽的内容信息
        initLayout(jsonarr,navs,arr);
        
        //组件1可拖拽至 top left
        var a=$(".select-mb").val();
        alltuo();
        //tuo(a)
        
      /*  function tuo(a){
            var karr=[];

            for(var key in pages[a].layout){
                for(var i=0; i<pages[a].layout[key].length; i++){
                    var b=zimianarr.indexOf(pages[a].layout[key][i]);
                    var zuobj={
                        b:b,
                        key:key
                    };
                    karr.push(zuobj);
                    console.log(karr);
                    $(".sidebar-nav .zj-"+b+"").draggable({
                        connectToSortable: ".ks-"+key+"",
                        helper: "clone",
                        handle: ".drag",
                        drag: function(e, t) {
                            t.helper.width(400)
                        },
                        stop: function() {
                            handleJsIds()
                        }
                    });
                    $(".demo .column").sortable({
                        connectWith: ".column",
                        opacity: .35,
                        handle: ".drag"
                    });
                }

            };

            var aarr=[];

            for(var j=0; j<karr.length; j++){
                aarr.push(karr[j].b);
            }
            console.log(aarr);

            var qqq=repet(aarr);
            console.log(qqq);
            var weizhi=weizhi(qqq);
            for(v=0; v<weizhi.length; v++){
                karr[weizhi[v]].b
            }

            function weizhi(qqq){
                var keyarr=[];
                for(var j=0; j<qqq.length; j++){
                    var a=j
                    for(var i=0; i<aarr.length; i++){
                        if(aarr[i]==qqq[j] && aarr[i]==karr[i].b){
                            keyarr.push(i);

                        }
                    }
                }
                return keyarr;
            }

            function repet(arr){
                var obj = {}
                for(var i=0;i<arr.length;i++)
                {
                    var item = arr[i];
                    if(obj[item]==null)obj[item] = 1;
                    else obj[item] = obj[item]+1;
                }
                var arr=[];
                for(a in obj)
                {
                    var item = obj[a];
                    if(item>1){
                        arr.push(a);
                    }
                }
                return arr;
            }
        }*/
    });
}


$(window).resize(function() {
    $("body").css("min-height", $(window).height() - 90);
    $(".demo").css("min-height", $(window).height() - 160);
});

$(document).ready(function() {

    $("body").css("min-height", $(window).height() - 90);
    $(".demo").css("min-height", $(window).height() - 160);
    //获取模版底下的模版文件(btl文件)
    getConfigXml('aaa');

    JqdeMods.ajax('pmpSectionAction', 'getMetadbInfoListBySectionCode',{'sectionCode':'xxgk'}).then(function (result) {
    	var obj=result.obj;
        var str="<ul>";
        for(var i=0; i<obj.length; i++){
            for(var key in obj[i]) {
                str += "<li class='nav-header'>"+key+"</li>";
                str +="<li class='boxes'>";
                for(var j=0; j<obj[i][key].length; j++){
                    str +="<div class='box1'>" +

                            "<div class='bo' ondragstart='drag(event)' draggable='true'>"+
                        ""+obj[i][key][j].id+""+
                            "</div>"+

                        "</div>";
                }
                str +="</li>";
            }
        }
        str +="</ul>";
        $(".nav-leftt").html(str);
        $(".boxes:gt(0)").hide();
        $(".nav-header").on("click",function() {
            
            $(this).siblings().each(function(){
            	if($(this).hasClass("boxes")){
            		$(this).hide();
            	}
            });
            
            $(this).next().slideDown();
        });
    });
    removeElm();

});
