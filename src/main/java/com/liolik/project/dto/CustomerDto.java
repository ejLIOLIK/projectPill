package com.liolik.project.dto;
import lombok.Data;

@Data
public class CustomerDto {
	
	private String STATE;
	private String CCODE;
	private String CNAME;
	private String EMPLOYEE;
	private String ADRESS;
	private String ADRESS_DETAIL;	// 상세
	private String TEL;
	private String MEMO;
	private int BALANCE;

}
