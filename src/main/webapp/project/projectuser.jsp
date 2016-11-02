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
						<a href="proj?id=${project.id}" >项目记录</a>
						<a href="progress?id=${project.id}" >项目进度</a>
						<a class="cur">项目成员</a> 
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
					<div class="row">
						<div>
							<div>
								<!-- 成员表 -->
								<table class="u-table" cellpadding="10" border="1" bordercolor="#ddd">
									<tr class="th">
										<td width="20px">
											<label class="center">
												<input class="input-checkbox" type="checkbox" style="visibility: none;" name="input-checkbox" />
											</label>
										</td>
										<td>成员</td>
										<td>加入时间</td>
										<td>状态</td>
										<td>操作</td>
									</tr>
									<tr class="tr">
										<td>
											<label class="center">
												<input class="input-checkbox" type="checkbox" value="0" style="visibility: none;" name="input-checkbox" />
											</label>
										</td>
										<td>
											<img style="vertical-align:middle;" class="img-radius30" src="${project.user.portrait }"  /> ${project.user.username} <font color="red"><b>[项目主人]</b></font> 
										</td>
										<td><date:date value="${project.createTime}" /></td>
										<td class="hidden-400">
											<span class="label label-sm label-success">在线</span>
										</td>
										<td>
										
										</td>
									</tr>
									<c:forEach items="${users}" var="u">
										<tr class="tr">
											<td>
												<label class="center">
													<input class="input-checkbox" type="checkbox" value="0" style="visibility: none;" name="checkbox" />
												</label>
											</td>
											<td>
												<img style="vertical-align:middle;" class="img-radius30" src="${u.portrait }"  /> ${u.username} 
											</td>
											<td><date:date value="${u.createTime}" /></td>
											<td class="hidden-400">
												<span class="label label-sm label-success">在线</span>
											</td>
											<td>
												<a href="javascript:delete_project_user(${u.id})" class="button button-primary button-rounded button-small">删除</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="fenge"></div>
							<div>
								<a id="add_project_user" href="#add_project_user_div"  class="button button-primary button-rounded button-small">添加</a>
								<script type="text/javascript">
									$('#add_project_user').leanModal();
								</script>
							</div>
						</div>
					</div>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
		<div id="add_project_user_div" class="leanmodel_div">
			<form action="projectuser/add" role="form" class="form" id="add_project_user_form">
				<div style="padding:20px 5px;"><font size="+2"><b>项目成员新增</b></font> <span style="color:#999;"> >>请选择项目成员 </span> </div>
				<div class="form-group" style="float: left;width:45%;">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="form-group"  style="float: left;width: 45%;margin-top:10px;padding:0; padding-top: 15px;background: #e9eaf5;border-radius: 5px;box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.7);">
					<div align="center" style="padding-bottom:10px;">
						<img class="img-radius64" id="userpic" src="images/liimg.jpg" style="margin-bottom: 5px;" /><br />
						<label id="username">未选择</label>
						<input type="hidden" name="user.id" value="" />
						<input type="hidden" name="project.id" value="${project.id}" />
					</div>
					<div style="margin:0 10px;border-top: 1px solid #ddd;">
						<p>
							╭⌒ 男人 就得活出自己 高傲的姿态. Ending
						</p>
					</div>
				</div>
				<div class="clear"></div>
				<div class="form-group" style="padding:10px 0 20px 0;">
					<span class="label" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<a href="javascript:add_project_user()" class="button button-primary button-rounded button-small">确认</a>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			var setting = {
		            view: {
		               
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
				cache:true,
				type:"POST",
				url:"user/trees",
				error: function(request) {
					alert("服务器连接失败!");
				},
				success: function(data) {
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
						$("input[name='user.id']").val(treeNode.id);
						$("#username").html(treeNode.name);
						$("#userpic").attr("src",treeNode.portrait==""?"images/liimg.jpg":treeNode.portrait);
					}
				}
				
				//新增项目组成员
				function add_project_user(){
					var action = $("#add_project_user_form").attr("action");
					var alldata = $("#add_project_user_form").serialize();
					$.ajax({
						cache:true,
						type:"POST",
						url:action,
						data:alldata,
						error:function(request){
							alert("服务器连接失败!");
						},
						success:function(data){
							var vdata = eval("("+data+")");
							//alert(vdata.message);
							
							$("#add_project_div").attr("style","");
							$("#lean_overlay").remove();
							
							window.location.href = 'projectuser?id='+vdata.projectId;
						}
					});
				}
				
				function delete_project_user(userid){
					var projectid = '${project.id}';
					if(confirm("确认删除？")){
						$.ajax({
							cache:true,
							type:"POST",
							url:"projectuser/delete",
							data:{userid:userid,projectid:projectid},
							error:function(request){
								alert("服务器连接失败!");
							},
							success:function(data){
								var vdata = eval("("+data+")");
								//alert(vdata.message);
								
								window.location.href = 'projectuser?id='+vdata.projectId;
							}
						});
					}
				}
		
		</script>
		
	</fms:Content>
</fms:ContentPage>