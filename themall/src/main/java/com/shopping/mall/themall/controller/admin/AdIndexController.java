package com.shopping.mall.themall.controller.admin;


import com.shopping.mall.themall.model.User;
import com.shopping.mall.themall.service.IUserService;
import com.shopping.mall.themall.util.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/index")
public class AdIndexController {
	@Resource
	IUserService userService;
	/**
	 * 去后台管理登录页
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {
	    return "admin/login";
	}
	/**
	 * 登录页表单提交
	 * @return
	 */
	@RequestMapping("/tologin")
	public String tologin(String username, String password, String code,
                          Model model, User user,
                          HttpSession session) {
		String randomCode = (String)session.getAttribute(ValidateCode.RANDOMCODEKEY);
		if (code.equalsIgnoreCase(randomCode)) { //忽略大小写判断！
			System.out.println("验证码正确！");
		}else{
			model.addAttribute("message", "验证码不正确");
			return "admin/login";
		}
		try {
			user.setUserName(username);
			user.setUserPassword(password);
			User u = userService.login(user);
			
			//判断后台登录用户是否具有权限
			if(u.getPower() != true) {
				model.addAttribute("message", "该用户无权限");
				return "admin/login";
			}
			session.setAttribute("user", u);
			return "redirect:/admin/index/home";
		} catch (Exception e) {
			e.getMessage();
			model.addAttribute("message", e.getMessage());
			return "admin/login";
		}
	}
	/**
	 * 去后台管理首页
	 * @return
	 */
	@RequestMapping("/home")
	public String tohome() {
		
	    return "admin/index";
	}
	/**
	 * 得到welcome页
	 * @return
	 */
	@RequestMapping("/welcome")
	public String welcome() {
	    return "admin/welcome";
	}
	/**
	 * 得到人員列表
	 * @return
	 */
	@RequestMapping("/touserlist")
	public String touserlist(Model model) {
		List<User> listUser = userService.findAllUser();
		model.addAttribute("listUser", listUser);
	    return "admin/userlist";
	}

}
