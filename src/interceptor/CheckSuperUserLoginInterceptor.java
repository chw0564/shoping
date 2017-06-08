package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import constant.shopingConstant;
import entity.SysUser;

public class CheckSuperUserLoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView mav) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		SysUser sysUser =  (SysUser) request.getSession().getAttribute("user");
		if(sysUser==null){
			response.sendRedirect(request.getContextPath()+"/adminlogin");
			return false;
		}
		if(sysUser.getSysuserstatus()!=shopingConstant.SysUser.SUPER_SYSTEM_USER){
			response.sendRedirect(request.getContextPath()+"/adminIndex");
			return false;
		}
		return true;
	}

}
