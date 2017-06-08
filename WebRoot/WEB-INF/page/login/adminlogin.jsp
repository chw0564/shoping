<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>管理员登录</title>
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
	    <h1>在线商城-后台管理系统</h1>
	  </div>
	  <hr />
	</div>
	<div class="am-g">
	  <div class="am-u-lg-4 am-u-md-6 am-u-sm-centered">
	    <h3>
	    	管理员登录&nbsp;
	    	<c:if test="${!empty message }">
	    		<span class="error-msg">${message }</span>
	    	</c:if>
	    </h3>
	    <hr>
	    <form action="${pageContext.request.contextPath }/sysUser/login" method="post" class="am-form">
	      <label for="loginname">登录帐号:</label>
	      <input type="text" name="loginname" id="loginname" value="">
	      <br>
	      <label for="loginpassword">登录密码:</label>
	      <input type="password" name="loginpassword" id="loginpassword" value="">
	      <br>
	      <div class="am-cf">
	        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl am-btn-block">
	      </div>
	    </form>
	  </div>
	</div>
</body>
</html>

