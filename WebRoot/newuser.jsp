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
  	<script type="text/javascript">
  		$(function(){
  			$("#02page").addClass("change");
  		});
  	</script>
  </head>
  <body>
	<jsp:include page="/indexHead"></jsp:include>
  	<div class="am-g">
		<div class="am-u-sm-12 am-u-md-10 am-u-lg-8 am-u-sm-centered">
			<div class="am-panel am-panel-default">
				 <img class="am-radius" src="${pageContext.request.contextPath }/img/newuser.png" width="100%" height="auto" />
			</div>
		</div>
  	</div>
  </body>
</html>
