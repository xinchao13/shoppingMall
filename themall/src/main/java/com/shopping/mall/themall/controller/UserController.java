package com.shopping.mall.themall.controller;


import com.shopping.mall.themall.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	IUserService userService;
	
	
}
