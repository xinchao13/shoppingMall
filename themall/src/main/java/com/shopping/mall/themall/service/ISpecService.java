package com.shopping.mall.themall.service;


import com.shopping.mall.themall.model.Spec;

import java.util.List;
import java.util.Map;

public interface ISpecService {
	/**
	 * 查询显示所有信息（规格与规格值）
	 * @return
	 */
	List<Spec> selectAll();
	/**
	 * 删除规格信息
	 * @param id
	 * @return
	 */
	boolean deleteSpec(Integer id);
	/**
	 * 根据规格名查对象
	 * @param specname
	 * @return
	 */
	Spec selectByName(String specname);
	/**
	 * 新增规格方法
	 * @param spec
	 * @return
	 */
	Map<String,Object> insert(String name, String sequence, String[] specvnames, String[] specvseqs);
	/**
	 * 根据id查规格对象
	 * @param id
	 * @return
	 */
	Spec selectByPrimaryKey(Integer id);
	/**
	 * 修改规格方法
	 * @return
	 */
	Map<String,Object> update(String id, String name, String sequence,
                              String[] delids,//得到要删除的id
                              String[] ids,//得到编辑之前的id
                              String[] specvnames, String[] specvSeqs,//要修改的规格值排序和名称
                              String[] newSpecvnames, String[] newSpecvSeqs//新增的规格值对象
    );
	/**
     * 查询商品的规格信息
     * @return
     */
    List<Spec> selectSpec(Integer productid);
}
