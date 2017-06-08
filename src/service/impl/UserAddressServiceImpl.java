package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.SysUserMapper;
import dao.UserAddressMapper;
import entity.MemberUser;
import entity.SysUser;
import entity.SysUserExample;
import entity.UserAddress;
import entity.UserAddressExample;
import entity.UserAddressExample.Criteria;
import exception.SysUserException;
import service.ISysUserService;
import service.IUserAddressService;

@Service("userAddressService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class UserAddressServiceImpl implements IUserAddressService{

	@Autowired
	private UserAddressMapper userAddressMapper;
	
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<UserAddress> findByUserId(MemberUser user){
		UserAddressExample example = new UserAddressExample();
		example.createCriteria().andUseridEqualTo(user.getId());
		List<UserAddress> list = userAddressMapper.selectByExample(example);
		return list;
	}
}
