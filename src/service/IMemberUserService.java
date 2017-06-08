package service;

import java.util.List;

import entity.MemberUser;
import exception.MemberUserException;

public interface IMemberUserService {

	public List<MemberUser> findAll();
	
	public void changeUserPwd(Integer id);
	
	public String addNewUser(MemberUser user) throws MemberUserException;
	
	public MemberUser loginUser(MemberUser user) throws MemberUserException;
}
