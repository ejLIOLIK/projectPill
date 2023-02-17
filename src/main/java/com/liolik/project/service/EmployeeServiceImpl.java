package com.liolik.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.mapper.EmployeeMapper;

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
}
