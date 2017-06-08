package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.MemberUser;
import service.IMemberUserService;
import util.AjaxResult;

@Controller
@RequestMapping("/memberUserController")
public class MemberUserController {

	@Autowired
	private IMemberUserService memberUserService;
	
	@RequestMapping("/loadData")
	public ModelAndView loadData(){
		List<MemberUser> list = memberUserService.findAll();
		return new ModelAndView("back/userInfo", "users", list);
	}
	
	@RequestMapping("/reloadUserPwd")
	@ResponseBody
	public AjaxResult reloadUserPwd(Integer id){
		memberUserService.changeUserPwd(id);
		return new AjaxResult(true, "密码重置成功<br>重置密码：123456", null);
	}
}
