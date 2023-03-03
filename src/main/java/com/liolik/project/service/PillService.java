package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.PagingDto;
import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;

public interface PillService {
	public List<PillDto> getListPill();
	public PillDto readPill(String pillCode);
	public List<ProductDto> getListProduct(String pillCode);
	public void writePill(PillDto pdto);
	public void deletePill(String pillCode);
	public void editPill(PillDto pdto);
	public PagingDto settingPage(Integer curPage, Integer curPageBlock);
}
