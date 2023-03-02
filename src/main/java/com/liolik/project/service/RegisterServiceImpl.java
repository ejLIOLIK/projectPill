package com.liolik.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.EmployeeDto;
import com.liolik.project.mapper.RegisterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class RegisterServiceImpl implements RegisterService {

	@Setter(onMethod_ = @Autowired)
	private RegisterMapper mapper;
	
	@Override
	public List<EmployeeDto> getEmployeeCode(String employeeName){
		if(employeeName==null) {
			return mapper.getEmployeeCode();}
		else {
			return mapper.getEmploySearch(employeeName);}
	}
	
	@Override
	public void sign(Map<String, String> registerData) {
		EmployeeDto edto = new EmployeeDto();
		edto.setECODE(registerData.get("ECODE"));
		edto.setPW(registerData.get("PW"));
		mapper.sign(edto);
	}
}
