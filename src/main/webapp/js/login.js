

$(function(){
	
	function login_xy(){
		var h = $(window).height();
		var w = $(window).width();
		var body = $(".main-body");
		var left = (w - body.width()) / 2;
		body.css({"left" : left + "px"});
		resizeCanvas();
	}
	
	$(window).resize(function(){
		login_xy();
	});
	
	login_xy();
	
	
	
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