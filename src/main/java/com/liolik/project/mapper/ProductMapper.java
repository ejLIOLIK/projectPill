package com.liolik.project.mapper;

import java.util.List;

import com.liolik.project.dto.ProductDto;

public interface ProductMapper {
	public List<ProductDto> getListProduct();
	public ProductDto readProduct(String PCODE);
	public List<ProductDto> getListSamePill(String PCODE);
	public void deleteProduct(String PCODE);
	public void editProduct(ProductDto pdto);
}
