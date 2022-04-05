package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.GoodsAndSpecvMapper;
import com.shopping.mall.themall.model.GoodsAndSpecv;
import com.shopping.mall.themall.service.IGoodsAndSpecvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsAndSpecvServiceImpl implements IGoodsAndSpecvService {
	@Resource
	GoodsAndSpecvMapper goodsAndSpecvMapper;
	/**
	 * 向商品与规则值中间表，添加商品的规格与规格值
	 */
	@Override
	public int insert(GoodsAndSpecv goodsAndSpecv) {
		int count = goodsAndSpecvMapper.insert(goodsAndSpecv);
		return count;
	}
	/**
	 * 通过商品id和商品规则值中间表，得到最多两个规则值集合
	 */
	@Override
	public List<GoodsAndSpecv> select(Integer id) {
		List<GoodsAndSpecv> listGoodsAndSpecv = goodsAndSpecvMapper.select(id);
		return listGoodsAndSpecv;
	}
	/**
	 * 通过商品id删除关联表里面的记录
	 */
	@Override
	public int deleteByGoodsId(Integer goodsid) {
		int count = goodsAndSpecvMapper.deleteByGoodsId(goodsid);
		return count;
	}
	/**
	 * 通过商品id查询具体规格值
	 */
	@Override
	public List<GoodsAndSpecv> selectByGoodsid(Integer goodsid) {
		List<GoodsAndSpecv> listGoodsAndSpecv = goodsAndSpecvMapper.selectByGoodsid(goodsid);
		return listGoodsAndSpecv;
	}
	@Override
	public int findByProAndSpecv(Integer productid, Integer specvid1, Integer specvid2) {
		int goodsid = goodsAndSpecvMapper.findByProAndSpecv(productid, specvid1, specvid2);
		return goodsid;
	}


}
