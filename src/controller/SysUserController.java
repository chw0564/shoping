package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import constant.shopingConstant;
import service.ISysUserService;
import util.AjaxResult;
import entity.SysUser;
import exception.SysUserException;

@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	
	@Autowired
	private ISysUserService sysUserService;
	
	@ExceptionHandler(value={SysUserException.class})
	public ModelAndView exceptionHandler(Exception e){
		return new ModelAndView("forward:/adminlogin","message",e.getMessage());
	}
	
	@RequestMapping("/login")
	public String sysUserLogin(SysUser sysUser,HttpSession session) throws SysUserException{
		if(null==sysUser){
			throw new SysUserException("请输入登录名和密码");
		}
		if(null==sysUser.getLoginname()){
			throw new SysUserException("请输入登录名");
		}
		if(null==sysUser.getLoginpassword()){
			throw new SysUserException("请输入登录密码");
		}
		SysUser sysUserLogin = sysUserService.sysUserLogin(sysUser);
		session.setAttribute("user", sysUserLogin);
		session.setAttribute("superStatus", shopingConstant.SysUser.SUPER_SYSTEM_USER);
		return "redirect:/adminIndex";
	}
	
	@RequestMapping("/loginOut")
	public String sysUserLoginOut(HttpSession session) throws SysUserException{
		session.invalidate();
		return "redirect:/adminlogin";
	}
	
	@RequestMapping("/changePwd")
	@ResponseBody
	public AjaxResult sysUserChangePwd(SysUser sysUser,String oldPwd){
		AjaxResult ajaxResult = new AjaxResult();
		try {
			sysUserService.sysUserChangePwd(sysUser, oldPwd);
			ajaxResult.setFlag(true);
			ajaxResult.setMsg("密码修改成功");
		} catch (SysUserException e) {
			//e.printStackTrace();
			ajaxResult.setFlag(false);
			ajaxResult.setMsg("密码修改失败");
		}
		return ajaxResult;
	}
	
	@RequestMapping("/loadAdminSysUser")
	public ModelAndView loadAdminSysUser(){
		List<SysUser> list = sysUserService.findAdminSysUser();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminUsers", list);
		map.put("sysUserClose", shopingConstant.SysUser.SYSTEM_USER_CLOSE);
		return new ModelAndView("back/sysUserManager", map);
	}
	
	@RequestMapping("/adminUserAdd")
	@ResponseBody
	public AjaxResult adminUserAdd(SysUser sysUser){
		AjaxResult ajaxResult = null;
		sysUser.setLoginpassword(shopingConstant.SysUser.DEFAULT_PASSWORD);
		sysUser.setSysuserstatus(shopingConstant.SysUser.SYSTEM_USER_CLOSE);
		
		try {
			sysUserService.addAdminSysUser(sysUser);
			ajaxResult = new AjaxResult(true, "管理员添加成功", null);
		} catch (SysUserException e) {
			ajaxResult = new AjaxResult(true, e.getMessage(), null);
		}
		
		return ajaxResult;
	}
	
	@RequestMapping("/changeSysUserStatus")
	@ResponseBody
	public AjaxResult changeSysUserStatus(Integer id){
		String msg = sysUserService.changeSysUserStatus(id);
		AjaxResult ajaxResult = new AjaxResult(true, msg, null);
		return ajaxResult;
	}
	
	@RequestMapping("/deleteSysUser")
	@ResponseBody
	public AjaxResult deleteSysUser(Integer id){
		sysUserService.deleteSysUser(id);
		AjaxResult ajaxResult = new AjaxResult(true, "管理员删除成功", null);
		return ajaxResult;
	}
	
	@RequestMapping("/loadSysUserById")
	@ResponseBody
	public AjaxResult loadSysUserById(Integer id){
		SysUser sysUser = sysUserService.findSysUserById(id);
		AjaxResult ajaxResult = new AjaxResult(true, "查询成功", sysUser);
		return ajaxResult;
	}
	
	@RequestMapping("/modifySysUser")
	@ResponseBody
	public AjaxResult modifySysUser(SysUser sysUser){
		sysUserService.modifySysUser(sysUser);
		AjaxResult ajaxResult = new AjaxResult(true, "姓名修改成功", sysUser);
		return ajaxResult;
	}
	
	@RequestMapping("/reloadSysUserPwd")
	@ResponseBody
	public AjaxResult reloadSysUserPwd(SysUser sysUser){
		sysUser.setLoginpassword(shopingConstant.SysUser.DEFAULT_PASSWORD);
		sysUserService.modifySysUser(sysUser);
		AjaxResult ajaxResult = new AjaxResult(true, "密码重置成功 <br>(默认密码："+shopingConstant.SysUser.DEFAULT_PASSWORD+")", sysUser);
		return ajaxResult;
	}
}
