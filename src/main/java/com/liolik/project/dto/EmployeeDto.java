package com.liolik.project.dto;
import lombok.Data;

@Data
public class EmployeeDto {
	
	private String ECODE;
	private String ENAME;
	private String ERANK;
	private String ETEAM;
	private String PW; // 직원 로그인 기능 추가용 
}
