package com.liolik.project.dto;
import lombok.Data;

@Data
public class CustomerDto {
	
	private String STATE;
	private String CCODE;
	private String CNAME;
	private String EMPLOYEE_CODE;
	private String EMPLOYEE_NAME;
	private String EMPLOYEE_RANK;
	private String ADRESS_NUMBER;	// 우편번호
	private String ADRESS_DORO;		// 도로명
	private String ADRESS_JIBEON;	// 지번
	private String ADRESS_DETAIL;	// 상세
	private String ADRESS_MEMO;		// 참고항목
	private String TEL;
	private String MEMO;
	private int BALANCE;
}
