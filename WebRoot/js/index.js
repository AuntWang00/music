	//轮播图
	jQuery.foucs({ direction: 'left' });
	
	//tab切换
	var $div_li =jQuery("div.tab_menu ul li");
	$div_li.mousemove(function(){
		jQuery(this).addClass("selected")    
			   .siblings().removeClass("selected");  
		var index =  $div_li.index(this); 
		jQuery("div.tab_box > div").eq(index).show().siblings().hide(); 
	});
	jQuery(".mvalbum li a.img").mousemove(function(){
		jQuery(this).parent().find("a.play").show();
	});
	jQuery(".mvalbum li").mouseleave(function(){
		jQuery(this).find("a.play").hide();
	});
	//首页专题
	var page = 1;
    var i = 1; 
    //向后 按钮
    jQuery(".weekSinger .next").click(function(){    //绑定click事件
	     var $parent = jQuery(this).parents("div.weekSinger");//根据当前点击元素获取到父元素
		 var $v_show = $parent.find("div.scroll"); //寻找到“视频内容展示区域”
		 var $v_content = $parent.find("div.content"); //寻找到“视频内容展示区域”外围的DIV元素
		 var v_width = $v_content.width() ;
		 var len = $v_show.find(".singer").length;
		 var page_count = Math.ceil(len) ;   //只要不是整数，就往大的方向取最小的整数
		 if( !$v_show.is(":animated") ){    //判断“视频内容展示区域”是否正在处于动画
			  if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
				$v_show.animate({ left : '0px'}, "slow"); //通过改变left值，跳转到第一个版面
				page = 1;
			  }else{
				$v_show.animate({ left : '-='+v_width }, "slow");  //通过改变left值，达到每次换一个版面
				page++;
			 }
		 }
    });
    //往前 按钮
    jQuery(".weekSinger .prev").click(function(){
    	 self.clearInterval(timer);
	     var $parent = jQuery(this).parents("div.weekSinger");//根据当前点击元素获取到父元素
		 var $v_show = $parent.find("div.scroll"); //寻找到“视频内容展示区域”
		 var $v_content = $parent.find("div.content"); //寻找到“视频内容展示区域”外围的DIV元素
		 var v_width = $v_content.width();
		 var len = $v_show.find(".singer").length;
		 var page_count = Math.ceil(len) ;   //只要不是整数，就往大的方向取最小的整数
		 if( !$v_show.is(":animated") ){    //判断“视频内容展示区域”是否正在处于动画
		 	 if( page == 1 ){  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
				$v_show.animate({ left : '-='+v_width*(page_count-1) }, "slow");
				page = page_count;
			}else{
				$v_show.animate({ left : '+='+v_width }, "slow");
				page--;
			}
		}
		timer = setInterval('jQuery(".weekSinger .next").trigger("click")',5000);
    });
    var timer = setInterval('jQuery(".weekSinger .next").trigger("click")',5000);
	//歌曲排行榜
	jQuery(".line").hover(function(){
		jQuery(this).addClass("current");
	},function(){
		jQuery(this).removeClass("current");
	});
	//ipad弹出浮层
	if(window.location.href.indexOf("src=ipad")>-1){
		document.getElementById('tips_b').style.display='block';
	}
    function logDown(pro){
    	var img = new Image();
    	var t=new Date().getTime();
    	img.src = 'http://webstat.kuwo.cn/www/musicdown_' + pro + '.gif?t=' + t;
    }
    function downTj(pro){
    	var img = new Image();//pro=down/pro=click
    	img.src ='http://webstat.kuwo.cn/logtj/comm/commjstj/www/musicdown_' + pro + '.jpg';
    }
