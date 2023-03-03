package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PagingDto;

public interface EmployeeService {
	public List<EmployeeDto> getListEmployee();
	public EmployeeDto readEmployee(String employeeCode);
	public void writeEmployee(EmployeeDto edto);
	public void deleteEmployee(String employeeCode);
	public void editEmployee(EmployeeDto edto);
	public List<CustomerDto> salesEmployee(String employeeCode);
	public PagingDto settingPage(Integer curPage, Integer curPageBlock);
	public PagingDto settingSalesPage(Integer curPage, Integer curPageBlock, String employeeCode);
}
