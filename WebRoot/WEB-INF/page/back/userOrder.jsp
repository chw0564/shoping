<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js fixed-layout">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>后台管理</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/amazeui.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
		<style type="text/css">
			.hide_order_detail{
				display: none;
			}
			.detail_padding{
				padding: 0px;
			}
		</style>
		<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>
		<script type="text/javascript">
			var oldtrid = "";
			function showOrderDetail(trid){
				if(oldtrid!=""){
					$(oldtrid).toggleClass("hide_order_detail");
				}
				oldtrid = trid;
				
				$(trid).toggleClass("hide_order_detail");
			}
			function sendProduct(orderId,confirmOrder){
				
				$.post("${pageContext.request.contextPath }/onlineOrderController/changeStatusOrder",{"id":orderId,"ordersttus":confirmOrder},function(data){
					console.log(data);
					if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/onlineOrderController/loadData";
	    				}, 500)
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
				        	<strong class="am-text-primary am-text-lg">用户订单管理</strong>
				        </div>
				      </div>
				
				      <hr>
				
				      <div class="am-g">
				        <div class="am-u-sm-12">
				            <table class="am-table am-table-striped am-table-hover table-main">
				              <thead>
				              <tr>
				                <th class="table-id">ID</th>
				                <th class="table-author">购买帐号</th>
				                <th class="table-title">订单编号 <small>(点击查看详情)</small></th>
				                <th class="table-title">购买产品</th>
				                <th class="table-date">购买时间</th>
				                <th class="table-type">订单状态</th>
				                <th class="table-set">操作</th>
				              </tr>
				              </thead>
				              <tbody>
				              <c:forEach items="${onlinkOrders }" var="oo" varStatus="i">
					              <tr>
					                <td>${i.count }</td>
					                <td>${oo.userLoginName }</td>
					                <td>
					                	<a class="am-btn am-btn-xs am-btn-link" onclick="showOrderDetail('#order${oo.id }')" >${oo.orderno }</a>
					                </td>
					                <td>${oo.productName }</td>
					                <td>
					                	<fmt:formatDate value="${oo.buydate }" pattern="yyyy-MM-dd"/>
					                </td>
					                <td>
					                	<c:if test="${oo.ordersttus eq orderOpen }">
					                		<span class="am-text-danger">待发货</span>
					                	</c:if>
					                	<c:if test="${oo.ordersttus eq orderConfirm }">
					                		<span class="am-text-warning">待收货</span>
					                	</c:if>
					                	<c:if test="${oo.ordersttus eq orderClose }">
					                		<span class="am-text-success">订单完成</span>
					                	</c:if>
					                </td>
					                <td>
					                  <div class="am-btn-toolbar">
					                    <div class="am-btn-group am-btn-group-xs">
					                    	<c:if test="${oo.ordersttus eq orderOpen }">
						                      <a onclick="sendProduct(${oo.id },${orderConfirm })" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
						                      	<span class="am-icon-ambulance"></span> 配送发货
						                      </a>
					                		</c:if>
					                    </div>
					                  </div>
					                </td>
					              </tr>
					              <tr class="hide_order_detail" id="order${oo.id }" name="orderDital">
					              	<td colspan="7" class="detail_padding">
					              		<!--  -->
					              		<div class="row">
											<div class="am-u-md-6">
          										<div class="am-panel am-panel-default">
            										<div class="am-panel-hd am-cf">
            											订单详情
            										</div>
            										<div class="am-panel-bd am-collapse am-in">
              											<ul class="am-list admin-content-task">
                											<li>
                  												订单编号：${oo.orderno }
                											</li>
                											<li>
                  												订单时间：<fmt:formatDate value="${oo.buydate }" pattern="yyyy-MM-dd"/>
                											</li>
                											<li>
                  												收货地址：${oo.address }
                											</li>
                											<li>
                  												联系电话：${oo.tel }
                											</li>
                											<li>
                  												收货客户：${oo.linkMan }
                											</li>
                											<c:if test="${oo.ordersttus eq orderOpen }">
										                		<li class="am-text-danger">订单状态：待发货</li>
										                	</c:if>
										                	<c:if test="${oo.ordersttus eq orderConfirm }">
										                		<li class="am-text-warning">订单状态：待收货</li>
										                	</c:if>
										                	<c:if test="${oo.ordersttus eq orderClose }">
										                		<li class="am-text-success">订单状态：订单完成</li>
										                	</c:if>
              											</ul>
            										</div>
         										 </div>
         									</div>
         									<div class="am-u-md-6">
          										<div class="am-panel am-panel-default">
            										<div class="am-panel-hd am-cf">
            											购买商品信息
            										</div>
            										<div class="am-panel-bd am-collapse am-in">
              											<ul class="am-list admin-content-task">
              												<li>
                  												购买账户：${oo.userLoginName }
                											</li>
                											<li>
                  												商品品类：${oo.productTypeName }
                											</li>
                											<li>
                  												商品名称：${oo.productName }
                											</li>
                											<li>
                  												商品单价：${oo.productPrice }
                											</li>
                											<li>
                  												购买数量：${oo.buynum }
                											</li>
                											<li class="am-text-danger">
                  												订单总价：${oo.buynum * oo.productPrice }
                											</li>
              											</ul>
            										</div>
         										 </div>
         									</div>
					              		</div>
					              		<!--  -->
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
