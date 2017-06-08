<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <div class="am-g">
		<div class="am-u-sm-12 am-u-md-10 am-u-lg-8 am-u-sm-centered topNav">
			<div class="am-topbar-brand">
				<img src="${pageContext.request.contextPath }/img/logo.png">
			</div>
			<div class="am-topbar-right" >
				<h1 class="setMagZERO"><i class="am-icon-phone"></i> 8888-888-8888</h1>
				<p class="setMagZERO">工作时间：9:00-18:00（周一至周五）</p>
			</div>
		</div>
  	</div>
  	<div class="am-g backColor nav">
  		<div class="am-u-sm-12 am-u-md-10 am-u-lg-8 am-u-sm-centered">
  			<ul class="clear">
  				<li id="01page"><a href="${pageContext.request.contextPath }/index.jsp">商城首页</a></li>
  				<li id="02page"><a href="${pageContext.request.contextPath }/newuser.jsp">新手上路</a></li>
  				<li id="03page"><a href="#">购物指南</a></li>
  				<li id="04page"><a href="#">用户留言</a></li>
  				<li id="05page"><a href="#">关于我们</a></li>
  				<li><a href="${pageContext.request.contextPath }/adminlogin">后台登录</a></li>
  			</ul>
  			<ul class="clear-right" id="user-btn-bar">
  				<c:if test="${!empty memberUser }">
  					<li>
  						<a href="${pageContext.request.contextPath }/userShopingController/loadProductForCart"  class="am-btn am-btn-xs am-radius am-btn-primary">我的购物车</a>
  					</li>
	    			<li>
	    				<a class="am-btn am-btn-xs am-radius am-btn-primary">我的订单</a>
	    			</li>
  				</c:if>
  				<c:if test="${empty memberUser }">
	  				<li>
	  					<button type="button" class="am-btn am-btn-xs am-radius am-btn-primary" data-am-modal="{target: '#addNewUser'}">会员注册</button>
	  				</li>
	  				<li>
	  					<button type="button" class="am-btn am-btn-xs am-radius am-btn-primary" data-am-modal="{target: '#loginIndexUser'}">会员登录</button>
	  				</li>
  				</c:if>
  			</ul>
  		</div>
  	</div>

 <!-- 会员注册  -->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="addNewUser">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">新会员注册</div>
	    <hr>
	    <div class="am-modal-bd">
	     	<form class="am-form am-form-horizontal">
			  <div class="am-form-group">
			    <label for="name" class="am-u-sm-3 am-form-label">真实姓名</label>
			    <div class="am-u-sm-9">
			      <input type="text" id="name" name="name">
			    </div>
			  </div>
			  <div class="am-form-group">
			    <label for="username" class="am-u-sm-3 am-form-label">会员帐号</label>
			    <div class="am-u-sm-9">
			      <input type="text" id="username" name="username">
			    </div>
			  </div>
			  <div class="am-form-group">
			    <label for="password" class="am-u-sm-3 am-form-label">登录密码</label>
			    <div class="am-u-sm-9">
			      <input type="password" id="password" name="password">
			    </div>
			  </div>
			</form>
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" onclick="addNewUser()">确定</span>
	    </div>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/toastr.css"/>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr.min.js"></script>
	    <script type="text/javascript">
	    	function addNewUser(){
	    		var fm = $("#addNewUser form");
	    		$.post("${pageContext.request.contextPath }/publicDataController/addNewUser",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    </script>
	  </div> 
	</div>	
	
	<!-- 会员登录  -->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="loginIndexUser">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">会员登录</div>
	    <hr>
	    <div class="am-modal-bd">
	     	<form class="am-form am-form-horizontal">
			  <div class="am-form-group">
			    <label for="username" class="am-u-sm-3 am-form-label">会员帐号</label>
			    <div class="am-u-sm-9">
			      <input type="text" id="username" name="username">
			    </div>
			  </div>
			  <div class="am-form-group">
			    <label for="password" class="am-u-sm-3 am-form-label">登录密码</label>
			    <div class="am-u-sm-9">
			      <input type="password" id="password" name="password">
			    </div>
			  </div>
			</form>
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" onclick="loginToUser()">确定</span>
	    </div>
	    <script type="text/javascript">
	    	function loginToUser(){
	    		var fm = $("#loginIndexUser form");
	    		$.post("${pageContext.request.contextPath }/publicDataController/loginIndexUser",fm.serialize(),function(data){
	    			if(data.flag){
	    				toastr.success(data.msg);
	    				var str ='<li><button type="button" class="am-btn am-btn-xs am-radius am-btn-primary">我的购物车</button></li>'
	    						 +'<li><button type="button" class="am-btn am-btn-xs am-radius am-btn-primary">我的订单</button></li>';
	    				$("#user-btn-bar").html(str);
	    			}else{
	    				toastr.error(data.msg);
	    			}
	    		},"json");
	    	}
	    </script>
	  </div> 
	</div>	