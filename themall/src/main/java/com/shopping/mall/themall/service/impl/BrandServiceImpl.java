package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.BrandMapper;
import com.shopping.mall.themall.model.Brand;
import com.shopping.mall.themall.service.IBrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BrandServiceImpl implements IBrandService {
	@Resource
	BrandMapper brandMapper;

	@Override
	public List<Brand> selectAll() {
		List<Brand> listBrand = brandMapper.selectAll();
		return listBrand;
	}

	@Override
	public int insert(Brand brand) throws Exception {
		int count = brandMapper.insert(brand);
		if(count == 0) {
			throw new Exception("添加品牌失败！");
		}
		return count;
	}

	@Override
	public Brand findByName(String brandName) {
		Brand brand = brandMapper.selectByName(brandName);
		return brand;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		int count = brandMapper.deleteByPrimaryKey(id);
		return count;
	}

	@Override
	public Brand selectByPrimaryKey(Integer id) {
		Brand brand = brandMapper.selectByPrimaryKey(id);
		return brand;
	}

	@Override
	public int update(Brand brand) {
		int count = brandMapper.updateByPrimaryKey(brand);
		return count;
	}

	@Override
	public List<Brand> selectByRec() {
		List<Brand> listBrand = brandMapper.selectByRec();
		return listBrand;
	}
}
