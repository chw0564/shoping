<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>会员登录</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <metaname="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/msg.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
	<div class="header">
	  <div class="am-g">
	    <h1>在线商城-会员登录</h1>
	  </div>
	  <hr />
	</div>
	<div class="am-g">
	  <div class="am-u-lg-4 am-u-md-6 am-u-sm-centered">
    	<c:if test="${!empty msg }">
    		<span class="error-msg">${msg }</span>
    		<hr>
    	</c:if>
	    <form action="${pageContext.request.contextPath }/publicDataController/loginPageUser" method="post" class="am-form">
	      <label for="username">会员帐号:</label>
	      <input type="text" name="username" id="username" value="${inputUser.username }">
	      <br>
	      <label for="password">登录密码:</label>
	      <input type="password" name="password" id="password" value="${inputUser.password }">
	      <br>
	      <div class="am-cf">
	        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl am-btn-block">
	      </div>
	    </form>
	  </div>
	</div>
</body>
</html>

