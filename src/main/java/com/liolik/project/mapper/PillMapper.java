package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.PillDto;

public interface PillMapper {
	public List<PillDto> getListPill();
	public PillDto readPill(String PILLCODE);
	public void writePill(PillDto pdto);
	public void deletePill(String PILLCODE);
	public void editPill(PillDto pdto);
	public void NameSetProduct(String PILLCODE);
}

