package com.shopping.mall.themall.service.impl;

import com.shopping.mall.themall.dao.UserMapper;
import com.shopping.mall.themall.model.User;
import com.shopping.mall.themall.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
	@Resource
	UserMapper userMapper;
	/**
	 * 注册方法
	 */
	@Override
	public boolean register(User user, String pwd2) throws Exception {
		//数据校验
		if(user.getUserName()==null||"".equals(user.getUserName())) {
			throw new Exception("用户名不能为空！");
		}
		if(user.getUserPassword()==null) {
			throw new Exception("密码不能为空！");
		}
		String pattern = "[a-zA-Z0-9]{6,10}";
		if(!user.getUserPassword().matches(pattern)) {
			throw new Exception("密码格式错误！");
		}
		if(!user.getUserPassword().equals(pwd2)) {
			throw new Exception("密码两次输入不一致！");
		}
		if(!pwd2.matches(pattern)) {
			throw new Exception("确认密码的格式错误！");
		}
		String regex="(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\\d{8}";
		if(!user.getPhone().matches(regex)) {
			throw new Exception("手机号格式错误！");
		}
		if(user.getPhone()==null||"".equals(user.getPhone())) {
			throw new Exception("手机号码不能为空！");
		}
		if(user.getEmail()==null||"".equals(user.getEmail())) {
			throw new Exception("邮箱不能为空！");
		}
		String regex2="\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
		if(!user.getEmail().matches(regex2)) {
			throw new Exception("邮箱格式错误！");
		}
		
		int count = userMapper.insert(user);
		if(count > 0) {
			return true;
		}
		return false;
	}
	@Override
	public User login(User user) throws Exception {
		//数据校验
		if(user.getUserName()==null||"".equals(user.getUserName())) {
			throw new Exception("用户名不能为空！");
		}
		if(user.getUserPassword()==null) {
			throw new Exception("密码不能为空！");
		}
		String pattern = "[a-zA-Z0-9]{6,10}";
		if(!user.getUserPassword().matches(pattern)) {
			throw new Exception("密码格式错误！");
		}
		User u = userMapper.findUserAndPassword(user.getUserName(), user.getUserPassword());
		if(u == null) {
			throw new Exception("用户名或密码错误！");
		}
		return u;
	}
	/**
	 * 注册先检查是否重名方法
	 */
	@Override
	public boolean findUser(String userName) {
		User u = userMapper.findUser(userName);
		if(u == null) {
			return true;
		}
		return false;
	}
	/**
	 * 电话号是否复方法
	 */
	@Override
	public boolean findPhone(String phone) {
		User u = userMapper.findPhone(phone);
		if(u == null) {
			return true;
		}
		return false;
	}
	/**
	 * 邮箱是否重复方法
	 */
	@Override
	public boolean findEmail(String email) {
		User u = userMapper.findEmail(email);
		if(u == null) {
			return true;
		}
		return false;
	}
	@Override
	public List<User> findAllUser() {
		List<User> listUser = userMapper.findAllUser();
		return listUser;
	}
	
}
