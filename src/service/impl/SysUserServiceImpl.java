package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.SysUserMapper;
import entity.SysUser;
import entity.SysUserExample;
import exception.SysUserException;
import service.ISysUserService;

@Service("sysUserService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class SysUserServiceImpl implements ISysUserService{

	@Autowired
	private SysUserMapper sysUserMapper;
	
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public SysUser sysUserLogin(SysUser sysUser) throws SysUserException {
		
		SysUserExample sysUserExample = new SysUserExample();
		sysUserExample.createCriteria()
					  .andLoginnameEqualTo(sysUser.getLoginname())
					  .andLoginpasswordEqualTo(sysUser.getLoginpassword());
		
		List<SysUser> list = sysUserMapper.selectByExample(sysUserExample);
		if(null==list || list.isEmpty()){
			throw new SysUserException("用户名密码错误");
		}
		if(list.get(0).getSysuserstatus()==shopingConstant.SysUser.SYSTEM_USER_CLOSE){
			throw new SysUserException("帐号禁用，请联系系统管理员");
		}
		return list.get(0);
	}


	@Override
	public void sysUserChangePwd(SysUser sysUser, String oldPWD)throws SysUserException {
		SysUserExample sysUserExample = new SysUserExample();
		sysUserExample.createCriteria()
					  .andIdEqualTo(sysUser.getId())
					  .andLoginpasswordEqualTo(oldPWD);
		List<SysUser> list = sysUserMapper.selectByExample(sysUserExample);
		if(null==list || list.isEmpty()){
			throw new SysUserException("登录密码错误");
		}
		sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}


	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<SysUser> findAdminSysUser() {
		SysUserExample example = new SysUserExample();
		example.createCriteria()
			   .andSysuserstatusNotEqualTo(shopingConstant.SysUser.SUPER_SYSTEM_USER);
		List<SysUser> list = sysUserMapper.selectByExample(example);
		return list;
	}


	@Override
	public void addAdminSysUser(SysUser sysUser) throws SysUserException {
		SysUserExample example = new SysUserExample();
		example.createCriteria().andLoginnameEqualTo(sysUser.getLoginname());
		List<SysUser> list = sysUserMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new SysUserException("登录帐号已存在");
		}
		sysUserMapper.insertSelective(sysUser);
	}


	@Override
	public String changeSysUserStatus(Integer id) {
		SysUser sysUser = sysUserMapper.selectByPrimaryKey(id);
		String msg = null;
		if(sysUser.getSysuserstatus()==shopingConstant.SysUser.SYSTEM_USER_CLOSE){
			sysUser.setSysuserstatus(shopingConstant.SysUser.ADMIN_SYSTEM_USER);
			msg = "管理员已启用";
		}else if(sysUser.getSysuserstatus()==shopingConstant.SysUser.ADMIN_SYSTEM_USER){
			sysUser.setSysuserstatus(shopingConstant.SysUser.SYSTEM_USER_CLOSE);
			msg = "管理员已禁用";
		}
		sysUserMapper.updateByPrimaryKeySelective(sysUser);
		return msg;
	}


	@Override
	public void deleteSysUser(Integer id) {
		sysUserMapper.deleteByPrimaryKey(id);
	}


	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public SysUser findSysUserById(Integer id) {
		SysUser sysUser = sysUserMapper.selectByPrimaryKey(id);
		return sysUser;
		
	}


	@Override
	public void modifySysUser(SysUser sysUser) {
		sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}
}
