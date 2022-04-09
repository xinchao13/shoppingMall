package com.shopping.mall.themall.controller;


import com.shopping.mall.themall.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	IUserService userService;
	/**
	 * 去登录页
	 * @return
	 */
	@RequestMapping("/login")
	public String tologin() {
		return "login";
	}
	//注销用户
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		//清空所有Session
		request.getSession().invalidate();
		//跳转回登录页面
		return "login";

	}
}
