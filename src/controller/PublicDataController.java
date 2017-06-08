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

import constant.shopingConstant;
import entity.MemberUser;
import entity.ProductType;
import exception.MemberUserException;
import service.IMemberUserService;
import service.IProductService;
import service.IProductTypeService;
import util.AjaxResult;
import vo.ProductVO;

@Controller
@RequestMapping("/publicDataController")
public class PublicDataController {

	@Autowired
	private IProductTypeService productTypeService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IMemberUserService memberUserService;
	
	@RequestMapping("/loadAllType")
	@ResponseBody
	public AjaxResult loadAllProductType(){
		List<ProductType> list = productTypeService.findAllOpen();
		return new AjaxResult(true, "", list);
	}
	
	@RequestMapping("/loadOpenProduct")
	@ResponseBody
	public AjaxResult loadOpenProduct(Integer id){
		if(id==-1){
			id = null;
		}
		List<ProductVO> list = productService.findOpenProductByExam(shopingConstant.Product.PRODUCT_OPEN,
																	shopingConstant.productType.PRODYCT_TYPE_OPEN,
																	id);
		return new AjaxResult(true, "", list);
	}
	
	@RequestMapping("/addNewUser")
	@ResponseBody
	public AjaxResult addNewUser(MemberUser user){
		try {
			String addMsg = memberUserService.addNewUser(user);
			return new AjaxResult(true, addMsg, null);
		} catch (MemberUserException e) {
			return new AjaxResult(false, e.getMessage(), null);
		}
	}
	
	@RequestMapping("/loginIndexUser")
	@ResponseBody
	public AjaxResult loginIndexUser(MemberUser user,HttpSession session){
		try {
			 MemberUser memberUser = memberUserService.loginUser(user);
			 session.setAttribute("memberUser", memberUser);
			return new AjaxResult(true, "欢迎您："+memberUser.getName(), memberUser.getName());
		} catch (MemberUserException e) {
			return new AjaxResult(false, e.getMessage(), null);
		}
	}
	
	@RequestMapping("/loginPageUser")
	public ModelAndView loginPageUser(MemberUser user,HttpSession session){
		try {
			 MemberUser memberUser = memberUserService.loginUser(user);
			 session.setAttribute("memberUser", memberUser);
			 return new ModelAndView("redirect:/index.jsp");
		} catch (MemberUserException e) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("msg", e.getMessage());
			map.put("inputUser", user);
			return new ModelAndView("forward:/userlogin.jsp", map);
		}
	}
}
