package com.shopping.mall.themall.controller;

import com.shopping.mall.themall.model.*;
import com.shopping.mall.themall.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("/goods")
public class GoodController {
	@Resource
	IUserService userService;
	@Resource
	IGoodsService goodsService;
	@Resource
	IBrandService brandService;
	@Resource
	IImgService imgService;
	@Resource
	ISpecService specService;
	@Resource
	IGoodsAndSpecvService goodsAndSpecvService;
	@Resource
	IGoodCartService goodCartService;
	@Resource
	IAddressService addressService;
	@Resource
	IOrderService orderService;
	/**
	 * 去商品展示页
	 * @return
	 */
	@RequestMapping("/toshowgoods")
	public String tohome(String goodsid, String productid, HttpSession session, Model model) {
		//参照淘宝，判断session是否有用户，无用户直接跳转登录页，有用户进入商品展示页
		User a = (User)session.getAttribute("user");
		if(a == null){
			return "redirect:/user/login";
		}else {
			//得到商品对象
			Goods goods = goodsService.selectByPrimaryKey(Integer.parseInt(goodsid));
			model.addAttribute("goods", goods);
			//得到商品附图
			List<Img> listImg = imgService.selectByGoodsId(Integer.parseInt(goodsid));
			model.addAttribute("listImg", listImg);
			//得到商品的规格信息
			List<Spec> listSpec = specService.selectSpec(Integer.parseInt(productid));
			model.addAttribute("listSpec", listSpec);
			//得到这个商品的具体规格值
			List<GoodsAndSpecv> listGoodsSpecv = goodsAndSpecvService.selectByGoodsid(Integer.parseInt(goodsid));
			model.addAttribute("listGoodsSpecv", listGoodsSpecv);
			if(a != null){
				Goodcart goodcart = goodCartService.selectGoodCount(a.getId());
				model.addAttribute("count", goodcart.getUsergooodscount());
			}
//		//得到用户的购物车中商品信息
//		if(session.getAttribute("user") != null) {
//			User user = (User)session.getAttribute("user");
//			//得到用户的商品信息
//			List<Goodcart> listGoodCart = goodCartService.getInfo(user.getId());
//			model.addAttribute("listGoodCart", listGoodCart);
//		}
			return "goods";
		}


	}
	/**
	 * ajax动态改变商品信息
	 * @return
	 */
	@RequestMapping("/changegoods")
	@ResponseBody
	public Map<String,Object> ajaxupdate(String productid,String specvIds) {
		System.out.println(productid);//产品号
		System.out.println(specvIds);//规则值id字符串
		Integer specvid1 = null;
		Integer specvid2 = null;
		if(specvIds !=null) {
			String[] ids = specvIds.split(",");//得到ids数组
			if(ids.length == 2) {	
				specvid2 = Integer.parseInt(ids[1]);
			}
			specvid1 = Integer.parseInt(ids[0]);
		}
		//根据中间表查询商品id，在根据商品id查询商品对象
		int goodsid = goodsAndSpecvService.findByProAndSpecv(Integer.parseInt(productid), specvid1, specvid2);
		Goods goods = goodsService.selectByPrimaryKey(goodsid);
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("goods", goods);
	    return result;
	}
	/**
	 * 购物车添加商品方法
	 * @param goodsid
	 * @param count
	 * @param goodcart
	 * @param session
	 * @return
	 */
	@RequestMapping("/addgoodscart")
	@ResponseBody
	public Map<String,Object> addGoodsCart(HttpServletRequest req, String goodsid, String count, Goodcart goodcart, HttpSession session) {
		System.out.println(goodsid);
		System.out.println(count);
		String url = req.getHeader("REFERER");//记录未登录最后一次界面地址
		session.setAttribute("url", url);
		Map<String,Object> result = new HashMap<String,Object>();
		//判断是否登录
		if(session.getAttribute("user") == null) {
			result.put("STATUS", "FAIL1");
			return result;
		}
		User user = (User)session.getAttribute("user");

		//根据商品id与用户id查询购物车对象
		Goodcart goodcart2 = goodCartService.selectByUseridAndGoodsid(user.getId(), Integer.parseInt(goodsid));
		if(goodcart2 != null) {
			//根据商品id查对象得到库存
			Goods goods = goodsService.selectByPrimaryKey(Integer.parseInt(goodsid));
			int goodsStock = goods.getStock();//商品库存
			int goodsCount = goodcart2.getCount()+Integer.parseInt(count);//要买的商品数量
			if(goodsStock < goodsCount) {
				goodsCount = goodsStock;
			}
			goodcart2.setCount(goodsCount);
			int count2 = goodCartService.updateByPrimaryKey(goodcart2);
			List<Goodcart> listGoodcart = goodCartService.selectGoodCart(user.getId());
			//计算总价
			BigDecimal sum = null;
			BigDecimal sum1 = new BigDecimal(0);
			for(Goodcart goodcart3:listGoodcart) {
				Goods goods1 = goodsService.selectByPrimaryKey(goodcart3.getGoodsid());//得到商品对象
				sum = goods1.getNewprice().multiply(new BigDecimal(goodcart3.getCount()));
				sum1 = sum1.add(sum);
			}
			result.put("count", listGoodcart.size());
			result.put("total_price", sum1);//把sum传回去
			if(count2 == 0) {
				result.put("STATUS", "FAIL2");
				return result;
			}
			result.put("STATUS", "SUCCESS");
			return result;
		}else{//第一次添加购物车，对购物车对象进行赋值
			//得到商品库存
			Goods goods = goodsService.selectByPrimaryKey(Integer.parseInt(goodsid));
			if(goods.getStock()<Integer.parseInt(count)) {
				goodcart.setCount(goods.getStock());
			}else {
				goodcart.setCount(Integer.parseInt(count));
			}
			goodcart.setAddtime(new Date());
			goodcart.setGoodsid(Integer.parseInt(goodsid));
			goodcart.setUserid(user.getId());
			int count2 = goodCartService.insert(goodcart);
			List<Goodcart> listGoodcart = goodCartService.selectGoodCart(user.getId());
			//计算总价
			BigDecimal sum = null;
			BigDecimal sum1 = new BigDecimal(0);
			for(Goodcart goodcart3:listGoodcart) {
				Goods goods1 = goodsService.selectByPrimaryKey(goodcart3.getGoodsid());//得到商品对象
				sum = goods1.getNewprice().multiply(new BigDecimal(goodcart3.getCount()));
				sum1 = sum1.add(sum);
			}
			result.put("count", listGoodcart.size());//把count传回去
			result.put("total_price", sum1);//把sum传回去
			if(count2 != 1) {
				result.put("STATUS","FAIL2");
				return result;
			}
			result.put("STATUS","SUCCESS");
			return result;
		}
		
	}
	/**
	 * ajax动态改变顶部商品信息
	 * @return
	 */
	@RequestMapping("/showgoodcart")
	public String showgoodcart(HttpSession session, Model model) {
		List<Goodcart> listGoodCart = null;
		//判断是否登录
		if(session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			//得到用户的商品信息
			listGoodCart = goodCartService.getInfo(user.getId());
			model.addAttribute("listGoodCart", listGoodCart);
		}
		//得到总价
		BigDecimal sum = null;
		BigDecimal sum1 = new BigDecimal(0);
		if(listGoodCart != null) {
			for(Goodcart goodcart3:listGoodCart) {
				Goods goods1 = goodsService.selectByPrimaryKey(goodcart3.getGoodsid());//得到商品对象
				sum = goods1.getNewprice().multiply(new BigDecimal(goodcart3.getCount()));
				sum1 = sum1.add(sum);
			}
			model.addAttribute("sum", sum1);
		}
		
		return "goodsInfo";
	}
	/**
	 * 去购物车展示页
	 * @return
	 */
	@RequestMapping("/toshowgoodcart")
	public String toshowgoodcart(HttpSession session, Model model) {
		List<Goodcart> listGoodCart = null;
		//判断是否登录,得到这个用户的购物车（购物车包含商品对象）商品集合
		if(session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			//得到用户的购物车详细商品信息
			listGoodCart = goodCartService.goodsCartDetail(user.getId());
			model.addAttribute("listGoodCart", listGoodCart);
		}
	    return "goodcart";
	}
	/**
	 * ajax动态修改商品数量
	 * @return
	 */
	@RequestMapping("/ajaxUpdateCount")
	@ResponseBody
	public Map<String,Object> ajaxUpdateCount(String cartid,String count) {
		Map<String,Object> result = new HashMap<String,Object>();
		Goodcart goodCart = goodCartService.selectByPrimaryKey(Integer.parseInt(cartid));
		if(goodCart.getGoods().getStock() <= Integer.parseInt(count)) {
			int count2 = goodCart.getGoods().getStock();
			goodCart.setCount(count2);
			result.put("count",count2);
		}else {
			goodCart.setCount(Integer.parseInt(count));
			result.put("count",Integer.parseInt(count));
		}
		goodCartService.updateByPrimaryKey(goodCart);
		//把count与每种商品的小计传回去
		result.put("sprice",goodCart.getGoods().getNewprice().multiply(new BigDecimal(count)));

		return result;
	}
	/**
	 * 去确认订单页
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/toconfirmorder")
	public String toConfirmOrder(String ids, HttpSession session, Model model) {
		System.out.println(ids);
		//得到上一页面勾选的购物车集合，在计算勾选的总价格
		String[] ids2 = ids.split(",");
		BigDecimal sum = null;
		BigDecimal sum1 = new BigDecimal(0);
		List<Goodcart> listGoodcart = new ArrayList<>();
		for(int i=0;i<ids2.length;i++) {
			Goodcart goodcart = goodCartService.selectByPrimaryKey(Integer.parseInt(ids2[i]));
			sum = goodcart.getGoods().getNewprice().multiply(new BigDecimal(goodcart.getCount()));
			sum1 = sum1.add(sum);
			listGoodcart.add(goodcart);
		}
		model.addAttribute("listGoodcart", listGoodcart);
		model.addAttribute("sum", sum1);
		//根据当前用户查询收货地址集合
		User user = (User)session.getAttribute("user");
		List<Address> listAddress = addressService.selectByUserid(user.getId());
		model.addAttribute("listAddress", listAddress);
		return "confirmorder";
	}
	/**
	 * 订单确认提交并生成订单号与详单
	 * @param addressid
	 * @param goodcartid
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/ordersubmit")
	public String orderSubmit(String addressid, String goodcartid, HttpSession session, Model model) {
		Map<String,Object> result = orderService.createOrderAndDetail(session, addressid, goodcartid);
		if("SUCCESS".equals(result.get("STATUS"))) {
			model.addAttribute("sum", result.get("sum"));
			model.addAttribute("ordernum", result.get("ordernum"));
			model.addAttribute("order", result.get("order"));
			return "createorder";
		}else {
			//跳转到购物车页面
			return "redirect:/toshowgoodcart";
		}
	}
	/**
	 * 去订单列表
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/toshowOrder")
	public String toShowOrder(HttpSession session, Model model,
                              @RequestParam Map<String,Object> map) {
		System.out.println(map);
		User user = (User)session.getAttribute("user");
		List<Order> listOrder = orderService.selectOrderList(user.getId(),map);
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("map", map);
		return "orderlist";
	}
	/**
	 * 去详单页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/todetailorder")
	public String toDetailorder(String ordernum, HttpSession session, Model model) {
		Order order = orderService.selectDatailbyOrdernum(Integer.parseInt(ordernum));
		model.addAttribute("order", order);
		return "detailorder";
	}
	/**
	 * 前台取消订单方法
	 * @return
	 */
	@RequestMapping("/cancelorder")
	public String cancelOrder(String orderid,Order order) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.updateByCancelOrder(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 前台付款订单方法，跳转付款页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/payorder")
	public String toPayOrder(String orderid, Order order, Model model) {
		//查询订单号与总金额
		order = orderService.selectByPrimaryKey(Integer.parseInt(orderid));
		model.addAttribute("sum", order.getOrdersum());
		model.addAttribute("ordernum", order.getOrdernum());
		model.addAttribute("order", order);
		return "createorder";
		
	}
	/**
	 * 付款成功后执行方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/payorder2")
	public String payOrder(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.updateByPayOrder(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 提醒卖家发货方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/remind")
	public String remind(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.remind(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 确认收货方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/confirmget")
	public String confirmGet(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.confirmGet(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 评价方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/aspire")
	public String aspire(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.aspire(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 软删方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/ruanDelete")
	public String ruanDelete(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.ruanDelete(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
	/**
	 * 硬删方法
	 * @param model
	 * @return
	 */
	@RequestMapping("/yingDelete")
	public String yingDelete(String orderid, Order order, Model model) {
		order.setId(Integer.parseInt(orderid));
		int count = orderService.deleteByPrimaryKey(order);
		if(count != 1) {
			return "orderlist";
		}
		return "redirect:/goods/toshowOrder";
	}
}
