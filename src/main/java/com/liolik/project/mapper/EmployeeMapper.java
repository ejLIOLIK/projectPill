package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;

public interface EmployeeMapper {
	public List<EmployeeDto> getListEmployee();
	public EmployeeDto readEmployee(String ECODE);
	public void writeEmployee(EmployeeDto edto);
	public void deleteEmployee(String ECODE);
	public void editEmployee(EmployeeDto edto);
	public List<CustomerDto> salesEmployee(String ECODE);
	public int getListCount();
	public int getSalesListCount(String ECODE);
	public void setPriKey(EmployeeDto dto);
	public String getPriKey(String ECODE);
}
