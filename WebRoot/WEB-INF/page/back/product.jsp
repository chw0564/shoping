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
		<style type="text/css">
			.product_show_img{
				width: auto;
				height: 140px;
			}
		</style>
		<script type="text/javascript">
			function changeProductStatus(id){
	    		$.post("${pageContext.request.contextPath }/ProductController/changeProductStatus",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductController/loadData";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	
	    	function deleteProduct(id){
	    		$.post("${pageContext.request.contextPath }/ProductController/deleteProduct",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductController/loadData";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	
	    	$(function(){
	    		var msg = "${productMsg }";
	    		if(msg!=""){
	    			toastr.warning(msg);
	    		}
	    	});
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
				        	<strong class="am-text-primary am-text-lg">商品管理</strong>
				        </div>
				      </div>
				
				      <hr>
				
				      <div class="am-g">
				        <div class="am-u-sm-12 am-u-md-8">
				          <div class="am-g">
				          	<div class="am-u-sm-12 am-u-md-6">
					          	<a href="${pageContext.request.contextPath }/productAdd" type="button" class="am-btn am-btn-secondary am-btn-sm">添加商品</a>
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
				                <th class="table-title">商品名称</th>
				                <th class="table-type">单价</th>
				                <th class="table-type">图片</th>
				                <th class="table-type">品类</th>
				                <th class="table-type">状态</th>
				                <th class="table-set">操作</th>
				              </tr>
				              </thead>
				              <tbody>
				              <c:forEach items="${plist }" var="p" varStatus="i">
					              <tr>
					                <td>${i.count }</td>
					                <td>${p.proname }</td>
					                <td>${p.proprice }</td>
					                <td>
					                	<input type="button" class="am-btn am-btn-link am-btn-xs" 
					                		   data-am-popover="{theme: 'primary', content: '<img class=\'product_show_img\' src=\'${pageContext.request.contextPath }/productImg/${p.imgurl }\'>', trigger: 'hover focus'}"  
					                		   value="查看图片"/>
					                </td>
					                <td>${p.typename }</td>
					                <td>
					                	<c:if test="${p.typestatus eq ptstatus }">
					                		<c:if test="${p.prostatus eq pstatus }">
						                		<span class="am-text-success">销售中</span>
					                		</c:if>
					                		<c:if test="${p.prostatus ne pstatus }">
						                		<span class="am-text-warning">停销|补货</span>
					                		</c:if>
					                	</c:if>
					                	<c:if test="${p.typestatus ne ptstatus }">
					                		<span class="am-text-danger">品类已下线</span>
					                	</c:if>
					                </td>
					                <td>
					                  <div class="am-btn-toolbar">
					                    <div class="am-btn-group am-btn-group-xs">
					                      <c:if test="${p.typestatus eq ptstatus }">
					                      	<a href="${pageContext.request.contextPath }/ProductController/pageToProductModify?id=${p.id }" class="am-btn am-btn-default am-btn-xs am-text-secondary">
					                      		<span class="am-icon-pencil-square-o"></span> 修改
					                      	</a>
					                	  </c:if>
					                	  <c:if test="${p.typestatus ne ptstatus }">
					                	  	<a href="#" class="am-btn am-btn-default am-btn-xs am-text-secondary am-disabled"">
					                      		<span class="am-icon-pencil-square-o"></span> 修改
					                      	</a>
					                	  </c:if>
					                      
					                      <c:if test="${p.typestatus eq ptstatus }">
					                      	<a href="#" onclick="changeProductStatus(${p.id})" class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
					                      		<span class="am-icon-copy"></span> 
				                      	 		<c:if test="${p.prostatus eq pstatus }">
					                				停销|补货
					                	  		</c:if>
					                	  		<c:if test="${p.prostatus ne pstatus }">
					                				启销
					                	  		</c:if>					                      	
					                      	</a>
					                	  </c:if>
					                	  <c:if test="${p.typestatus ne ptstatus }">
					                		<a href="#" class="am-btn am-btn-default am-btn-xs am-hide-sm-only am-disabled">
					                      		<span class="am-icon-copy"></span> 品类已下线			                      	
					                      	</a>
					                	  </c:if>
					                      <a href="#" onclick="deleteProduct(${p.id})" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
					                      	<span class="am-icon-trash-o"></span> 删除
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
