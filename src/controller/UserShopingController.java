package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.MemberUser;
import entity.OnlineOrder;
import entity.Product;
import entity.UserAddress;
import service.IProductService;
import service.IUserAddressService;
import util.AjaxResult;

@Controller
@RequestMapping("/userShopingController")
public class UserShopingController {
	
	@Autowired
	private IUserAddressService userAddressService;
	@Autowired
	private IProductService productService;
	
	@RequestMapping("/addProductToCart")
	@ResponseBody
	public AjaxResult addProductToCart(Integer pid,HttpSession session){
		Map<Integer, OnlineOrder> orderCartList = (Map<Integer, OnlineOrder>) session.getAttribute("orderCartList");
		if(orderCartList==null){
			orderCartList = new HashMap<Integer, OnlineOrder>();
		}
		if(!orderCartList.containsKey(pid)){
			Product product = productService.findProductById(pid);
			orderCartList.put(pid, new OnlineOrder(pid, 1.0,product));
		}else{
			orderCartList.get(pid).addBuyNum(1);
		}
		session.setAttribute("orderCartList", orderCartList);
		return new AjaxResult(true, "添加购物车成功", null);
	}
	
	@RequestMapping("/loadProductForCart")
	public ModelAndView loadProductForCart(HttpSession session){
		MemberUser user = (MemberUser) session.getAttribute("memberUser");
		List<UserAddress> list = userAddressService.findByUserId(user);
		return new ModelAndView("userpage/usercart","addressList",list);
	}
}
