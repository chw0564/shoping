package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import constant.shopingConstant;
import dao.OnlineOrderMapper;
import dao.ProductMapper;
import entity.OnlineOrder;
import entity.OnlineOrderExample;
import entity.Product;
import entity.ProductExample;
import exception.ProductException;
import service.IOnlineOrderService;
import service.IProductService;
import vo.OnlineOrderVO;
import vo.ProductVO;

@Service("onlineOrderService")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class OnlineOrderServiceImpl implements IOnlineOrderService{

	@Autowired
	private OnlineOrderMapper orderMapper;
	
	@Override
	@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
	public List<OnlineOrderVO> findAll() {
		List<OnlineOrderVO> list = orderMapper.selectAllVo();
		return list;
	}

	@Override
	public void changeOrderStatus(OnlineOrder onlineOrder) {
		orderMapper.updateByPrimaryKeySelective(onlineOrder);
	}
	
	
}
