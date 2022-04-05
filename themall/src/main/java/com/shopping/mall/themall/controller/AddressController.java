package com.shopping.mall.themall.controller;

import com.shopping.mall.themall.model.Address;
import com.shopping.mall.themall.model.User;
import com.shopping.mall.themall.service.IAddressService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Resource
	IAddressService addressService;
	/**
	 * 查询用户的所有地址集合
	 * @param userid
	 * @param model
	 * @return
	 */
	@RequestMapping("/showaddresslist")
	public String toShowAddressList(String userid, Model model) {
		List<Address> listAddress = addressService.selectByUserid(Integer.parseInt(userid));
		model.addAttribute("listAddress", listAddress);
		return "addresslist";
	}
	/**
	 * 删除用户的一条地址记录
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteaddress")
	public String deleteAddress(HttpSession session, String id, Model model) {
		int count = addressService.deleteByPrimaryKey(Integer.parseInt(id));
		User user = (User)session.getAttribute("user");
		return "forward:/address/showaddresslist?userid="+user.getId();
	}
	/**
	 * ajax显示新增地址界面
	 * @param session
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping("/toaddAddresss")
	public String toAddAddresss(HttpSession session, Model model) {
		return "insertAddress";
	}
	/**
	 * ajax显示编辑地址界面
	 * @param session
	 * @param
	 * @param model
	 * @return
	 */
	@RequestMapping("/toupdateaddress")
	public String toUpdateAddress(String addressid, HttpSession session, Model model) {
		Address address = addressService.selectByPrimaryKey(Integer.parseInt(addressid));
		model.addAttribute("address", address);
		return "updateAddress";
	}
	/**
	 * 新增地址表单提交方法
	 * @param session
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/addAddress")
	public String addAddress(String trueName, String area1,
                             String area2, String area_info, String zip, String telephone,
                             HttpSession session, String id, Model model) {
		User user = (User)session.getAttribute("user");
		Address address = new Address();
		address.setAddtime(new Date());
		address.setConsigneename(trueName);
		address.setPhone(telephone);
		address.setPostcodecode(zip);
		address.setProcityarea(area1+area2);
		address.setDetailaddress(area_info);
		address.setUserid(user.getId());
		//查询此次新增是否是第一次新增，看这个用户有没有一个地址
		List<Address> listAddress = addressService.selectByUserid(user.getId());
		if(listAddress == null) {
			address.setMorenstatus(true);
		}else {
			address.setMorenstatus(false);
		}
		int count = addressService.insert(address);
		return "forward:/address/showaddresslist?userid="+user.getId();
	}
	/**
	 * 编辑修改地址方法
	 * @param trueName
	 * @param area1
	 * @param area2
	 * @param area_info
	 * @param zip
	 * @param telephone
	 * @param session
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toupdateAddress")
	public String toUpdateAddress(String trueName, String area1,
                                  String area2, String area_info, String zip, String telephone,
                                  HttpSession session, String id, Model model) {
		User user = (User)session.getAttribute("user");
		Address address = new Address();
		address.setConsigneename(trueName);
		address.setPhone(telephone);
		address.setPostcodecode(zip);
		address.setProcityarea(area1+area2);
		address.setDetailaddress(area_info);
		address.setId(Integer.parseInt(id));
		int count = addressService.updateByPrimaryKey(address);
		System.out.println(count);
		return "forward:/address/showaddresslist?userid="+user.getId();
	}
}
