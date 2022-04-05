package com.shopping.mall.themall.controller.admin;

import com.shopping.mall.themall.model.Sort;
import com.shopping.mall.themall.service.ISortService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/sort")
public class SortController {
	@Resource
	ISortService sortService;
	/**
	 * 得到分类列表
	 * @return
	 */
	@RequestMapping("/toclasslist")
	public String toclasslist(Model model, String parentid) {
		List<Sort> listSort = sortService.findAllSort(Integer.parseInt(parentid));
		model.addAttribute("listSort", listSort);
	    return "admin/goodsclasslist";
	}
	/**
	 * ajax动态修改
	 * @param id
	 * @param fieldName
	 * @param value
	 * @return
	 */
	@RequestMapping("/ajaxupdate")
	@ResponseBody
	public Map<String,Object> ajaxupdate(String id,String fieldName,String value) {
		Map<String,Object> result = sortService.ajaxUpdate(id,fieldName,value);
		System.out.println(result);
	    return result;
	}
	/**
	 * 去分类新增界面
	 * @param model
	 * @return
	 */
	@RequestMapping("toInsertSort")
	public String toInsertSort(Model model) {
		//得到层级分类列表
		List<Sort> listSort = sortService.getAllSort();
		model.addAttribute("listSort", listSort);
	    return "admin/insertSort";
	}
	/**
	 * 新增分类表单提交
	 * @param sort
	 * @param model
	 * @return
	 */
	@RequestMapping("/insertSort")
	public String insertSort(String sortName, String pid, String display, String sort, Sort sort1, Model model) {
		if(sort == null || "".equals(sort) || !sort.matches("[0-9]+")) {
			sort1.setSort(0);
		}else {
			sort1.setSort(Integer.parseInt(sort));
		}
		if("false".equals(display)) {
			sort1.setDisplay(false);
		}else {
			sort1.setDisplay(true);
		}
		Sort s = sortService.findByName(sortName);
		if(s != null){
			//重名了
			model.addAttribute("msg", "该分类名称已存在！");
			return "forward:/admin/sort/toInsertSort";
		}
		try {
			
			sort1.setAddtime(new Date());
			sort1.setParentid(Integer.parseInt(pid));
			int count = sortService.insert(sort1);
			return "redirect:/admin/sort/toclasslist?parentid=0";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "forward:/admin/sort/toInsertSort";
		}
	    
	}
	/**
	 * 删除三级分类方法
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("toDeleteSort3")
	public String toDeleteSort3(String id, Model model) {
		try {
			int count = sortService.deleteByPrimaryKey(Integer.parseInt(id));
			return "redirect:/admin/sort/toclasslist?parentid=0";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "redirect:/admin/sort/toclasslist?parentid=0";
		}
	}
	/**
	 * 删除二级分类方法,先找对应三级删除，然后删除二级。
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("toDeleteSort2")
	public String toDeleteSort2(String id, Model model) {
		//得到三级对象
		List<Sort> listSort3 = sortService.findAllSort(Integer.parseInt(id));
		if(listSort3 == null) {
			try {
				int count = sortService.deleteByPrimaryKey(Integer.parseInt(id));
				return "redirect:/admin/sort/toclasslist?parentid=0";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "redirect:/admin/sort/toclasslist?parentid=0";
			}
		}
		sortService.deletesort3(Integer.parseInt(id));//删除对应三级
		try {
			int count = sortService.deleteByPrimaryKey(Integer.parseInt(id));
			return "redirect:/admin/sort/toclasslist?parentid=0";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "redirect:/admin/sort/toclasslist?parentid=0";
		}
	}
	/**
	 * 删除一级分类方法,先找对应二级，然后找对应三级，删除三级，再删二级，最后删一级。
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("toDeleteSort")
	public String toDeleteSort(String id, Model model) {
		//得到所有二级分类对象
		List<Sort> listSort = sortService.findAllSort(Integer.parseInt(id));
		if(listSort == null) {
			try {//删除一级
				int count = sortService.deleteByPrimaryKey(Integer.parseInt(id));
				return "redirect:/admin/sort/toclasslist?parentid=0";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "redirect:/admin/sort/toclasslist?parentid=0";
			}
		}
		//得到每个对象的id(二级id)，先删除三级，然后删除二级
		for(Sort sort:listSort) {
			//得到三级对象
			List<Sort> listSort3 = sortService.findAllSort(sort.getId());
			if(listSort3 == null) {
				try {//删除二级对象
					int count = sortService.deleteByPrimaryKey(sort.getId());
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", e.getMessage());
				}
			}
			sortService.deletesort3(sort.getId());//删除对应三级
			try {
				int count = sortService.deleteByPrimaryKey(sort.getId());			
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
			}
		}
		try {//删除一级
			int count = sortService.deleteByPrimaryKey(Integer.parseInt(id));
			return "redirect:/admin/sort/toclasslist?parentid=0";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "redirect:/admin/sort/toclasslist?parentid=0";
		}
	}
	/**
	 * 去修改分类页方法
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("toUpdateSort")
	public String toUpdateSort(String id, Model model) {
		Sort s = sortService.findById(Integer.parseInt(id));
		model.addAttribute("sort", s);
		//得到层级分类列表
		List<Sort> listSort = sortService.getAllSort();
		model.addAttribute("listSort", listSort);
	    return "admin/updateSort";
	}
	/**
	 * 修改分类表单提交
	 * @param sort
	 * @param model
	 * @return
	 */
	@RequestMapping("updateSort")
	public String updateSort(String sortName, String pid, String display, String sort, Sort sort1, Model model) {
		if(sort == null || "".equals(sort) || !sort.matches("[0-9]+")) {
			sort1.setSort(0);
		}else {
			sort1.setSort(Integer.parseInt(sort));
		}
		Sort s = sortService.findByName(sortName);
		if(s != null){//重名了
			if(s.getId() != sort1.getId()){//
				model.addAttribute("msg", "该分类名称已存在！");
				return "forward:/admin/sort/toUpdateSort?id="+sort1.getId();
			}
		}
		try {
			sort1.setParentid(Integer.parseInt(pid));
			int count = sortService.updateByPrimaryKey(sort1);
			return "redirect:/admin/sort/toclasslist?parentid=0";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "forward:/admin/sort/toUpdateSort?id="+sort1.getId();
		}
	}
	/**
	 * ajax动态显示收起二级三级分类方法
	 * @param pid
	 * @param model
	 * @return
	 */
	@RequestMapping("/showLevel")
	public String showLevel(String pid, Model model) {
		//查此pid对应的子集合
		List<Sort> listSort = sortService.findAllSort(Integer.parseInt(pid));
		//根据传进来的pid，把他当成id，查出他的pid
		Sort sort = sortService.findById(Integer.parseInt(pid));
		if(sort.getParentid() == 0) {
			model.addAttribute("listSort", listSort);
			
			return "admin/two";
		}else {
			model.addAttribute("listSort", listSort);
			model.addAttribute("pid", sort.getParentid());
			return "admin/three";
		}
	}
	
}
