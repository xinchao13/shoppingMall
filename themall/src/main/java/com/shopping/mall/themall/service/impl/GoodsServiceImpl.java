package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.GoodsMapper;
import com.shopping.mall.themall.model.Goods;
import com.shopping.mall.themall.service.IGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements IGoodsService {
	
	@Resource
	GoodsMapper goodsMapper;
	/**
	 * 查所有商品的列表
	 */
	@Override
	public List<Goods> selectAll(Map<String,Object> map) {
		List<Goods> listGoods = goodsMapper.selectAll(map);
		return listGoods;
	}
	/**
	 * 添加一个商品对象
	 */
	@Override
	public int insert(Goods goods) {
		int count = goodsMapper.insert(goods);
		return count;
	}
	/**
	 * 通过主键查询商品对象
	 */
	@Override
	public Goods selectByPrimaryKey(Integer id) {
		Goods goods = goodsMapper.selectByPrimaryKey(id);
		return goods;
	}
	/**
	 * 修改商品方法
	 */
	@Override
	public int updateByPrimaryKey(Goods goods) {
		int count = goodsMapper.updateByPrimaryKey(goods);
		return count;
	}
	/**
	 * 修改商品删除状态
	 */
	@Override
	public int updateStatu(Goods goods) {
		int count = goodsMapper.updateStatu(goods);
		return count;
	}
	/**
	 * 查询人气商品
	 */
	@Override
	public List<Goods> selectByFocus() {
		List<Goods> listGoods = goodsMapper.selectByFocus();
		return listGoods;
	}
	/**
	 * 查询新商品
	 */
	@Override
	public List<Goods> selectByNewGoods() {
		List<Goods> listGoods = goodsMapper.selectByNewGoods();
		return listGoods;
	}
	/**
	 * 查询推荐商品
	 */
	@Override
	public List<Goods> selectByRec() {
		List<Goods> listGoods = goodsMapper.selectByRec();
		return listGoods;
	}

}
