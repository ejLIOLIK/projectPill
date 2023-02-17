package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;

public interface CustomerService {
	public List<CustomerDto> getListCustomer();
	public void writeCustomer(CustomerDto cdto);
	public List<EmployeeDto>getListEmployee(); // get영업담당자
}
