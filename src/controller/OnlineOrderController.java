package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import constant.shopingConstant;
import entity.OnlineOrder;
import service.IOnlineOrderService;
import util.AjaxResult;
import vo.OnlineOrderVO;

@Controller
@RequestMapping("/onlineOrderController")
public class OnlineOrderController {

	@Autowired
	private IOnlineOrderService onlineOrderService;
	
	@RequestMapping("/loadData")
	public ModelAndView loadData(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<OnlineOrderVO> list = onlineOrderService.findAll();
		map.put("onlinkOrders", list);
		map.put("orderOpen",shopingConstant.OnlineOrder.ORDER_OPEN);
		map.put("orderConfirm", shopingConstant.OnlineOrder.ORDER_CONFIRM);
		map.put("orderClose", shopingConstant.OnlineOrder.ORDER_CLOSE);
		return new ModelAndView("back/userOrder", map);
	}
	
	@RequestMapping("/changeStatusOrder")
	@ResponseBody
	public AjaxResult changeStatusOrder(OnlineOrder onlineOrder){
		onlineOrderService.changeOrderStatus(onlineOrder);
		return new AjaxResult(true, "商品配送成功", null);
	}
}
