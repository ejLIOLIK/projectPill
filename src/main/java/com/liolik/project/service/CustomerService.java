package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;

public interface CustomerService {
	public List<CustomerDto> getListCustomer();
	public void writeCustomer(CustomerDto cdto);
	public List<EmployeeDto>getListEmployee(); // 영업담당자 select창을 위해 Employee를 get
	public CustomerDto readCustomer(String customerCode);
	public void deleteCustomer(String customerCode);
	public void editCustomer(CustomerDto cdto);	
	public void setListCustomer(List<CustomerDto> cdto);
}
