package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.GoodsAndSpecv;

import java.util.List;

public interface IGoodsAndSpecvService {
	/**
	 * 向商品与规则值中间表，添加商品的规格与规格值
	 * @param goodsAndSpecv
	 * @return
	 */
	int insert(GoodsAndSpecv goodsAndSpecv);
	/**
	 * 通过商品id和商品规则值中间表，得到最多两个规则值集合
	 * @param id
	 * @return
	 */
	List<GoodsAndSpecv> select(Integer id);
	/**
	 * 删除商品对应的规格
	 * @param goodsid
	 * @return
	 */
	int deleteByGoodsId(Integer goodsid);
	/**
     * 根据商品id查具体规格值
     * @param goodsid
     * @return
     */
    List<GoodsAndSpecv> selectByGoodsid(Integer goodsid);
    /**
     * 根据产品号与规格值id查询商品编号
     * @param productid
     * @param specvid1
     * @param specvid2
     * @return
     */
    int findByProAndSpecv(Integer productid, Integer specvid1, Integer specvid2);
}
