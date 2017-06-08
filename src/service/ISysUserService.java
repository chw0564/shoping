package service;

import java.util.List;

import entity.SysUser;
import exception.SysUserException;

public interface ISysUserService {
	
	public SysUser sysUserLogin(SysUser sysUser) throws SysUserException;
	
	public void sysUserChangePwd(SysUser sysUser,String oldPWD) throws SysUserException;

	public List<SysUser> findAdminSysUser();
	
	public void addAdminSysUser(SysUser sysUser) throws SysUserException;
	
	public String changeSysUserStatus(Integer id);
	
	public void deleteSysUser(Integer id);
	
	public SysUser findSysUserById(Integer id);
	
	public void modifySysUser(SysUser sysUser);
	
}
