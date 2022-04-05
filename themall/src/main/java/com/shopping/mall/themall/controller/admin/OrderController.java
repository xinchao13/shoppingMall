package com.shopping.mall.themall.controller.admin;


import com.shopping.mall.themall.model.Order;
import com.shopping.mall.themall.service.IOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Resource
	IOrderService orderService;
	/**
	 * 显示后台订单管理方法
	 * @return
	 */
	@RequestMapping("/toshoworderlist")
	public String showOrderList(Model model, @RequestParam Map<String,Object> map) {
		List<Order> listOrder = orderService.selectBehindOrderList(map);
		model.addAttribute("listOrder", listOrder);
		return "admin/behindorderlist";
	}
	/**
	 * 显示后台详单方法
	 * @return
	 */
	@RequestMapping("/toshowdetailorder")
	public String showdetailOrderList(HttpSession session, Model model, String ordernum) {
		Order order = orderService.selectDatailbyOrdernum(Integer.parseInt(ordernum));
		model.addAttribute("orderDetail", order);
		
		return "/admin/bdetailorder";
	}
	/**
	 * 后台取消订单方法
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping("/cancelorder")
	public String cancelOrder(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.updateByCancelOrder(order);	
		if(count != 1) {
			return "forward:/admin/order/toshowdetailorder?ordernum="+orderid;
		}
		return "forward:/admin/order/toshowdetailorder?ordernum="+orderid;
	}
	/**
	 * 提醒卖家发货方法
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping("/remind")
	public String remind(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.remind(order);
		if(count != 1) {
			return "forward:/admin/order/toshowdetailorder?ordernum="+orderid;
		}
		return "forward:/admin/order/toshowdetailorder?ordernum="+orderid;
	}
}
