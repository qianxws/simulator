//拖拽
var drag = {

    div_id : null,  	//允许放置的容器
	permitDrag : false,	//是否允许移动标识
	allowPut : false,	//是否允许放置
	callback : null,	//松开后的回调方法
	myTree : null,		//操作的树对象

	_x : 0,             //节点x坐标
    _y : 0,			    //节点y坐标
    _left : 0,          //光标与节点坐标的距离
    _top : 0,           //光标与节点坐标的距离

    old_elm : null,     //拖拽原节点
    tmp_elm : [],     	//跟随光标移动的临时节点
    temp_ul : null, 	//转载临时节点的ul
    drag_ids : [],		//移动的节点id

    //初始化
    init : function (div_id){
    	//操作的树对象
    	drag.myTree = $.fn.zTree.getZTreeObj("temp-temp");
    	
    	drag.temp_ul = $('<ul class="ztree"></ul>');
        //允许拖拽节点的父容器的classname(可按照需要，修改为id或其他)
        drag.div_id = div_id;

        //监听鼠标按下事件，动态绑定要拖拽的节点（因为节点可能是动态添加的）
        $('#' + drag.div_id).on('mousedown', 'ul li', function(event){
   		 	//当在允许拖拽的节点上监听到点击事件，将标识设置为可以拖拽
            drag.permitDrag = true;
			//获取到拖拽的原节点对象
            drag.old_elm = $(this);
            //区别点击事件
        	setTimeout(function(){
        		if (drag.permitDrag){
                    //执行开始拖拽的操作
                    drag.mousedown(event);
        		}
        	}, 240);
        	return false;
        });

        //监听鼠标移动
        $(document).mousemove(function(event){
            //判断拖拽标识是否为允许，否则不进行操作
            if(drag.permitDrag){
            	//执行移动的操作
                drag.mousemove(event);
            }
        });

        //监听鼠标放开
        $(document).mouseup(function(event){
            //判断拖拽标识是否为允许，否则不进行操作
            if(drag.permitDrag && drag.old_elm){
            	 //执行拖拽结束后的操作
                drag.mouseup(event);
                //拖拽结束后恢复标识到初始状态
                drag.permitDrag = false;
            }
        });
        
    },

	//按下鼠标 执行的操作
	mousedown : function (event){
		//当前点击节点拖拽节点
		var id = drag.old_elm.attr('id');
		var node = drag.myTree.getNodeByTId(id);
		//获得所有选中节点
		var selectNodes = drag.myTree.getSelectedNodes();
		
		if (!node){
			drag.permitDrag = false;
			return false;
		}
		if (selectNodes && selectNodes.length > 0){
			var isSelect = false;
			for (var i in selectNodes){
				if (selectNodes[i].tId == node.tId){
					isSelect = true;
				}
			}
			if (!isSelect){
				//取消选中节点
				drag.myTree.cancelSelectedNode();
				//选中当前节点
				drag.myTree.selectNode(node);
				selectNodes = [];
				selectNodes.push(node);
			}
		}else {
			//选中当前节点
			drag.myTree.selectNode(node);
			selectNodes = [];
			selectNodes.push(node);
		}
		
		//克隆选中节点
		drag.tmp_elm = [];
		drag.drag_ids = [];
		for (var i in selectNodes){
			var clone_temp = $('#' + selectNodes[i].tId).clone();
			clone_temp.find('ul').remove();
			drag.tmp_elm.push(clone_temp);
			drag.drag_ids.push(selectNodes[i].id);
		}
        
        //2.计算 节点 和 光标 的坐标
        drag._x = event.clientX - $('#sidebar').width() - 10;
        drag._y = event.clientY + $(document).scrollTop() - 100;

        var e = event || window.event;
        drag._left = e.pageX - drag._x;
        drag._top = e.pageY - drag._y;

        //3.修改克隆节点的坐标，实现跟随鼠标进行移动的效果
        for (var j in drag.tmp_elm){
        	var temp = drag.tmp_elm[j];
        	drag.temp_ul.append(temp);
        }
        drag.temp_ul.css({
            'position' : 'absolute',
            'background-color' : '#eee',
            'border': '1px dotted #020202',
            'left' : drag._x,
            'top' : drag._y,
            'cursor' : drag.allowPut ? 'pointer': 'not-allowed'
        });
        $('#data-show-content').append(drag.temp_ul);
        /*
        //4.添加临时节点
        tmp = $('#data-show-content').append(drag.tmp_elm);
        drag.tmp_elm = $(tmp).find(drag.tmp_elm);
        //$(drag.tmp_elm).css('cursor', (drag.allowPut ? 'pointer': 'not-allowed'));
        $(drag.tmp_elm).find('span').css('cursor', (drag.allowPut ? 'pointer': 'not-allowed'));
        */
	},

	//移动鼠标 执行的操作
	mousemove : function (event){

        //2.计算坐标
        var e = event || window.event;
        var x = e.pageX - drag._left;
        var y = e.pageY - drag._top;
        var maxL = $(document).width() - $(drag.old_elm).outerWidth();
        var maxT = $(document).height() - $(drag.old_elm).outerHeight();
        //不允许超出浏览器范围
        x = x < 0 ? 0: x;
        x = x > maxL ? maxL: x;
        y = y < 0 ? 0: y;
        y = y > maxT ? maxT: y;

        //3.修改克隆节点的坐标
        drag.temp_ul.css({
            'left' : x,
            'top' : y,
        });
	},

    //放开鼠标 执行的操作
    mouseup : function (event){
		//移除临时节点
    	drag.temp_ul.empty();
    	drag.temp_ul.remove();
    	if (drag.permitDrag && drag.allowPut){
    		//获取容器的坐标范围 (区域)
            var e = event || window.event;
    		var content = $('#datashow_div');
            var box_x = content.offset().left;     //容器左上角x坐标
            var box_y = content.offset().top;      //容器左上角y坐标
            var box_width = content.outerWidth();  //容器宽
            var box_height = content.outerHeight();//容器高
            
            //判断放开鼠标位置是否想允许放置的容器范围内
            if(e.pageX > box_x && e.pageX < box_x-0+box_width && e.pageY > box_y && e.pageY < box_y-0+box_height){
	            //回调
	            if (drag.callback){
	            	drag.callback(drag.drag_ids);
	            }
            }
    	}
    	drag.old_elm = null;
    },
};