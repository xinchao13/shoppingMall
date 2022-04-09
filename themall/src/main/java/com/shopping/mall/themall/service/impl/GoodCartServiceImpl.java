package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.GoodcartMapper;
import com.shopping.mall.themall.model.Goodcart;
import com.shopping.mall.themall.service.IGoodCartService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodCartServiceImpl implements IGoodCartService {
	@Resource
	GoodcartMapper goodcartMapper;
	/**
	 * 添加购物车对象
	 */
	@Override
	public int insert(Goodcart goodcart) {
		int count = goodcartMapper.insert(goodcart);
		return count;
	}
	/**
	 * 查询购物车对象
	 */
	@Override
	public Goodcart selectByUseridAndGoodsid(Integer userid, Integer goodsid) {
		Goodcart goodcart = goodcartMapper.selectByUseridAndGoodsid(userid, goodsid);
		return goodcart;
	}
	/**
	 * 修改一条购物车对象的count
	 */
	@Override
	public int updateByPrimaryKey(Goodcart goodcart) {
		int count = goodcartMapper.updateByPrimaryKey(goodcart);
		return count;
	}
	/**
	 * 查询用户的购物车里有几种商品
	 */
	@Override
	public List<Goodcart> selectGoodCart(Integer userid) {
		List<Goodcart> listGoodcart = goodcartMapper.selectGoodCart(userid);
		return listGoodcart;
	}
	@Override
	public List<Goodcart> getInfo(Integer userid) {
		List<Goodcart> listGoodcart = goodcartMapper.getInfo(userid);
		return listGoodcart;
	}
	@Override
	public List<Goodcart> goodsCartDetail(Integer userid) {
		List<Goodcart> listGoodcart = goodcartMapper.goodsCartDetail(userid);
		return listGoodcart;
	}
	@Override
	public Goodcart selectByPrimaryKey(Integer id) {
		Goodcart goodcart = goodcartMapper.selectByPrimaryKey(id);
		return goodcart;
	}
	/**
	 * 查用户购物车里有几种商品
	 */
	@Override
	public Goodcart selectGoodCount(Integer id) {
		Goodcart goodcart = goodcartMapper.selectGoodCount(id);
		return goodcart;
	}
}
