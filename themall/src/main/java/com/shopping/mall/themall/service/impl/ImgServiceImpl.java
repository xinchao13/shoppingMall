package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.ImgMapper;
import com.shopping.mall.themall.model.Img;
import com.shopping.mall.themall.service.IImgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ImgServiceImpl implements IImgService {
	@Resource
	ImgMapper imgMapper;
	/**
	 * 新增附图片方法
	 */
	@Override
	public int insert(Img img) {
		int count = imgMapper.insert(img);
		return count;
	}
	/**
	 * 查一个商品的所有附图
	 */
	@Override
	public List<Img> selectByGoodsId(Integer id) {
		List<Img> listImg = imgMapper.selectByGoodsId(id);
		return listImg;
	}
	@Override
	public Img findById(Integer id) {
		Img img = imgMapper.findById(id);
		return img;
	}
	@Override
	public int updateByPrimaryKey(Img img) {
		int count = imgMapper.updateByPrimaryKey(img);
		return count;
	}
	@Override
	public int deleteByPrimaryKey(Integer id) {
		int count = imgMapper.deleteByPrimaryKey(id);
		return count;
	}

}
