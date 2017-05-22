

$(function(){
	
	$(window).resize(function(){
		var h = $(window).height();
		var w = $(window).width();
		var bg = $(".main .bg");
		bg.width(w);
		bg.height(h);
	});
	
	$(".content .login .switch ul li").click(function(){
		$(this).addClass(".switch ul li").siblings().removeClass();
		var index=$(this).index();
		$(".main .content .login .web_login > div").eq(index).show().siblings().hide();
		var index=$(".switch ul li").index(this);
		var width=$(".switch ul li").width();
		$(".main .content .login .switch .switch_bg ").stop().animate({left:index*width},500)
		});
	
	var length, 
	currentIndex = 0, 
	interval, 
	hasStarted = false, //是否已经开始轮播 
	t = 3000; //轮播时间间隔 
	length = $('.tu').length; 
	//将除了第一张图片隐藏 
	$('.tu:not(:first)').hide(); 
	//将第一个slider-item设为激活状态 
	$('.pointer:first').addClass('pointer-selected'); 
	//隐藏向前、向后翻按钮  
	$('.pointer').hover(function(){ 
		stop(); 
		var preIndex = $(".pointer").filter(".pointer-selected").index(); //filter改变所有类名为.slider-item-selected的属性
		currentIndex = $(this).index(); 
		play(preIndex, currentIndex); 
	}, function(){ 
		start(); 
	});  
	/** 
	 * 从preIndex页翻到currentIndex页 
	 * preIndex 整数，翻页的起始页 
	 * currentIndex 整数，翻到的那页 
	 */
	function play(preIndex, currentIndex){ 
		$('.tu').eq(preIndex).fadeOut(500) 
		.parent().children().eq(currentIndex).fadeIn(1000); 
		$('.pointer').removeClass('pointer-selected'); 
		$('.pointer').eq(currentIndex).addClass('pointer-selected'); 
	} 
	/** 
	 * 开始轮播 
	 */
	function start(){ 
		if(!hasStarted){ 
			hasStarted = true; 
		} 
	} 
	/** 
	 * 停止轮播 
	 */
	function stop() { 
		clearInterval(interval); 
		hasStarted = false; 
	} 
	//开始轮播 
	start();
	/*
	var input = $("input");
	var error = $(".error:first");
	input.blur(function(){
		that = $(this),
		val = $.trim(that.val()),
		type = that.attr("type");
		if ((/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(val) && type == "text") || (/[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,18}$/.test(val) && type == "password")) {
          	error.addClass("hidden");
        } else {
 			that.val("");
         	error.removeClass("hidden");
		}
	});
	*/
	
	$("#login").click(function() {
		var url = $("#loginform").attr("action");
		var path = $("#loginform").attr("path");
		var username = $("#loginform input[name='username']").val().trim();
		var password = $("#loginform input[name='password']").val().trim();
		if(username == ''){
			$.alert({title:"信息提示",content:"请输入用户名！",type:"red"});
			return;
		}
		if(password == ''){
			$.alert({title:"信息提示",content:"请输入密码！",type:"red"});
			return;
		}
		/*
        var empty = input.filter(function(s, i) {
            return i.value == ""
        });
        */
        //if (empty.length == 0) {
            $.ajax({
                type: "post",
                url: url,
                data: {
                    email: username,
                    password: password
                },
                dataType: "json",
                success:function(data){
                	var val = eval("("+data+")");
                    if (val.code == 200 && val.status == 1) {
                        location.href = path+"/index";
                    	//location.href = "index.html?id=" + val.id + "&name=" + val.username + "&portrait=" + encodeURIComponent(val.portrait);
                    } else if (val.code == 105) {
                        $.alert({title:"信息提示",content:"用户未激活",type:"red"});
                    }else{
                    	$.alert({title:"信息提示",content:"用户名/密码错误，请重新登录!!!",type:"red"});
                    }
                }
            });
       //  } else {
        //    empty.first().blur();
       // }
    });
	
	//回车登录
	$(document).keyup(function(e){
		if(e.keyCode == 13){
			if($(".jconfirm").length > 0){
				$(".jconfirm").remove();
				return;
			}
			var username = $("#loginform input[name='username']").val().trim();
			if(username == ''){
				return;
			}
			$("#login").click();
			
		}
	});
	
});