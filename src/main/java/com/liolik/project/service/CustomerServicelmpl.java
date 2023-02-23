package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.CustomerDto;
import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.mapper.CustomerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomerServicelmpl implements CustomerService {
	
	@Setter(onMethod_ = @Autowired)
	private CustomerMapper mapper;	
	
	@Override
	public List<CustomerDto> getListCustomer(){
		return mapper.getListCustomer();
	}
	
	@Override
	public void writeCustomer(CustomerDto cdto) {
		mapper.writeCustomer(cdto);
	}

	@Override
	public List<EmployeeDto>getListEmployee() { // 영업담당자 select창을 위해 Employee를 get
		return mapper.getListEmployee(); 
	}
	
	@Override
	public CustomerDto readCustomer(String customerCode) {
		return mapper.readCustomer(customerCode);
	}
	
	@Override
	public void deleteCustomer(String customerCode) {
		mapper.deleteCustomer(customerCode);
	}
	
	@Override
	public void editCustomer(CustomerDto cdto) {
		mapper.editCustomer(cdto);
	}

}
