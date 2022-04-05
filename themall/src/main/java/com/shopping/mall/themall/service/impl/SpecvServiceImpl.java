package com.shopping.mall.themall.service.impl;

import com.shopping.mall.themall.dao.SpecvMapper;
import com.shopping.mall.themall.model.Specv;
import com.shopping.mall.themall.service.ISpecvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SpecvServiceImpl implements ISpecvService {
	
	@Resource
	SpecvMapper specvMapper;
	/**
	 * 根据specid查规格值集合
	 */
	@Override
	public List<Specv> selectBySpecid(Integer specid) {
		List<Specv> listSpecv = specvMapper.selectBySpecid(specid);
		return listSpecv;
	}
	@Override
	public Specv selectByPrimaryKey(Integer id) {
		Specv specv = specvMapper.selectByPrimaryKey(id);
		return specv;
	}

}
