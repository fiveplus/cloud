window.onload = function() {
    var oDiv = document.getElementById("tab");
    var oLi = oDiv.getElementsByTagName("div")[0].getElementsByTagName("li");
    var aCon = oDiv.getElementsByTagName("div")[1].getElementsByTagName("div");
    var timer = null;
    for (var i = 0; i < oLi.length; i++) {
        oLi[i].index = i;
        oLi[i].onmouseover = function() {
            show(this.index);
        }
    }
    function show(a) {
        index = a;
        var alpha = 0;
        for (var j = 0; j < oLi.length; j++) {
            oLi[j].className = "";
            aCon[j].className = "";
            aCon[j].style.opacity = 0;
            aCon[j].style.filter = "alpha(opacity=0)";
        }
        oLi[index].className = "cur";
        clearInterval(timer);
        timer = setInterval(function() {
            alpha += 2;
            alpha > 100 && (alpha = 100);
            aCon[index].style.opacity = alpha / 100;
            aCon[index].style.filter = "alpha(opacity=" + alpha + ")";
            alpha == 100 && clearInterval(timer);
        },
        5);
    }
}

$(function(){
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
	$("#login").on("click tap",function() {
            var empty = input.filter(function(s, i) {
                return i.value == ""
            });
            if (empty.length == 0) {
                $.ajax({
                    type: "post",
                    url: "user/login",
                    data: {
                        email: input[0].value,
                        password: input[1].value
                    },
                    dataType: "json"
                }).done(function(val) {
                	val = eval("("+val+")");
                	
                    if (val.code == 200 && val.status == 1) {
                        location.href = "index";
                    	//location.href = "index.html?id=" + val.id + "&name=" + val.username + "&portrait=" + encodeURIComponent(val.portrait);
                    } else if (val.code == 105) {
                        alert("用户未激活");
                    }else{
                         input.val("");
                         error.removeClass("hidden").end().focus();
                    }
                }).fail(function() {
                    input.val("");
                    error.removeClass("hidden").end().focus();
                });
            } else {
                empty.first().blur();
            }
        });
});