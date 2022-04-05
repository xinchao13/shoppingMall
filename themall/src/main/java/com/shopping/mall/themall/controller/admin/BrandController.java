package com.shopping.mall.themall.controller.admin;

import com.shopping.mall.themall.model.Brand;
import com.shopping.mall.themall.service.IBrandService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/brand")
public class BrandController {
	
	@Resource
	IBrandService brandService;
	/**
	 * 去品牌管理列表页
	 * @param model
	 * @param parentid
	 * @return
	 */
	@RequestMapping("/tobrandlist")
	public String tobrandlist(Model model, String parentid) {
		List<Brand> listBrand = brandService.selectAll();
		model.addAttribute("listBrand", listBrand);
	    return "admin/brandlist";
	}
	/**
	 * 去品牌新增页
	 * @return
	 */
	@RequestMapping("/toInsertBrand")
	public String insertBrand() {
		
	    return "admin/insertBrand";
	}
	/**
	 * ajax查新增品牌名重名
	 * @param
	 * @return
	 */
	@RequestMapping("/findbrandname")
	@ResponseBody
	public String findusername(@RequestParam("name") String name) {
		Brand brand = brandService.findByName(name);
		if(brand == null) {
			//未重名
			return "true";
		}
	    return "false";
	}
	/**
	 * 新增品牌表单提交
	 * @param name
	 * @param firstword
	 * @param
	 * @param recommend
	 * @param sequence
	 * @param brand
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/toInsertBrand")
	public String toInsertBrand(String name, String firstword,
                                String recommend, String sequence, Brand brand,
                                HttpServletRequest req, Model model) throws Exception {
		brand.setAddtime(new Date());
		
		//名字验证
		if(findusername(name).equals("false")) {
			model.addAttribute("msg", "品牌名已存在！");
			return "admin/insertBrand";
		}
		brand.setBrandName(name);	
		//首字母格式
		if(!firstword.matches("[a-zA-Z]")) {
			model.addAttribute("msg", "请输入一个字母！");
			return "admin/insertBrand";
		}
		brand.setInitial(firstword);
		//推荐转换
		if("true".equals(recommend)) {
			brand.setRecommend(true);
		}else {
			brand.setRecommend(false);
		}
		//排序转换
		if(sequence == null || "".equals(sequence) || !sequence.matches("[0-9]+")) {
			brand.setReq(0);
		}else {
			brand.setReq(Integer.parseInt(sequence));
		}
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)req;
	    MultipartFile file = mreq.getFile("brandLogo");
	    String fileName = file.getOriginalFilename();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	    String path = "H:\\uploadFiles/";
	    String path2 = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
	    FileOutputStream fos = new FileOutputStream(path+path2);
	    fos.write(file.getBytes());
	    fos.flush();
	    fos.close();
	    
	    brand.setImgpath("/asjy/file/"+path2);
	    int count = brandService.insert(brand);
	    if(count == 0) {
	    	model.addAttribute("msg", "添加品牌失败");
	    	return "admin/insertBrand";
	    }
	    return "redirect:/admin/brand/tobrandlist";
	}
	/**
	 * 删除品牌方法
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/todeletebrand")
	public String toDeleteBrand(String id, Model model) {
		int count = brandService.deleteByPrimaryKey(Integer.parseInt(id));
	    return "redirect:/admin/brand/tobrandlist";
	}
	/**
	 * 去编辑品牌页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toupdatebrand")
	public String toUpdateBrand(String id, Model model) {
		Brand brand = brandService.selectByPrimaryKey(Integer.parseInt(id));
		model.addAttribute("brand", brand);
	    return "admin/updateBrand";
	}
	/**
	 * ajax判断修改品牌是否重名
	 * @param name
	 * @param id
	 * @return
	 */
	@RequestMapping("/updatebrandname")
	@ResponseBody
	public String updateBrandName(@RequestParam("name") String name,
			@RequestParam("id") String id) {
		Brand brand = brandService.findByName(name);
		if(brand != null) {//查到了对象但不知是不是自己
			if(brand.getId() == Integer.parseInt(id)) {//是自己
				return "true";
			}
			return "false";
		}
	    return "true";
	}
	/**
	 * 编辑品牌表单提交
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/updateBrand")
	public String updateBrand(String id, String name,
                              String firstword, String recommend,
                              String sequence, Brand brand,
                              HttpServletRequest req, Model model) throws Exception {
		brand.setId(Integer.parseInt(id));
		brand.setBrandName(name);
		//首字母格式
		if(!firstword.matches("[a-zA-Z]")) {
			model.addAttribute("msg", "请输入一个字母！");
			return "admin/updateBrand";
		}
		brand.setInitial(firstword);
		//推荐转换
		if("true".equals(recommend)) {
			brand.setRecommend(true);
		}else {
			brand.setRecommend(false);
		}
		//排序转换
		if(sequence == null || "".equals(sequence) || !sequence.matches("[0-9]+")) {
			brand.setReq(0);
		}else {
			brand.setReq(Integer.parseInt(sequence));
		}
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)req;
	    MultipartFile file = mreq.getFile("brandLogo");
	    //判断改不改照片
	    if(file.isEmpty()==false) {//有文件情况
	    	String fileName = file.getOriginalFilename();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		    String path = "H:\\uploadFiles/";
		    String path2 = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
		    FileOutputStream fos = new FileOutputStream(path+path2);
		    fos.write(file.getBytes());
		    fos.flush();
		    fos.close();
		    brand.setImgpath("/asjy/file/"+path2);
	    }else {
	    	Brand brand2 = brandService.selectByPrimaryKey(Integer.parseInt(id));
		    brand.setImgpath(brand2.getImgpath());
	    }
	    
	    int count = brandService.update(brand);
	    if(count == 0) {
	    	model.addAttribute("msg", "添加品牌失败");
	    	return "admin/updateBrand";
	    }
	    return "redirect:/admin/brand/tobrandlist";
	}
}
