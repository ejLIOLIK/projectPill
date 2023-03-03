package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.mapper.EmployeeMapper;
import com.liolik.project.module.pagingModule;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Setter(onMethod_ = @Autowired)
	private EmployeeMapper mapper;	
	
	@Override
	public List<EmployeeDto> getListEmployee() {
		return mapper.getListEmployee();
	}

	@Override
	public EmployeeDto readEmployee(String employeeCode) {
		return mapper.readEmployee(employeeCode);
	}
	
	@Override
	public void writeEmployee(EmployeeDto edto) {
		mapper.writeEmployee(edto);
	}
	
	@Override
	public void deleteEmployee(String employeeCode) {
		mapper.deleteEmployee(employeeCode);
	}
	
	@Override
	public void editEmployee(EmployeeDto edto) {
		mapper.editEmployee(edto);
	}
	
	@Override
	public List<CustomerDto> salesEmployee(String employeeCode) {
		return mapper.salesEmployee(employeeCode);
	}
	
	@Override
	public PagingDto settingPage(Integer curPage, Integer curPageBlock) {
		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}
		
		PagingDto pdto = new PagingDto(mapper.getListCount(), curPage, curPageBlock);
		
		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		return pagingModule.setPaging(pdto);
	}
	
	@Override
	public PagingDto settingSalesPage(Integer curPage, Integer curPageBlock, String employeeCode) {
		if(curPage==null) { curPage = 1;}
		if(curPageBlock==null) { curPageBlock = 1;}
		
		PagingDto pdto = new PagingDto(mapper.getSalesListCount(employeeCode), curPage, curPageBlock);
		
		pdto.setTotalPage(pagingModule.setTotalPage(pdto.getTotalData()));
		pdto.setTotalPageBlock(pagingModule.setTotalPageBlock(pdto.getTotalPage()));
		
		return pagingModule.setPaging(pdto);
	}
}
