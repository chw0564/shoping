<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	</head>
	<body>
		<jsp:include page="/head"></jsp:include>
		<div class="am-cf admin-main">
			<jsp:include page="/nav"></jsp:include>
	
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-primary am-text-lg">首页</strong> / <small>快速导航</small>
						</div>
					</div>
					<ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
						<li>
							<a href="${pageContext.request.contextPath }/ProductTypeController/loadData" class="am-text-secondary">
								<span class="am-icon-btn am-icon-product-hunt"></span>
								<br />类型管理<br />
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/ProductController/loadData" class="am-text-success">
								<span class="am-icon-btn am-icon-tag"></span>
								<br />商品管理<br />
							</a>
						</li>
						<li><a href="${pageContext.request.contextPath }/onlineOrderController/loadData" class="am-text-warning">
								<span class="am-icon-btn am-icon-shopping-bag"></span>
								<br />订单管理<br />
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/memberUserController/loadData" class="am-text-danger">
								<span class="am-icon-btn am-icon-user"></span>
								<br />用户管理<br />
							</a>
						</li>
					</ul>
				</div>
				<jsp:include page="/foot"></jsp:include>
			</div>
		</div>
	</body>
</html>
