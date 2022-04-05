package com.shopping.mall.themall.service;

import com.shopping.mall.themall.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserService {
	/**
	 * 注册方法
	 * @param user
	 * @param pwd2
	 * @return
	 */
	boolean register(User user, String pwd2) throws Exception;
	/**
	 * 登录方法
	 * @param user
	 * @return
	 * @throws Exception
	 */
	User login(User user) throws Exception;
	/**
	 * 是否重名方法
	 * @param userName
	 * @return
	 */
	boolean findUser(String userName);
	/**
	 * 电话号是否重复方法
	 * @param phone
	 * @return
	 */
	boolean findPhone(String phone);
	/**
	 * 邮箱是否重复方法
	 * @param email
	 * @return
	 */
	boolean findEmail(@Param("email") String email);
	/**
	 * 查询所有会员
	 * @return
	 */
	List<User> findAllUser();
}
