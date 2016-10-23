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