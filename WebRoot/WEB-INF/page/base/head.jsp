<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<strong>在线商城</strong> <small>后台管理系统</small>
	</div>
	<button
		class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
		data-am-collapse="{target: '#topbar-collapse'}">
		<span class="am-sr-only"></span> <span class="am-icon-bars"></span>
	</button>
	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<li class="am-dropdown" data-am-dropdown>
				<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
					<span class="am-icon-users"></span>
					欢迎您：${user.username }
					<span class="am-icon-caret-down"></span>
				</a>
				<ul class="am-dropdown-content">
					<li>
						<button class="am-btn am-btn-link" href="#" data-am-modal="{target: '#sysUser-changePwd'}">
							<span class="am-icon-cog"></span>修改密码
						</button>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/sysUser/loginOut">
							<span class="am-icon-power-off"></span>退出
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</header>

<!-- 管理员密码修改 -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="sysUser-changePwd">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">密码修改</div>
    <hr>
    <div class="am-modal-bd">
     	<form class="am-form am-form-horizontal">
		  <div class="am-form-group">
		    <label for="oldPwd" class="am-u-sm-3 am-form-label">登录密码</label>
		    <div class="am-u-sm-9">
		      <input type="password" id="oldPwd" name="oldPwd">
		    </div>
		  </div>
		  <div class="am-form-group">
		    <label for="loginpassword" class="am-u-sm-3 am-form-label">新密码</label>
		    <div class="am-u-sm-9">
		      <input type="password" id="loginpassword" name="loginpassword">
		    </div>
		  </div>
		  <input type="hidden" name="id" value="${user.id }">
		</form>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" onclick="changePwd()">确定</span>
    </div>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/toastr.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/toastr.min.js"></script>
    <script type="text/javascript">
    	toastr.options = {positionClass: "toast-top-center"};
    	function changePwd(){
    		var fm = $("#sysUser-changePwd form");
    		$.post("${pageContext.request.contextPath }/sysUser/changePwd",fm.serialize(),function(data){
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
