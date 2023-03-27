package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.AccountDto;
import com.liolik.project.dto.PillDto;
import com.liolik.project.dto.ProductDto;

public interface ProductMapper {
	public List<ProductDto> getListProduct();
	public String getPillPrice(String PCODE);
	public ProductDto readProduct(String PCODE);
	public List<ProductDto> getListSamePill(String PCODE);
	public void deleteProduct(String PCODE);
	public void editProduct(ProductDto pdto);
	public List<PillDto> getProductName(String PILLNAME);
	public void writeProduct(ProductDto pdto);
	public int getListCount();
	public int getPillListCount(String PILLNAME);	
	public void stockUpdatePlus(AccountDto dto);
	public void stockUpdateMinus(AccountDto dto);
}
