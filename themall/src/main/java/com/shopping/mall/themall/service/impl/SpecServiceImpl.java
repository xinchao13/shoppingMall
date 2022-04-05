package com.shopping.mall.themall.service.impl;


import com.shopping.mall.themall.dao.SpecMapper;
import com.shopping.mall.themall.dao.SpecvMapper;
import com.shopping.mall.themall.model.Spec;
import com.shopping.mall.themall.model.Specv;
import com.shopping.mall.themall.service.ISpecService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SpecServiceImpl implements ISpecService {

	@Resource
	SpecMapper specMapper;
	@Resource
	SpecvMapper specvMapper;
	/**
	 * 查所有规格对象
	 */
	@Override
	public List<Spec> selectAll() {
		List<Spec> listSpec = specMapper.selectAll();
		return listSpec;
	}
	/**
	 * 删除规格信息
	 */
	@Override
	public boolean deleteSpec(Integer id) {
		int count = specMapper.deleteSpec(id);
		if(count > 0) {
			return true;
		}
		return false;
	}
	/**
	 * 根据规格名查对象
	 */
	@Override
	public Spec selectByName(String specname) {
		Spec s = specMapper.selectByName(specname);
		return s;
	}
	/**
	 * 新增规格方法
	 */
	@Override
	public Map<String,Object> insert(String name,String sequence,String[] specvnames, String[] specvseqs) {
		Map<String,Object> result = new HashMap<>();
		Spec spec = new Spec();
		//规格名称校验
		if("".equals(name) || name == null) {
			result.put("STATUS", "FAIL");
			result.put("msg","规格名称不能为空！");
			return result;
		}
		if(selectByName(name) != null) {
			result.put("STATUS", "FAIL");
			result.put("msg","规格名称已存在！");
			return result;
		}
		spec.setSpecname(name);
		//排序转换
		if(sequence == null || "".equals(sequence) || !sequence.matches("[0-9]+")) {
			spec.setSeq(0);
		}else {
			spec.setSeq(Integer.parseInt(sequence));
		}
		spec.setAddtime(new Date());
		
		int count = specMapper.insert(spec);
		if(count == 0) {
			result.put("STATUS","FAIL");
			result.put("msg", "添加失败！");
			return result;
		}
		result.put("STATUS","SUCCESS");
		
		this.insertSpecvs(spec.getId(),specvnames,specvseqs);
		
		return result;
	}
	/**
	 * 新增规格值方法
	 * @param specvnames 规格值名称
	 * @param specvseqs 规格值序号
	 * @return
	 */
	public void insertSpecvs(Integer specid,String[] specvnames, String[] specvseqs){
		//循环数据： 先判断数组不为null 长度大于0  循环中 判断值是否为空
		int i = 0;
		if(specvnames != null && specvnames.length > 0){
			for(String specvname : specvnames){
				if(!StringUtils.isEmpty(specvname)){
					Specv specv = new Specv();
					specv.setSpecvname(specvname);
					if(specvseqs != null && specvseqs.length > 0){
						String seq = specvseqs[i];
						i++;
						if(seq == null || "".equals(seq) || !seq.matches("[0-9]+")) {
							specv.setSeq(0);
						}else {
							specv.setSeq(Integer.parseInt(seq));
						}
					}else {
						specv.setSeq(0);
					}
					specv.setSpecid(specid);
					specv.setAddtime(new Date());
					int count = specvMapper.insert(specv);
					if(count > 0) {
						continue;
					}else {
						continue;
					}
					
				}
			}
		}
	}
	/**
	 * 根据id查规格对象
	 */
	@Override
	public Spec selectByPrimaryKey(Integer id) {
		Spec s = specMapper.selectByPrimaryKey(id);
		return s;
	}
	/**
	 * 修改规格方法
	 */
	@Override
	public Map<String,Object> update(String id,String name,String sequence,
			String[] delids,//得到要删除的规格值id
			String[] ids,//编辑之前的id
			String[] specvnames, String[] specvSeqs,//要修改的
			String[] newSpecvnames, String[] newSpecvSeqs) {
		Map<String,Object> result = new HashMap<>();
		//====================================修改规格功能begin
		Spec spec = new Spec();
		spec.setId(Integer.parseInt(id));
		//规格名称校验
		if("".equals(name) || name == null) {
			result.put("STATUS", "FAIL");
			result.put("msg","规格名称不能为空！");
			return result;
		}
		if(selectByName(name) != null) {//查到了对象但不知是不是自己
			if(selectByName(name).getId() != Integer.parseInt(id)) {//不是自己但重名
				result.put("STATUS", "FAIL");
				result.put("msg","该规格名称已存在！");
			}
			result.put("STATUS", "SUCCESS");
		}
		spec.setSpecname(name);
		//排序转换
		if(sequence == null || "".equals(sequence) || !sequence.matches("[0-9]+")) {
			spec.setSeq(0);
		}else {
			spec.setSeq(Integer.parseInt(sequence));
		}
		
		int count = specMapper.updateByPrimaryKey(spec);
		if(count == 0) {
			result.put("STATUS","FAIL");
			result.put("msg", "修改失败！");
			return result;
		}
		result.put("STATUS","SUCCESS");
		//====================================修改规格功能end
		
		
		//====================================删除规格值功能begin
		if(delids != null && delids.length > 0) {
			for(String delid:delids) {
				System.out.println(delid);
				if(delid != null || !"".equals(delid)) {
					int count2 = specvMapper.deleteByPrimaryKey(Integer.parseInt(delid));
					System.out.println(count2);
				}
				break;
	
			}
		}
		//====================================删除规格值功能end
		
		
		//====================================修改规格值功能begin
		int i = 0;
		if(ids != null && ids.length > 0) {
			for(String id1 : ids){
				Specv specv = specvMapper.selectByPrimaryKey(Integer.parseInt(id1));
				if(specv == null) {
					continue;
				}
			    specv.setSpecvname(specvnames[i]);
			    if(specvSeqs[i] == null || "".equals(specvSeqs[i]) || !specvSeqs[i].matches("[0-9]+")) {
					specv.setSeq(0);
				}else {
					specv.setSeq(Integer.parseInt(specvSeqs[i]));
				}
				specvMapper.updateByPrimaryKey(specv);
				i++;
			}
		}
		//====================================修改规格值功能end
				
				
		//====================================新增规格值功能begin
		if(newSpecvnames != null && newSpecvnames.length > 0) {
			this.insertSpecvs(spec.getId(),newSpecvnames,newSpecvSeqs);
		}
		//====================================新增规格值功能end
		
		return result;
	}
	/**
	 * 查询商品的规格信息
	 */
	@Override
	public List<Spec> selectSpec(Integer productid) {
		List<Spec> listSpec = specMapper.selectSpec(productid);
		return listSpec;
	}

		

}
