package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.EmployeeDto;

public interface RegisterMapper {
	public List<EmployeeDto> getEmployeeCode();
	public List<EmployeeDto> getEmploySearch(String ENAME);
	public void sign(EmployeeDto edto);
	public EmployeeDto login(String ECODE);
	public int getListCount();
	public int getListCountSearch(String ENAME);
}
