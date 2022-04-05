package com.shopping.mall.themall.dao;


import com.shopping.mall.themall.model.Goodcart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GoodcartMapper {

    int deleteByPrimaryKey(Integer id);
    /**
     * 添加一条购物车记录
     * @param record
     * @return
     */
    int insert(Goodcart record);

    int insertSelective(Goodcart record);
    /**
     * 通过购物车的id查询对象
     * @param id
     * @return
     */
    Goodcart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goodcart record);
    /**
     * 修改购物车表里的一条记录的数量
     * @param record
     * @return
     */
    int updateByPrimaryKey(Goodcart record);
    /**
     * 根据用户id与商品id查询购物车对象
     * @param userid
     * @param goodsid
     * @return
     */
    Goodcart selectByUseridAndGoodsid(@Param("userid") Integer userid,
                                      @Param("goodsid") Integer goodsid);
    /**
     * 查用户购物车里面有几种商品
     * @param userid
     * @return
     */
    List<Goodcart> selectGoodCart(@Param("userid") Integer userid);
    /**
     *  查用户购物车商品信息
     * @param userid
     * @return
     */
    List<Goodcart> getInfo(@Param("userid") Integer userid);
    /**
     * 查用户购物车商品详细信息
     * @param userid
     * @return
     */
    List<Goodcart> goodsCartDetail(@Param("userid") Integer userid);
    
}