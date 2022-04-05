package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Img;

import java.util.List;

public interface IImgService {
	/**
	 * 添加一个附图
	 * @param img
	 * @return
	 */
	int insert(Img img);
	/**
	 * 查货号下所有附图
	 * @param id
	 * @return
	 */
	List<Img> selectByGoodsId(Integer id);
	/**
	 * 通过id查图片对象
	 * @param id
	 * @return
	 */
	Img findById(Integer id);
	/**
	 * 修改图片对象
	 * @param record
	 * @return
	 */
	int updateByPrimaryKey(Img img);
	/**
	 * 删除一张图片
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Integer id);
}
