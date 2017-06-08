package service;

import java.util.List;

import entity.OnlineOrder;
import vo.OnlineOrderVO;

public interface IOnlineOrderService {

	public List<OnlineOrderVO> findAll();
	
	public void changeOrderStatus(OnlineOrder onlineOrder);
}
