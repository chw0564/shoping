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
			$(function(){
				$.post("${pageContext.request.contextPath }/ProductTypeController/loadAjaxData",function(data){
					if(data.flag){
						$(data.data).each(function(){
							if(this.producttypestatus==data.msg){
								if(this.id == ${product.typeid }){
									$("#typeid").append("<option value='"+this.id+"' selected disabled>"+this.producttypename+"</option>");
								}else{
									$("#typeid").append("<option value='"+this.id+"' disabled>"+this.producttypename+"</option>");
								}
							}else{
								if(this.id == ${product.typeid }){
									$("#typeid").append("<option value='"+this.id+"' selected >"+this.producttypename+"</option>");
								}else{
									$("#typeid").append("<option value='"+this.id+"' >"+this.producttypename+"</option>");
								}
							}
						});
					}
				},"json");
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
				        	<strong class="am-text-primary am-text-lg">商品信息修改</strong>
				        </div>
				      </div>
				
				      <hr>
					 <form action="${pageContext.request.contextPath }/ProductController/modifyProduct" method="post" class="am-form am-form-horizontal" enctype="multipart/form-data">
					  <input type="hidden" name="id" value="${product.id }">
					  <div class="am-form-group">
					    <label for="typeid" class="am-u-sm-2 am-form-label">商品类别</label>
					    <div class="am-u-sm-5">
					      <select id="typeid" name="typeid">
					      </select>
					      <span class="am-form-caret"></span>
					    </div>
					    <div class="am-u-sm-5"></div>
					  </div>
					
					  <div class="am-form-group">
					    <label for="proname" class="am-u-sm-2 am-form-label">商品名称</label>
					    <div class="am-u-sm-5">
					      <input type="text" id="proname" name="proname" value="${product.proname }">
					    </div>
					    <div class="am-u-sm-5"></div>
					  </div>
					
					  <div class="am-form-group">
					    <label for="proprice" class="am-u-sm-2 am-form-label">商品价格</label>
					    <div class="am-u-sm-5">
					      <input type="number" id="proprice" name="proprice" value="${product.proprice }">
					    </div>
					    <div class="am-u-sm-5"></div>
					  </div>
					  <div class="am-form-group am-form-file">
					      <label class="am-u-sm-2 am-form-label" for="file">商品照片</label>
					      <div class="am-u-sm-5">
					        <button type="button" class="am-btn am-btn-success am-btn-sm">
					          <i class="am-icon-cloud-upload"></i> 请选择商品图片</button>
					      </div>
					      <input type="file" id="file" name="file">
					      <!-- 图片预览 -->
						<script type="text/javascript">
							$('#file').change(function() {
								$("#p-img-f").attr("src", window.URL.createObjectURL(this.files[0]));
							});
						</script>
					  </div>
					  <div class="am-form-group">
					    <div class="am-u-sm-5 am-u-sm-offset-2">
					    	<img id="p-img-f" src="${pageContext.request.contextPath }/productImg/${product.imgurl }" class="am-img-thumbnail am-radius" width="200px" height="auto">
					    </div>
					  </div>
					  <div class="am-form-group">
					    <div class="am-u-sm-5 am-u-sm-offset-2">
					      <button type="submit" class="am-btn am-btn-primary">修改商品</button>
					    </div>
					  </div>
					</form>
			
			        </div>
				</div>
				<jsp:include page="/foot"></jsp:include>
			</div>
		</div>
	</body>
</html>
