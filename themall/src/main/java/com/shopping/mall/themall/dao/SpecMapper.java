package com.shopping.mall.themall.dao;

import com.shopping.mall.themall.model.Spec;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SpecMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Spec record);

    int insertSelective(Spec record);

    Spec selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Spec record);

    int updateByPrimaryKey(Spec record);
    /**
     * 查询所有显示信息
     * @return
     */
    List<Spec> selectAll();
    /**
     * 删除规格及规格值信息
     * @param id
     * @return
     */
    int deleteSpec(@Param("id") Integer id);
    /**
     * 根据规格名查对象
     * @param specname
     * @return
     */
    Spec selectByName(@Param("specname") String specname);
    /**
     * 查询商品的规格信息
     * @return
     */
    List<Spec> selectSpec(@Param("productid") Integer productid);
}