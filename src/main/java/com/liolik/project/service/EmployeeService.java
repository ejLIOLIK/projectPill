package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.EmployeeDto;

public interface EmployeeService {
	public List<EmployeeDto> getListEmployee();
	public EmployeeDto readEmployee(String employeeCode);
	public void writeEmployee(EmployeeDto edto);
	public void deleteEmployee(String employeeCode);
	public void editEmployee(EmployeeDto edto);
}
