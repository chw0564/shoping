<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>在线商城</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/amazeui.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/usermain.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/template-web.js"></script>
	<script type="text/javascript">
		function addProductToShopingCart(pid){
			$.post("${pageContext.request.contextPath }/userShopingController/addProductToCart",{"pid":pid},function(data){
				if(data.flag){
    				toastr.success(data.msg);
    			}else{
    				toastr.error("请先登录");
    			}
			});
		}
	</script>
	<script type="text/html" id="nav-template">
		<label class="am-btn am-active">
			<input type="radio" name="productTypeId" value='-1' checked="checked" onchange="loadProductList(this.value)">全部商品
		</label>
		{{each data value }}
			<label class="am-btn">
				<input type="radio" name="productTypeId" value='{{value.id}}' onchange="loadProductList(this.value)" >{{value.producttypename }}
			</label>
		{{/each }}
	</script>

	<script type="text/html" id="productTemplate">
		{{each data value }}
			<div class="am-u-sm-4 pro-padd">
				<ul class="am-list am-list-static am-list-border">
					<li>
						<img src="${pageContext.request.contextPath }/productImg/{{value.imgurl}}" width="100%" height="200px">
					</li>
					<li>
						<p class="am-text-truncate">商品名称：{{value.proname}}</p>
						<p>商品价格：{{value.proprice}}</p>
					</li>
					<li>
						<button type="button" class="am-btn am-btn-xs am-btn-warning am-btn-block" onclick="addProductToShopingCart({{value.id}})">加入购物车</button>
					</li>
				</ul>
			</div>
		{{/each }}
	</script>
	<script type="text/javascript">
		$(function(){
			gettime();
			$.post("${pageContext.request.contextPath }/publicDataController/loadAllType",function(data){
				var html = template('nav-template', data);
				$("#ptsNav").html(html);
			},"json")
			loadProductList(-1);
			$("#01page").addClass("change");
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
		function loadProductList(typeId){
			$.post("${pageContext.request.contextPath }/publicDataController/loadOpenProduct",{"id":typeId},function(data){
				var html = template('productTemplate', data);
				$("#product-list").html(html);
			});
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
						<li><span class="am-icon-home" style="color: #0e90d2">商品列表</span></li>
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
					<div class="am-btn-group doc-js-btn-1" data-am-button style="position: absolute;">
					  <label class="am-btn am-disabled">
					    <input type="radio"> 商品品类：
					  </label>
					</div>
					<div class="am-btn-group doc-js-btn-1" data-am-button id="ptsNav" style="padding-left: 100px">
					  <label class="am-btn am-active">
					    <input type="radio" name="rateNums" value='-1' checked="checked">全部商品
					  </label>
					</div>
				</div>
			</div>
			<div class="am-panel am-panel-default">
				<div class="row" id="product-list">
					
				</div>
			</div>
		</div>
  	</div>
  </body>
</html>
