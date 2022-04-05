package com.shopping.mall.themall.controller.admin;

import com.shopping.mall.themall.model.*;
import com.shopping.mall.themall.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/admin/goods")
public class GoodsController {
	@Resource
	IBrandService brandService;
	@Resource
	IGoodsService goodsService;
	@Resource
	ISortService sortService;
	@Resource
	ISpecService specService;
	@Resource
	ISpecvService specvService;
	@Resource
	IImgService imgService;
	@Resource
	IGoodsAndSpecvService goodsAndSpecvService;
	/**
	 * 去商品列表页
	 * @return
	 */
	@RequestMapping("/toshowgoodslist")
	public String toShowGoodslist(Model model,
                                  @RequestParam(value="currentPage",defaultValue="1",required = true)String currentPage,
                                  @RequestParam Map<String,Object> map) {
		System.out.println(map);
		
		//得到所有品牌
		List<Brand> listBrand = brandService.selectAll();
		model.addAttribute("listBrand", listBrand);
		//得到有层级的所有分类
		List<Sort> listSort = sortService.getAllSort();
		model.addAttribute("listSort", listSort);
		PageHelper.startPage(Integer.parseInt(currentPage),4);
		//得到商品列表
		List<Goods> listGoods = goodsService.selectAll(map);
		model.addAttribute("listGoods", listGoods);
		PageInfo<Goods> pageInfo=new PageInfo<Goods>(listGoods);
        model.addAttribute("page",pageInfo);
		return "admin/goodslist";
	}
	/**
	 * 去商品新增页
	 * @param model
	 * @return
	 */
	@RequestMapping("/toinsertgoods")
	public String toInsertGoods(Model model) {
		
		//得到所有品牌
		List<Brand> listBrand = brandService.selectAll();
		model.addAttribute("listBrand", listBrand);
		//得到有层级的所有分类
		List<Sort> listSort = sortService.getAllSort();
		model.addAttribute("listSort", listSort);
		//得到所有规格
		List<Spec> listSpec = specService.selectAll();
		model.addAttribute("listSpec", listSpec);
		return "admin/insertGoods";
	}
	/**
	 * 规格与规格值联动
	 * @param specid
	 * @return
	 */
	@RequestMapping("/findspecv")
	@ResponseBody
	public Map<String,Object> findSpecv(String specid) {
		Map<String,Object> result = new HashMap<>();
		//得到规格相对应的规格值集合
		List<Specv> listSpecv = specvService.selectBySpecid(Integer.parseInt(specid));
		result.put("listSpecv", listSpecv);
		System.out.println(listSpecv.size());
		return result;
	}
	/**
	 * 新增商品方法
	 * @param goods
	 * @param spec
	 * @param specv
	 * @param model
	 * @return
	 */
	@RequestMapping("/toInsertGoods")
	public String toInsertGoods(Goods goods, String[] spec, String[] specv,
                                String productid,
                                HttpServletRequest request, HttpServletResponse response,
                                Model model) throws IllegalStateException, IOException {
		goods.setAddtime(new Date());
		System.out.println("uploads");
		int count = 0;
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    MultipartHttpServletRequest接口简单地扩展了默认的HttpServletRequest接口
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();
            
            int i = 0;
            while(iter.hasNext()){   
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());
                if(file != null){
	        		//取得当前上传文件的文件名称  
	                String myFileName = file.getOriginalFilename();  
	                if(myFileName != null){
	            		if(i == 0){//主图添加
	            			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	                    	if(myFileName != null && !"".equals(myFileName.trim())){
	    	    				String uuid = UUID.randomUUID()+"";
	    	                	System.out.println(uuid);
	    	                    String path1 ="H:\\uploadFiles/";
	    	                    String path2 =sdf.format(new Date())+""+i+""+myFileName.substring(myFileName.lastIndexOf('.'));  
	    	                    File localFile = new File(path1+path2);  
	    	                    file.transferTo(localFile);
	    	                    goods.setImgpath("/asjy/file/"+path2);
	    	                    count = goodsService.insert(goods);
	        		        }else {
	        		        	model.addAttribute("msg", "请加入商品图片！");
	        		        	return "redirect:/admin/goods/toinsertgoods";
	        		        }
	            			
	            		}else{//附图添加
	            			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	            			if(myFileName != null && !"".equals(myFileName.trim())){
	    	    				String uuid = UUID.randomUUID()+"";
	    	                	System.out.println(uuid);
	    	                	String path1 ="H:\\uploadFiles/";
	    	                    String path2 =sdf.format(new Date())+""+i+""+myFileName.substring(myFileName.lastIndexOf('.'));  
	    	                    File localFile = new File(path1+path2);  
	    	                    file.transferTo(localFile);
	    	                    Img img = new Img();
	    	                    img.setGoodsid(goods.getId());
	    	                    img.setImgpath("/asjy/file/"+path2);
	    	                    img.setAddtime(new Date());
	    	                    imgService.insert(img);
	        		        }
	            		}
	            		i++;  
	            	}else {
	            		i++;
	            		continue;
	            	}
                		
                }    

            }
        }
        //向商品与规格值中间表新增数据
        if(specv != null && specv.length > 0){
        	for(String specvid : specv){
        		if(!StringUtils.isEmpty(specvid)){
        			GoodsAndSpecv gsv = new GoodsAndSpecv();
        			gsv.setSpecvid(Integer.parseInt(specvid));
        			Specv specv1 = specvService.selectByPrimaryKey(Integer.parseInt(specvid));
        			gsv.setSpecid(specv1.getSpecid());
        			gsv.setGoodsid(goods.getId());
        			gsv.setProductid(Integer.parseInt(productid));
        			int count2 = goodsAndSpecvService.insert(gsv);
        		
        		}else {
        			continue;
        		}
        	
        	}
        }else {
        	if(count !=1 ) {
            	model.addAttribute("msg", "添加商品失败！");
            	return "redirect:/admin/goods/toinsertgoods";
            }
    		return "redirect:/admin/goods/toshowgoodslist";
        }
        if(count !=1 ) {
        	model.addAttribute("msg", "添加商品失败！");
        	return "redirect:/admin/goods/toinsertgoods";
        }
		return "redirect:/admin/goods/toshowgoodslist";
        
	}
	/**
	 * 去编辑商品页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toupdategoods")
	public String toUpdateGoods(String id, Model model) {
		//得到要编辑的商品对象
		Goods goods = goodsService.selectByPrimaryKey(Integer.parseInt(id));
		model.addAttribute("goods", goods);
		//得到所有品牌
		List<Brand> listBrand = brandService.selectAll();
		model.addAttribute("listBrand", listBrand);
		//得到有层级的所有分类
		List<Sort> listSort = sortService.getAllSort();
		model.addAttribute("listSort", listSort);
		//得到所有规格
		List<Spec> listSpec = specService.selectAll();
		model.addAttribute("listSpec", listSpec);
		//得到商品的附图集合
		List<Img> listImg = imgService.selectByGoodsId(Integer.parseInt(id));
		if(listImg != null) {
			model.addAttribute("listImg", listImg);
			System.out.println(listImg);
		}
		//得到商品的最多两个规格值集合,并进行后台处理
		List<GoodsAndSpecv> listGoodsAndSpecv = goodsAndSpecvService.select(Integer.parseInt(id));
		Integer specid1 = null;
		Integer specid2 = null;
		Integer specvid1 = null;
		Integer specvid2 = null;
		List<Specv> listSpecv1 = new ArrayList<>();
		List<Specv> listSpecv2 = new ArrayList<>();
		if(listGoodsAndSpecv != null && listGoodsAndSpecv.size() > 0){
			if(listGoodsAndSpecv.size() == 2){
				specid2 = listGoodsAndSpecv.get(1).getSpecid();//规格id
				model.addAttribute("specid2", specid2);
				specvid2 = listGoodsAndSpecv.get(1).getSpecvid();//规格值id
				model.addAttribute("specvid2", specvid2);
				listSpecv2 = listGoodsAndSpecv.get(1).getListSpecv();//一个规格下的规格值集合
				model.addAttribute("listSpecv2", listSpecv2);
			}
			specid1 = listGoodsAndSpecv.get(0).getSpecid();
			model.addAttribute("specid1", specid1);
			specvid1 = listGoodsAndSpecv.get(0).getSpecvid();
			model.addAttribute("specvid1", specvid1);
			listSpecv1 = listGoodsAndSpecv.get(0).getListSpecv();
			model.addAttribute("listSpecv1", listSpecv1);
		}
		return "admin/updateGoods";
	}
	/**
	 * 编辑商品页提交
	 * @param goods
	 * @param spec
	 * @param specv
	 * @param productid
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/updateGoods")
	public String updateGoods(Goods goods, String goodsid, String[] spec, String[] specv,
                              String productid, String[] imgids,//要修改的id
                              String[] delids, //记住要删除的img的id
                              HttpServletRequest request, HttpServletResponse response,
                              Model model) throws IllegalStateException, IOException {
		System.out.println("uploads");
		int count = 0;
		//==============================删除附图begin
		if(delids != null && delids.length > 0) {
			for(String delid:delids) {
				System.out.println(delid);
				if(delid != null || !"".equals(delid)) {
					int count2 = imgService.deleteByPrimaryKey(Integer.parseInt(delid));
					System.out.println(count2);
				}
				break;
	
			}
		}
		//==============================删除附图end
		goods.setId(Integer.parseInt(goodsid));
		//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    MultipartHttpServletRequest接口简单地扩展了默认的HttpServletRequest接口
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();
            
            int i = 0;
            while(iter.hasNext()){   
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());
                if(file != null){
	        		//取得当前上传文件的文件名称  
	                String myFileName = file.getOriginalFilename();  
	                if(myFileName != null){
	            		if(i == 0){//主图修改
	            			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	                    	if(myFileName != null && !"".equals(myFileName.trim())){
	    	    				String uuid = UUID.randomUUID()+"";
	    	                	System.out.println(uuid);
	    	                    String path1 ="H:\\uploadFiles/";
	    	                    String path2 =sdf.format(new Date())+""+i+""+myFileName.substring(myFileName.lastIndexOf('.'));  
	    	                    File localFile = new File(path1+path2);  
	    	                    file.transferTo(localFile);
	    	                    goods.setImgpath("/asjy/file/"+path2);
	    	                    count = goodsService.updateByPrimaryKey(goods);
	        		        }else {
	        		        	Goods goods1 = goodsService.selectByPrimaryKey(Integer.parseInt(goodsid));
	        		        	goods.setImgpath(goods1.getImgpath());
	        		        	count = goodsService.updateByPrimaryKey(goods);
	        		        	i++;
	        		        	continue;
	        		        }
	            			
	            		}else{//附图修改新增逻辑
	            			if(imgids != null && imgids.length >0 && i<=imgids.length){
	            				//修改逻辑
	            				Img img = imgService.findById(Integer.parseInt(imgids[i-1]));
	            				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		            			if(myFileName != null && !"".equals(myFileName.trim())){
		    	    				String uuid = UUID.randomUUID()+"";
		    	                	System.out.println(uuid);
		    	                	String path1 ="H:\\uploadFiles/";
		    	                    String path2 =sdf.format(new Date())+""+i+""+myFileName.substring(myFileName.lastIndexOf('.'));  
		    	                    File localFile = new File(path1+path2);  
		    	                    file.transferTo(localFile);
		    	                    img.setImgpath("/asjy/file/"+path2);
		    	                    imgService.updateByPrimaryKey(img);
		        		        }
	            			}else{
	            				//新增图片逻辑
	            				Img img = new Img();
	            				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		            			if(myFileName != null && !"".equals(myFileName.trim())){
		    	    				String uuid = UUID.randomUUID()+"";
		    	                	System.out.println(uuid);
		    	                	String path1 ="H:\\uploadFiles/";
		    	                    String path2 =sdf.format(new Date())+""+i+""+myFileName.substring(myFileName.lastIndexOf('.'));  
		    	                    File localFile = new File(path1+path2);  
		    	                    file.transferTo(localFile);
		    	                    img.setGoodsid(goods.getId());
		    	                    img.setImgpath("/asjy/file/"+path2);
		    	                    img.setAddtime(new Date());
		    	                    imgService.insert(img);
		        		        }
	            			}
	            			
	            		}  
	            	}
                		
                }    
                i++;
            }
        }
        //修改商品与规格值中间表数据，先删再加
        System.out.println(Integer.parseInt(goodsid));
        int count3 = goodsAndSpecvService.deleteByGoodsId(Integer.parseInt(goodsid));
//        if(count3 == 0) {
//        	model.addAttribute("msg2", "修改规格失败");
//        	return "forward:/admin/goods/toupdategoods?id="+goodsid;
//        }
        if(specv != null && specv.length > 0){
        	for(String specvid : specv){
        		if(!StringUtils.isEmpty(specvid)){
        			GoodsAndSpecv gsv = new GoodsAndSpecv();
        			gsv.setSpecvid(Integer.parseInt(specvid));
        			Specv specv1 = specvService.selectByPrimaryKey(Integer.parseInt(specvid));
        			gsv.setSpecid(specv1.getSpecid());
        			gsv.setGoodsid(goods.getId());
        			gsv.setProductid(Integer.parseInt(productid));
        			int count2 = goodsAndSpecvService.insert(gsv);
        		
        		}else {
        			continue;
        		}
        	
        	}
        }else {
    		return "redirect:/admin/goods/toshowgoodslist";
        }
		return "redirect:/admin/goods/toshowgoodslist";
	}
	/**
	 * 删除商品
	 * @param model
	 * @return
	 */
	@RequestMapping("/toDeleteGoods")
	public String toDeleteGoods(String id, Goods goods, Model model) {
		goods.setId(Integer.parseInt(id));
		int count = goodsService.updateStatu(goods);
		if(count == 1) {
			return "redirect:/admin/goods/toshowgoodslist";
		}else {
			model.addAttribute("msg", "删除失败！");
			return "redirect:/admin/goods/toshowgoodslist";
		}
	}
}
