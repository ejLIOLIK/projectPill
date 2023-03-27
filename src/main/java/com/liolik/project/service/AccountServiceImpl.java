package com.liolik.project.service;

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
	public List<AccountDto> getListAccount(){
		return mapper.getListAccount();
	}
	
	@Override
	public void writeAccount(AccountDto dto) {
		mapper.writeAccount(dto);
	}
	
}
