package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.SortMapper;
import com.shopping.mall.themall.model.Sort;
import com.shopping.mall.themall.service.ISortService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SortServiceImpl implements ISortService {
	
	@Resource
	SortMapper sortMapper;
	/**
	 * 查询一级分类名
	 */
	@Override
	public List<Sort> findAllSort(Integer parentid) {
		List<Sort> listSort = sortMapper.findAllSort(parentid);
		return listSort;
	}
	/**
	 * ajax动态修改列表方法
	 */
	@Override
	public Map<String, Object> ajaxUpdate(String id,String fieldName,String value){
		//修改逻辑
		//先根据id查询当前修改对象 查再改
		Sort sort = sortMapper.selectByPrimaryKey(Integer.parseInt(id));
		Map<String, Object> result = new HashMap<>();
		result.put("sort", sort);
		//发现传过来的是排序值
		if("sequence".equals(fieldName)){
			if(StringUtils.isEmpty(value) || !value.matches("[0-9]+")) {
				value = "0";
			}	
			sort.setSort(Integer.parseInt(value));
		}
		//发现传递过来的是分类名称
		if("className".equals(fieldName)){
			if(StringUtils.isEmpty(value)){
				result.put("STATUS", "FAIL");
				result.put("Message", "请输入分类名称");
				return result;
			}
			Sort sort2 = sortMapper.findByName(value);
			if(sort2 != null){
				if(sort2.getId() != sort.getId()){
					result.put("STATUS", "FAIL");
					result.put("Message", "分类名已存在");
					return result;
				}
			}
			sort.setSortName(value);
		}
		//发现传递过来的是是否显示状态
		if("display".equals(fieldName)){
			if(sort.getDisplay()){
				sort.setDisplay(false);
				result.put("display", false);
			}else{
				sort.setDisplay(true);
				result.put("display", true );
			}
		}
		
		int count = sortMapper.updateByPrimaryKey(sort);

		if(count == 0){
			result.put("STATUS","FAIL");
		}
		result.put("STATUS","SUCCESS");
		return result;
		}
	/**
	 * 添加一个分类
	 * @throws Exception 
	 */
	@Override
	public int insert(Sort sort) throws Exception {
		int count = sortMapper.insert(sort);
		if(count == 0) {
			throw new Exception("添加分类失败！");
		}
		
		return count;
	}
	/**
	 * 通过分类名称查询
	 */
	@Override
	public Sort findByName(String sortName) {
		Sort s = sortMapper.findByName(sortName);
		return s;
	}
	/**
	 * 通过id查分类对象方法
	 */
	@Override
	public Sort findById(Integer id) {
		Sort s = sortMapper.selectByPrimaryKey(id);
		return s;
	}
	/**
	 * 通过id修改分类对象方法
	 */
	@Override
	public int updateByPrimaryKey(Sort sort) throws Exception {
		int count = sortMapper.updateByPrimaryKey(sort);
		if(count == 0) {
			throw new Exception("更改分类失败！");
		}
		return count;
	}
	/**
	 * 查询有层级分类名称
	 */
	@Override
	public List<Sort> getAllSort() {
		List<Sort> listSort = sortMapper.getAllSort();
		return listSort;
	}
	/**
	 * 删除分类对象
	 * @throws Exception 
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) throws Exception {
		int count = sortMapper.deleteByPrimaryKey(id);
		if(count == 0) {
			throw new Exception("删除失败！");
		}
		return count;
	}
	/**
	 * 得到二级的id，删除二级下的三级分类
	 */
	@Override
	public int deletesort3(Integer id) {
		int count = sortMapper.deletesort3(id);
		return count;
	}

}
