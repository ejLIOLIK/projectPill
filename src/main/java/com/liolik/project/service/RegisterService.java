package com.liolik.project.service;

import java.util.List;
import java.util.Map;

import com.liolik.project.dto.EmployeeDto;

public interface RegisterService {
	public List<EmployeeDto> getEmployeeCode(String employeeName);
	public void sign(Map<String, String> registerData);
	public EmployeeDto login(Map<String, String> loginData);
}
