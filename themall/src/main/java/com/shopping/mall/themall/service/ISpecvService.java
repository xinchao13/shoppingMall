package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Specv;

import java.util.List;

public interface ISpecvService {
	/**
     * 根据specid查规格值集合
     * @param specid
     * @return
     */
    List<Specv> selectBySpecid(Integer specid);
    Specv selectByPrimaryKey(Integer id);
}
