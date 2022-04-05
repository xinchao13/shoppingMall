package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Goods;

import java.util.List;
import java.util.Map;

public interface IGoodsService {
	/**
	 * 查询商品列表方法
	 * @return
	 */
	List<Goods> selectAll(Map<String, Object> map);
	/**
	 * 新增商品方法
	 * @param record
	 * @return
	 */
	int insert(Goods goods);
	/**
	 * 通过id查商品对象
	 * @param id
	 * @return
	 */
	Goods selectByPrimaryKey(Integer id);
	/**
	 * 修改商品方法
	 * @param goods
	 * @return
	 */
	int updateByPrimaryKey(Goods goods);
	/**
	 * 修改删除状态
	 * @param goods
	 * @return
	 */
	int updateStatu(Goods goods);
	/**
	 * 查询人气商品
	 * @return
	 */
	List<Goods> selectByFocus();
    /**
     * 查询新商品
     * @return
     */
    List<Goods> selectByNewGoods();
    /**
     * 查询推荐商品
     * @return
     */
    List<Goods> selectByRec();
}
