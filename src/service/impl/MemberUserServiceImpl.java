package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.MemberUserMapper;
import entity.MemberUser;
import entity.MemberUserExample;
import exception.MemberUserException;
import service.IMemberUserService;

@Service("memberUserService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class MemberUserServiceImpl implements IMemberUserService{

	@Autowired
	private MemberUserMapper memberUserMapper;
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<MemberUser> findAll() {
		List<MemberUser> list = memberUserMapper.selectByExample(null);
		return list;
	}

	@Override
	public void changeUserPwd(Integer id) {
		MemberUser user = new MemberUser();
		user.setId(id);
		user.setPassword(shopingConstant.MemberUser.DEFAULT_PASSWORD);
		memberUserMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public String addNewUser(MemberUser user) throws MemberUserException {
		MemberUserExample example = new MemberUserExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername());
		List<MemberUser> list = memberUserMapper.selectByExample(example);
		if(list!=null&&!list.isEmpty()){
			throw new MemberUserException("会员帐号已存在!");
		}
		memberUserMapper.insertSelective(user);
		return "注册成功！请登录";
	}

	@Override
	public MemberUser loginUser(MemberUser user) throws MemberUserException {
		MemberUserExample example = new MemberUserExample();
		example.createCriteria()
			   .andUsernameEqualTo(user.getUsername())
			   .andPasswordEqualTo(user.getPassword());
		List<MemberUser> list = memberUserMapper.selectByExample(example);
		if(list==null||list.isEmpty()){
			throw new MemberUserException("登录失败！用户名或密码错误");
		}
		return list.get(0);
	}

}
