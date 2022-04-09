package com.shopping.mall.themall.controller;

import com.shopping.mall.themall.model.Brand;
import com.shopping.mall.themall.model.Goodcart;
import com.shopping.mall.themall.model.Goods;
import com.shopping.mall.themall.model.User;
import com.shopping.mall.themall.service.IBrandService;
import com.shopping.mall.themall.service.IGoodCartService;
import com.shopping.mall.themall.service.IGoodsService;
import com.shopping.mall.themall.service.IUserService;
import com.shopping.mall.themall.util.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Resource
	IUserService userService;
	@Resource
	IGoodsService goodsService;
	@Resource
	IBrandService brandService;
	@Resource
	IGoodCartService goodCartService;
	/**
	 * 去首页
	 * @return
	 */
	@RequestMapping("/home")
	public String tohome(Model model,HttpSession session) {
		//得到人气商品集合
		List<Goods> listGoods1 = goodsService.selectByFocus();
		model.addAttribute("listGoods1", listGoods1);
		//得到人气商品集合
		List<Goods> listGoods2 = goodsService.selectByRec();
		model.addAttribute("listGoods2", listGoods2);
		//得到新商品集合
		List<Goods> listGoods3 = goodsService.selectByNewGoods();
		model.addAttribute("listGoods3", listGoods3);
		//得到推荐品牌集合
		List<Brand> listBrand = brandService.selectByRec();
		model.addAttribute("listBrand", listBrand);
		User a = (User)session.getAttribute("user");
		if(a != null){
			Goodcart goodcart = goodCartService.selectGoodCount(a.getId());
			model.addAttribute("count", goodcart.getUsergooodscount());
		}

	    return "home";
	}
	/**
	 * 去注册页
	 * @return
	 */
	@RequestMapping("/toregister")
	public String toregister() {
	    return "register";
	}

	/**
	 * 提交登录表单方法
	 * @param user
	 * @param username
	 * @param password
	 * @param code
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/tologin")
	public String login(User user,
			String username,
			String password,
			String code,
			Model model,
			HttpServletRequest request,
			HttpSession session) {
		String randomCode = (String)session.getAttribute(ValidateCode.RANDOMCODEKEY);
		if (code.equalsIgnoreCase(randomCode)) { //忽略大小写判断！
			System.out.println("验证码正确！");
		}else{
			model.addAttribute("message", "验证码不正确");
			return "login";
		}
		try {
			user.setUserName(username);
			user.setUserPassword(password);
			User u = userService.login(user);
			session.setAttribute("user", u);
			if(session.getAttribute("url") == null) {
				return "redirect:/index/home";
			}else {
				String url = (String)session.getAttribute("url");
				url = url.substring(21);
				System.out.println(url);
				return "redirect:"+url;
			}
			
		} catch (Exception e) {
			e.getMessage();
			model.addAttribute("message", e.getMessage());
			return "login";
		}
	}
	/**
	 * ajax查用户名重名
	 * @param userName
	 * @return
	 */
	@RequestMapping("/findusername")
	@ResponseBody
	public String findusername(@RequestParam("userName") String userName) {
		boolean flag = userService.findUser(userName);
		if(flag == true) {
			//未重名
			return "true";
		}
	    return "false";
	}
	/**
	 * ajax查电话号重复
	 * @param phone
	 * @return
	 */
	@RequestMapping("/findphone")
	@ResponseBody
	public String findPhone(@RequestParam("phone") String phone) {
		boolean flag = userService.findPhone(phone);
		if(flag == true) {
			//未重名
			return "true";
		}
	    return "false";
	}
	/**
	 * ajax查邮箱重复
	 * @param email
	 * @return
	 */
	@RequestMapping("/findemail")
	@ResponseBody
	public String findEmail(@RequestParam("email") String email) {
		boolean flag = userService.findEmail(email);
		if(flag == true) {
			//未重名
			return "true";
		}
	    return "false";
	}
	/**
	 * 验证码是否输入正确方法
	 * @param code
	 * @param session
	 * @return
	 */
	@RequestMapping("/yanzhengma")
	@ResponseBody
	public String yanzhengma(@RequestParam("code") String code, HttpSession session) {
		String randomCode = (String)session.getAttribute(ValidateCode.RANDOMCODEKEY);
		if (code.equalsIgnoreCase(randomCode)) { //忽略大小写判断！

			return "true";
		}
	    return "false";
	}
	/**
	 * 注册表单提交
	 * @return
	 */
	@RequestMapping("/register")
	public String register(User user, String code, String pwd2, Model model) {
		boolean flag = userService.findUser(user.getUserName());
		if(flag == true) {
			//未重名
			user.setAddtime(new Date());
			try {
				boolean flag2 = userService.register(user, pwd2);
				if(flag2 == true) {
					return "login";
				}
				return "register";
			} catch (Exception e) {
				e.getMessage();
				model.addAttribute("message", e.getMessage());
				return "register";
			}
		}
		model.addAttribute("message", "用户名已存在！");
	    return "register";
	}
}
