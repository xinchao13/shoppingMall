package com.shopping.mall.themall.controller;


import com.shopping.mall.themall.service.IUserService;
import com.shopping.mall.themall.util.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	/**
	 * 显示验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/imgcode")
	public void toregister(HttpServletRequest request, HttpServletResponse response) {
		//显示出二维码
		//设置响应类型，图片格式
		response.setContentType("image/jpeg");
		//设置响应头，阻止浏览器缓存此响应的内容(节约内存)
		response.setHeader("Pragma", "No-cache");

		//引用工具类中的方法，绘制验证码图片
		ValidateCode code = new ValidateCode();
		code.getValidateCode(request, response);//调用绘制验证码的方法，绘制图片
	}
}
