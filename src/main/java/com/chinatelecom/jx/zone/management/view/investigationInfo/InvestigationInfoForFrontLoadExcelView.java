package com.chinatelecom.jx.zone.management.view.investigationInfo;

import java.awt.Color;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.chinatelecom.jx.zone.management.bean.formInput.FormInputBean;
import com.chinatelecom.jx.zone.management.bean.formInput.FormInputProinstBean;
import com.chinatelecom.jx.zone.management.bean.investigationInfo.InvestigationInfoMainBean;
import com.chinatelecom.jx.zone.management.bean.statisticsInput.StatisticsInputBean;
import com.chinatelecom.jx.zone.management.bean.statisticsInve.StatisticsInveInfoBean;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.organization.info.bean.OrganizationInfoLoad;

@Component("InvestigationInfoForFrontLoadExcelView")
public class InvestigationInfoForFrontLoadExcelView  extends AbstractView {

	@SuppressWarnings("unchecked")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DecimalFormat df = new DecimalFormat("0.00");
		//选项的统计数据
		Map<String, String> examResultMap = (Map<String, String>) model.get("examResultMap");
		//调查事项的总统计数据
		StatisticsInveInfoBean totalInfo = (StatisticsInveInfoBean) model.get("totalInfo");
		//录入项
		List<StatisticsInputBean> inputLoadList = (List<StatisticsInputBean>) model.get("inputList");
		//调查事项详情
		InvestigationInfoMainBean info = (InvestigationInfoMainBean)model.get("info");
		List<FormInputProinstBean> inputProinstList = (List<FormInputProinstBean>)model.get("inputProinstList");

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("调查统计结果(选择题)");
		sheet.setDefaultColumnWidth(20); // 设置列的默认宽度
		// sheet.setColumnWidth(0, 15); // 设置第一列的宽度

		// 表格样式
		HSSFCellStyle cellStyle = wb.createCellStyle();
		// 设置上下左右边框
		cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
		cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
		cellStyle.setBorderRight(CellStyle.BORDER_THIN);
		cellStyle.setBorderTop(CellStyle.BORDER_THIN);
		// 设置显示字体
		HSSFFont font = wb.createFont();
		font.setFontName("宋体");// 设置字体名
		font.setFontHeightInPoints((short) 13);// 设置字号
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);// 加粗
		cellStyle.setFont(font);
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中
		cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 上下居中
		
		// 表格样式2
		HSSFCellStyle cell2 = wb.createCellStyle();
		// 设置上下左右边框
		cell2.setBorderBottom(CellStyle.BORDER_THIN);
		cell2.setBorderLeft(CellStyle.BORDER_THIN);
		cell2.setBorderRight(CellStyle.BORDER_THIN);
		cell2.setBorderTop(CellStyle.BORDER_THIN);
		// 设置显示字体
		cell2.setFont(font);
		cell2.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中
		cell2.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 上下居中
		cell2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);;//设置前景填充样式
		cell2.setFillForegroundColor(HSSFColor.BLUE_GREY.index);//前景填充色
	
		int rowIndex = 0;
		
		HSSFRow row = sheet.createRow(rowIndex);
		// 创建列名
		HSSFCell cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("问卷名称");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(0, 40 * 256);

		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(info.getInvestigationName());
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(1, 40 * 256);
		
		row = sheet.createRow(++rowIndex);
		// 创建列名
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("创建时间");
		cell.setCellStyle(cellStyle);

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(sf.format(info.getCreateTime()));
		cell.setCellStyle(cellStyle);
		
		row = sheet.createRow(++rowIndex);
		// 创建列名
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("调查项目");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue("数据量");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(2, Cell.CELL_TYPE_STRING);
		cell.setCellValue("浏览量");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(3, Cell.CELL_TYPE_STRING);
		cell.setCellValue("填写率");
		cell.setCellStyle(cell2);
		
		row = sheet.createRow(++rowIndex);
		//填入值
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue(inputLoadList.size());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(totalInfo.getCountExampleSum());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(2, Cell.CELL_TYPE_STRING);
		cell.setCellValue(totalInfo.getCountBrowse());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(3, Cell.CELL_TYPE_STRING);
		cell.setCellValue(df.format((totalInfo.getCountExampleSum()/1.0/totalInfo.getCountBrowse()*100))+"%");
		cell.setCellStyle(cellStyle);
		
		// 设置单元格
		HSSFCellStyle gridCS = wb.createCellStyle();
		gridCS.setWrapText(true);// 设置单元格自动换行
		// 设置单元格边框
		gridCS.setBorderBottom(CellStyle.BORDER_THIN);
		gridCS.setBorderLeft(CellStyle.BORDER_THIN);
		gridCS.setBorderRight(CellStyle.BORDER_THIN);
		gridCS.setBorderTop(CellStyle.BORDER_THIN);
		// 设置单元格字体
		HSSFFont gridFont = wb.createFont();
		gridFont.setFontName("宋体");
		gridFont.setFontHeightInPoints((short) 11);
		gridCS.setFont(gridFont);
		// 设置单元格内容显示位置
		gridCS.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中
		gridCS.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 上下居中
		
		// 设置单元格2
		HSSFCellStyle cs2 = wb.createCellStyle();
		cs2.setWrapText(true);// 设置单元格自动换行
		// 设置单元格边框
		cs2.setBorderBottom(CellStyle.BORDER_THIN);
		cs2.setBorderLeft(CellStyle.BORDER_THIN);
		cs2.setBorderRight(CellStyle.BORDER_THIN);
		cs2.setBorderTop(CellStyle.BORDER_THIN);
		// 设置单元格字体
		cs2.setFont(gridFont);
		// 设置单元格内容显示位置
		cs2.setAlignment(CellStyle.ALIGN_CENTER);// 左右居中
		cs2.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 上下居中
		cs2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);;//设置前景填充样式
		cs2.setFillForegroundColor(HSSFColor.GOLD.index);//前景填充色

		int i = 1;
		for (StatisticsInputBean bean : inputLoadList) {
			if("radio".equals(bean.getInputType()) || "checkbox".equals(bean.getInputType())){
				row = sheet.createRow(++rowIndex);//空一行
				cell = row.createCell(0, Cell.CELL_TYPE_STRING);
				cell.setCellValue("");
				cell.setCellStyle(cellStyle);
				
				row = sheet.createRow(++rowIndex);
				
				cell = row.createCell(0, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(cs2);
				cell.setCellValue(i+"、"+bean.getInputTitle());
				
				cell = row.createCell(1, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(cell2);
				cell.setCellValue("参与人数："+bean.getCountExampleSum());
				
				row = sheet.createRow(++rowIndex);
				cell = row.createCell(0, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(" ");
				
				cell = row.createCell(1, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue("数据量");
				
				cell = row.createCell(2, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue("百分比");
				
				String[] options = bean.getOptions().split("_:");
				for(String o : options){
					if(StringUtil.checkNotNull(o)){
						String data = examResultMap.get(bean.getInputId()+o);
						
						row = sheet.createRow(++rowIndex);
						cell = row.createCell(0, Cell.CELL_TYPE_STRING);
						cell.setCellStyle(gridCS);
						cell.setCellValue(o);
						
						cell = row.createCell(1, Cell.CELL_TYPE_STRING);
						cell.setCellStyle(gridCS);
						cell.setCellValue(data.split("_")[0]);
						
						cell = row.createCell(2, Cell.CELL_TYPE_STRING);
						cell.setCellStyle(gridCS);
						cell.setCellValue(df.format(Double.valueOf(data.split("_")[1]))+"%");
					}
				}
				i++;
			}
		}
		
		//创建新的sheet
	    sheet = wb.createSheet("调查统计结果(填空题)");
	    sheet.setDefaultColumnWidth(20); // 设置列的默认宽度
		// sheet.setColumnWidth(0, 15); // 设置第一列的宽度

		rowIndex = 0;
		
		row = sheet.createRow(rowIndex);
		// 创建列名
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("问卷名称");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(0, 40 * 256);

		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(info.getInvestigationName());
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(1, 40 * 256);
		
		row = sheet.createRow(++rowIndex);
		// 创建列名
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("创建时间");
		cell.setCellStyle(cellStyle);

		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(sf.format(info.getCreateTime()));
		cell.setCellStyle(cellStyle);
		//------------------------
		row = sheet.createRow(++rowIndex);
		// 创建列名
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("调查项目");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue("数据量");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(2, Cell.CELL_TYPE_STRING);
		cell.setCellValue("浏览量");
		cell.setCellStyle(cell2);
		
		cell = row.createCell(3, Cell.CELL_TYPE_STRING);
		cell.setCellValue("填写率");
		cell.setCellStyle(cell2);
		//------------------------
		row = sheet.createRow(++rowIndex);
		//填入值
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue(inputLoadList.size());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellValue(totalInfo.getCountExampleSum());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(2, Cell.CELL_TYPE_STRING);
		cell.setCellValue(totalInfo.getCountBrowse());
		cell.setCellStyle(cellStyle);
		
		cell = row.createCell(3, Cell.CELL_TYPE_STRING);
		cell.setCellValue(df.format((totalInfo.getCountExampleSum()/1.0/totalInfo.getCountBrowse()*100))+"%");
		cell.setCellStyle(cellStyle);
		//------------空一行
		row = sheet.createRow(++rowIndex);//空一行
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellValue("");
		cell.setCellStyle(cellStyle);
		
		//标题
		row = sheet.createRow(++rowIndex);
		cell = row.createCell(0, Cell.CELL_TYPE_STRING);
		cell.setCellStyle(cs2);
		cell.setCellValue("开始时间");
		
		cell = row.createCell(1, Cell.CELL_TYPE_STRING);
		cell.setCellStyle(cs2);
		cell.setCellValue("IP");
		
		int k = 2;
		for (StatisticsInputBean bean : inputLoadList) {
			if("textarea".equals(bean.getInputType()) || "text".equals(bean.getInputType())){
				cell = row.createCell(k, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(cs2);
				cell.setCellValue(bean.getInputTitle());
				k++;
			}
		}
		
		//内容
		BigDecimal tempAccountId = new BigDecimal("-1");
		for (FormInputProinstBean bean : inputProinstList) {
			if("textarea".equals(bean.getInputType()) || "text".equals(bean.getInputType())){
				if(bean.getAccountId().compareTo(tempAccountId) != 0){
					row = sheet.createRow(++rowIndex);
				}
				cell = row.createCell(0, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(sf.format(bean.getCreateTime()));
				
				cell = row.createCell(1, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(bean.getIpAddress());
				
				//数据根据录入项sort_grade asc,create_time asc,account_id asc
				k = 2;
				for (StatisticsInputBean input: inputLoadList) {
					if("textarea".equals(input.getInputType()) || "text".equals(input.getInputType())){
						if(bean.getInputId().compareTo(input.getInputId()) == 0){
							cell = row.createCell(k, Cell.CELL_TYPE_STRING);
							cell.setCellStyle(gridCS);
							cell.setCellValue(bean.getInputValue());
						}
						k++;
					}
				}
				
				tempAccountId = bean.getAccountId();
			}
		}

		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		// 设置下载的excel文件名
		String fileName = info.getInvestigationName()+"_调查结果统计_"
				+ new SimpleDateFormat("yyyy-MM-dd")
						.format(new java.util.Date()) + ".xls";
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(fileName.getBytes("gb2312"), "ISO8859-1"));


		try (ServletOutputStream stream = response.getOutputStream()) {
			wb.write(stream);
		} catch (Exception ex) {
			String errorMsg = "生成下载Excel组织机构列表文件失败，详细原因："
					+ ex.getLocalizedMessage();
			logger.error(errorMsg, ex);
		}
		if (wb != null) {
			try {
				wb.close();
			} catch (Exception ex) {

			}
		}		
	}
}
