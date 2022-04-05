package com.shopping.mall.themall.service;

import com.shopping.mall.themall.model.Goodcart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGoodCartService {
	/**
	 * 添加一条购物车记录
	 * @param goodcart
	 * @return
	 */
	int insert(Goodcart goodcart);
	/**
     * 根据用户id与商品id查询购物车对象
     * @param userid
     * @param goodsid
     * @return
     */
	Goodcart selectByUseridAndGoodsid(Integer userid, Integer goodsid);
    /**
     * 修改购物车表里的一条记录的数量
     * @param record
     * @return
     */
    int updateByPrimaryKey(Goodcart goodcart);
    /**
     * 查用户购物车里面有几种商品
     * @param userid
     * @return
     */
    List<Goodcart> selectGoodCart(Integer userid);
    /**
     *  查用户购物车商品信息
     * @param userid
     * @return
     */
    List<Goodcart> getInfo(Integer userid);
    /**
     * 查用户购物车商品详细信息
     * @param userid
     * @return
     */
    List<Goodcart> goodsCartDetail(@Param("userid") Integer userid);
    /**
     * 通过购物车的id查询对象
     * @param id
     * @return
     */
    Goodcart selectByPrimaryKey(Integer id);
}
