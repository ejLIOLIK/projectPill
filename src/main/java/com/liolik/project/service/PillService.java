package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.PillDto;

public interface PillService {
	public List<PillDto> getListPill();
	public PillDto readPill(String pillCode);
	public void writePill(PillDto pdto);
	public void deletePill(String pillCode);
	public void editPill(PillDto pdto);
	public void NameSetProduct(String PILLCODE);
}
