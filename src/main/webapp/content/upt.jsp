<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" > ★ 内容修改 <small> >>修改详细内容 </small></h4>
	</div>
	<div class="modal-body">
		<form action="${contextPath}/content/update.json" id="upt_cont_form">
			<input type="hidden" name="id" value="${content.id}" />
			<div class="category-choose-wrap">
				<div class="category-title">项目：</div>
				<ul class="seletc-choose">
					<a data-id="0" <c:if test="${content.project.id == NULL}">class="active"</c:if> ><li>无项目组</li></a>
					<c:forEach items="${projects}" var="p"  >
	    				<a data-id="${p.id}" <c:if test="${content.project.id == p.id}">class="active"</c:if> ><li>${p.name}</li></a>
	    			</c:forEach>
	    			<input type="hidden" name="project.id" askuy-form="value" value="${content.project.id == NULL ? '' : content.project.id}" />
				</ul>
				<div class="clear"></div>
			</div>
			<div class="category-choose-wrap">
				<div class="category-title">主题：</div>
				<ul id="topical" class="seletc-choose">
					<c:forEach items="${themes}" var="t" varStatus="stat"  >
	    				<a data-id="${t.id}" <c:if test="${content.theme.id == t.id}"> class="active" </c:if> ><li>${t.name}</li></a>
	   				</c:forEach>
	    			<input type="hidden" name="theme.id" askuy-form="value" value="${content.theme.id}" />
				</ul>
				<div class="clear"></div>
			</div>
			<div class="fenge"></div>
			<textarea id="send-text" name="content" class="send-text">${content.content}</textarea>
		</form>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary" onclick="update_content('upt_cont_form')">保存</button>
	</div>
</div>
<script type="text/javascript">
	var editor;
	$(document).ready(function(){
		
		//项目组／主题
		$("#project a").click(function(){
			$("#project a").removeClass("active");
			$(this).addClass("active");
			//var val = $(this).next().children().html();
			var val = $(this).attr("data-id");
			$("#project input").attr("value",val);
		});
		$("#topical a").click(function(){
			$("#topical a").removeClass("active");
			$(this).addClass("active");
			//var val = $(this).next().children().html();
			var val = $(this).attr("data-id");
			$("#topical input").attr("value",val);
		});
		
		/* 编辑器初始化 */
		editor_init();
	});

	function editor_init(){
		if($("#send-text")){
			editor = KindEditor.create('textarea[name="content"]', {
				width:"100%",
				height:"400px",
				cssPath : '${contextPath}/js/kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : '${contextPath}/ke/upload',
				fileManagerJson : '${contextPath}/ke/manager',
				allowFileManager : true,
				resizeType : 0,
				items:["source", "|", "undo", "redo", "|", "preview", "print", "template", "code", "cut", "copy", "paste", "plainpaste", "wordpaste",
					"|", "justifyleft", "justifycenter", "justifyright", "justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent",
					"subscript", "superscript", "clearhtml", "quickformat", "selectall", "|", "/", "formatblock", "fontname", "fontsize", 
					"|", "forecolor", "hilitecolor", "bold", "italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image", 
					"multiimage", "flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak", "anchor", "link", "unlink", 
					"|" ], //"fullscreen" 全屏  , "about" 关于
				afterCreate : function() {
					var self = this;
				},
				afterBlur : function(){
					this.sync();
				}
			});
			
		}
	}

	function update_content(id){
		var form = $("#"+id);
		var url = form.attr("action");
		var data = form.serialize();
		alert(data);
		$.ajax({
			url:url,
			type:"POST",
			data:data,
			success:function(data){
				var vdata = data;
				$.alert({title:"提示信息",content:"内容更新成功!"});
				window.location.reload();
			}
		});
	}
	
</script>