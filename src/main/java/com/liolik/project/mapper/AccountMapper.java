package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.AccountDto;

public interface AccountMapper {
	public List<AccountDto> getListAccount();
	public void writeAccount(AccountDto dto);
}
