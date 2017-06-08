package service;

import java.util.List;

import entity.MemberUser;
import entity.UserAddress;

public interface IUserAddressService {

	public List<UserAddress> findByUserId(MemberUser user);
}
