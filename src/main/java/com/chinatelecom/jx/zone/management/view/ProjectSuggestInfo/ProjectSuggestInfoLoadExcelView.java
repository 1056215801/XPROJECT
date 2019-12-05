package com.chinatelecom.jx.zone.management.view.ProjectSuggestInfo;

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
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import com.chinatelecom.jx.zone.management.bean.projectSuggest.ProjectSuggestInfoBean;

@Component("ProjectSuggestInfoLoadExcelView")
public class ProjectSuggestInfoLoadExcelView extends AbstractView {

	@SuppressWarnings("unchecked")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 录入项
		List<ProjectSuggestInfoBean> projectSuggestLoadList = (List<ProjectSuggestInfoBean>) model
				.get("projectSuggestList");

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("意见反馈结果");
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
		cell2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		;// 设置前景填充样式
		cell2.setFillForegroundColor(HSSFColor.BLUE_GREY.index);// 前景填充色

		int rowIndex = 0;

		HSSFRow row = sheet.createRow(rowIndex);
		// 创建列名
		HSSFCell cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("建议主题");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(0, 35 * 256);

		cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("反馈时间");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(1, 25 * 256);

		cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("联系人电话");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(2, 15 * 256);

		cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("是否采纳");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(3, 25 * 256);

		cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue("奖励金额");
		cell.setCellStyle(cellStyle);
		sheet.setColumnWidth(4, 25 * 256);

		// 设置单元格
		HSSFCellStyle gridCS = wb.createCellStyle();
		gridCS.setWrapText(true);// 设置单元格自动换行
		// 设置单元格边框
		gridCS.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		gridCS.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		gridCS.setBorderRight(HSSFCellStyle.BORDER_THIN);
		gridCS.setBorderTop(HSSFCellStyle.BORDER_THIN);
		// 设置单元格字体
		HSSFFont gridFont = wb.createFont();
		gridFont.setFontName("宋体");
		gridFont.setFontHeightInPoints((short) 11);
		gridCS.setFont(gridFont);
		// 设置单元格内容显示位置
		gridCS.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		gridCS.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中

		int i = 1;
		if (projectSuggestLoadList != null && projectSuggestLoadList.size() > 0) {
			for (ProjectSuggestInfoBean bean : projectSuggestLoadList) {
				row = sheet.createRow(++rowIndex); // 空一行
				// 建议主题
				cell = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(i + "、" + bean.getSuggestTitle());

				// 反馈时间
				if (bean.getAuditTime() != null) {
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					cell = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
					cell.setCellStyle(gridCS);
					cell.setCellValue(sf.format(bean.getAuditTime()));
				}

				// 用户联系方式
				cell = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(bean.getAccountTel());

				// 是否采纳
				cell = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				if (bean.getStatus() != null) {
					switch (bean.getStatus()) {
					case 0:
						cell.setCellValue("未采纳");
						break;
					case 1:
						cell.setCellValue("已采纳");
						break;
					case 2:
						cell.setCellValue("审核中");
						break;
					default:
						cell.setCellValue((String) null);
						break;
					}
				} else {
					cell.setCellValue((String) null);
				}

				// 奖励金额
				cell = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
				cell.setCellStyle(gridCS);
				cell.setCellValue(bean.getRewardContent());

				i++;
			}

			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			// 设置下载的excel文件名
			String fileName = "意见反馈列表_" + new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) + ".xls";
			response.setHeader("Content-Disposition",
					"attachment;filename=" + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
			try (ServletOutputStream stream = response.getOutputStream()) {
				wb.write(stream);
			} catch (Exception ex) {
				String errorMsg = "生成下载Excel意见反馈列表文件失败，详细原因：" + ex.getLocalizedMessage();
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

}
