package com.liolik.project.service;

import java.util.List;

import com.liolik.project.dto.AccountDto;
import com.liolik.project.dto.PagingDto;
import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;

public interface ProductService {
	public List<ProductDto> getListProduct();
	public String getPillPrice(String productCode);
	public ProductDto readProduct(String productCode);
	public List<ProductDto> getListSamePill(String productCode);
	public void deleteProduct(String productCode);
	public void editProduct(ProductDto pdto);
	public List<PillDto> getProductName(String productName);
	public void writeProduct(ProductDto pdto);
	public PagingDto settingPage(Integer curPage, Integer curPageBlock);
	public PagingDto settingPage(Integer curPage, Integer curPageBlock, String productName);
	public void stockUpdate(AccountDto dto);
}
