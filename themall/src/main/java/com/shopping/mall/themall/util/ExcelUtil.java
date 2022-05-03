package com.shopping.mall.themall.util;

import java.util.List;
import java.util.regex.Pattern;

import com.shopping.mall.themall.model.Goods;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.shopping.mall.themall.model.Goods;

public class ExcelUtil {
	
	public static XSSFWorkbook exportExcelForGoods(List<Goods> list_goods) {
		//创建excel文件对象
		XSSFWorkbook wb = new XSSFWorkbook();
//		String status = "";
//		String recommend = "";
		
		Sheet sheet = wb.createSheet("goodsInfo");
		
		//创建第一行  
		Row row = sheet.createRow(0);  
		//创建第二行  
		Row row1 = sheet.createRow(1);  
		//文件头字体                                                         
		Font font0 = createFonts(wb, Font.BOLDWEIGHT_BOLD, "宋体", false, (short) 250);  
		Font font1 = createFonts(wb, Font.BOLDWEIGHT_NORMAL, "楷体", false,  (short) 250);  
		 
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));  
		//设置第一行的文字  
		createCell(wb, row, 0, "excel下载商品信息", font1);
		
		//给第二行添加文本  
		createCell(wb, row1, 0, "序号", font0); 
		createCell(wb, row1, 1, "商品名", font0);  
		createCell(wb, row1, 2, "进价", font0);  
		createCell(wb, row1, 3, "品牌", font0);

		//给第三行添加文本  
		Row row2 = sheet.createRow(2);
		createCell(wb, row2, 0, "No", font0);
		createCell(wb, row2, 1, "goodsname", font0);  
		createCell(wb, row2, 2, "price", font0);  
		createCell(wb, row2, 3, "brand", font0);

		
		//第四行表示  
		int line = 3;  
		//这里将商品的信息存入到表格中          
		for (int i = 0; i < list_goods.size(); i++) {  
		    //创建一行  
		    Row rowData = sheet.createRow(line++);
		    Goods goods = list_goods.get(i);
		    createCell(wb, rowData, 0, String.valueOf(i+1), font0); 
		    createCell(wb, rowData, 1, goods.getGoodname(), font0);
		    createCell(wb, rowData, 2, String.valueOf(goods.getOldprice()), font0);
			createCell(wb, rowData, 3, String.valueOf(goods.getBrandid()), font0);
		}
		//自动调节列宽
		for(int x = 0; x < 15; x++){
			sheet.autoSizeColumn(x);
		}
		return wb;  
	}
	/**
	 * 创建单元格并设置样式,值
	 * 
	 * @param wb
	 * @param row
	 * @param column
	 * @param
	 * @param
	 * @param value
	 */
	public static void createCell(Workbook wb, Row row, int column,
			String value, Font font) {
		Cell cell = row.createCell(column);
		cell.setCellValue(value);
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_BOTTOM);
		cellStyle.setFont(font);
		cellStyle.setFillForegroundColor(XSSFCellStyle.BORDER_DOUBLE);
		cell.setCellStyle(cellStyle);
	}

	/**
	 * 设置字体
	 * 
	 * @param wb
	 * @return
	 */
	public static Font createFonts(Workbook wb, short bold, String fontName,
			boolean isItalic, short hight) {
		Font font = wb.createFont();
		font.setFontName(fontName);
		font.setBoldweight(bold);
		font.setItalic(isItalic);
		font.setFontHeight(hight);
		return font;
	}

	/**
	 * 判断是否为数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		if (str == null || "".equals(str.trim()) || str.length() > 10)
			return false;
		Pattern pattern = Pattern.compile("^0|[1-9]\\d*(\\.\\d+)?$");
		return pattern.matcher(str).matches();
	}
	


}
