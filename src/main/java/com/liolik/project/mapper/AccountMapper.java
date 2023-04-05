package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.AccountDto;

public interface AccountMapper {
	public List<AccountDto> getListAccount(String TDATE);
	public void writeAccount(AccountDto dto);
	public void UpdateBalance(AccountDto dto);
}
