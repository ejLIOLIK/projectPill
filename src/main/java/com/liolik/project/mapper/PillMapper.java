package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;

public interface PillMapper {
	public List<PillDto> getListPill();
	public PillDto readPill(String PILLCODE);
	public List<ProductDto> getListProduct(String PILLCODE);
	public void writePill(PillDto pdto);
	public void deletePill(String PILLCODE);
	public void deleteSetProduct(String PILLCODE);
	public void editPill(PillDto pdto);
	public void EditSetProduct(String PILLCODE);
	public void EditSetProductPrice(String PILLCODE);
	public int getListCount();
}

