package com.shopping.mall.themall.dao;


import com.shopping.mall.themall.model.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {
	/**
	 * 硬删除方法
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Order order);
    /**
     * 添加一条订单记录
     * @param record
     * @return
     */
    int insert(Order record);

    int insertSelective(Order record);
    /**
     * 通过主键查询订单方法
     * @param id
     * @return
     */
    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    /**
     * 查询某个用户的所有订单
     * @param userid
     * @return
     */
    List<Order> selectOrderList(@Param("userid") Integer userid,
                                @Param("map") Map<String, Object> map);
    /**
     * 后台显示所有订单列表
     * @return
     */
    List<Order> selectBehindOrderList(@Param("map") Map<String, Object> map);
    /**
     * 通过订单id查询详单及商品信息
     * @param ordernum
     * @return
     */
    Order selectDatailbyOrdernum(@Param("ordernum") Integer ordernum);
    /**
     * 取消订单修改方法
     * @param order
     * @return
     */
    int updateByCancelOrder(Order order);
    /**
     * 付款订单修改方法
     * @param order
     * @return
     */
    int updateByPayOrder(Order order);
    /**
     * 提醒卖家发货方法
     * @param order
     * @return
     */
    int remind(Order order);
    /**
     * 确认收货方法
     * @param order
     * @return
     */
    int confirmGet(Order order);
    /**
     * 评价方法ruanDelete
     * @param order
     * @return
     */
    int aspire(Order order);
    /**
     * 软删除方法
     * @param order
     * @return
     */
    int ruanDelete(Order order);
}