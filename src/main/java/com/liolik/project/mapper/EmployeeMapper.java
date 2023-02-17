package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.dto.PillDto;

public interface EmployeeMapper {
	public List<EmployeeDto> getListEmployee();
	public EmployeeDto readEmployee(String ECODE);
	public void writeEmployee(EmployeeDto edto);
	public void deleteEmployee(String ECODE);
	public void editEmployee(EmployeeDto edto);
}
