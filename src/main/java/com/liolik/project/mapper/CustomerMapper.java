package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;

public interface CustomerMapper {
	public List<CustomerDto> getListCustomer();
	public void writeCustomer(CustomerDto cdto);
	public void editCustomer(CustomerDto cdto);
	public List<EmployeeDto>getListEmployee();
	public CustomerDto readCustomer(String CCODE);
	public void deleteCustomer(String CCODE);
}
