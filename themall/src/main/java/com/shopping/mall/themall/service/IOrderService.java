package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Order;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface IOrderService {
    /**
     * 添加一条订单记录
     * @param record
     * @return
     */
    int insert(Order record);
    /**
     * 通过主键查询订单方法
     * @param id
     * @return
     */
    Order selectByPrimaryKey(Integer id);
    /**
     * 生成订单和详单，购物车删除结算的记录，商品表减库存
     * @param addressid
     * @param goodcartid
     * @return
     */
    Map<String, Object> createOrderAndDetail(HttpSession session, String addressid, String goodcartid);
    /**
     * 查询某个用户的所有订单
     * @param userid
     * @return
     */
    List<Order> selectOrderList(Integer userid, Map<String, Object> map);
    /**
     * 后台显示所有订单列表
     * @return
     */
    List<Order> selectBehindOrderList(Map<String, Object> map);
    /**
     * 通过订单id查询详单及商品信息
     * @param ordernum
     * @return
     */
    Order selectDatailbyOrdernum(Integer ordernum);
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
     * 评价方法
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
	/**
	 * 硬删除方法
	 * @param id
	 * @return
	 */
    int deleteByPrimaryKey(Order order);
}
