/**
 * @author zhangshenwu
 * @version 1.0.0
 * 简单工具构建
 */
//Map工具构建
var Map = function(key,value){
	this._entrys = new Array();
	this.put = function(key,value){
		if(key == null || key == undefined){
			return;
		}
		var index = this._getIndex(key);
		if(index == -1){
			var entry = new Object();
			entry.key = key;
			entry.value = value;
			this._entrys[this._entrys.length] = entry;
		}else{
			this._entrys[index].value = value;
		}
	};
	this.get = function(key){
		var index = this._getIndex(key);
		return (index!=-1)?this._entrys[index].value:null;
	};
	this.remove = function(key){
		var index = this._getIndex(key);
		if(index != -1){
			this._entrys.splice(index, 1);
		}
	};
	
	
	this.clear = function(){
		this._entrys.length = 0;
	};
	this.contains = function(key){
		var index = this._getIndex(key);
		return (index!=-1)?true:false;
	};
	this.getCount = function(){
		return this._entrys.length;
	};
	this.getEntrys = function(){
		return this._entrys;
	};
	this._getIndex = function(key){
		if(key == null || key == undefined){
			return -1;
		}
		var _length = this._entrys.length;
		for(var i = 0;i<_length;i++){
			var entry = this._entrys[i];
			if(entry == null || entry == undefined){
				continue;
			}
			if(entry.key == key){
				return i;
			}
		}
		return -1;
	};
	
};
//日期格式化
Date.prototype.Format = function(fmt){
	var o = {
			"M+":this.getMonth()+1,
			"d+":this.getDate(),
			"H+":this.getHours(),
			"m+":this.getMinutes(),
			"s+":this.getSeconds(),
			"q+":Math.floor((this.getMonth()+3)/3), //季度
			"S":this.getMilliseconds() //毫秒
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};
//curCSS,jquery1.8废除功能
jQuery.curCSS = function(element, prop, val) {
    return jQuery(element).css(prop, val);
};
//browser jquery1.9.1废除功能
(function(jQuery){
	if(jQuery.browser) return; 

	jQuery.browser = {}; 
	jQuery.browser.mozilla = false; 
	jQuery.browser.webkit = false; 
	jQuery.browser.opera = false; 
	jQuery.browser.msie = false; 

	var nAgt = navigator.userAgent; 
	jQuery.browser.name = navigator.appName; 
	jQuery.browser.fullVersion = ''+parseFloat(navigator.appVersion); 
	jQuery.browser.majorVersion = parseInt(navigator.appVersion,10); 
	var nameOffset,verOffset,ix; 

	// In Opera, the true version is after "Opera" or after "Version" 
	if ((verOffset=nAgt.indexOf("Opera"))!=-1) { 
	jQuery.browser.opera = true; 
	jQuery.browser.name = "Opera"; 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+6); 
	if ((verOffset=nAgt.indexOf("Version"))!=-1) 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+8); 
	} 
	// In MSIE, the true version is after "MSIE" in userAgent 
	else if ((verOffset=nAgt.indexOf("MSIE"))!=-1) { 
	jQuery.browser.msie = true; 
	jQuery.browser.name = "Microsoft Internet Explorer"; 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+5); 
	} 
	// In Chrome, the true version is after "Chrome" 
	else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) { 
	jQuery.browser.webkit = true; 
	jQuery.browser.name = "Chrome"; 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+7); 
	} 
	// In Safari, the true version is after "Safari" or after "Version" 
	else if ((verOffset=nAgt.indexOf("Safari"))!=-1) { 
	jQuery.browser.webkit = true; 
	jQuery.browser.name = "Safari"; 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+7); 
	if ((verOffset=nAgt.indexOf("Version"))!=-1) 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+8); 
	} 
	// In Firefox, the true version is after "Firefox" 
	else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) { 
	jQuery.browser.mozilla = true; 
	jQuery.browser.name = "Firefox"; 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+8); 
	} 
	// In most other browsers, "name/version" is at the end of userAgent 
	else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) < 
	(verOffset=nAgt.lastIndexOf('/')) ) 
	{ 
	jQuery.browser.name = nAgt.substring(nameOffset,verOffset); 
	jQuery.browser.fullVersion = nAgt.substring(verOffset+1); 
	if (jQuery.browser.name.toLowerCase()==jQuery.browser.name.toUpperCase()) { 
	jQuery.browser.name = navigator.appName; 
	} 
	} 
	// trim the fullVersion string at semicolon/space if present 
	if ((ix=jQuery.browser.fullVersion.indexOf(";"))!=-1) 
	jQuery.browser.fullVersion=jQuery.browser.fullVersion.substring(0,ix); 
	if ((ix=jQuery.browser.fullVersion.indexOf(" "))!=-1) 
	jQuery.browser.fullVersion=jQuery.browser.fullVersion.substring(0,ix); 

	jQuery.browser.majorVersion = parseInt(''+jQuery.browser.fullVersion,10); 
	if (isNaN(jQuery.browser.majorVersion)) { 
	jQuery.browser.fullVersion = ''+parseFloat(navigator.appVersion); 
	jQuery.browser.majorVersion = parseInt(navigator.appVersion,10); 
	} 
	jQuery.browser.version = jQuery.browser.majorVersion; 
})(jQuery);