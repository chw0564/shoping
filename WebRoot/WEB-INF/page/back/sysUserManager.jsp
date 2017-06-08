<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js fixed-layout">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/amazeui.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
		<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>
		<script type="text/javascript">
			function addSysUser(){
	    		var fm = $("#sysUser-add form");
	    		$.post("${pageContext.request.contextPath }/sysUser/adminUserAdd",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/sysUser/loadAdminSysUser";
	    				}, 500)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
			function changeSysUserStatus(id){
	    		$.post("${pageContext.request.contextPath }/sysUser/changeSysUserStatus",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/sysUser/loadAdminSysUser";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	function deleteSysUser(id){
	    		$.post("${pageContext.request.contextPath }/sysUser/deleteSysUser",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/sysUser/loadAdminSysUser";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	function sysUserModify(id){
	    		var fm = $("#sysUser-modify form");	
	    		$.post("${pageContext.request.contextPath }/sysUser/loadSysUserById",{"id":id},function(data){
	    			if(data.flag){
	    				fm.find("#id").val(data.data.id);
	    				fm.find("#username").val(data.data.username);
	    				$("#sysUser-modify").modal();
	    			}
	    		},"json");
	    	}
	    	function modifySysUser(){
	    		var fm = $("#sysUser-modify form");	
	    		$.post("${pageContext.request.contextPath }/sysUser/modifySysUser",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/sysUser/loadAdminSysUser";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	function reloadSysUserPwd(id){
	    		$.post("${pageContext.request.contextPath }/sysUser/reloadSysUserPwd",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
		</script>
	</head>
	<body>
		<jsp:include page="/head"></jsp:include>
		<div class="am-cf admin-main">
			<jsp:include page="/nav"></jsp:include>
			
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					  <div class="am-cf am-padding am-padding-bottom-0">
				        <div class="am-fl am-cf">
				        	<strong class="am-text-primary am-text-lg">系统用户管理</strong>
				        </div>
				      </div>
				
				      <hr>
				
				      <div class="am-g">
				        <div class="am-u-sm-12 am-u-md-8">
				          <div class="am-g">
				          	<div class="am-u-sm-12 am-u-md-6">
					          	<button type="button" class="am-btn am-btn-secondary am-btn-sm" data-am-modal="{target: '#sysUser-add'}">添加管理员</button>
					         </div>
					      </div>
				        </div>
				       </div>
				      <div class="am-g">
				        <div class="am-u-sm-12">
				            <table class="am-table am-table-striped am-table-hover table-main">
				              <thead>
				              <tr>
				                <th class="table-id">ID</th>
				                <th class="table-title">管理员姓名</th>
				                <th class="table-type">登录帐号</th>
				                <th class="table-type">登录密码</th>
				                <th class="table-type">状态</th>
				                <th class="table-set">操作</th>
				              </tr>
				              </thead>
				              <tbody>
				              <c:forEach items="${adminUsers }" var="admin" varStatus="i">
					              <tr>
					                <td>${i.count }</td>
					                <td>${admin.username }</td>
					                <td>${admin.loginname }</td>
					                <td>*********</td>
					                <td>
					                	<c:if test="${admin.sysuserstatus eq sysUserClose }">
					                		<span class="am-text-danger">帐号禁用</span>
					                	</c:if>
					                	<c:if test="${admin.sysuserstatus ne sysUserClose }">
					                		<span class="am-text-success">普通管理员</span>
					                	</c:if>
					                </td>
					                <td>
					                  <div class="am-btn-toolbar">
					                    <div class="am-btn-group am-btn-group-xs">
					                      <a href="#" onclick="sysUserModify(${admin.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
					                      	<span class="am-icon-pencil-square-o"></span> 修改
					                      </a>
					                      <a href="#" onclick="changeSysUserStatus(${admin.id})" class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
					                      	<span class="am-icon-copy"></span> 
					                      	 <c:if test="${admin.sysuserstatus eq sysUserClose }">
						                		启用
						                	  </c:if>
						                	  <c:if test="${admin.sysuserstatus ne sysUserClose }">
						                		禁用
						                	  </c:if>					                      	
					                      </a>
					                      <a href="#" onclick="deleteSysUser(${admin.id})" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
					                      	<span class="am-icon-trash-o"></span> 删除
					                      </a>
					                      <a href="#" onclick="reloadSysUserPwd(${admin.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
					                      	<span class="am-icon-spinner"></span> 密码重置
					                      </a>
					                    </div>
					                  </div>
					                </td>
					              </tr>
				              </c:forEach>
				              </tbody>
				            </table>
				        </div>
				     </div>
				</div>
				<jsp:include page="/foot"></jsp:include>
			</div>
		</div>
		
		
		 <!-- 管理员添加 modal 开始 -->
	      <div class="am-modal am-modal-confirm" tabindex="-1" id="sysUser-add">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">
			    	管理员添加 <small> (默认密码：000000)</small>
			    </div>
			    <hr>
			    <div class="am-modal-bd">
			     	<form action="#" class="am-form am-form-horizontal">
					  <div class="am-form-group">
					    <label for="username" class="am-u-sm-3 am-form-label">管理员姓名</label>
					    <div class="am-u-sm-9">
					      <input type="text" id="username" name="username">
					    </div>
					  </div>
					  <div class="am-form-group">
					    <label for="loginname" class="am-u-sm-3 am-form-label">登录帐号</label>
					    <div class="am-u-sm-9">
					      <input type="text" id="loginname" name="loginname">
					    </div>
					  </div>
					</form>
			    </div>
			    <div class="am-modal-footer">
			      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
			      <span class="am-modal-btn" onclick="addSysUser()">确定</span>
			    </div>
			  </div>
			</div>
	       <!-- 管理员添加 modal 结束 -->
	       <!-- 管理员修改 modal 开始 -->
		      <div class="am-modal am-modal-confirm" tabindex="-1" id="sysUser-modify">
				  <div class="am-modal-dialog">
				    <div class="am-modal-hd">管理员修改</div>
				    <hr>
				    <div class="am-modal-bd">
				     	<form action="#" class="am-form am-form-horizontal">
						  <div class="am-form-group">
						    <label for="username" class="am-u-sm-3 am-form-label">管理员姓名</label>
						    <div class="am-u-sm-9">
						      <input type="text" id="username" name="username">
						    </div>
						  </div>
						  <input type="hidden" id="id" name="id">
						</form>
				    </div>
				    <div class="am-modal-footer">
				      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
				      <span class="am-modal-btn" onclick="modifySysUser()">确定</span>
				    </div>
				  </div>
				</div>
		   <!-- 管理员修改 modal 结束 -->
	</body>
</html>
