<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	<div class="am-offcanvas-bar admin-offcanvas-bar">
		<ul class="am-list admin-sidebar-list">
			<li>
				<a href="${pageContext.request.contextPath }/adminIndex">
					<span class="am-icon-home"></span> 首页
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/ProductTypeController/loadData">
					<span class="am-icon-product-hunt"></span> 商品类型管理
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/ProductController/loadData">
					<span class="am-icon-tag"></span> 商品管理
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/memberUserController/loadData">
					<span class="am-icon-user"></span> 用户管理
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/onlineOrderController/loadData">
					<span class="am-icon-shopping-bag"></span> 用户订单管理
				</a>
			</li>
			<c:if test="${user.sysuserstatus eq superStatus }">
				<li>
					<a href="${pageContext.request.contextPath }/sysUser/loadAdminSysUser">
						<span class="am-icon-users"></span> 系统用户管理
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>
<!-- sidebar end -->
