package com.shopping.mall.themall.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.shopping.mall.themall.model.Brand;
import com.shopping.mall.themall.model.Goods;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
public class ReadExcel{
	
	/**
     * read the Excel file
     * @param path the path of the Excel file
     * @return
     * @throws IOException
     */
    public List<Goods> readExcel(String path, List<Brand> list_brand, HttpServletResponse resp) throws IOException {
    	if(StringUtils.isEmpty(path)){
            return null;
        }else{
            String postfix = Util.getPostfix(path);
            if (!Common.EMPTY.equals(postfix)) {
                if (Common.OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
                    return readXls(path, list_brand,resp);
                } else if (Common.OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
                    return readXlsx(path, list_brand,resp);
                }
            } else {
                System.out.println(path + Common.NOT_EXCEL_FILE);
            }
        }
        return null;
    }

    /**
     * Read the Excel 2010
     * @param path the path of the excel file
     * @return
     * @throws IOException
     */
    public List<Goods> readXlsx(String path, List<Brand> list_brand, HttpServletResponse resp) throws IOException {
        System.out.println(Common.PROCESSING+"readXlsx"+ path);
        InputStream is = new FileInputStream(path);
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);  
        List<Goods> list = new ArrayList<>();
        System.out.println(xssfWorkbook.getNumberOfSheets());
        Map<String, Integer> mapBrand = new HashMap<>();
        for(Brand brand : list_brand) {
        	mapBrand.put(brand.getBrandName(), brand.getId());
        }
        
        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
            if (xssfSheet == null) {
                continue;
            }
            for (int rowNum = 2; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow != null) {
                	Goods goods = new Goods();
                    XSSFCell id = xssfRow.getCell(0);
                    XSSFCell goodsname = xssfRow.getCell(1);
                    XSSFCell price = xssfRow.getCell(2);
                    XSSFCell brandName = xssfRow.getCell(3);
        
                    goods.setId(Integer.parseInt(getValue(id)));
                    goods.setGoodname(getValue(goodsname));
                    goods.setOldprice(new BigDecimal(getValue(price)));
                    Integer brandId = null;
                    if(mapBrand.containsKey(getValue(brandName))) {
                    	brandId = mapBrand.get(getValue(brandName));
                    }
                    goods.setBrandid(brandId);
                    list.add(goods);
                }
            }
            
        }
    	
        
        return list;
        
    }
    
    /**
     * Read the Excel 2003-2007
     * @param path the path of the Excel
     * @return
     * @throws IOException
     */
    public List<Goods> readXls(String path, List<Brand> list_brand, HttpServletResponse resp) throws IOException {
        System.out.println(Common.PROCESSING+"readXls"+ path); 
        InputStream is = new FileInputStream(path);
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        Goods goods = null;
        List<Goods> list = new ArrayList<Goods>();
        
        
        int rowNum = 3;
        int exist_error = 0;
        
        // Read the Sheet
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // Read the Row
            for (rowNum = 3; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {
                    goods = new Goods();
                    HSSFCell goodsname = hssfRow.getCell(1);
                    HSSFCell pprice = hssfRow.getCell(2);
                    HSSFCell sprice = hssfRow.getCell(3);
                    HSSFCell oprice = hssfRow.getCell(4);
                    HSSFCell storage = hssfRow.getCell(5);
                    HSSFCell weight = hssfRow.getCell(6);
                    HSSFCell size = hssfRow.getCell(7);
                    HSSFCell productnum = hssfRow.getCell(8);
                    HSSFCell status = hssfRow.getCell(9);
                    HSSFCell recommend = hssfRow.getCell(10);
                    HSSFCell classname = hssfRow.getCell(11);
                    HSSFCell brandname = hssfRow.getCell(12);
                    
                   
                    list.add(goods);
                }
            }
        }
        return list;
    }

    @SuppressWarnings("static-access")
    private String getValue(XSSFCell xssfCell) {
        if (xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(xssfCell.getBooleanCellValue());
        } else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
        	
        	String temp = String.valueOf(xssfCell.getNumericCellValue());
        	if(temp.contains(".")){
        		temp = temp.substring(0, temp.indexOf("."));
        	}
        	
            return temp;
        } else {
            return String.valueOf(xssfCell.getStringCellValue());
        }
    }

    @SuppressWarnings("static-access")
    private String getValue(HSSFCell hssfCell) {
        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
            return String.valueOf(hssfCell.getNumericCellValue());
        } else {
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
    
}
