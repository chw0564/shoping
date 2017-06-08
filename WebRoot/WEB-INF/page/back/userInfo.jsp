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
			function reloadUserPwd(id){
				$.post("${pageContext.request.contextPath }/memberUserController/reloadUserPwd",{"id":id},function(data){
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
				        	<strong class="am-text-primary am-text-lg">在线商城注册用户</strong>
				        </div>
				      </div>
				
				      <hr>
				      
				      <div class="am-g">
				        <div class="am-u-sm-12">
				            <table class="am-table am-table-striped am-table-hover table-main">
				              <thead>
				              <tr>
				                <th class="table-id">ID</th>
				                <th class="table-title">用户姓名</th>
				                <th class="table-type">用户登录帐号</th>
				                <th class="table-type">用户登录密码</th>
				                <th class="table-set">操作</th>
				              </tr>
				              </thead>
				              <tbody>
				              <c:forEach items="${users }" var="u" varStatus="i">
					              <tr>
					                <td>${i.count }</td>
					                <td>${u.name }</td>
					                <td>${u.username }</td>
					                <td>********</td>
					                <td>
					                  <div class="am-btn-toolbar">
					                    <div class="am-btn-group am-btn-group-xs">
					                       <a href="#" onclick="reloadUserPwd(${u.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
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
	</body>
</html>
