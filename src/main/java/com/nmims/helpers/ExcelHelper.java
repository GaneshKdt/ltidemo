package com.nmims.helpers;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.nmims.bean.GroupBean;
import com.nmims.bean.GroupsMembers;


public class ExcelHelper {

	public ArrayList<List> readSapIdFromExcel(GroupBean fileBean, ArrayList<String> studentList, String userId){
		
		int SAPID_INDEX = 0;
		ByteArrayInputStream bis = new ByteArrayInputStream(fileBean.getFileData().getBytes());
		Workbook workbook;
		
		List<GroupsMembers> studentSapIdList = new ArrayList<GroupsMembers>();
		List<GroupsMembers> errorBeanList = new ArrayList<GroupsMembers>();
		
		ArrayList<List> resultList = new ArrayList<>();
		Iterator<Row> rowIterator = null;
		
		try {
			if (fileBean.getFileData().getOriginalFilename().endsWith(".xls")) {
				workbook = new HSSFWorkbook(bis);
				HSSFSheet sheet = (HSSFSheet)workbook.getSheetAt(0);
				rowIterator = sheet.iterator();
			} else if (fileBean.getFileData().getOriginalFilename().endsWith(".xlsx")) {
				workbook = new XSSFWorkbook(bis);
				XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);
				rowIterator = sheet.iterator();
			} else {
				throw new IllegalArgumentException("Received file does not have a standard excel extension.");
			}
			
			int i = 0;
			//Skip first row since it contains column names, not data.
			if(rowIterator.hasNext()){
				Row row = rowIterator.next();
			}
			while(rowIterator.hasNext()) {
				i++;
				Row row = rowIterator.next();
				
				if(row!=null){
					row.getCell(SAPID_INDEX, Row.CREATE_NULL_AS_BLANK).setCellType(Cell.CELL_TYPE_STRING);
					GroupsMembers bean = new GroupsMembers();
					String sapid = row.getCell(SAPID_INDEX, Row.CREATE_NULL_AS_BLANK).getStringCellValue();
					
					if("".equals(sapid.trim()) ){
						break;
					}
					
					if(bean.isErrorRecord()){
						errorBeanList.add(bean);
						continue;
					}
					
					bean.setSapid(sapid);
					bean.setCreatedBy(userId);
					bean.setGroupid(fileBean.getId());
					
					if(!studentList.contains(bean.getSapid().trim())){
						bean.setErrorMessage(bean.getErrorMessage()+" Row : "+ (i+1) +" "+bean.getSapid().trim()+" Invalid Sapid / Student Already added in this Group.");
						bean.setErrorRecord(true);
					}
					
					if(bean.isErrorRecord()){
						errorBeanList.add(bean);
					}else{
						studentSapIdList.add(bean);
					}
					
					if(i % 1000 == 0){
//						System.out.println("Read "+i+" rows");
					}
				}
			}
			
//			System.out.println("Total Records = "+(errorBeanList.size()+studentSapIdList.size()));
//			System.out.println("Error Records = "+errorBeanList.size());
//			System.out.println("Valid Records = "+studentSapIdList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resultList.add(studentSapIdList);
		resultList.add(errorBeanList);
		return resultList;
		
	}
}
