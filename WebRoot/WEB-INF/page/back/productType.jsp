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
			function addProductType(){
	    		var fm = $("#productType-add form");
	    		$.post("${pageContext.request.contextPath }/ProductTypeController/productTypeAdd",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductTypeController/loadData";
	    				}, 500)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
			function changeProductTypeStatus(id){
	    		$.post("${pageContext.request.contextPath }/ProductTypeController/changeProductTypeStatus",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductTypeController/loadData";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	function deleteProductType(id){
	    		console.log(id);
	    		$.post("${pageContext.request.contextPath }/ProductTypeController/deleteProductType",{"id":id},function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductTypeController/loadData";
	    				}, 1000)
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    	function productModify(id){
	    		var fm = $("#productType-modify form");	
	    		$.post("${pageContext.request.contextPath }/ProductTypeController/loadPtById",{"id":id},function(data){
	    			if(data.flag){
	    				fm.find("#id").val(data.data.id);
	    				fm.find("#producttypename").val(data.data.producttypename);
	    				$("#productType-modify").modal();
	    			}
	    		},"json");
	    	}
	    	function modifyProductType(){
	    		var fm = $("#productType-modify form");	
	    		$.post("${pageContext.request.contextPath }/ProductTypeController/modifyProductType",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				setTimeout(function() {
	    					window.location.href = "${pageContext.request.contextPath }/ProductTypeController/loadData";
	    				}, 1000)
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
				        	<strong class="am-text-primary am-text-lg">商品类型管理</strong>
				        </div>
				      </div>
				
				      <hr>
				
				      <div class="am-g">
				        <div class="am-u-sm-12 am-u-md-8">
				          <div class="am-g">
				          	<div class="am-u-sm-12 am-u-md-6">
					          	<button type="button" class="am-btn am-btn-secondary am-btn-sm" data-am-modal="{target: '#productType-add'}">新产品类型</button>
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
				                <th class="table-title">产品类型名称</th>
				                <th class="table-type">状态</th>
				                <th class="table-set">操作</th>
				              </tr>
				              </thead>
				              <tbody>
				              <c:forEach items="${ptlist }" var="pt" varStatus="i">
					              <tr>
					                <td>${i.count }</td>
					                <td>${pt.producttypename }</td>
					                <td>
					                	<c:if test="${pt.producttypestatus eq ptclose }">
					                		<span class="am-text-danger">禁用</span>
					                	</c:if>
					                	<c:if test="${pt.producttypestatus ne ptclose }">
					                		<span class="am-text-success">启用</span>
					                	</c:if>
					                </td>
					                <td>
					                  <div class="am-btn-toolbar">
					                    <div class="am-btn-group am-btn-group-xs">
					                      <a href="#" onclick="productModify(${pt.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
					                      	<span class="am-icon-pencil-square-o"></span> 修改
					                      </a>
					                      <a href="#" onclick="changeProductTypeStatus(${pt.id})" class="am-btn am-btn-default am-btn-xs am-hide-sm-only">
					                      	<span class="am-icon-copy"></span> 
					                      	 <c:if test="${pt.producttypestatus eq ptclose }">
						                		启用
						                	  </c:if>
						                	  <c:if test="${pt.producttypestatus ne ptclose }">
						                		禁用
						                	  </c:if>					                      	
					                      </a>
					                      <a href="#" onclick="deleteProductType(${pt.id})" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
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
		
		
		 <!-- 产品类型添加 modal 开始 -->
	      <div class="am-modal am-modal-confirm" tabindex="-1" id="productType-add">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">产品类型添加</div>
			    <hr>
			    <div class="am-modal-bd">
			     	<form action="#" class="am-form am-form-horizontal">
					  <div class="am-form-group">
					    <label for="producttypename" class="am-u-sm-3 am-form-label">类型名称</label>
					    <div class="am-u-sm-9">
					      <input type="text" id="producttypename" name="producttypename">
					    </div>
					  </div>
					</form>
			    </div>
			    <div class="am-modal-footer">
			      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
			      <span class="am-modal-btn" onclick="addProductType()">确定</span>
			    </div>
			  </div>
			</div>
	       <!-- 产品类型添加 modal 结束 -->
	       <!-- 产品类型修改 modal 开始 -->
		      <div class="am-modal am-modal-confirm" tabindex="-1" id="productType-modify">
				  <div class="am-modal-dialog">
				    <div class="am-modal-hd">产品类型添加</div>
				    <hr>
				    <div class="am-modal-bd">
				     	<form action="#" class="am-form am-form-horizontal">
						  <div class="am-form-group">
						    <label for="producttypename" class="am-u-sm-3 am-form-label">类型名称</label>
						    <div class="am-u-sm-9">
						      <input type="text" id="producttypename" name="producttypename">
						    </div>
						  </div>
						  <input type="hidden" id="id" name="id">
						</form>
				    </div>
				    <div class="am-modal-footer">
				      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
				      <span class="am-modal-btn" onclick="modifyProductType()">确定</span>
				    </div>
				  </div>
				</div>
		   <!-- 产品类型修改 modal 结束 -->
	</body>
</html>
