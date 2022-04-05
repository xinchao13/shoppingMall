package com.shopping.mall.themall.dao;


import com.shopping.mall.themall.model.Brand;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BrandMapper {

    int deleteByPrimaryKey(Integer id);

    /**
     *	添加一个品牌方法
     * @mbggenerated
     */
    int insert(Brand record);

    int insertSelective(Brand record);

    Brand selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKey(Brand record);
    /**
     * 查询所有品牌方法
     * @return
     */
    List<Brand> selectAll();
    /**
     * 根据名字查品牌对象
     * @param brandName
     * @return
     */
    Brand selectByName(@Param("brandName") String brandName);
    /**
     * 查询推荐品牌
     * @return
     */
    List<Brand> selectByRec();
}