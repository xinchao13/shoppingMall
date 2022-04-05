package com.shopping.mall.themall.dao;


import com.shopping.mall.themall.model.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GoodsMapper {
    
    int deleteByPrimaryKey(Integer id);
    /**
     * 新增商品方法
     * @param record
     * @return
     */
    int insert(Goods record);
    /**
     * 修改商品库存方法
     * @param record
     * @return
     */
    int updateStock(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    /**
     * 查询商品列表
     * @return
     */
    List<Goods> selectAll(@Param("map") Map<String, Object> map);
    /**
     * 删除状态置1
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