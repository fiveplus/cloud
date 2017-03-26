var Color= new Array(9);
	Color[1] = "ff";
	Color[2] = "ee";
	Color[3] = "dd";
	Color[4] = "cc";
	Color[5] = "bb";
	Color[6] = "aa";
	Color[7] = "99";
	Color[8] = "88";
	Color[9] = "77";
	Color[10] = "66";
	Color[11] = "55";
	Color[12] = "44";
	Color[13] = "33";
	Color[14] = "22";
	Color[15] = "11";
	Color[16] = "00";
var Time = new Map();
//获取TOKEN
var path = $("meta[name='path']").attr("content")+"/";
function rong_init() {
	$.ajax( {
		type : "POST",
		url : path+"rong/get_token.json",
		error : function(request) {
			//alert("服务器连接异常!");
		},
		success : function(data) {
			//var vdata = eval("("+data+")");
			var result = eval("("+data.result+")");
			var token = result.token;
			// 连接融云服务器。
			RongIMClient.init("lmxuhwagxp68d");
			connect_listener();
			message_listener();
			connect(token);
		}
	});
}

function connect(token){
	RongIMClient.connect(token, {
		onSuccess : function(userId) {
			// 此处处理连接成功。
			console.log("userId:"+userId);
			//get_history();
		},
		onError : function(errorCode) {
			// 此处处理连接错误。
			var info = '';
			switch (errorCode) {
			case RongIMClient.callback.ErrorCode.TIMEOUT:
				info = '超时';
				break;
			case RongIMClient.callback.ErrorCode.UNKNOWN_ERROR:
				info = '未知错误';
				break;
			case RongIMClient.ConnectErrorStatus.UNACCEPTABLE_PROTOCOL_VERSION:
				info = '不可接受的协议版本';
				break;
			case RongIMClient.ConnectErrorStatus.IDENTIFIER_REJECTED:
				info = 'appkey不正确';
				break;
			case RongIMClient.ConnectErrorStatus.SERVER_UNAVAILABLE:
				info = '服务器不可用';
				break;
			case RongIMClient.ConnectErrorStatus.TOKEN_INCORRECT:
				info = 'token无效';
				break;
			case RongIMClient.ConnectErrorStatus.NOT_AUTHORIZED:
				info = '未认证';
				break;
			case RongIMClient.ConnectErrorStatus.REDIRECT:
				info = '重新获取导航';
				break;
			case RongIMClient.ConnectErrorStatus.PACKAGE_ERROR:
				info = '包名错误';
				break;
			case RongIMClient.ConnectErrorStatus.APP_BLOCK_OR_DELETE:
				info = '应用已被封禁或已被删除';
				break;
			case RongIMClient.ConnectErrorStatus.BLOCK:
				info = '用户被封禁';
				break;
			case RongIMClient.ConnectErrorStatus.TOKEN_EXPIRE:
				info = 'token已过期';
				break;
			case RongIMClient.ConnectErrorStatus.DEVICE_ERROR:
				info = '设备号错误';
				break;
			}
			console.log(info);
		}
		});
}

function connect_listener() {
	// 设置连接监听状态 （ status 标识当前连接状态）
	// 连接状态
	RongIMClient.setConnectionStatusListener( {
		onChanged : function(status) {
			switch (status) {
			//链接成功
			case RongIMClient.ConnectionStatus.CONNECTED:
				console.log('链接成功');
				break;
			//正在链接
			case RongIMClient.ConnectionStatus.CONNECTING:
				console.log('正在链接');
				break;
			//重新链接
			case RongIMClient.ConnectionStatus.RECONNECT:
				console.log('重新链接');
				break;
			//其他设备登陆
			case RongIMClient.ConnectionStatus.OTHER_DEVICE_LOGIN:
				//连接关闭
			case RongIMClient.ConnectionStatus.CLOSURE:
				//未知错误
			case RongIMClient.ConnectionStatus.UNKNOWN_ERROR:
				//登出
			case RongIMClient.ConnectionStatus.LOGOUT:
				//用户已被封禁
			case RongIMClient.ConnectionStatus.BLOCK:
				break;
			}
		}
	});
}

function message_listener(){
	// 消息监听器
     RongIMClient.getInstance().setOnReceiveMessageListener({
        // 接收到的消息
        onReceived: function (message) {
            // 判断消息类型
            switch(message.getMessageType()){
                case RongIMClient.MessageType.TextMessage:
                    // do something...
                	var msg = message.getContent();
                	
                	var uid = message.getSenderUserId();
         
                	var imgurl = $("#chat-div .chat-top-left img").attr("src");
                	$("#chat-div .chat-center #mCSB_2_container").append(to_message_div(imgurl,msg));
                	$("#chat-div .chat-center").mCustomScrollbar("scrollTo","last");
                	if($("#chat-div").is(":hidden")){
                		playa(uid);
                	}
                	
                	
                    break;
                case RongIMClient.MessageType.ImageMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.VoiceMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.RichContentMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.LocationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.DiscussionNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.InformationNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.ContactNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.ProfileNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.CommandNotificationMessage:
                    // do something...
                    break;
                case RongIMClient.MessageType.UnknownMessage:
                    // do something...
                    break;
                default:
                    // 自定义消息
                    // do something...
            }
            
        }
    });
}

function get_history(){
	//此方法最多一次行拉取20条消息。拉取顺序按时间倒序拉取。
	RongIMClient.getInstance().getHistoryMessages(RongIMClient.ConversationType.PRIVATE,'targeid',20,{
		onSuccess:function(symbol,HistoryMessages){
			// symbol为boolean值，如果为true则表示还有剩余历史消息可拉取，为false的话表示没有剩余历史消息可供拉取。
			// HistoryMessages 为拉取到的历史消息列表，列表中消息为对应消息类型的消息实体
			console.log(HistoryMessages);
		
		},onError:function(){
			// APP未开启消息漫游或处理异常
			// throw new ERROR ......
			console.log("error");
		}
	});
}




function to_message_div(imgurl,msg){
	if(imgurl == ''){
		imgurl = path+"images/main_56.png";
	}else{
		imgurl = path+imgurl;
	}
	var html = "";
	html+='<div class="chat-to">'+
			'<div class="item-left">'+
				'<img src="'+imgurl+'" class="img-radius30" />'+
			'</div>'+
			'<div class="item-right">'+
				'<div class="arrow"></div>'+
				'<div class="text">'+msg+'</div>'+
				'<div class="clear"></div>'+
			'</div>'+
			'<div class="clear"></div>'+
		'</div>';
	return html;
}
function form_message_div(imgurl,msg){
	if(imgurl == ''){
		imgurl = path+"images/main_56.png";
	}else{
		imgurl = path+imgurl;
	}
	var html = "";
	html+='<div class="chat-form">'+
			'<div class="item-left">'+
				'<img src="'+imgurl+'" class="img-radius30" />'+
			'</div>'+
			'<div class="item-right">'+
				'<div class="arrow"></div>'+
				'<div class="text">'+msg+'</div>'+
				'<div class="clear"></div>'+
			'</div>'+
			'<div class="clear"></div>'+
		'</div>';
	return html;
}

function play_background(obj){
	var where = 16;
	var flag = true;
	var id = setInterval(function(){
		if(flag){
			where -= 1;
		}else{
			where += 1;
		}
		if(where == 16){
			flag = true;
		}
		if(where == 0){
			flag = false;
		}
		fade(where,obj);
	},15);
	var userid = $(obj).attr("user-id");
	
	Time.put(userid, id);
}
function stop_background(obj){
	var userid = $(obj).attr("user-id");
	var t = Time.get(userid);
	if(t != null){
		clearInterval(t);
		Time.remove(userid);
		$(obj).removeAttr("style");
	}
}

function fade(where,obj) {
	obj.style.backgroundColor="#" + Color[where] +"0000";
}

function playa(userid){
	$("#person-list a").each(function(){
		var uid = $(this).attr("user-id");
		
		if(userid == uid){
			play_background(this);
		}
	});
}

function stopa(userid){
	$("#person-list a").each(function(){
		var uid = $(this).attr("user-id");
		
		if(userid == uid){
			stop_background(this);
		}
	});
}

//离线消息初始化
function message_init(){
	$("#person-list a").each(function(){
		var count = $(this).attr("count");
		var userid = $(this).attr("user-id");
		if(count != undefined && userid != undefined){
			
			if(count > 0){
				play_background(this);
			}
		}
		
	});
}
