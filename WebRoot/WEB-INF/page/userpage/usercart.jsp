<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>在线商城</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/amazeui.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/usermain.css" type="text/css"></link>
	<style type="text/css">
		.table-img > img{
			width: 80px;
			height: 80px;
		}
	
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/num-alignment.js"></script>
	<script type="text/javascript">
		$(function(){
			gettime();
		});
		
		function gettime(){
			var now=new Date();
			var year=now.getFullYear();
			var month=now.getMonth();
			var day=now.getDate();
			var hours=now.getHours();
			var minutes=now.getMinutes();
			var seconds=now.getSeconds();
			var timeStr = ""+year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
			$("#time").html(timeStr);
			window.setTimeout("gettime()",1000);
		}
	</script>
  </head>
  
  <body>
  	  
    <jsp:include page="/indexHead"></jsp:include>
    
  	<div class="am-g">
		<div class="am-u-sm-12 am-u-md-10 am-u-lg-8 am-u-sm-centered">
			<div class="am-g">
				<div class="am-u-sm-6">
					<ol class="am-breadcrumb olSet">
						<li><span class="am-icon-home" style="color: #0e90d2">地址列表</span></li>
					</ol>
				</div>
				<div class="am-u-sm-6" align="right">
					<ol class="am-breadcrumb olSet">
						<li><span class="am-icon-clock-o" style="color: #0e90d2" id="time">
						</span></li>
					</ol>
				</div>
			</div>
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<table class="am-table am-table-striped am-table-hover table-main">
				    	<thead>
				        	<tr>
				                <th class="table-check">配送地址选择</th>
				                <th class="table-title">配送地址</th>
				                <th class="table-type">联系电话</th>
				                <th class="table-type">联系人</th>
				        	</tr>
				        </thead>
				     	<tbody>
				     		<c:forEach items="${addressList }" var="address" varStatus="i">
				     			<tr>
				                	<td class="table-check">
				                		<c:if test="${i.index eq 0 }">
				       						<input type="radio" name="addressId" value="${address.id }" checked />
				                		</c:if>
				                		<c:if test="${i.index ne 0 }">
				       						<input type="radio" name="addressId" value="${address.id }"/>
				                		</c:if>
				                	</td>
				                	<td class="table-title">${address.address }</td>
				                	<td class="table-type">${address.tel }</td>
				                	<td class="table-type">${address.linkname }</td>
				        		</tr>
				     		</c:forEach>
				     	</tbody>
				     </table>
				</div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-6">
					<ol class="am-breadcrumb olSet">
						<li><span class="am-icon-home" style="color: #0e90d2">购物车列表</span></li>
					</ol>
				</div>
			</div>
			<div class="am-panel am-panel-default">
				<div class="am-panel-bd">
					<table class="am-table am-table-striped am-table-hover table-main">
				     	<tbody>
				     		<c:forEach items="${orderCartList }" var="map" varStatus="i">
				     			<tr height="100px">
				                	<td class="table-id" style="line-height: 80px">${i.count }</td>
				                	<td class="table-img" style="line-height: 80px">
				                		<img src="${pageContext.request.contextPath }/productImg/${map.value.product.imgurl }">
				                	</td>
				                	<td class="table-title" style="line-height: 80px">${map.value.product.proname }</td>
				                	<td class="table-title" style="line-height: 80px">${map.value.product.proprice }</td>
				                	<td class="table-title" style="padding-top: 26px;">
				                		<input id="${i.count }" data_step="1" data_min="1" data_max="10" data_digit="1" value="${map.value.buynum }">
				                	</td>
				                	<td class="table-title" style="line-height: 80px">
				                		总计：${map.value.buynum*map.value.product.proprice }
				                	</td>
				        		</tr>
				     		</c:forEach>
				     	</tbody>
				     </table>
				</div>
			</div>
		</div>
  	</div>
  </body>
</html>
