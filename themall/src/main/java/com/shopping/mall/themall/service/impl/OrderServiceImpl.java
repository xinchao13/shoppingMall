package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.*;
import com.shopping.mall.themall.model.*;
import com.shopping.mall.themall.service.IOrderService;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderServiceImpl implements IOrderService {
	@Resource
	OrderMapper orderMapper;
	@Resource
	AddressMapper addressMapper;
	@Resource
	GoodcartMapper goodcartMapper;
	@Resource
	DetailOrderMapper detailOrderMapper;
	@Resource
	GoodsMapper goodsMapper;
	/**
	 * 添加一条记录
	 */
	@Override
	public int insert(Order order) {
		int count = orderMapper.insert(order);
		return count;
	}
	/**
	 * 生成订单详单减库存改购物车操作
	 */
	@Override
	@Transactional
	public Map<String, Object> createOrderAndDetail(HttpSession session, String addressid, String goodcartid) {
		System.out.println(addressid);
		System.out.println(goodcartid);
		Map<String, Object> result = new HashMap<>();
		//得到上一页面勾选的购物车集合，在计算勾选的总价格，并校验库存
		String[] ids2 = goodcartid.split(",");
		BigDecimal sum = null;
		BigDecimal sum1 = new BigDecimal(0);
		List<Goodcart> listGoodcart = new ArrayList<>();
		for(int i=0;i<ids2.length;i++) {
			Goodcart goodcart = goodcartMapper.selectByPrimaryKey(Integer.parseInt(ids2[i]));
			if(goodcart.getGoods().getStock()<goodcart.getCount()) {
				result.put("STATUS", "FAIL");
				result.put("Message", "库存不足！");
				return result;
			}
			sum = goodcart.getGoods().getNewprice().multiply(new BigDecimal(goodcart.getCount()));
			sum1 = sum1.add(sum);
			System.out.println(sum1);
			listGoodcart.add(goodcart);
		}
		result.put("sum", sum1);
		//通过地址id查询地址对象
		Address address = addressMapper.selectByPrimaryKey(Integer.parseInt(addressid));
		if(address == null) {
			result.put("STATUS", "FAIL");
			result.put("Message", "未找到收货地址！");
			return result;
		}
		//订单号的生成策略  userId+时间戳+随机数===================begin
		User user = (User)session.getAttribute("user");
		String path = String.valueOf(user.getId());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String path1 = sdf.format(new Date());
		String path2 = String.valueOf((int)(Math.random()*9+1)*100);
		String ordernum = path+path1+path2;
		System.out.println(ordernum);
		result.put("ordernum", ordernum);
		Order order = new Order();
		
		order.setOrdernum(ordernum);
		order.setAddtime(new Date());
		order.setConsigneename(address.getConsigneename());
		order.setDetailaddress(address.getDetailaddress());
		order.setOrderstatus(0);
		order.setPhone(address.getPhone());
		order.setPostcodecode(address.getPostcodecode());
		order.setProcityarea(address.getProcityarea());
		order.setUserid(address.getUserid());
		order.setOrdersum(sum1);
		int count = orderMapper.insert(order);
		result.put("order", order);
		if(count != 1) {
			result.put("STATUS", "FAIL");
			result.put("Message", "生成订单失败！");
			return result;
		}
		//订单号的生成策略  userId+时间戳+随机数===================end
		//生成详单===============================================begin
		for(String id : ids2){
			DetailOrder detailOrder = new DetailOrder();
			Goodcart goodsCart = goodcartMapper.selectByPrimaryKey(Integer.parseInt(id));
			BigDecimal sPrice = new BigDecimal(goodsCart.getCount()).multiply(goodsCart.getGoods().getNewprice());
			detailOrder.setAddtime(new Date());
			detailOrder.setOrdernum(order.getId());
			detailOrder.setGoodsid(goodsCart.getGoodsid());
			detailOrder.setCount(goodsCart.getCount());
			detailOrder.setPrice(sPrice);
			int count2 = detailOrderMapper.insert(detailOrder);
			if(count2 != 1) {
				result.put("STATUS", "FAIL");
				result.put("Message", "生成详单失败！");
				return result;
			}
			//删除购物车
			int count3 = goodcartMapper.deleteByPrimaryKey(goodsCart.getId());
			if(count3 != 1) {
				result.put("STATUS", "FAIL");
				result.put("Message", "删除购物车记录失败！");
				return result;
			}
			//减库存
			Goods goods  = goodsCart.getGoods();
			Integer newStock = goods.getStock()-goodsCart.getCount();
			goods.setStock(newStock);
			int count4 = goodsMapper.updateStock(goods);
			if(count4 != 1) {
				result.put("STATUS", "FAIL");
				result.put("Message", "修改商品库存失败！");
				return result;
			}
		}
		//生成详单===============================================end
		result.put("STATUS", "SUCCESS");
		return result;
	}
	/**
	 * 前台查询订单列表方法
	 */
	@Override
	public List<Order> selectOrderList(Integer userid,Map<String,Object> map) {
		List<Order> listOrder = orderMapper.selectOrderList(userid,map);
		return listOrder;
	}
	/**
	 * 后台查询订单列表方法
	 */
	@Override
	public List<Order> selectBehindOrderList(Map<String,Object> map) {
		List<Order> listOrder = orderMapper.selectBehindOrderList(map);
		return listOrder;
	}
	/**
	 * 前后台查询详单方法
	 */
	@Override
	public Order selectDatailbyOrdernum(Integer ordernum) {
		Order order = orderMapper.selectDatailbyOrdernum(ordernum);
		return order;
	}
	/**
	 * 前台取消订单方法
	 */
	@Override
	public int updateByCancelOrder(Order order) {
		int count = orderMapper.updateByCancelOrder(order);
		return count;
	}
	/**
	 * 前台付款订单方法
	 */
	@Override
	public int updateByPayOrder(Order order) {
		int count = orderMapper.updateByPayOrder(order);
		return count;
	}
	/**
	 * 通过主键查询订单方法
	 */
	@Override
	public Order selectByPrimaryKey(Integer id) {
		Order order = orderMapper.selectByPrimaryKey(id);
		return order;
	}
	/**
	 * 提醒卖家发货方法
	 */
	@Override
	public int remind(Order order) {
		int count = orderMapper.remind(order);
		return count;
	}
	@Override
	public int confirmGet(Order order) {
		int count = orderMapper.confirmGet(order);
		return count;
	}
	@Override
	public int aspire(Order order) {
		int count = orderMapper.aspire(order);
		return count;
	}
	@Override
	public int ruanDelete(Order order) {
		int count = orderMapper.ruanDelete(order);
		return count;
	}
	@Override
	public int deleteByPrimaryKey(Order order) {
		int count = orderMapper.deleteByPrimaryKey(order);
		return count;
	}

}
