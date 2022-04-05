package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Brand;

import java.util.List;

public interface IBrandService {
	/**
	 * 查询所有品牌方法
	 * @return
	 */
	List<Brand> selectAll();
	/**
	 * 添加一个品牌的方法
	 * @param record
	 * @return
	 */
	int insert(Brand brand) throws Exception;
	/**
	 * 根据名字查品牌对象
	 * @param brandName
	 * @return
	 */
	Brand findByName(String brandName);
	/**
	 * 删除品牌方法
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Integer id);
	/**
	 * 根据主键查询品牌对象
	 * @param id
	 * @return
	 */
	Brand selectByPrimaryKey(Integer id);
	/**
	 * 修改品牌对象方法
	 * @param brand
	 * @return
	 */
	int update(Brand brand);
    /**
     * 查询推荐品牌
     * @return
     */
    List<Brand> selectByRec();
}
