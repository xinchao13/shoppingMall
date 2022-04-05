package com.shopping.mall.themall.controller.admin;

import com.shopping.mall.themall.model.Spec;
import com.shopping.mall.themall.model.Specv;
import com.shopping.mall.themall.service.ISpecService;
import com.shopping.mall.themall.service.ISpecvService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/spec")
public class SpecController {
	
	@Resource
	ISpecService specService;
	@Resource
	ISpecvService specvService;
	/**
	 * 去规格管理页
	 * @return
	 */
	@RequestMapping("/toShowSpec")
	public String toShowSpec(Model model) {
		List<Spec> listSpec = specService.selectAll();
		model.addAttribute("listSpec", listSpec);
	    return "admin/speclist";
	}
	/**
	 * 删除规格方法
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toDeleteSpec")
	public String toDeleteSpec(String id, Model model) {
		boolean flag = specService.deleteSpec(Integer.parseInt(id));
		if(flag == false) {
			model.addAttribute("msg", "删除失败");
		}
	    return "redirect:/admin/spec/toShowSpec";
	}
	/**
	 * 去新增规格页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toInsertSpec")
	public String toInsertSpec(String id, Model model) {
		
	    return "admin/insertSpec";
	}
	/**
	 * ajax查新增规格名重名
	 * @param
	 * @return
	 */
	@RequestMapping("/findspecname")
	@ResponseBody
	public String findSpecName(@RequestParam("name") String name) {
		Spec s = specService.selectByName(name);
		if(s == null) {
			//未重名
			return "true";
		}
	    return "false";
	}
	/**
	 * 新增规格表单提交方法
	 * @param name
	 * @param sequence
	 * @param specvSeqs
	 * @param specvnames
	 * @param spec
	 * @param model
	 * @return
	 */
	@RequestMapping("/insertspec")
	public String insertSpec(String name, String sequence,
                             String[] specvSeqs, String[] specvnames,
                             Spec spec, Model model) {
		Map<String,Object> result = specService.insert(name, sequence, specvnames, specvSeqs);
		if("SUCCESS".equals(result.get("STATUS"))) {
			model.addAttribute("result", result);
			return "redirect:/admin/spec/toShowSpec";
		}else {
			return "admin/insertSpec";
		}
	    
	}
	/**
	 * 去编辑规格页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdateSpec")
	public String toUpdateSpec(String id, Model model) {
		//得到规格对象
		Spec spec = specService.selectByPrimaryKey(Integer.parseInt(id));
		model.addAttribute("spec", spec);
		//得到规格值对象
		List<Specv> listSpecv = specvService.selectBySpecid(Integer.parseInt(id));
		model.addAttribute("listSpecv", listSpecv);
	    return "admin/updateSpec";
	}
	/**
	 * ajax判断修改规格是否重名
	 * @param name
	 * @param id
	 * @return
	 */
	@RequestMapping("/updatespecname")
	@ResponseBody
	public String updateSpecName(@RequestParam("name") String name,
			@RequestParam("id") String id) {
		Spec spec = specService.selectByName(name);
		if(spec != null) {//查到了对象但不知是不是自己
			if(spec.getId() == Integer.parseInt(id)) {//是自己
				return "true";
			}
			return "false";
		}
	    return "true";
	}
	/**
	 * 修改规格方法
	 * @param id
	 * @param name
	 * @param sequence
	 * @param delids
	 * @param ids
	 * @param specvnames
	 * @param specvSeqs
	 * @param newSpecvnames
	 * @param newSpecvSeqs
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateSpec")
	public String updateSpec(String id,String name,String sequence,
			String[] delids, //记住要删除的id
			String[] ids,//之前的id
			String[] specvnames, String[] specvSeqs,//要修改的
			String[] newSpecvnames, String[] newSpecvSeqs,//要新增的
			Model model) {
		Map<String,Object> result = specService.update(id, name, sequence, delids, ids, specvnames, specvSeqs, newSpecvnames, newSpecvSeqs);
		if("SUCCESS".equals(result.get("STATUS"))) {
			model.addAttribute("result", result);
			return "redirect:/admin/spec/toShowSpec";
		}else {
			//得到规格对象
			Spec spec = specService.selectByPrimaryKey(Integer.parseInt(id));
			model.addAttribute("spec", spec);
			//得到规格值对象
			List<Specv> listSpecv = specvService.selectBySpecid(Integer.parseInt(id));
			model.addAttribute("listSpecv", listSpecv);
			return "admin/updateSpec";
		}
	}
}
