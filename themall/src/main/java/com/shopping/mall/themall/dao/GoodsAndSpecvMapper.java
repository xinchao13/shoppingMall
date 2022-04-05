package com.shopping.mall.themall.dao;


import com.shopping.mall.themall.model.GoodsAndSpecv;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface GoodsAndSpecvMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(GoodsAndSpecv record);

    int insertSelective(GoodsAndSpecv record);

    GoodsAndSpecv selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodsAndSpecv record);

    int updateByPrimaryKey(GoodsAndSpecv record);
    /**
     * 通过商品id和商品规则值中间表，得到最多两个规则值集合
     * @param id
     * @return
     */
    List<GoodsAndSpecv> select(@Param("id") Integer id);
    /**
     * 删除商品对应的规格
     * @param goodsid
     * @return
     */
    int deleteByGoodsId(@Param("goodsid") Integer goodsid);
    /**
     * 根据商品id查具体规格值
     * @param goodsid
     * @return
     */
    List<GoodsAndSpecv> selectByGoodsid(@Param("goodsid") Integer goodsid);
    /**
     * 根据产品号与规格值id查询商品编号
     * @param productid
     * @param specvid1
     * @param specvid2
     * @return
     */
    Integer findByProAndSpecv(@Param("productid") Integer productid,
                              @Param("specvid1") Integer specvid1,
                              @Param("specvid2") Integer specvid2);
}