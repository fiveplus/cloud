<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
		<!-- tree插件 -->
		<link rel="stylesheet" href="css/metroStyle/metroStyle.css" type="text/css" />
		<script type="text/javascript" src="js/ztree/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="js/ztree/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="js/ztree/jquery.ztree.exedit-3.5.js"></script>
		
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" style="min-width: 850px;">
					<div class="cmenuleft">
						<a  href="proj?id=${project.id}" >项目记录</a>
						<a class="cur">项目进度</a>
						<a href="projectuser?id=${project.id}" >项目成员</a> 
						<a href="projectset?id=${project.id}" >项目设置</a>
					</div>
					<div class="cmenuright">
						<a href="#" class="cmra1">&nbsp;</a>
						<a href="#" class="cmra2">&nbsp;</a> 
						<a href="#">统计</a>
						<a href="#">附件</a>
						<a href="#">图片</a>
						<a href="#" class="cur">记录</a>
					</div>
					<div class="clear"></div>
				</div>
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<div class="gr_ge">
						<span>
							<img class="img-radius64" src="${project.user.portrait }" />
						</span>
						<div class="gr_ge2">
							<b><a href="#">${project.name}</a></b>
							<br/><br/>
							负责人:
							<strong>${project.user.username}</strong>
							建立时间:
							<strong><date:date value="${project.createTime}" /></strong>
							项目组人员:
							<strong>${fn:length(users)+1}人</strong>
						</div>
					</div>
					<div>
						<div>
							<div class ="gantt"></div> 
							<div>
								<!-- 实施人 -->
								<table class="table" cellpadding="10" border="1" bordercolor="#ddd">
									<tr class="th">
										<td width="50">执行者</td>
										<td>指派时间</td>
										<td>完成时间</td>
										<td>任务标题</td>
										<td>任务内容</td>
										<td width="180">操作</td>
									</tr>
									<c:forEach items="${progresses}" var="ps">
										<tr class="tr">
											<td>
												${ps.user.username}
											</td>
											<td><date:date value="${ps.startTime}" /></td>
											<td><date:date value="${ps.endTime}" /></td>
											<td>${ps.title}</td>
											<td>
												${ps.content}
											</td>
											<td>
												<c:if test="${ps.status=='Y'}">
													<a name="update_progress" onclick="update_set(${ps.id})" href="#update_project_progress_div" class="button button-rounded button-highlight button-small">修改</a>
													<a href="javascript:delete_progress(${ps.id})" class="button button-rounded button-caution button-small">删除</a>
													<script type="text/javascript">
														$('a[name="update_progress"]').leanModal({top:0});
													</script>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="fenge"></div>
							<div>
								<a id="add_project_progress" href="#add_project_progress_div"  class="button button-primary button-rounded button-small">新增项目计划</a>
								<script type="text/javascript">
									$('#add_project_progress').leanModal({top:0});
								</script>
							</div>
						</div>
					</div>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
	
		<div id="add_project_progress_div" class="leanmodel_div">
			<form action="progress/add" role="form" class="form" id="add_project_progress_form" style="margin: auto;width: 580px;">
				<div style="padding:20px 5px;"><font size="+2"><b>项目计划新增</b></font> <span style="color:#999;"> >>请输入项目计划信息 </span> </div>
				<div class="form-group" style="margin:5px 0;">
					<span class="control-label" >执行成员：</span>
					<a id="add_progress_user" href="#add_project_user_div" ><b>请选择 +</b></a>
					<script type="text/javascript">
						$('#add_progress_user').leanModal({top:0});
					</script>
				</div>
				<div class="form-group">
					<span class="control-label">事件名称：</span>
					<input type="hidden" name="project.id" value="${project.id}" />
					<input type="hidden" name="user.id" value="" />
					<input type="text" name="title" class="input-text" placeholder="事件名称"  />
				</div>
				<div class="form-group">
					<span class="control-label">事件时间：</span>
					<input class="input-text" type="text" placeholder="事件时间" readonly="readonly" id="dateRangePicker" name="dateRangePicker" />
				</div>
				<div class="form-group" >
					<div style="float:left;margin-right: 6px;">事件内容：</div>
					<textarea name="content" class="input-textarea"></textarea>
				</div>
				
				<div class="form-group" style="padding:0 0 10px 0;width: 375px;">
					<span class="control-label">&nbsp;</span>
					<a href="javascript:add_project_progress()" style="float: right;" class="button button-primary button-rounded button-small">确认新增</a>
					<div class="clear"></div>
				</div>
			</form>
		</div>
	
		<div id="add_project_user_div" class="leanmodel_div">
			<form action="project/useradd" role="form" class="form" id="add_project_user_form">
				<div style="padding:20px 10px;"><font size="+2"><b>项目成员选择</b></font> <span style="color:#999;"> >>请选择项目成员 </span> </div>
				<div style="height:400px;overflow-y:auto;">
					<div class="form-group" style="float: left;width:45%;min-height: 250px;">
						<ul id="treeDemo" class="ztree"></ul>
					</div>
					<div class="form-group"  style="float: left;width: 45%;margin-top:10px;padding:0; padding-top: 15px;background: #e9eaf5;border-radius: 5px;box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.7);">
						<div align="center" style="padding-bottom:10px;">
							<img class="img-radius64" id="userpic" src="images/liimg.jpg" style="margin-bottom: 5px;" /><br />
							<label id="username">未选择</label>
							<input type="hidden" name="userid" value="" />
						</div>
						<div style="margin:0 10px;border-top: 1px solid #ddd;">
							<p>
								╭⌒ 男人 就得活出自己 高傲的姿态. Ending
							</p>
						</div>
					</div>
					<div class="clear"></div>
				</div>
					<div class="form-group" style="padding:15px 0 20px 0;">
						<span class="label" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<a href="javascript:set_user()" class="button button-primary button-rounded button-small">确认</a>
						<a href="javascript:user_cancel()" class="button button-primary button-rounded button-small">取消</a>
					</div>
				
				
			</form>
		</div>
		
		<div id="update_project_progress_div" class="leanmodel_div">
			<form action="progress/update" role="form" class="form" id="update_project_progress_form">
				<div style="padding:20px 5px;"><font size="+2"><b>项目计划修改</b></font> <span style="color:#999;"> >>请输入项目计划信息 </span> </div>
				<div class="form-group" style="margin:5px 0;">
					<span class="control-label" id="user_name">执行成员：</span>
					<input type="hidden" name="id" value="" />
				</div>
				<div class="form-group">
					<span class="control-label">事件名称：</span>
					<input type="hidden" name="project.id" value="${project.id}" />
					<input type="text" name="title" class="input-text" placeholder="事件名称"  />
				</div>
				<div class="form-group">
					<span class="control-label">事件时间：</span>
					<input class="input-text" type="text" placeholder="事件时间" readonly="readonly" id="dateRangePicker2" name="dateRangePicker" />
				</div>
				<div class="form-group" >
					<div style="float:left;margin-right: 6px;">事件内容：</div>
					<textarea name="content" class="input-textarea"></textarea>
				</div>
				
				<div class="form-group" style="padding:15px 0 20px 0;">
					<span class="control-label" >&nbsp;</span>
					<a href="javascript:update_project_progress()" class="button button-primary button-rounded button-small">确认</a>
				</div>
			</form>
		</div>
		
		<!-- gantt插件 -->
		<link rel ="stylesheet" href ="js/gantt/css/style.css" /> 
		<script src ="js/gantt/jquery.fn.gantt.js" charset="GB2312"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var id = '${project.id}';
				$(".gantt").gantt({
					source: "progress/gantt?id="+id,
					navigate: "scroll",
					maxScale: "hours",
					itemsPerPage: 10,
					onItemClick: function(data) {
						//alert("Item clicked - show some details");
					},
					onAddClick: function(dt, rowId) {
						//alert("Empty space clicked - add an item!");
					},
					onRender: function() {
						if (window.console && typeof console.log === "function") {
							console.log("chart rendered");
							//加载完成
						}
					}
				});
			});
			
			$('#dateRangePicker').daterangepicker();
			
			var setting = {
		            view: {
		               // addHoverDom: addHoverDom,
		               // removeHoverDom: removeHoverDom,
		                selectedMulti: false,
		                dblClickExpand: false,
		                showLine:false
		            },
		            data: {
		                simpleData: {
		                    enable: true
		                }
		            },
		            callback:{
		            	beforeExpand: beforeExpand,
						onExpand: onExpand,
						onClick: onClick
		            }
		        };
			
			$.ajax({
				type:"POST",
				url:"user/trees",
				async:false,
				error:function(request){
					//alert("数据请求错误!");
				},
				success:function(data){
					var trees = eval("("+data+")");
					var zNodes = [];
					for(var i = 0;i< trees.length;i++){
						zNodes.push({id:trees[i].id,pId:trees[i].pid,name:trees[i].name,isParent:trees[i].parent,portrait:trees[i].portrait});
					}
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				}
			});

			
			var newCount = 1;
		    function addHoverDom(treeId, treeNode) {
		        var sObj = $("#" + treeNode.tId + "_span");
		        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
		        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		            + "' title='add node' onfocus='this.blur();'></span>";
		        sObj.after(addStr);
		        var btn = $("#addBtn_"+treeNode.tId);
		        if (btn) btn.bind("click", function(){
		        	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
		            return false;
		        });
		    };
		    function removeHoverDom(treeId, treeNode) {
		        $("#addBtn_"+treeNode.tId).unbind().remove();
		    };
		    
			var curExpandNode = null;
			function beforeExpand(treeId, treeNode) {
				var pNode = curExpandNode ? curExpandNode.getParentNode():null;
				var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
					if (treeNode !== treeNodeP.children[i]) {
						zTree.expandNode(treeNodeP.children[i], false);
					}
				}
				while (pNode) {
					if (pNode === treeNode) {
						break;
					}
					pNode = pNode.getParentNode();
				}
				if (!pNode) {
					singlePath(treeNode);
				}

			}
			function singlePath(newNode) {
				if (newNode === curExpandNode) return;

	            var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	                    rootNodes, tmpRoot, tmpTId, i, j, n;

	            if (!curExpandNode) {
	                tmpRoot = newNode;
	                while (tmpRoot) {
	                    tmpTId = tmpRoot.tId;
	                    tmpRoot = tmpRoot.getParentNode();
	                }
	                rootNodes = zTree.getNodes();
	                for (i=0, j=rootNodes.length; i<j; i++) {
	                    n = rootNodes[i];
	                    if (n.tId != tmpTId) {
	                        zTree.expandNode(n, false);
	                    }
	                }
	            } else if (curExpandNode && curExpandNode.open) {
					if (newNode.parentTId === curExpandNode.parentTId) {
						zTree.expandNode(curExpandNode, false);
					} else {
						var newParents = [];
						while (newNode) {
							newNode = newNode.getParentNode();
							if (newNode === curExpandNode) {
								newParents = null;
								break;
							} else if (newNode) {
								newParents.push(newNode);
							}
						}
						if (newParents!=null) {
							var oldNode = curExpandNode;
							var oldParents = [];
							while (oldNode) {
								oldNode = oldNode.getParentNode();
								if (oldNode) {
									oldParents.push(oldNode);
								}
							}
							if (newParents.length>0) {
								zTree.expandNode(oldParents[Math.abs(oldParents.length-newParents.length)-1], false);
							} else {
								zTree.expandNode(oldParents[oldParents.length-1], false);
							}
						}
					}
				}
				curExpandNode = newNode;
			}

			function onExpand(event, treeId, treeNode) {
				curExpandNode = treeNode;
			}

			function onClick(e,treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.expandNode(treeNode, null, null, null, true);
				if(!treeNode.isParent){
					$("input[name='userid']").val(treeNode.id);
					$("#username").html(treeNode.name);
					$("#userpic").attr("src",treeNode.portrait==""?"images/liimg.jpg":treeNode.portrait);
				}
			}
			
			function set_user(){
				
				$("#add_project_user_div").attr("style","");
				
				var userid = $("input[name='userid']").val();
				var username = $("#username").html();
				
				$("input[name='user.id']").val(userid);
				$("#add_progress_user").html("<b>"+username+"</b>");
			}
			
			function user_cancel(){
				$("#add_project_user_div").attr("style","");
			}
			
			function delete_progress(id){
				$.confirm({
					title:'提示信息',
					content:'确认删除？删除后无法恢复！！！',
					buttons:{
						confirm:function(){
							$.ajax({
								cache:true,
								type:"POST",
								url:"progress/delete?id="+id,
								error: function(request) {
								},
								success: function(data) {
									var vdata = eval("("+data+")");
									window.location = "progress?id="+vdata.projectId;
								}
							});
						},
						cancel:function(){}
					}
				});
				
			}
			
			function update_set(id){
				$.ajax({
					cache:true,
					type:"POST",
					url:"progress/updateInit?id="+id,
					error: function(request) {
						//alert("服务器连接失败!");
					},
					success: function(data) {
						var vdata = eval("("+data+")");
						var pg = vdata.progress;
						$("#update_project_progress_div input[name='id']").val(pg.id);
						$("#update_project_progress_div #user_name").html("执行成员：&nbsp;<b>"+pg.user.username+"</b>");
						$("#update_project_progress_div input[name='title']").val(pg.title);
						$("#update_project_progress_div textarea[name='content']").html(pg.content);
						$("#update_project_progress_div input[name='dateRangePicker']").val(vdata.dateRangePicker);
						var start = vdata.dateRangePicker.split("-")[0].trim();
						var end = vdata.dateRangePicker.split("-")[1].trim();
						$('#dateRangePicker2').daterangepicker({
							startDate:start,
							endDate:end
						});
					}
				});
			}
			
			//修改项目计划
			function update_project_progress(){
				var action = $("#update_project_progress_form").attr("action");
				var alldata = $("#update_project_progress_form").serialize();
				$.ajax({
					cache:true,
					type:"POST",
					url:action,
					data:alldata,
					error:function(request){
						//alert("服务器连接失败!");
					},
					success:function(data){
						var vdata = eval("("+data+")");
						//alert(vdata.message);
						
						$("#update_project_progress_div").attr("style","");
						$("#lean_overlay").remove();
						
						$("#update_project_progress_div .form input[type=text]").val("");
						$("#update_project_progress_div .form textarea").val("");
						
						window.location = 'progress?id='+vdata.projectId;
					}
				});
			}
			
			//添加项目计划
			function add_project_progress(){
				var action = $("#add_project_progress_form").attr("action");
				var alldata = $("#add_project_progress_form").serialize();
				$.ajax({
					cache:true,
					type:"POST",
					url:action,
					data:alldata,
					error:function(request){
						//alert("服务器连接失败!");
					},
					success:function(data){
						var vdata = eval("("+data+")");
						//alert(vdata.message);
						
						$("#add_project_progress_div").attr("style","");
						$("#lean_overlay").remove();
						
						$("#add_project_progress_div .form input[type=text]").val("");
						$("#add_project_progress_div .form textarea").val("");
						
						window.location = 'progress?id='+vdata.projectId;
					}
				});
			}
		
		</script>
	</fms:Content>
</fms:ContentPage>