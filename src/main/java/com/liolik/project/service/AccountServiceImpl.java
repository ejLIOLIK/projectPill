package com.liolik.project.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liolik.project.dto.AccountDto;
import com.liolik.project.mapper.AccountMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AccountServiceImpl implements AccountService {

	@Setter(onMethod_ = @Autowired)
	private AccountMapper mapper;
	
	@Override
	public List<AccountDto> getListAccount(String TDATE){

		TDATE = getToday(TDATE); 
		return mapper.getListAccount(TDATE);
	}
	
	@Override
	public void writeAccount(AccountDto dto) {
		mapper.writeAccount(dto);
		
		// 정산 시 음수 처리
		if("정산".equals(dto.getSTATE())) {
			dto.setTOTAL(-1 * dto.getTOTAL());
		}

		mapper.UpdateBalance(dto);
	}
	
	@Override
	public String getToday(String TDATE) {
		if(TDATE == null) {
			// 현재 날짜 구하기
	        LocalDate today = LocalDate.now();
	        TDATE = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}
		return TDATE;
	}
}
