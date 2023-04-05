package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.AccountDto;

public interface AccountService {
	public List<AccountDto> getListAccount(String TDATE);
	public void writeAccount(AccountDto dto);
	public String getToday(String TDATE);
}
