package com.htcf.action;


import java.io.FileInputStream;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;


/**
 * @author liu
 */
public class LoadExcel {
	

	public Workbook getExcel(String path) {
		Workbook workbook;
		try {
			workbook = Workbook.getWorkbook(new FileInputStream(path));
			return workbook;
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}
	

	public Sheet getSheet(Workbook workbook,int index) {
		Sheet sheet;
		try {
			sheet = workbook.getSheet(index);
			return sheet;
		} catch(Exception e) {
			e.printStackTrace();
			this.closeWorkbook(workbook);
			return null;
		}
	}
	
	public Cell[] readLine(Sheet sheet,int row) {
		try {
		    int colnum = sheet.getColumns();
		    Cell[] rest = new Cell[colnum];
		    rest = sheet.getRow(row);
		    return rest;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String read(Sheet sheet,int col, int row){
	    try {
	    	Cell cell = sheet.getCell(col,row); 
	    	String rest = "";
	    	rest = cell.getContents();
	    	return rest;
	    }catch(Exception e){
	    	e.printStackTrace();
	    	return null;
	    }
	}

	public void closeWorkbook(Workbook workbook) {
		if(workbook != null) {
			try {
				workbook.close();
				workbook = null;
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
