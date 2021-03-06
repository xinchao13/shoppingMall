package com.shopping.mall.themall.dao;

import com.shopping.mall.themall.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    User selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table shopping_user
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(User record);
    /**
     * 用户名是否重名方法
     * @param userName
     * @return
     */
    User findUser(@Param("userName") String userName);
    /**
     * 电话号是否重复方法
     * @param phone
     * @return
     */
    User findPhone(@Param("phone") String phone);
    /**
     * email是否重复方法
     * @param email
     * @return
     */
    User findEmail(@Param("email") String email);
    /**
     * 登录方法
     * @param userName
     * @param userPassword
     * @return
     */
    User findUserAndPassword(@Param("userName") String userName, @Param("userPassword") String userPassword);
    /**
     * 查询所有会员
     * @return
     */
    List<User> findAllUser();
}